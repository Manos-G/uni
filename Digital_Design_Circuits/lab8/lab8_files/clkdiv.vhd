LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;
ENTITY clkdiv IS
  PORT (
    mclk : IN STD_LOGIC;
    clr : IN STD_LOGIC;
    clkfast : OUT STD_LOGIC;
    clk3 : OUT STD_LOGIC
  );
END clkdiv;
ARCHITECTURE clkdiv OF clkdiv IS
  SIGNAL q : STD_LOGIC_VECTOR(24 DOWNTO 0);
BEGIN
  -- clock divider
  PROCESS (mclk, clr)
  BEGIN
    IF clr = '1' THEN
      q <= X"000000" & '0';
    ELSIF mclk'event AND mclk = '1' THEN
      q <= q + 1;
    END IF;
  END PROCESS;

  clk3 <= q(24); -- 3 Hz
  clkfast <= q(18);
END clkdiv;