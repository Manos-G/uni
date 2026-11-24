-- Testbench for top (lab11 game), phases 1-3.
-- Presses the button (with contact bounce) while the 8th LED is on,
-- then while the 7th LED is on, then while a middle LED is on,
-- and reports the score after each press.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity tb_top is
end tb_top;

architecture sim of tb_top is
  component top
  port(clk : in STD_LOGIC;
       clr : in STD_LOGIC;
       btn : in STD_LOGIC;
       an : out STD_LOGIC_VECTOR(3 downto 0);
       digits : out STD_LOGIC_VECTOR(6 downto 0);
       leds : out STD_LOGIC_VECTOR(7 downto 0));
  end component;

  signal clk : STD_LOGIC := '0';
  signal clr : STD_LOGIC := '1';
  signal btn : STD_LOGIC := '0';
  signal an : STD_LOGIC_VECTOR(3 downto 0);
  signal digits : STD_LOGIC_VECTOR(6 downto 0);
  signal leds : STD_LOGIC_VECTOR(7 downto 0);
  signal score : STD_LOGIC_VECTOR(4 downto 0);
  signal done : boolean := false;
  constant T : time := 20 ns;  -- 50 MHz
begin
  uut: top port map (clk => clk, clr => clr, btn => btn, an => an,
                     digits => digits, leds => leds);

  clk <= not clk after T/2 when not done;
  score <= << signal .tb_top.uut.q : STD_LOGIC_VECTOR(4 downto 0) >>;

  process
    -- press with bounce, hold, release with bounce
    procedure press(hold : time) is
    begin
      for i in 1 to 3 loop
        btn <= '1'; wait for 300 us;
        btn <= '0'; wait for 200 us;
      end loop;
      btn <= '1'; wait for hold;
      for i in 1 to 3 loop
        btn <= '0'; wait for 300 us;
        btn <= '1'; wait for 200 us;
      end loop;
      btn <= '0';
    end procedure;

    procedure play(led : integer; name : string) is
      variable before : integer;
    begin
      wait until leds(led) = '1';
      before := to_integer(unsigned(score));
      press(15 ms);
      wait for 20 ms;
      report name & ": score " & integer'image(before) & " -> "
             & integer'image(to_integer(unsigned(score)));
    end procedure;
  begin
    clr <= '1'; wait for 5*T; clr <= '0';
    play(7, "press on 8th LED (expect +3)");
    play(6, "press on 7th LED (expect +1)");
    play(3, "press on 4th LED (expect +0)");
    done <= true;
    wait;
  end process;
end sim;
