----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:44 05/27/2014 
-- Design Name: 
-- Module Name:    BCD_vhdl - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;	-- include functions to perform logical
use IEEE.NUMERIC_STD.ALL;		-- arithmetic functions with Signed or Unsigned values

entity BCD_vhdl is
    Port ( CLK : in  STD_LOGIC;								-- Clock signal
           CLR : in  STD_LOGIC;								-- Clear
           AN  : out  STD_LOGIC_VECTOR (3 downto 0);	-- 
           C   : out  STD_LOGIC_VECTOR (7 downto 0));
end BCD_vhdl;

architecture Behavioral of BCD_vhdl is
	signal dozen: UNSIGNED (3 downto 0) := "0000";
	signal unit : UNSIGNED (3 downto 0) := "1001";
	signal bcd : UNSIGNED(3 downto 0); 
	signal counter,divide : integer := 0;
	signal CLK_mod : std_logic;
	signal mux : std_logic;
	
	signal bcd_LastUnit  : UNSIGNED(3 downto 0); 
	signal bcd_LastDozen : UNSIGNED(3 downto 0); 
	
begin

count_process: process(unit, dozen, CLR, CLK_mod)
begin
	if (CLK_mod'event and CLK_mod = '1') then
		if (CLR = '0') then
			if ((unit = "0000" and dozen = "0011") or CLR = '1') then
				dozen <= "0000";
				unit <= "0001";
			else
				if (unit = "1001") then
					unit  <= "0000";
				else
					unit  <= unit + 1;
				end if;
				
				if (unit = "1000") then
					dozen <= dozen + 1;
				end if;
			end if;
		else
			unit  <= "0000";
			dozen <= "0000";
		end if;
		if (bcd_LastUnit = "0001" and bcd_LastDozen = "0011") then
			unit <= "0000";
			dozen <= "0000";
		end if;
	end if;

	if (CLK_mod'event and CLK_mod = '1') then
		AN <= "1101";
		bcd <= dozen;
		bcd_LastDozen <= dozen;
	elsif (CLK_mod'event and CLK_mod = '0') then
		AN <= "1110";
		bcd <= unit;
		bcd_LastUnit  <= unit;
	end if;
	
end process count_process;

segment_process: process(bcd)
begin
	case  bcd is
	when "0000"=> C <="00000011";  -- '0'
	when "0001"=> C <="10011111";  -- '1'
	when "0010"=> C <="00100101";  -- '2'
	when "0011"=> C <="00001101";  -- '3'
	when "0100"=> C <="10011001";  -- '4' 
	when "0101"=> C <="01001001";  -- '5'
	when "0110"=> C <="01000001";  -- '6'
	when "0111"=> C <="00011111";  -- '7'
	when "1000"=> C <="00000001";  -- '8'
	when "1001"=> C <="00001001";  -- '9'
	--nothing is displayed when a number more than 9 is given as input. 
	when others=> C <="11111111"; 
	end case;	
end process segment_process;

clk_process: process(CLK)
begin
	divide <= 100000;
	if( rising_edge(CLK) ) then
		if(counter < divide/2-1) then
			counter <= counter + 1;
			CLK_mod <= '0';
		elsif(counter < divide-1) then
			counter <= counter + 1;
			CLK_mod <= '1';
		else
			CLK_mod <= '0';
			counter <= 0;
		end if; 
	end if;
end process clk_process;

end Behavioral;

