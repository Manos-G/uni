-- Vhdl test bench created from schematic /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/half_adder.sch - Tue Oct 13 07:50:58 2026
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY half_adder_half_adder_sch_tb IS
END half_adder_half_adder_sch_tb;
ARCHITECTURE behavioral OF half_adder_half_adder_sch_tb IS 

   COMPONENT half_adder
   PORT( a0	:	IN	STD_LOGIC; 
          a1	:	IN	STD_LOGIC; 
          C	:	OUT	STD_LOGIC; 
          S	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL a0	:	STD_LOGIC;
   SIGNAL a1	:	STD_LOGIC;
   SIGNAL C	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;

BEGIN

   UUT: half_adder PORT MAP(
		a0 => a0, 
		a1 => a1, 
		C => C, 
		S => S
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      -- 0 + 0 : S=0, C=0
      a0 <= '0'; a1 <= '0';
      WAIT FOR 100 ns;
      ASSERT (S = '0' AND C = '0') REPORT "Fail: 0+0" SEVERITY ERROR;

      -- 0 + 1 : S=1, C=0
      a0 <= '0'; a1 <= '1';
      WAIT FOR 100 ns;
      ASSERT (S = '1' AND C = '0') REPORT "Fail: 0+1" SEVERITY ERROR;

      -- 1 + 0 : S=1, C=0
      a0 <= '1'; a1 <= '0';
      WAIT FOR 100 ns;
      ASSERT (S = '1' AND C = '0') REPORT "Fail: 1+0" SEVERITY ERROR;

      -- 1 + 1 : S=0, C=1
      a0 <= '1'; a1 <= '1';
      WAIT FOR 100 ns;
      ASSERT (S = '0' AND C = '1') REPORT "Fail: 1+1" SEVERITY ERROR;

      REPORT "Simulation finished" SEVERITY NOTE;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;

