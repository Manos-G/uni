-- Traffic lights without the yellow states (lab8, question 2)
-- Sequence: s0 (NS green) -> s2 (all red) -> s3 (EW green) -> s5 (all red) -> s0
-- s1 and s4 (yellow) are removed.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
entity traffic is
port (clk: in STD_LOGIC;
clr: in STD_LOGIC;
lights: out STD_LOGIC_VECTOR(5 downto 0));
end traffic;
architecture traffic of traffic is
type state_type is (s0, s2, s3, s5);
signal state: state_type;
signal count: STD_LOGIC_VECTOR(3 downto 0);
constant SEC5: STD_LOGIC_VECTOR(3 downto 0) := "1111";
constant SEC1: STD_LOGIC_VECTOR(3 downto 0) := "0011";

begin

process(clk, clr)
begin
if clr = '1' then
state <= s0;
count <= X"0";
elsif clk'event and clk = '1' then
case state is
when s0 =>
if count < SEC5 then
state <= s0;
count <= count + 1;
else
state <= s2;          -- was s1 (NS yellow)
count <= X"0";
end if;
when s2 =>
if count < SEC1 then
state <= s2;
count <= count + 1;
else
state <= s3;
count <= X"0";
end if;
when s3 =>
if count < SEC5 then
state <= s3;
count <= count + 1;
else
state <= s5;          -- was s4 (EW yellow)
count <= X"0";
end if;
when s5 =>
if count < SEC1 then
state <= s5;
count <= count + 1;
else
state <= s0;
count <= X"0";
end if;
when others =>
state <= s0;
end case;
end if;
end process;

-- lights = EW(R,Y,G) & NS(R,Y,G)
C2: process(state)
begin
case state is
when s0 => lights <= "100001";   -- NS green, EW red
when s2 => lights <= "100100";   -- all red
when s3 => lights <= "001100";   -- NS red, EW green
when s5 => lights <= "100100";   -- all red
when others => lights <= "100001";
end case;
end process;
end traffic;
