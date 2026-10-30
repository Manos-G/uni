--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : half_adder.vhf
-- /___/   /\     Timestamp : 10/13/2026 08:36:52
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3 -flat -suppress -vhdl /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/half_adder.vhf -w /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/half_adder.sch
--Design Name: half_adder
--Device: spartan3
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity half_adder is
   port ( a0 : in    std_logic; 
          a1 : in    std_logic; 
          C  : out   std_logic; 
          S  : out   std_logic);
end half_adder;

architecture BEHAVIORAL of half_adder is
   attribute BOX_TYPE   : string ;
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : XOR2
      port map (I0=>a0,
                I1=>a1,
                O=>S);
   
   XLXI_2 : AND2
      port map (I0=>a0,
                I1=>a1,
                O=>C);
   
end BEHAVIORAL;


