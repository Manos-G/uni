library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tl_top is
port(
clk : in STD_LOGIC;
btn : in STD_LOGIC;
ld : out STD_LOGIC_VECTOR(5 downto 0)
);
end tl_top;
architecture tl_top of tl_top is

component clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end component;

component traffic is
port (clk: in STD_LOGIC;
clr: in STD_LOGIC;
lights: out STD_LOGIC_VECTOR(5 downto 0));
end component;
signal clr, clk3: STD_LOGIC;
begin
clr <= btn;

U1: clkdiv
  port map (
  mclk=>clk,
  clr=>clr,
  clk3=>clk3,
  clkfast=>open
);

U2: traffic
port map (
  clk=>clk3,
  clr=>clr,
  lights=>ld
);

end tl_top;
