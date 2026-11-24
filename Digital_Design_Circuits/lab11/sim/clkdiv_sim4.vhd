-- Simulation-only replacement for phase4/clkdiv.vhd (same ports, with expert).
-- Same 4:1 speed ratio as the board (q(24) / q(22)), but faster:
--   novice: clk3 = q(22) -> one LED step every ~168 ms
--   expert: clk3 = q(20) -> one LED step every ~42 ms
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
expert : in STD_LOGIC;
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end clkdiv;
architecture sim of clkdiv is
signal q: STD_LOGIC_VECTOR(22 downto 0);
begin
process(mclk, clr)
begin
if clr = '1' then
  q <= (others => '0');
elsif mclk'event and mclk = '1' then
  q <= q + 1;
end if;
end process;
clk3 <= q(20) when expert = '1' else q(22);
clkfast <= q(3);
end sim;
