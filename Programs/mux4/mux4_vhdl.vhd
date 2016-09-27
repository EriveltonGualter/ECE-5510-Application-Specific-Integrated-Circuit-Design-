----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:38:04 05/14/2014 
-- Design Name: 
-- Module Name:    mux4_vhdl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;  -- defines std_logic types

entity mux4_vhdl is
    port (
	  Sel   : in STD_LOGIC_VECTOR(1 downto 0);   -- Select Inputs 
	  A, B, C, D   : in STD_LOGIC;               -- Inputs
	  Y   : out STD_LOGIC   -- Output            
         );
end mux4_vhdl;

architecture behavior of mux4_vhdl is

begin
	process (Sel, A, B, C, D)
		begin
		if (Sel = "00") then
		Y <= A;
		elsif (Sel = "01") then
		Y <= B;
		elsif (Sel = "10") then
		Y <= C;
		else
		Y <= D;
		end if;
	end process;
end behavior;


