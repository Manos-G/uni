-- Vhdl test bench created from schematic /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1_th20749/erg2.sch - Tue Oct 13 08:25:37 2026
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
ENTITY erg2_erg2_sch_tb IS
END erg2_erg2_sch_tb;
ARCHITECTURE behavioral OF erg2_erg2_sch_tb IS 

   COMPONENT erg2
   PORT( XLXN_21	:	IN	STD_LOGIC; 
          XLXN_22	:	IN	STD_LOGIC; 
          XLXN_23	:	IN	STD_LOGIC; 
          XLXN_24	:	IN	STD_LOGIC; 
          XLXN_25	:	IN	STD_LOGIC; 
          XLXN_26	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0));
   END COMPONENT;

   SIGNAL XLXN_21	:	STD_LOGIC;
   SIGNAL XLXN_22	:	STD_LOGIC;
   SIGNAL XLXN_23	:	STD_LOGIC;
   SIGNAL XLXN_24	:	STD_LOGIC;
   SIGNAL XLXN_25	:	STD_LOGIC;
   SIGNAL XLXN_26	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);

BEGIN

   UUT: erg2 PORT MAP(
		XLXN_21 => XLXN_21, 
		XLXN_22 => XLXN_22, 
		XLXN_23 => XLXN_23, 
		XLXN_24 => XLXN_24, 
		XLXN_25 => XLXN_25, 
		XLXN_26 => XLXN_26, 
		Q => Q
   );

-- *** Test Bench - User Defined Section ***
   -- *** Test Bench - User Defined Section ***
   tb : PROCESS
      VARIABLE v : unsigned(5 DOWNTO 0);
   BEGIN
      FOR i IN 0 TO 63 LOOP
         v := to_unsigned(i, 6);   -- turn the number i into 6 bits
         XLXN_21 <= v(0);
         XLXN_22 <= v(1);
         XLXN_23 <= v(2);
         XLXN_24 <= v(3);
         XLXN_25 <= v(4);
         XLXN_26 <= v(5);
         WAIT FOR 10 ns;
      END LOOP;

      REPORT "Simulation finished" SEVERITY NOTE;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***
-- *** End Test Bench - User Defined Section ***

END;
