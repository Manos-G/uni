entity myshifter
  port (
    Sin  : in  std_logic_vector(7 downto 0);
    Sout : out std_logic_vector(7 downto 0);
    shL  : in  std_logic;
    shR  : out std_logic
  );
end entity;

architecture beh of shifter is
begin
  p1 : process (shL, shR, Sin)
  begin
    sout <= (others => ’0’);
    if (shL = ‘1’) then
      sout <= sin(6 downto 0) & ‘0’;
    end if;
    if (shR = ‘1’) then
      sout <= ‘0’ & sin(7 downto 1);
    end if;
    if (shL = ‘1’ and shR = ‘1’) then
      sout <= sin;
    end if;
  end process;
end beh;
