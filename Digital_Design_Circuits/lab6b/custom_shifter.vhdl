library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myshifter is
  port (
    Sin  : in  std_logic_vector(7 downto 0);
    Sout : out std_logic_vector(7 downto 0);
    shL  : in  std_logic;
    shR  : in  std_logic;
    rorL : in  std_logic;
    rorR : in  std_logic
  );
end entity;

architecture beh of myshifter is
begin
  p1 : process (shL, shR, rorL, rorR, Sin)
  begin
    Sout <= (others => '0');
    if (shL = '1') then
      Sout <= Sin(6 downto 0) & '0';
    end if;
    if (shR = '1') then
      Sout <= '0' & Sin(7 downto 1);
    end if;
    if (rorL = '1') then
      Sout <= Sin(6 downto 0) & Sin(7);
    end if;
    if (rorR = '1') then
      Sout <= Sin(0) & Sin(7 downto 1);
    end if;
    if (shL = '1' and shR = '1') or (rorL = '1' and rorR = '1') then
      Sout <= Sin;
    end if;
  end process;
end beh;
