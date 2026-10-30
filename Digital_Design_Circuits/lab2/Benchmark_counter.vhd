--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:18:25 10/13/2026
-- Design Name:   
-- Module Name:   /home/manos/Documents/GitHub/Digital_Design_Circuits/lab2/Benchmark_counter.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter4bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Benchmark_counter IS
END Benchmark_counter;
 
ARCHITECTURE behavior OF Benchmark_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter4bit
    PORT(
         clk : IN  std_logic;
         sclr : IN  std_logic;
         up : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sclr : std_logic := '0';
   signal up : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter4bit PORT MAP (
          clk => clk,
          sclr => sclr,
          up => up,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- 1. Clear the counter for 100 ns (10 clock cycles)
      sclr <= '1';
      up   <= '1';
      wait for 100 ns;
      assert q = "0000" report "Fail: clear did not reset q" severity error;
      sclr <= '0';

      -- 2. Count up for 20 clocks (goes past 15, so you see it wrap to 0)
      up <= '1';
      wait for clk_period*20;

      -- 3. Count down for 20 clocks
      up <= '0';
      wait for clk_period*20;

      -- 4. Clear in the middle of counting
      sclr <= '1';
      wait for clk_period*2;
      assert q = "0000" report "Fail: clear during count" severity error;
      sclr <= '0';

      -- 5. Count up 5 times from 0, q must be 5
      up <= '1';
      wait for clk_period*5;
      assert q = "0101" report "Fail: q is not 5 after 5 clocks" severity error;

      report "Simulation finished" severity note;
      wait;
   end process;

END;
