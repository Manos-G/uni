# Lab 11: Reaction game (FSM)

A "1" bounces back and forth across the 8 LEDs. Press the button while it is on one of the two leftmost LEDs and you get points:

| LED lit when you press | State | Points |
|---|---|---|
| 8th (LD7) | s7 | 3 |
| 7th (LD6) | s6 | 1 |
| any other | s0-s5 | 0 |

The score is shown on the 7-segment display in hex.

## How the circuit fits together

```
             clk (50 MHz)
                 |
          +------+-------+
          |    clkdiv    |
          +--+--------+--+
        clk3 |        | clkfast (~190 Hz)
             v        v
btn ---> +--------+   +-----------+
         | spike  |   | todisplay |---> an, digits (7-seg)
         +--------+   +-----------+
          |      |          ^
     leds v      | grade    | q (score)
                 v          |
          b = "000" & grade |
                 |          |
          +------+-------+  |
 btn ---> |   accslow    |--+
 (ce)     | q <= q + b   |
          +--------------+
             clk = 50 MHz
```

- **clkdiv**: a 25-bit counter on the 50 MHz clock. Each bit runs at half the frequency of the one before it. `clk3` (the game speed) and `clkfast` (the display refresh) are two of those bits.
- **spike**: the state machine. In s0 → s7 the "1" moves left; s7 sets `toggle` and it comes back s6 → s0. `lights` is the LED pattern of the state. `grade` is the points for a press right now: "11" (3) in s7, "01" (1) in s6, "00" anywhere else.
- **accslow**: an accumulator generated with Coregen. On every 50 MHz clock edge where `ce = '1'` it does `q <= q + b`. `sclr` clears it. `b` is `grade` padded to 5 bits, so the score goes up by `grade` every time `ce` is high.
- **todisplay** + **bcd2seg**: show `q` on the 7-segment display. Only one digit can be on at a time (they share the segment lines), so `an` rotates through the 4 digits on `clkfast`. `bcd2seg` turns each 4-bit value into a segment pattern (0-9, A-F).

## Phase 1: the given design

The design builds once `accslow` exists. In ISE: Project → New Source → **IP (CORE Generator & Architecture Wizard)**, name it `accslow`, then Math Functions → Accumulators → Accumulator:

- Implementation: Fabric
- Input type: Unsigned, input width: 5, output width: 5
- Operation: Add, latency: 1
- Tick **Clock Enable (CE)** and **Synchronous Clear (SCLR)**. Leave the other options unticked.

Pins: `clr` is switch SW7 (keep it down to play), `btn` is BTN3.

**What goes wrong:** the accumulator runs at 50 MHz and `ce = btn`. A press lasts about 100 ms, so it adds the points around 5 million times instead of once. The score jumps to a random value (in simulation one press on the 8th LED gave 24 instead of 3). Phase 3 fixes this.

**Fix in spike.vhd:** the process that calculates `grade` had only `state` in its sensitivity list. In simulation it never noticed the button, so presses scored nothing. It also left `grade` unassigned when `btn = '0'`, which makes a latch. The fix adds `btn` to the list and sets `grade <= "00"` when the button is not pressed. It is applied to all 4 phases.

## Phase 2: faster

One line in `clkdiv.vhd`:

```vhdl
clk3 <= q(22);   -- was q(24)
```

`q(n)` runs at 50 MHz / 2^(n+1), so `q(24)` is about 1.5 Hz and `q(22)` about 6 Hz. Two bits lower is 4 times faster. Each LED stays lit for about 0.17 s.

## Phase 3: debounce

A push button doesn't switch cleanly. For a few ms the contact bounces between 0 and 1. On top of that, as phase 1 showed, the accumulator must only see **one 50 MHz cycle** per press.

`debounce.vhd` does three things:

1. **Synchronise**: passes `btn` through two flip-flops, so a change exactly at a clock edge can't cause problems.
2. **Debounce**: `btn_db` only takes the new value once the input has stayed the same for 2^19 cycles (about 10 ms). Any bounce resets the counter.
3. **One pulse**: `pulse = btn_db and not btn_prev`. This is `'1'` only in the clock cycle where `btn_db` goes from 0 to 1.

In `top.vhd`, `btn_p` (the pulse) goes to both `spike` and the accumulator's `ce`, so each press adds `grade` exactly once.

The lab7 debounce wasn't reused because its pulse comes 0.23 s after the press. At the phase 2 speed the "1" would already have moved to another LED. 10 ms is short enough.

## Phase 4: novice / expert

`clkdiv` gets an `expert` input that picks the bit used for `clk3`:

```vhdl
clk3 <= q(22) when expert = '1' else q(24);
```

`expert` is switch SW0 (F12): down = novice (about 1.5 Hz), up = expert (about 6 Hz).

## Simulation (sim/)

These files are for simulation only. They don't go on the board.

- `accslow_sim.vhd`: a VHDL model with the same ports and behaviour as the Coregen accumulator, since the Coregen core only exists inside ISE.
- `clkdiv_sim.vhd`, `clkdiv_sim4.vhd`: faster clock dividers. With the real ones, reaching the 8th LED would take hundreds of millions of clock cycles. The phase 4 one keeps the same 4:1 novice/expert ratio.
- `tb_top.vhd` (phases 1-3), `tb_top4.vhd` (phase 4): press the button with bounces on the 8th LED, the 7th LED and a middle LED, and print the score after each press.

Run phase 3, for example (from `sim/`):

```bash
nvc --std=2008 -a ../phase3/bcd2seg.vhd ../phase3/todisplay.vhd ../phase3/spike.vhd \
    clkdiv_sim.vhd accslow_sim.vhd ../phase3/debounce.vhd ../phase3/top.vhd tb_top.vhd \
    -e tb_top -r
```

Results:

| Phase | 8th LED | 7th LED | middle LED |
|---|---|---|---|
| 1 (raw button) | 0 → 24 | 24 → 0 | 0 → 0 |
| 3 (debounced) | 0 → 3 | 3 → 4 | 4 → 4 |
| 4 expert / novice | 0 → 3 / 4 → 7 | 3 → 4 | - |

## On the board

- SW7 down to play, up to reset the score.
- The score is 5 bits, shown in hex: 10 is "A", and after 31 it wraps to 0.
- Phase 4: SW0 sets the speed.
