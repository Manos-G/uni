-- Traffic lights on the 7-segment display (lab8, question 3)
-- Built on the original FSM (with yellow).
-- Each traffic light uses one digit:
--   segment a (top)    = red
--   segment g (middle) = yellow
--   segment d (bottom) = green
-- an(1) (left digit)  = East-West light
-- an(0) (right digit) = North-South light
-- Both digits share the segment lines, so they are multiplexed with clkfast:
-- while clkfast = '0' the NS digit is on, while clkfast = '1' the EW digit is on.
-- Anodes and segments are active-low on the Spartan-3 board.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tl_top is
port(
clk : in STD_LOGIC;
btn : in STD_LOGIC;
an : out STD_LOGIC_VECTOR(3 downto 0);
disp : out STD_LOGIC_VECTOR(6 downto 0);  -- disp(6..0) = a..g
dp : out STD_LOGIC
);
end tl_top;
architecture tl_top of tl_top is

component clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end component;

component traffic is
port (clk: in STD_LOGIC;
clr: in STD_LOGIC;
lights: out STD_LOGIC_VECTOR(5 downto 0));
end component;

signal clr, clk3, clkfast: STD_LOGIC;
signal lights: STD_LOGIC_VECTOR(5 downto 0);  -- EW(R,Y,G) & NS(R,Y,G)
signal ryg: STD_LOGIC_VECTOR(2 downto 0);     -- light of the digit that is on now
begin
clr <= btn;

U1: clkdiv
  port map (
  mclk=>clk,
  clr=>clr,
  clk3=>clk3,
  clkfast=>clkfast
);

U2: traffic
port map (
  clk=>clk3,
  clr=>clr,
  lights=>lights
);

-- digit select
ryg <= lights(5 downto 3) when clkfast = '1' else lights(2 downto 0);
an  <= "1101" when clkfast = '1' else "1110";   -- an(3), an(2) always off

-- segments (active-low): only a, g and d are used, the rest stay off
disp(6) <= not ryg(2);   -- a = red
disp(5) <= '1';          -- b
disp(4) <= '1';          -- c
disp(3) <= not ryg(0);   -- d = green
disp(2) <= '1';          -- e
disp(1) <= '1';          -- f
disp(0) <= not ryg(1);   -- g = yellow
dp      <= '1';

end tl_top;
