library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity top is
port(
  clk : in STD_LOGIC;
  clr : in STD_LOGIC;
  btn : in STD_LOGIC;
  expert : in STD_LOGIC;   -- switch: '0' = novice, '1' = expert
  an  : out STD_LOGIC_VECTOR(3 downto 0);
  digits : out STD_LOGIC_VECTOR(6 downto 0);
  leds: out STD_LOGIC_VECTOR(7 downto 0)
);
end top;

architecture rtl of top is

component clkdiv is
port(
mclk : in STD_LOGIC;
clr : in STD_LOGIC;
expert : in STD_LOGIC;
clkfast : out STD_LOGIC;
clk3 : out STD_LOGIC
);
end component;

  component todisplay is
  port(
  clk : in std_logic;
  rst : in std_logic;
  in16bit : in std_logic_vector(15 downto 0);
  outan : out std_logic_vector(3 downto 0);
  out7seg : out std_logic_vector(6 downto 0)
  );
  end component;

  component spike is
  port (clk: in STD_LOGIC;
      clr: in STD_LOGIC;
      btn: in STD_LOGIC;
      grade: out STD_LOGIC_VECTOR(1 downto 0);
      lights: out STD_LOGIC_VECTOR(7 downto 0));
  end component;

  component debounce is
  generic (N : integer := 19);
  port (
    clk   : in  STD_LOGIC;
    btn   : in  STD_LOGIC;
    pulse : out STD_LOGIC
  );
  end component;

  component accslow IS
    port (
    b: IN std_logic_VECTOR(4 downto 0);
    clk: IN std_logic;
    ce: IN std_logic;
    sclr: IN std_logic;
    q: OUT std_logic_VECTOR(4 downto 0));
  END component;

  signal clk3, clkfast: STD_LOGIC;
  signal lights: std_logic_vector(7 downto 0);
  signal grade : std_logic_vector(1 downto 0);
  signal b,q   : std_logic_vector(4 downto 0);
  signal in16bit: std_logic_vector(15 downto 0);
  signal out7bit: std_logic_vector(6 downto 0);
  signal btn_p : std_logic;  -- debounced button, one clk pulse per press
  
begin

U1: clkdiv
  port map (
  mclk=>clk,
  clr=>clr,
  expert=>expert,
  clk3=>clk3,
  clkfast=>clkfast
);

-- debounce the button: btn_p is '1' for one 50 MHz cycle on each press,
-- so the accumulator adds the points once per press
U0: debounce
  port map(
    clk   => clk,
    btn   => btn,
    pulse => btn_p
  );

U2: spike 
  port map(
      clk=>clk3,
      clr=>clr,
      btn=>btn_p,
      grade=>grade,
      lights=>leds
  );

b <= "000"&grade ;
U3: accslow 
  port map(
   b => b,
   clk=> clk,
   ce => btn_p,
   sclr=>clr,
   q => q
  );

in16bit <= "00000000000" & q ;
U4: todisplay 
  port map(
  clk     => clkfast,
  rst     => clr,
  in16bit => in16bit,
  outan   => an,
  out7seg => out7bit
  );
digits <= not out7bit;

end rtl;
