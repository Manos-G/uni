-- $Id$
--
-- bcd2seg.vhd: BCD to 7-segment display encoder
--
-- Converts a BCD-coded signal to seven-segment-display
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
use IEEE.NUMERIC_STD.ALL;

entity bcd2seg is
port (
  i_bcd : in integer range 0 to 15;
  o_7seg : out std_logic_vector(6 downto 0)
);
end bcd2seg;

architecture behavioral of bcd2seg is
--    A
--  -----
-- F|   |B
--  | G |
--  -----
-- E|   |C
--  | D |
--  -----

type slv_array is array(0 to 15) of std_logic_vector(6 downto 0);
constant conversionTable : slv_array :=
( -- ABCDEFG
"1111110", -- 0
"0110000", -- 1
"1101101", -- 2
"1111001", -- 3
"0110011", -- 4
"1011011", -- 5
"1011111", -- 6
"1110000", -- 7
"1111111", -- 8
"1111011", -- 9
"1110111", -- A
"0011111", -- B
"1001110", -- C
"0111101", -- D
"1001111", -- E
"1000111" -- F
);

begin

o_7seg <= conversionTable(i_bcd);

end Behavioral;

