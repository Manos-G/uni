--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab2_1.vhf
-- /___/   /\     Timestamp : 10/20/2026 09:36:00
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath /home/manos/Documents/GitHub/Digital_Design_Circuits/lab2/ipcore_dir -intstyle ise -family spartan3 -flat -suppress -vhdl /home/manos/Documents/GitHub/Digital_Design_Circuits/lab2/lab2_1.vhf -w /home/manos/Documents/GitHub/Digital_Design_Circuits/lab2/lab2_1.sch
--Design Name: lab2_1
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

entity lab2_1 is
   port ( clear  : in    std_logic; 
          clk    : in    std_logic; 
          updown : in    std_logic; 
          cntout : out   std_logic_vector (3 downto 0));
end lab2_1;

architecture BEHAVIORAL of lab2_1 is
   attribute IOSTANDARD : string ;
   attribute BOX_TYPE   : string ;
   attribute SLEW       : string ;
   attribute DRIVE      : string ;
   signal q      : std_logic_vector (3 downto 0);
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   signal XLXN_3 : std_logic;
   component counter4bit
      port ( up   : in    std_logic; 
             clk  : in    std_logic; 
             sclr : in    std_logic; 
             q    : out   std_logic_vector (3 downto 0));
   end component;
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
begin
   counter : counter4bit
      port map (clk=>XLXN_2,
                sclr=>XLXN_3,
                up=>XLXN_1,
                q(3 downto 0)=>q(3 downto 0));
   
   XLXI_2 : IBUF
      port map (I=>updown,
                O=>XLXN_1);
   
   XLXI_3 : IBUF
      port map (I=>clk,
                O=>XLXN_2);
   
   XLXI_4 : IBUF
      port map (I=>clear,
                O=>XLXN_3);
   
   XLXI_5 : OBUF
      port map (I=>q(0),
                O=>cntout(0));
   
   XLXI_6 : OBUF
      port map (I=>q(1),
                O=>cntout(1));
   
   XLXI_7 : OBUF
      port map (I=>q(2),
                O=>cntout(2));
   
   XLXI_8 : OBUF
      port map (I=>q(3),
                O=>cntout(3));
   
end BEHAVIORAL;


