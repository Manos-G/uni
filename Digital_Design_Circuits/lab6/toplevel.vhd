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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity toplevel is
port (
  clk : in std_logic;
  reset : in std_logic;
  -- switches: sw(3..0) = '1' turns on digit i
  --           sw(7..4) = binary number the display counter counts up to
  sw : in std_logic_vector(7 downto 0);
  -- LED display
  disp : out std_logic_vector(6 downto 0);
  dp : out std_logic;
  an : out std_logic_vector(3 downto 0)
);
end toplevel;

architecture structural of toplevel is

  component bcd2seg
  port (
  i_bcd : in integer range 0 to 15;
  o_7seg : out std_logic_vector(6 downto 0)
  );
  end component;

  component counter
  generic (
  G_MAX : natural := 15; -- maximum range
  G_INIT : natural := 15; -- initial value
  G_UP : boolean := true -- count up?
  );
  port (
  i_clk : in std_logic;
  i_reset : in std_logic;
  i_enable : in std_logic;
  i_limit : in natural range 0 to G_MAX;
  o_value : out natural range 0 to G_MAX
  );
end component;

  constant DELAY_INIT : integer := 50000000;
  signal counterEnable : std_logic;
  signal counterValue : integer range 0 to 15 := 0;
  signal delay : integer range 0 to DELAY_INIT-1 := DELAY_INIT-1;
  signal displayData : std_logic_vector(6 downto 0);
  signal countLimit : integer range 0 to 15;

begin

  delayCounter : counter
  generic map (
  G_MAX => DELAY_INIT-1,
  G_INIT => DELAY_INIT-1,
  G_UP => false
  )
  port map (
  i_clk => clk,
  i_reset => reset,
  i_enable => '1',
  i_limit => DELAY_INIT-1,
  o_value => delay
  );

  displayCounter : counter
  generic map (
  G_MAX => 15,
  G_INIT => 0,
  G_UP => true
  )
  port map (
  i_clk => clk,
  i_reset => reset,
  i_enable => counterEnable,
  i_limit => countLimit,
  o_value => counterValue
  );

  encoder : bcd2seg
  port map (
  i_bcd => counterValue,
  o_7seg => displayData
  );

  counterEnable <= '1' when delay = 0 else '0';
  disp <= NOT displayData; -- the LED display is active-low driven
  dp <= '1';
  countLimit <= conv_integer(sw(7 downto 4));
  an <= NOT sw(3 downto 0); -- anodes are active-low

end structural;

