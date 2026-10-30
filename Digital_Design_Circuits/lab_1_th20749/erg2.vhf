--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : erg2.vhf
-- /___/   /\     Timestamp : 10/13/2026 08:25:03
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3 -flat -suppress -vhdl /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1_th20749/erg2.vhf -w /home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1_th20749/erg2.sch
--Design Name: erg2
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

entity M2_1_MXILINX_erg2 is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1_MXILINX_erg2;

architecture BEHAVIORAL of M2_1_MXILINX_erg2 is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   I_36_7 : AND2B1
      port map (I0=>S0,
                I1=>D0,
                O=>M0);
   
   I_36_8 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
   I_36_9 : AND2
      port map (I0=>D1,
                I1=>S0,
                O=>M1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity erg2 is
   port ( XLXN_21 : in    std_logic; 
          XLXN_22 : in    std_logic; 
          XLXN_23 : in    std_logic; 
          XLXN_24 : in    std_logic; 
          XLXN_25 : in    std_logic; 
          XLXN_26 : in    std_logic; 
          Q       : out   std_logic_vector (1 downto 0));
end erg2;

architecture BEHAVIORAL of erg2 is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   attribute IOSTANDARD : string ;
   attribute SLEW       : string ;
   attribute DRIVE      : string ;
   signal XLXN_5  : std_logic;
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_9  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_12 : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_17 : std_logic;
   signal XLXN_18 : std_logic;
   signal XLXN_34 : std_logic;
   component fulladder
      port ( cou : out   std_logic; 
             dn  : in    std_logic; 
             sum : out   std_logic; 
             x   : in    std_logic; 
             y   : in    std_logic);
   end component;
   
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component M2_1_MXILINX_erg2
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
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
   
   attribute HU_SET of XLXI_5 : label is "XLXI_5_0";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_1";
begin
   XLXI_1 : fulladder
      port map (dn=>XLXN_7,
                x=>XLXN_5,
                y=>XLXN_8,
                cou=>XLXN_10,
                sum=>XLXN_9);
   
   XLXI_2 : FDC
      port map (C=>XLXN_13,
                CLR=>XLXN_14,
                D=>XLXN_16,
                Q=>XLXN_18);
   
   XLXI_3 : FDC
      port map (C=>XLXN_13,
                CLR=>XLXN_14,
                D=>XLXN_17,
                Q=>XLXN_34);
   
   XLXI_5 : M2_1_MXILINX_erg2
      port map (D0=>XLXN_9,
                D1=>XLXN_5,
                S0=>XLXN_12,
                O=>XLXN_16);
   
   XLXI_6 : M2_1_MXILINX_erg2
      port map (D0=>XLXN_10,
                D1=>XLXN_8,
                S0=>XLXN_12,
                O=>XLXN_17);
   
   XLXI_8 : IBUF
      port map (I=>XLXN_24,
                O=>XLXN_7);
   
   XLXI_9 : IBUF
      port map (I=>XLXN_25,
                O=>XLXN_8);
   
   XLXI_10 : IBUF
      port map (I=>XLXN_26,
                O=>XLXN_5);
   
   XLXI_11 : IBUF
      port map (I=>XLXN_23,
                O=>XLXN_12);
   
   XLXI_12 : IBUF
      port map (I=>XLXN_22,
                O=>XLXN_13);
   
   XLXI_22 : OBUF
      port map (I=>XLXN_18,
                O=>Q(0));
   
   XLXI_24 : IBUF
      port map (I=>XLXN_21,
                O=>XLXN_14);
   
   XLXI_25 : OBUF
      port map (I=>XLXN_34,
                O=>Q(1));
   
end BEHAVIORAL;


