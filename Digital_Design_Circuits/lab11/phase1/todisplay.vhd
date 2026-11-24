----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity todisplay is
port(
  clk : in std_logic;
  rst : in std_logic;
  in16bit : in std_logic_vector(15 downto 0);
  outan : out std_logic_vector(3 downto 0);
  out7seg : out std_logic_vector(6 downto 0)
);
end todisplay;

architecture Behavioral of todisplay is

component bcd2seg is
port (
  i_bcd : in integer range 0 to 15;
  o_7seg : out std_logic_vector(6 downto 0)
);
end component;

  signal an : std_logic_vector(3 downto 0);
  signal dig4: std_logic_vector(3 downto 0) ;
  signal dig4int: integer range 0 to 15 ;
  
begin

  ubcd1: bcd2seg 
  port map(
  i_bcd => dig4int,
  o_7seg => out7seg
  );

 dig4int <= conv_integer(dig4);
 outan <= an ;
 
mux1p: process(clk, rst)
begin
  if (rst='1') then
     an <= "1110";
  elsif clk'event and clk='1' then
     an <= an(2 downto 0) & an(3);
  end if;
end process;

crtp: process(an, in16bit)
begin
case an is 
  when "1110" => dig4 <= in16bit(3 downto 0);
  when "1101" => dig4 <= in16bit(7 downto 4);
  when "1011" => dig4 <= in16bit(11 downto 8);
  when "0111" => dig4 <= in16bit(15 downto 12);
  when others => dig4 <= "0000";
end case;
end process;

end Behavioral;

