--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: random_synthesis.vhd
-- /___/   /\     Timestamp: Thu May 29 18:34:22 2014
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm random -w -dir netgen/synthesis -ofmt vhdl -sim random.ngc random_synthesis.vhd 
-- Device	: xc6slx16-2-csg324
-- Input file	: random.ngc
-- Output file	: C:\Users\EriveltonDell\Documents\Western Michigan University\ECE 5510\Programs\random\netgen\synthesis\random_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: random
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

entity random is
  port (
    clk : in STD_LOGIC := 'X'; 
    random_num : out STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end random;

architecture Structure of random is
  signal clk_BUFGP_0 : STD_LOGIC; 
  signal rand_temp_31_rand_temp_30_XOR_1_o : STD_LOGIC; 
  signal rand_temp : STD_LOGIC_VECTOR ( 31 downto 0 ); 
begin
  rand_temp_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp_31_rand_temp_30_XOR_1_o,
      Q => rand_temp(0)
    );
  rand_temp_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(0),
      Q => rand_temp(1)
    );
  rand_temp_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(1),
      Q => rand_temp(2)
    );
  rand_temp_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(2),
      Q => rand_temp(3)
    );
  rand_temp_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(3),
      Q => rand_temp(4)
    );
  rand_temp_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(4),
      Q => rand_temp(5)
    );
  rand_temp_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(5),
      Q => rand_temp(6)
    );
  rand_temp_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(6),
      Q => rand_temp(7)
    );
  rand_temp_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(7),
      Q => rand_temp(8)
    );
  rand_temp_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(8),
      Q => rand_temp(9)
    );
  rand_temp_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(9),
      Q => rand_temp(10)
    );
  rand_temp_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(10),
      Q => rand_temp(11)
    );
  rand_temp_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(11),
      Q => rand_temp(12)
    );
  rand_temp_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(12),
      Q => rand_temp(13)
    );
  rand_temp_14 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(13),
      Q => rand_temp(14)
    );
  rand_temp_15 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(14),
      Q => rand_temp(15)
    );
  rand_temp_16 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(15),
      Q => rand_temp(16)
    );
  rand_temp_17 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(16),
      Q => rand_temp(17)
    );
  rand_temp_18 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(17),
      Q => rand_temp(18)
    );
  rand_temp_19 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(18),
      Q => rand_temp(19)
    );
  rand_temp_20 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(19),
      Q => rand_temp(20)
    );
  rand_temp_21 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(20),
      Q => rand_temp(21)
    );
  rand_temp_22 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(21),
      Q => rand_temp(22)
    );
  rand_temp_23 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(22),
      Q => rand_temp(23)
    );
  rand_temp_24 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(23),
      Q => rand_temp(24)
    );
  rand_temp_25 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(24),
      Q => rand_temp(25)
    );
  rand_temp_26 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(25),
      Q => rand_temp(26)
    );
  rand_temp_27 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(26),
      Q => rand_temp(27)
    );
  rand_temp_28 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(27),
      Q => rand_temp(28)
    );
  rand_temp_29 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(28),
      Q => rand_temp(29)
    );
  rand_temp_30 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(29),
      Q => rand_temp(30)
    );
  rand_temp_31 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_0,
      D => rand_temp(30),
      Q => rand_temp(31)
    );
  Mxor_rand_temp_31_rand_temp_30_XOR_1_o_xo_0_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => rand_temp(31),
      I1 => rand_temp(30),
      O => rand_temp_31_rand_temp_30_XOR_1_o
    );
  random_num_31_OBUF : OBUF
    port map (
      I => rand_temp(31),
      O => random_num(31)
    );
  random_num_30_OBUF : OBUF
    port map (
      I => rand_temp(30),
      O => random_num(30)
    );
  random_num_29_OBUF : OBUF
    port map (
      I => rand_temp(29),
      O => random_num(29)
    );
  random_num_28_OBUF : OBUF
    port map (
      I => rand_temp(28),
      O => random_num(28)
    );
  random_num_27_OBUF : OBUF
    port map (
      I => rand_temp(27),
      O => random_num(27)
    );
  random_num_26_OBUF : OBUF
    port map (
      I => rand_temp(26),
      O => random_num(26)
    );
  random_num_25_OBUF : OBUF
    port map (
      I => rand_temp(25),
      O => random_num(25)
    );
  random_num_24_OBUF : OBUF
    port map (
      I => rand_temp(24),
      O => random_num(24)
    );
  random_num_23_OBUF : OBUF
    port map (
      I => rand_temp(23),
      O => random_num(23)
    );
  random_num_22_OBUF : OBUF
    port map (
      I => rand_temp(22),
      O => random_num(22)
    );
  random_num_21_OBUF : OBUF
    port map (
      I => rand_temp(21),
      O => random_num(21)
    );
  random_num_20_OBUF : OBUF
    port map (
      I => rand_temp(20),
      O => random_num(20)
    );
  random_num_19_OBUF : OBUF
    port map (
      I => rand_temp(19),
      O => random_num(19)
    );
  random_num_18_OBUF : OBUF
    port map (
      I => rand_temp(18),
      O => random_num(18)
    );
  random_num_17_OBUF : OBUF
    port map (
      I => rand_temp(17),
      O => random_num(17)
    );
  random_num_16_OBUF : OBUF
    port map (
      I => rand_temp(16),
      O => random_num(16)
    );
  random_num_15_OBUF : OBUF
    port map (
      I => rand_temp(15),
      O => random_num(15)
    );
  random_num_14_OBUF : OBUF
    port map (
      I => rand_temp(14),
      O => random_num(14)
    );
  random_num_13_OBUF : OBUF
    port map (
      I => rand_temp(13),
      O => random_num(13)
    );
  random_num_12_OBUF : OBUF
    port map (
      I => rand_temp(12),
      O => random_num(12)
    );
  random_num_11_OBUF : OBUF
    port map (
      I => rand_temp(11),
      O => random_num(11)
    );
  random_num_10_OBUF : OBUF
    port map (
      I => rand_temp(10),
      O => random_num(10)
    );
  random_num_9_OBUF : OBUF
    port map (
      I => rand_temp(9),
      O => random_num(9)
    );
  random_num_8_OBUF : OBUF
    port map (
      I => rand_temp(8),
      O => random_num(8)
    );
  random_num_7_OBUF : OBUF
    port map (
      I => rand_temp(7),
      O => random_num(7)
    );
  random_num_6_OBUF : OBUF
    port map (
      I => rand_temp(6),
      O => random_num(6)
    );
  random_num_5_OBUF : OBUF
    port map (
      I => rand_temp(5),
      O => random_num(5)
    );
  random_num_4_OBUF : OBUF
    port map (
      I => rand_temp(4),
      O => random_num(4)
    );
  random_num_3_OBUF : OBUF
    port map (
      I => rand_temp(3),
      O => random_num(3)
    );
  random_num_2_OBUF : OBUF
    port map (
      I => rand_temp(2),
      O => random_num(2)
    );
  random_num_1_OBUF : OBUF
    port map (
      I => rand_temp(1),
      O => random_num(1)
    );
  random_num_0_OBUF : OBUF
    port map (
      I => rand_temp(0),
      O => random_num(0)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_0
    );

end Structure;

