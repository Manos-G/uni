
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity spike is
port (clk: in STD_LOGIC;
      clr: in STD_LOGIC;
      btn: in STD_LOGIC;
      grade: out STD_LOGIC_VECTOR(1 downto 0);
      lights: out STD_LOGIC_VECTOR(7 downto 0));
end spike;

architecture rtl of spike is
  type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
  signal state : state_type;

  signal toggle : std_logic;

begin

process(clk, clr)
begin
if clr = '1' then
  state <= s0;
  toggle <= '0';
  
elsif clk'event and clk = '1' then
  case state is
  when s0 =>
       toggle <= '0';
       state <= s1 ;
  when s1 =>
       if toggle='0' then 
       state <= s2 ;
       else
       state <= s0 ;
       end if;
  when s2 =>
       if toggle='0' then 
       state <= s3 ;
       else
       state <= s1 ;
       end if;
  when s3 =>
       if toggle='0' then 
       state <= s4 ;
       else
       state <= s2 ;
       end if;
  when s4 =>
       if toggle='0' then 
       state <= s5 ;
       else
       state <= s3 ;
       end if;
  when s5 =>
       if toggle='0' then 
       state <= s6 ;
       else
       state <= s4 ;
       end if;
  when s6 =>
       if toggle='0' then 
       state <= s7 ;
       else
       state <= s5 ;
       end if;
  when s7 =>
       toggle<='1';
       state <= s6 ;
  when others =>
       state <= s0;
  end case;
end if;
end process;

C2: process(state)
begin
case state is
when s0 => lights <= "00000001";
when s1 => lights <= "00000010";
when s2 => lights <= "00000100";
when s3 => lights <= "00001000";
when s4 => lights <= "00010000";
when s5 => lights <= "00100000";
when s6 => lights <= "01000000";
when s7 => lights <= "10000000";
when others => lights <= "00000000";
end case;
end process;

C3: process(state)
begin
case state is
when s7 => 
     if btn='1' then 
       grade <= "11";
     end if;
when s6 => 
     if btn='1' then 
       grade <= "01";
     end if;
when others => grade <= "00";
end case;
end process;

end rtl;

