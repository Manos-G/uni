library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debounce is
  port (
    clk              : in  std_logic;
    switch_input     : in  std_logic;
    debounced_output : out std_logic := '0'
  );
end debounce;

architecture behavioral of debounce is

  type states is (noPushButton, ButtonPushed);
  signal state : states := noPushButton;

  signal stop_counter : std_logic := '0';
  signal run_counter  : std_logic := '0';
  signal counter      : std_logic_vector(23 downto 0) := (others => '0');

begin

  state_machine : process (clk)
  begin
    if clk'event and clk = '1' then
      case state is
        when noPushButton =>
          if (switch_input = '1' and stop_counter = '0') then
            state            <= ButtonPushed;
            debounced_output <= '0';
            run_counter      <= '1';
          else
            state            <= noPushButton;
            debounced_output <= '0';
            run_counter      <= '0';
          end if;

        when ButtonPushed =>
          if stop_counter = '1' then
            state            <= noPushButton;
            debounced_output <= '1';
            run_counter      <= '0';
          else
            state            <= ButtonPushed;
            debounced_output <= '0';
            run_counter      <= '1';
          end if;

        when others =>
          debounced_output <= '0';
          run_counter      <= '0';
          state            <= noPushButton;
      end case;
    end if;
  end process state_machine;

  -- When the state machine goes 'high', it starts the counter (run_counter = 1).
  -- The counter counts from 0 to 11,500,000 (x"AF79E0"). Each cycle is 20 ns,
  -- so the total time is 11,500,000 * 20 ns = 0.23 sec. When it is done it
  -- sets stop_counter to '1', the output gives a single '1' pulse and the
  -- state goes back to noPushButton.
  count_machine : process (clk, run_counter)
  begin
    if run_counter = '1' then
      if clk'event and clk = '1' then
        if counter = x"AF79E0" then
          stop_counter <= '1';
        else
          stop_counter <= '0';
        end if;
        counter <= counter + 1;
      end if;
    else
      counter <= x"000000";
    end if;
  end process count_machine;

end behavioral;
