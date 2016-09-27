----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:32 05/14/2014 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
library IEEE;								-- declaration of library
use IEEE.STD_LOGIC_1164.ALL;			-- declaration of library
entity ALU is														-- entinty ALU
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);		-- Input A
           B : in  STD_LOGIC_VECTOR (3 downto 0);		-- Input B
           OPC : in  STD_LOGIC_VECTOR (2 downto 0);	-- Select
           Cin : in  STD_LOGIC;						
           BWin : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);		-- Output F
           Cout : out  STD_LOGIC;
           BWou : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is	-- architecture

begin
	process(OPC, A, B, Cin)
		begin
		if (OPC = "000") then
			-- Adiction			
			for i in 0 to 3 loop
				if(i = 0) then
					F(i) <= A(i) xor B(i) xor Cin;
					Cout  <= (A(i) and B(i)) or (Cin and ( A(i) xor B(i))); 
				else
					F(i) <= (Cout and (not(A(i) xor B(i))))or(A(i) xor B(i)) 
				end if;
			end loop;
			
		elsif (OPC = "001") then
			-- Subtraction
		elsif (OPC = "010") then
			-- AND
			F(0) <= A(0) and (B(0));
			F(1) <= A(1) and (B(1));
			F(2) <= A(2) and (B(2));
			F(3) <= A(3) and (B(3));
		elsif (OPC = "011") then
			-- OR
			F(0) <= A(0) or (B(0));
			F(1) <= A(1) or (B(1));
			F(2) <= A(2) or (B(2));
			F(3) <= A(3) or (B(3));
		elsif (OPC = "100") then
			-- XOR
			F(0) <= A(0) xor (B(0));
			F(1) <= A(1) xor (B(1));
			F(2) <= A(2) xor (B(2));
			F(3) <= A(3) xor (B(3));
		elsif (OPC = "101") then
			-- NOT B
			for i in 0 to 3 loop
				F(i) <= not(B(i));
			end loop;
		elsif (OPC = "110") then
			-- Nothing
		else
			-- Nothing
		end if;
	end process;
end Behavioral;
