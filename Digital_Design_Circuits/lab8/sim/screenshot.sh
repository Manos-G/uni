#!/bin/bash
# Usage: screenshot.sh <wave.fst> <save.gtkw> <out.png> [start_ns end_ns]
# Opens GTKWave on a private virtual display and screenshots it.
# With no time range it uses Zoom Best Fit.
set -e
FST=$1; GTKW=$2; OUT=$3
TCL=$(mktemp --suffix=.tcl)
if [ -n "$4" ]; then
  echo "gtkwave::setZoomRangeTimes {$4 ns} {$5 ns}" > "$TCL"
else
  echo "gtkwave::/Time/Zoom/Zoom_Best_Fit" > "$TCL"
fi
Xvfb :77 -screen 0 1900x800x24 >/dev/null 2>&1 & XP=$!
DISPLAY=:77 gtkwave "$FST" "$GTKW" -S "$TCL" >/dev/null 2>&1 & GP=$!
for i in $(seq 1 30); do
  DISPLAY=:77 xwininfo -root -tree 2>/dev/null | grep -qi gtkwave && break
  timeout 0.5 tail -f /dev/null || true
done
timeout 3 tail -f /dev/null || true
WID=$(DISPLAY=:77 xwininfo -root -tree | grep -i "gtkwave" | head -1 | awk "{print \$1}")
DISPLAY=:77 import -window "$WID" "$OUT"
kill $GP $XP 2>/dev/null || true
wait 2>/dev/null || true
rm -f "$TCL"
echo "saved $OUT"
