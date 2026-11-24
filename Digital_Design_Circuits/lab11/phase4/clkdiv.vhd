library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
expert : in STD_LOGIC;   -- '0' = novice (slow), '1' = expert (fast)
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end clkdiv;
architecture clkdiv of clkdiv is
signal q:STD_LOGIC_VECTOR(24 downto 0);
begin
-- clock divider
process(mclk, clr)
begin
if clr = '1' then
  q <= X"000000" & '0';
elsif mclk'event and mclk='1' then
  q <= q + 1;
end if;
end process;

-- game speed: novice ~1.5 Hz, expert ~6 Hz
clk3 <= q(22) when expert = '1' else q(24);
clkfast <= q(17); 
end clkdiv;
