-- Simulation-only replacement for clkdiv.vhd (same entity and ports).
-- The real divider uses q(24) for clk3, i.e. 2^25 clock cycles per tick,
-- which is far too long to simulate. Here the counter is shorter:
--   clk3    = q(3) -> one tick every 16 clk cycles
--   clkfast = q(0) -> toggles every clk cycle (digit multiplexing)
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
signal q: STD_LOGIC_VECTOR(3 downto 0);
begin
process(mclk, clr)
begin
if clr = '1' then
  q <= "0000";
elsif mclk'event and mclk = '1' then
  q <= q + 1;
end if;
end process;

clk3 <= q(3);
clkfast <= q(0);
end sim;
