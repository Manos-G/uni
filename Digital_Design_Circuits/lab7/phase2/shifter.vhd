library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Phase 2: the shL / shR buttons go through a debounce circuit, so every
-- press gives exactly one '1' pulse of one clock cycle.
--
-- A one-cycle pulse would only show the shifted value on the LEDs for 20 ns,
-- so the shifter now works on the register output (feedback): each press
-- shifts the value stored in the register by one position, and with no
-- press the register keeps its value. The "load" button copies the
-- switches Sin into the register, and "reset" clears it.
entity shifter is
  port (
    Sin   : in  std_logic_vector(7 downto 0);
    Sout  : out std_logic_vector(7 downto 0);
    shL   : in  std_logic;
    shR   : in  std_logic;
    load  : in  std_logic;
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

  component debounce
    port (
      clk              : in  std_logic;
      switch_input     : in  std_logic;
      debounced_output : out std_logic := '0'
    );
  end component;

  signal soutbus : std_logic_vector(7 downto 0);
  signal regout  : std_logic_vector(7 downto 0);
  signal shL_db  : std_logic;
  signal shR_db  : std_logic;

begin

  Ureg : reg8 port map (
    din  => soutbus,
    dout => regout,
    clk  => clk,
    rst  => reset
  );

  Udb_shL : debounce port map (
    clk              => clk,
    switch_input     => shL,
    debounced_output => shL_db
  );

  Udb_shR : debounce port map (
    clk              => clk,
    switch_input     => shR,
    debounced_output => shR_db
  );

  Sout <= regout;

  p1 : process (shL_db, shR_db, load, Sin, regout)
  begin
    soutbus <= regout;                          -- no button: keep value
    if (shL_db = '1') then
      soutbus <= regout(6 downto 0) & '0';
    end if;
    if (shR_db = '1') then
      soutbus <= '0' & regout(7 downto 1);
    end if;
    if (shL_db = '1' and shR_db = '1') then
      soutbus <= regout;
    end if;
    if (load = '1') then
      soutbus <= Sin;
    end if;
  end process;

end beh;
