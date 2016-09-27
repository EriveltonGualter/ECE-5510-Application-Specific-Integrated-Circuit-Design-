--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: parity_vhdl_synthesis.vhd
-- /___/   /\     Timestamp: Tue May 20 22:17:37 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm parity_vhdl -w -dir netgen/synthesis -ofmt vhdl -sim parity_vhdl.ngc parity_vhdl_synthesis.vhd 
-- Device	: xc6slx16-2-csg324
-- Input file	: parity_vhdl.ngc
-- Output file	: C:\Users\EriveltonDell\Documents\Western Michigan University\ECE 5510\Programs\parity\netgen\synthesis\parity_vhdl_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: parity_vhdl
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity parity_vhdl is
  port (
    A : in STD_LOGIC_VECTOR ( 6 downto 0 ); 
    p : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end parity_vhdl;

architecture Structure of parity_vhdl is
  signal p_0_OBUF_0 : STD_LOGIC; 
  signal p_1_OBUF_1 : STD_LOGIC; 
  signal p_2_OBUF_2 : STD_LOGIC; 
  signal p_3_OBUF_3 : STD_LOGIC; 
  signal p_4_OBUF_4 : STD_LOGIC; 
  signal p_5_OBUF_5 : STD_LOGIC; 
  signal p_6_OBUF_6 : STD_LOGIC; 
  signal p_7_OBUF_7 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
begin
  p_7_SW0 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => p_1_OBUF_1,
      I1 => p_0_OBUF_0,
      O => N01
    );
  p_7_Q : LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => p_6_OBUF_6,
      I1 => p_5_OBUF_5,
      I2 => p_4_OBUF_4,
      I3 => p_3_OBUF_3,
      I4 => p_2_OBUF_2,
      I5 => N01,
      O => p_7_OBUF_7
    );
  A_6_IBUF : IBUF
    port map (
      I => A(6),
      O => p_6_OBUF_6
    );
  A_5_IBUF : IBUF
    port map (
      I => A(5),
      O => p_5_OBUF_5
    );
  A_4_IBUF : IBUF
    port map (
      I => A(4),
      O => p_4_OBUF_4
    );
  A_3_IBUF : IBUF
    port map (
      I => A(3),
      O => p_3_OBUF_3
    );
  A_2_IBUF : IBUF
    port map (
      I => A(2),
      O => p_2_OBUF_2
    );
  A_1_IBUF : IBUF
    port map (
      I => A(1),
      O => p_1_OBUF_1
    );
  A_0_IBUF : IBUF
    port map (
      I => A(0),
      O => p_0_OBUF_0
    );
  p_7_OBUF : OBUF
    port map (
      I => p_7_OBUF_7,
      O => p(7)
    );
  p_6_OBUF : OBUF
    port map (
      I => p_6_OBUF_6,
      O => p(6)
    );
  p_5_OBUF : OBUF
    port map (
      I => p_5_OBUF_5,
      O => p(5)
    );
  p_4_OBUF : OBUF
    port map (
      I => p_4_OBUF_4,
      O => p(4)
    );
  p_3_OBUF : OBUF
    port map (
      I => p_3_OBUF_3,
      O => p(3)
    );
  p_2_OBUF : OBUF
    port map (
      I => p_2_OBUF_2,
      O => p(2)
    );
  p_1_OBUF : OBUF
    port map (
      I => p_1_OBUF_1,
      O => p(1)
    );
  p_0_OBUF : OBUF
    port map (
      I => p_0_OBUF_0,
      O => p(0)
    );

end Structure;

