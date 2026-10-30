-- Vhdl test bench created from schematic /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/full_adder.sch - Tue Oct 13 08:46:10 2026
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
ENTITY full_adder_full_adder_sch_tb IS
END full_adder_full_adder_sch_tb;
ARCHITECTURE behavioral OF full_adder_full_adder_sch_tb IS 

   COMPONENT full_adder
   PORT( sum	:	OUT	STD_LOGIC; 
          x	:	IN	STD_LOGIC; 
          y	:	IN	STD_LOGIC; 
          dn	:	IN	STD_LOGIC; 
          cout	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL sum	:	STD_LOGIC;
   SIGNAL x	:	STD_LOGIC;
   SIGNAL y	:	STD_LOGIC;
   SIGNAL dn	:	STD_LOGIC;
   SIGNAL cout	:	STD_LOGIC;

BEGIN

   UUT: full_adder PORT MAP(
		sum => sum, 
		x => x, 
		y => y, 
		dn => dn, 
		cout => cout
   );

-- *** Test Bench - User Defined Section ***
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
      VARIABLE v : unsigned(2 DOWNTO 0);
   BEGIN
      FOR i IN 0 TO 7 LOOP
         v := to_unsigned(i, 3);   -- 000, 001, ... 111
         x  <= v(2);
         y  <= v(1);
         dn <= v(0);
         WAIT FOR 100 ns;

         -- sum must be 1 when an odd number of inputs are 1
         ASSERT sum = (v(2) XOR v(1) XOR v(0))
            REPORT "Fail: wrong sum at input " & integer'image(i) SEVERITY ERROR;
         -- cout must be 1 when at least two inputs are 1
         ASSERT cout = ((v(2) AND v(1)) OR (v(2) AND v(0)) OR (v(1) AND v(0)))
            REPORT "Fail: wrong cout at input " & integer'image(i) SEVERITY ERROR;
      END LOOP;

      REPORT "Simulation finished" SEVERITY NOTE;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***
-- *** End Test Bench - User Defined Section ***

END;
