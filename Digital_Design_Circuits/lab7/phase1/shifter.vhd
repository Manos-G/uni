library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
  port (
    Sin   : in  std_logic_vector(7 downto 0);
    Sout  : out std_logic_vector(7 downto 0);
    shL   : in  std_logic;
    shR   : in  std_logic;
    clk   : in  std_logic;
    reset : in  std_logic
  );
end shifter;

architecture beh of shifter is

  component reg8
    port (
      din  : in  std_logic_vector(7 downto 0);
      dout : out std_logic_vector(7 downto 0);
      clk  : in  std_logic;
      rst  : in  std_logic
    );
  end component;

  signal soutbus : std_logic_vector(7 downto 0);

begin

  Ureg : reg8 port map (
    din  => soutbus,
    dout => Sout,
    clk  => clk,
    rst  => reset
  );

  p1 : process (shL, shR, Sin)
  begin
    soutbus <= (others => '0');
    if (shL = '1') then
      soutbus <= Sin(6 downto 0) & '0';
    end if;
    if (shR = '1') then
      soutbus <= '0' & Sin(7 downto 1);
    end if;
    if (shL = '1' and shR = '1') then
      soutbus <= Sin;
    end if;
  end process;

end beh;
