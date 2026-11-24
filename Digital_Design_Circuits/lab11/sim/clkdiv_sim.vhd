-- Simulation-only replacement for clkdiv.vhd (same entity and ports as
-- phases 1-3). clk3 = q(20): one LED step every 2^21 cycles (~42 ms) instead
-- of seconds, still longer than the ~10 ms debounce time.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end clkdiv;
architecture sim of clkdiv is
signal q: STD_LOGIC_VECTOR(20 downto 0);
begin
process(mclk, clr)
begin
if clr = '1' then
  q <= (others => '0');
elsif mclk'event and mclk = '1' then
  q <= q + 1;
end if;
end process;
clk3 <= q(20);
clkfast <= q(3);
end sim;
