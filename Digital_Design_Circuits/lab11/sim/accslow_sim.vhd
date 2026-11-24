-- Simulation model of the Coregen accumulator "accslow" (sim only).
-- Same ports as the Coregen core: 5-bit unsigned input b, 5-bit output q,
-- clock enable ce and synchronous clear sclr, latency 1.
-- On every rising clock edge: if sclr = '1' then q = 0,
-- else if ce = '1' then q = q + b (wraps around at 32).
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity accslow is
port (
  b    : in  STD_LOGIC_VECTOR(4 downto 0);
  clk  : in  STD_LOGIC;
  ce   : in  STD_LOGIC;
  sclr : in  STD_LOGIC;
  q    : out STD_LOGIC_VECTOR(4 downto 0)
);
end accslow;

architecture sim of accslow is
  signal acc : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if sclr = '1' then
        acc <= (others => '0');
      elsif ce = '1' then
        acc <= acc + b;
      end if;
    end if;
  end process;
  q <= acc;
end sim;
