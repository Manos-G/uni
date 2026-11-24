-- Testbench for traffic.vhd: drives clk directly (1 tick = 1 clk3 period)
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_traffic is
end tb_traffic;
architecture sim of tb_traffic is
  component traffic
  port (clk: in STD_LOGIC;
        clr: in STD_LOGIC;
        lights: out STD_LOGIC_VECTOR(5 downto 0));
  end component;
  signal clk : STD_LOGIC := '0';
  signal clr : STD_LOGIC := '1';
  signal lights : STD_LOGIC_VECTOR(5 downto 0);
  constant T : time := 10 ns;
begin
  uut: traffic port map (clk => clk, clr => clr, lights => lights);

  clk <= not clk after T/2;

  process
  begin
    clr <= '1';
    wait for 2*T;
    clr <= '0';
    wait for 28*T;
    -- reset in the middle of s3 (EW green): FSM jumps back to s0
    clr <= '1';
    wait for 2*T;
    clr <= '0';
    wait for 52*T;
    std.env.stop;
  end process;
end sim;
