"""Build an interactive HTML plot of every Thorlabs spectrum CSV under this folder.

Usage: python3 plot_spectra.py   ->  writes spectra.html next to this script
"""
import json
import math
from pathlib import Path

ROOT = Path(__file__).parent
OUT = ROOT / "spectra.html"


def read_spectrum(path):
    wl, inten = [], []
    in_data = False
    for line in path.read_text(errors="ignore").splitlines():
        line = line.strip()
        if line == "[Data]":
            in_data = True
            continue
        if line.startswith("[EndOfFile]"):
            break
        if in_data and line:
            x, y = line.split(",")[:2]
            wl.append(round(float(x), 3))
            inten.append(float(f"{float(y):.5g}"))
    return wl, inten


def _lobe(x, mu, s1, s2):
    t = (x - mu) / (s1 if x < mu else s2)
    return math.exp(-t * t / 2)


def cmf(l):
    """CIE 1931 2deg colour matching functions (Wyman, Sloan & Shirley 2013 fit)."""
    x = 1.056 * _lobe(l, 599.8, 37.9, 31.0) + 0.362 * _lobe(l, 442.0, 16.0, 26.7) - 0.065 * _lobe(l, 501.1, 20.4, 26.2)
    y = 0.821 * _lobe(l, 568.8, 46.9, 40.5) + 0.286 * _lobe(l, 530.9, 16.3, 31.1)
    z = 1.217 * _lobe(l, 437.0, 11.8, 36.0) + 0.681 * _lobe(l, 459.0, 26.0, 13.8)
    return x, y, z


def planck_uv(T):
    """CIE 1960 uv of a blackbody at T kelvin (Krystek 1985)."""
    u = (0.860117757 + 1.54118254e-4 * T + 1.28641212e-7 * T * T) / (1 + 8.42420235e-4 * T + 7.08145163e-7 * T * T)
    v = (0.317398726 + 4.22806245e-5 * T + 4.20481691e-8 * T * T) / (1 - 2.89741816e-5 * T + 1.61456053e-7 * T * T)
    return u, v


def estimate_color(wl, inten):
    X = Y = Z = 0.0
    for i in range(1, len(wl)):
        if 380 <= wl[i] <= 780:
            p = max(inten[i], 0) * (wl[i] - wl[i - 1])
            a, b, c = cmf(wl[i])
            X, Y, Z = X + a * p, Y + b * p, Z + c * p
    s = X + Y + Z
    x, y = X / s, Y / s

    # CCT via McCamy, then distance from the Planckian locus (Duv) to judge whether CCT means anything
    n = (x - 0.3320) / (0.1858 - y)
    cct = 449 * n**3 + 3525 * n**2 + 6823.3 * n + 5520.33
    u, v = 4 * x / (-2 * x + 12 * y + 3), 6 * y / (-2 * x + 12 * y + 3)
    duv = math.dist((u, v), planck_uv(min(max(cct, 1000), 15000)))

    # XYZ -> sRGB, scaled so the brightest channel is 1
    r = 3.2406 * X - 1.5372 * Y - 0.4986 * Z
    g = -0.9689 * X + 1.8758 * Y + 0.0415 * Z
    b = 0.0557 * X - 0.2040 * Y + 1.0570 * Z
    rgb = [max(c, 0) for c in (r, g, b)]
    m = max(rgb)
    rgb = [c / m for c in rgb]
    rgb = [12.92 * c if c <= 0.0031308 else 1.055 * c ** (1 / 2.4) - 0.055 for c in rgb]
    hexcol = "#" + "".join(f"{round(c * 255):02x}" for c in rgb)

    peak = wl[max(range(len(inten)), key=inten.__getitem__)]
    return {
        "x": round(x, 4), "y": round(y, 4), "hex": hexcol, "peak": round(peak, 1),
        "cct": round(cct) if duv < 0.02 else None, "duv": round(duv, 4),
    }


traces = []
for csv in sorted(ROOT.rglob("*.csv")):
    wl, inten = read_spectrum(csv)
    if wl:
        color = estimate_color(wl, inten)
        traces.append({"name": str(csv.relative_to(ROOT)), "wl": wl, "inten": inten, "color": color})
        print(f"{csv.name:24s} {color}")

# Shrink the page: resample onto a shared 1 nm grid (keeping each bin's max so narrow lines survive)
# and store intensities as integers 0..1000 relative to the overall max.
X0 = math.floor(min(t["wl"][0] for t in traces))
X1 = math.ceil(max(t["wl"][-1] for t in traces))
top = max(max(t["inten"]) for t in traces)
for t in traces:
    bins = [None] * (X1 - X0 + 1)
    for l, v in zip(t.pop("wl"), t.pop("inten")):
        i = round(l) - X0
        bins[i] = v if bins[i] is None else max(bins[i], v)
    t["y"] = [None if v is None else round(1000 * v / top) for v in bins]

html = """<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Opto-electronics spectra</title>
<script src="https://cdn.plot.ly/plotly-2.35.2.min.js"></script>
<style>
  body { font-family: sans-serif; margin: 0; padding: 12px 16px; background: #fafafa; }
  #controls { display: flex; gap: 16px; align-items: center; flex-wrap: wrap; margin-bottom: 8px; }
  #plot { width: 100%; height: calc(100vh - 190px); min-height: 400px; }
  #swatches { display: flex; gap: 10px; flex-wrap: wrap; margin-bottom: 8px; }
  .sw { display: flex; gap: 8px; align-items: center; background: #fff; border: 1px solid #ddd;
        border-radius: 6px; padding: 6px 10px; font-size: 13px; color: #222; }
  .chip { width: 36px; height: 36px; border-radius: 50%; border: 1px solid #0003; flex: none; }
  .sw small { color: #666; display: block; }
</style>
</head>
<body>
<div id="controls">
  <strong>Spectra</strong>
  <label><input type="checkbox" id="norm"> Normalise each to peak = 1</label>
  <label><input type="checkbox" id="logy"> Log y-axis</label>
  <label>Trace colours:
    <select id="palette">
      <option value="real">Real (estimated) colour</option>
      <option value="distinct">Distinct colours</option>
    </select>
  </label>
  <span style="color:#666">Click legend to hide/show, double-click to isolate. Drag to zoom, double-click plot to reset.</span>
</div>
<div id="swatches"></div>
<div id="plot"></div>
<script>
const DATA = __DATA__;
const X0 = __X0__;
DATA.forEach(d => { d.x = d.y.map((_, i) => X0 + i); });

document.getElementById('swatches').innerHTML = DATA.map(d => {
  const c = d.color;
  const cct = c.cct ? `CCT ≈ ${c.cct} K` : `not white (Duv ${c.duv})`;
  return `<div class="sw"><div class="chip" style="background:${c.hex}"></div><div>
    <b>${d.name}</b><small>x=${c.x}, y=${c.y} · ${cct}</small><small>peak ${c.peak} nm · ${c.hex}</small></div></div>`;
}).join('');

const DISTINCT = ['#1f77b4', '#d62728', '#2ca02c', '#ff7f0e', '#9467bd', '#17becf', '#e377c2', '#8c564b', '#bcbd22', '#7f7f7f'];

// Approximate sRGB of a monochromatic wavelength (Dan Bruton's algorithm); black outside 380-780 nm
function wavelengthToRGB(l) {
  let r = 0, g = 0, b = 0;
  if (l >= 380 && l < 440) { r = (440 - l) / 60; b = 1; }
  else if (l < 490) { g = (l - 440) / 50; b = 1; }
  else if (l < 510) { g = 1; b = (510 - l) / 20; }
  else if (l < 580) { r = (l - 510) / 70; g = 1; }
  else if (l < 645) { r = 1; g = (645 - l) / 65; }
  else if (l <= 780) { r = 1; }
  let f = 0;
  if (l >= 380 && l < 420) f = 0.3 + 0.7 * (l - 380) / 40;
  else if (l >= 420 && l <= 700) f = 1;
  else if (l > 700 && l <= 780) f = 0.3 + 0.7 * (780 - l) / 80;
  const c = v => Math.round(255 * Math.pow(v * f, 0.8));
  return `rgb(${c(r)},${c(g)},${c(b)})`;
}

// Colour bar under the x-axis: a 1-row heatmap whose z is the wavelength itself
const allX = DATA.flatMap(d => [d.x[0], d.x[d.x.length - 1]]);
const xmin = Math.floor(Math.min(...allX)), xmax = Math.ceil(Math.max(...allX));
const barX = [], scale = [];
for (let l = xmin; l <= xmax; l++) barX.push(l);
for (let l = xmin; l <= xmax; l += 2) scale.push([(l - xmin) / (xmax - xmin), wavelengthToRGB(l)]);
scale[scale.length - 1][0] = 1;
const spectrumBar = {
  type: 'heatmap', x: barX, y: [0], z: [barX], xaxis: 'x', yaxis: 'y2',
  colorscale: scale, showscale: false, hoverinfo: 'skip', showlegend: false,
};

function build() {
  const norm = document.getElementById('norm').checked;
  const logy = document.getElementById('logy').checked;
  const real = document.getElementById('palette').value === 'real';
  const traces = DATA.map((d, i) => {
    let y = d.y;
    if (norm) {
      const m = Math.max(...y);
      y = y.map(v => v / m);
    }
    const color = real ? d.color.hex : DISTINCT[i % DISTINCT.length];
    return { x: d.x, y: y, name: d.name, type: 'scattergl', mode: 'lines', line: { width: real ? 2 : 1.5, color } };
  });
  // near-white sources vanish on a white background, so real colours get a dark plot
  const fg = real ? '#ddd' : '#444', grid = real ? '#333' : '#e5e5e5';
  const layout = {
    paper_bgcolor: real ? '#111' : '#fafafa',
    plot_bgcolor: real ? '#111' : '#fff',
    font: { color: fg },
    xaxis: { title: 'Wavelength (nm)', anchor: 'y2', gridcolor: grid, range: [xmin, xmax] },
    yaxis: { title: norm ? 'Normalised intensity' : 'Intensity (a.u.)', type: logy ? 'log' : 'linear',
             domain: [0.1, 1], gridcolor: grid },
    yaxis2: { domain: [0, 0.06], showticklabels: false, showgrid: false, zeroline: false, fixedrange: true },
    hovermode: 'x unified',
    margin: { t: 20, r: 20 },
    legend: { orientation: 'h', y: -0.15 },
  };
  document.body.style.background = layout.paper_bgcolor;
  document.body.style.color = fg;
  Plotly.react('plot', [spectrumBar, ...traces], layout, { responsive: true });
}
document.getElementById('norm').onchange = build;
document.getElementById('logy').onchange = build;
document.getElementById('palette').onchange = build;
build();
</script>
</body>
</html>
"""

OUT.write_text(html.replace("__DATA__", json.dumps(traces, separators=(",", ":"))).replace("__X0__", str(X0)))
print(f"Wrote {OUT} with {len(traces)} spectra")
