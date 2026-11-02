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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS
  GENERIC (
    G_MAX : NATURAL := 15; -- maximum range
    G_INIT : NATURAL := 15; -- initial value
    G_UP : BOOLEAN := true -- count up?
  );
  PORT (
    i_clk : IN STD_LOGIC;
    i_reset : IN STD_LOGIC;
    i_enable : IN STD_LOGIC;
    i_limit : IN NATURAL RANGE 0 TO G_MAX; -- wrap-around value (set at run time)
    o_value : OUT NATURAL RANGE 0 TO G_MAX
  );
END counter;

ARCHITECTURE Behavioral OF counter IS
  SIGNAL value : NATURAL RANGE 0 TO G_MAX;

BEGIN
  -- check generics
  ASSERT G_MAX >= G_INIT REPORT "G_INIT greater G_MAX"
  SEVERITY FAILURE;

  count : PROCESS (i_clk, i_reset)
  BEGIN
    IF i_reset = '1' THEN
      value <= G_INIT;
    ELSIF rising_edge(i_clk) AND i_enable = '1' THEN
      IF G_UP THEN
        -- '>=' so lowering the limit while counting still wraps
        IF value >= i_limit THEN
          value <= 0;
        ELSE
          value <= value + 1;
        END IF;
      ELSE
        IF value = 0 THEN
          value <= i_limit;
        ELSE
          value <= value - 1;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  o_value <= value;

END Behavioral;