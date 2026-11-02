-- $Id$
--
-- toplevel.vhd: VHDL tutorial top level entity
--
-- Top level entity for Digilent Spartan-3 evaluation board
--
-- Author : Enno Luebbers <enno.luebbers@upb.de>
-- Created: 24.04.2006
--
-- Major changes:
-- 24.04.2006 Enno Luebbers File created.
--
-- NET "clk" LOC = "T9";
-- #
-- # 7-segement display
-- #
-- NET "an(0)" LOC = "D14";
-- NET "an(1)" LOC = "G14";
-- NET "an(2)" LOC = "F14";
-- NET "an(3)" LOC = "E13";
-- NET "disp(6)" LOC = "E14";
-- NET "disp(5)" LOC = "G13";
-- NET "disp(4)" LOC = "N15";
-- NET "disp(3)" LOC = "P15";
-- NET "disp(2)" LOC = "R16";
-- NET "disp(1)" LOC = "F13";
-- NET "disp(0)" LOC = "N16";
-- NET "dp" LOC = "P16";
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY toplevel IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    -- switches: sw(3..0) = '1' turns on digit i
    --           sw(7..4) = binary number the display counter counts up to
    sw : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    -- LED display
    disp : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    dp : OUT STD_LOGIC;
    an : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END toplevel;

ARCHITECTURE structural OF toplevel IS

  COMPONENT bcd2seg
    PORT (
      i_bcd : IN INTEGER RANGE 0 TO 15;
      o_7seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT counter
    GENERIC (
      G_MAX : NATURAL := 15; -- maximum range
      G_INIT : NATURAL := 15; -- initial value
      G_UP : BOOLEAN := true -- count up?
    );
    PORT (
      i_clk : IN STD_LOGIC;
      i_reset : IN STD_LOGIC;
      i_enable : IN STD_LOGIC;
      i_limit : IN NATURAL RANGE 0 TO G_MAX;
      o_value : OUT NATURAL RANGE 0 TO G_MAX
    );
  END COMPONENT;

  CONSTANT DELAY_INIT : INTEGER := 50000000;
  SIGNAL counterEnable : STD_LOGIC;
  SIGNAL counterValue : INTEGER RANGE 0 TO 15 := 0;
  SIGNAL delay : INTEGER RANGE 0 TO DELAY_INIT - 1 := DELAY_INIT - 1;
  SIGNAL displayData : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL countLimit : INTEGER RANGE 0 TO 15;

BEGIN

  delayCounter : counter
  GENERIC MAP(
    G_MAX => DELAY_INIT - 1,
    G_INIT => DELAY_INIT - 1,
    G_UP => false
  )
  PORT MAP(
    i_clk => clk,
    i_reset => reset,
    i_enable => '1',
    i_limit => DELAY_INIT - 1,
    o_value => delay
  );

  displayCounter : counter
  GENERIC MAP(
    G_MAX => 15,
    G_INIT => 0,
    G_UP => true
  )
  PORT MAP(
    i_clk => clk,
    i_reset => reset,
    i_enable => counterEnable,
    i_limit => countLimit,
    o_value => counterValue
  );

  encoder : bcd2seg
  PORT MAP(
    i_bcd => counterValue,
    o_7seg => displayData
  );

  counterEnable <= '1' WHEN delay = 0 ELSE
    '0';
  disp <= NOT displayData; -- the LED display is active-low driven
  dp <= '1';
  countLimit <= conv_integer(sw(7 DOWNTO 4));
  an <= NOT sw(3 DOWNTO 0); -- anodes are active-low

END structural;