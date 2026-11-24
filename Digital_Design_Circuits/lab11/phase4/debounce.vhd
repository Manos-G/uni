-- Debounce + single pulse for a push button.
--
-- 1. The button is synchronised to clk with two flip-flops.
-- 2. The debounced value btn_db only changes after the button has stayed at
--    the new value for 2^N clock cycles (N = 19: 2^19 * 20 ns = ~10 ms),
--    so the bounces of the contact are ignored.
-- 3. On the rising edge of btn_db the output gives one '1' pulse that lasts
--    exactly one clock cycle, so one press is counted once, no matter how
--    long the button is held.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity debounce is
generic (N : integer := 19);
port (
  clk   : in  STD_LOGIC;
  btn   : in  STD_LOGIC;
  pulse : out STD_LOGIC
);
end debounce;

architecture rtl of debounce is
  signal s1, s2   : STD_LOGIC := '0';
  signal btn_db   : STD_LOGIC := '0';
  signal btn_prev : STD_LOGIC := '0';
  signal cnt      : STD_LOGIC_VECTOR(N downto 0) := (others => '0');  -- cnt(N) = 1 after 2^N cycles
begin

process(clk)
begin
  if clk'event and clk = '1' then
    -- synchroniser
    s1 <= btn;
    s2 <= s1;

    -- debounce: count while the input differs from the stable value
    if s2 = btn_db then
      cnt <= (others => '0');
    elsif cnt(N) = '1' then
      btn_db <= s2;
      cnt <= (others => '0');
    else
      cnt <= cnt + 1;
    end if;

    btn_prev <= btn_db;
  end if;
end process;

-- one clock cycle pulse on each press
pulse <= btn_db and not btn_prev;

end rtl;
