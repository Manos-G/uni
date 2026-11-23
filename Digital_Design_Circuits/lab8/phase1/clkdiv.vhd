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

clk3 <= q(24); -- 3 Hz
clkfast <= q(18); 
end clkdiv;
