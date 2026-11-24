-- Testbench for phase3 tl_top (traffic lights on the 7-segment display).
-- Compile with sim/clkdiv_sim.vhd instead of phase3/clkdiv.vhd.
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_tl_top is
end tb_tl_top;
architecture sim of tb_tl_top is
  component tl_top
  port(clk : in STD_LOGIC;
       btn : in STD_LOGIC;
       an : out STD_LOGIC_VECTOR(3 downto 0);
       disp : out STD_LOGIC_VECTOR(6 downto 0);
       dp : out STD_LOGIC);
  end component;
  signal clk : STD_LOGIC := '0';
  signal btn : STD_LOGIC := '1';
  signal an : STD_LOGIC_VECTOR(3 downto 0);
  signal disp : STD_LOGIC_VECTOR(6 downto 0);
  signal dp : STD_LOGIC;
  -- decoded view of the display (active-low -> '1' = segment lit)
  signal seg_a_red, seg_g_yellow, seg_d_green : STD_LOGIC;
  constant T : time := 20 ns;  -- 50 MHz
begin
  uut: tl_top port map (clk => clk, btn => btn, an => an, disp => disp, dp => dp);

  clk <= not clk after T/2;
  seg_a_red    <= not disp(6);
  seg_g_yellow <= not disp(0);
  seg_d_green  <= not disp(3);

  process
  begin
    btn <= '1';
    wait for 3*T;
    btn <= '0';
    wait for 50*16*T;   -- a little more than one full cycle (48 ticks)
    std.env.stop;
  end process;
end sim;
