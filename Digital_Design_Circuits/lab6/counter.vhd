-- $Id$
--
-- counter.vhd: Counter / Generics example
--
-- Provides a simple up/down counter. Parameters can
-- be set through generics
--
-- Author : Enno Luebbers <enno.luebbers@upb.de>
-- Created: 24.04.2006
--
-- Major changes:
-- 24.04.2006 Enno Luebbers File created.
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
generic (
G_MAX : natural := 15; -- maximum range
G_INIT : natural := 15; -- initial value
G_UP : boolean := true -- count up?
);
port (
i_clk : in std_logic;
i_reset : in std_logic;
i_enable : in std_logic;
i_limit : in natural range 0 to G_MAX; -- wrap-around value (set at run time)
o_value : out natural range 0 to G_MAX
);
end counter;

architecture Behavioral of counter is
  signal value : natural range 0 to G_MAX;

begin
-- check generics
assert G_MAX >= G_INIT report "G_INIT greater G_MAX"
severity FAILURE;
count : process(i_clk, i_reset)
begin
if i_reset = '1' then
value <= G_INIT;
elsif rising_edge(i_clk) and i_enable = '1' then
if G_UP then
-- '>=' so lowering the limit while counting still wraps
if value >= i_limit then
value <= 0;
else
value <= value + 1;
end if;
else
if value = 0 then
value <= i_limit;
else
value <= value - 1;
end if;
end if;
end if;
end process;
o_value <= value;

end Behavioral;

