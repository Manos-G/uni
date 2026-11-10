library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8 is
  port (
    din  : in  std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0);
    clk  : in  std_logic;
    rst  : in  std_logic
  );
end reg8;

architecture rtl of reg8 is
begin
  process (clk, rst)
  begin
    if rst = '1' then
      dout <= (others => '0');
    elsif (clk'event and clk = '1') then
      dout <= din;
    end if;
  end process;
end rtl;
