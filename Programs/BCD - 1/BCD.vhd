----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:45:32 05/24/2014 
-- Design Name: 
-- Module Name:    BCD - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD is
	port(	CLK:	in std_logic;
			CLR:	in std_logic;
			AN	:	out std_logic_vector (3 downto 0);
			C	:	out std_logic_vector (7 downto 0));
end BCD;

architecture Behavioral of BCD is
	type state_type is (count, clear);
	signal present_state, next_state: state_type := count;
	signal unit, dozen: integer;
	signal bcd : std_logic_vector(3 downto 0); 
	signal iterate: std_logic;
begin

count_process: process(present_state)
begin
	case present_state is
	when count =>
	
	unit	<=0;
	dozen <=0;
	
	for I in 0 to 3 loop
		for II in 0 to 9 loop
			unit <= unit + 1;
		end loop;
		dozen <= dozen + 1;
	end loop;
	
	when clear =>
	end case;
end process count_process;

segment_process: process(unit, dozen)
begin
	case  bcd is
	when "0000"=> C <="0000001";  -- '0'
	when "0001"=> C <="1001111";  -- '1'
	when "0010"=> C <="0010010";  -- '2'
	when "0011"=> C <="0000110";  -- '3'
	when "0100"=> C <="1001100";  -- '4' 
	when "0101"=> C <="0100100";  -- '5'
	when "0110"=> C <="0100000";  -- '6'
	when "0111"=> C <="0001111";  -- '7'
	when "1000"=> C <="0000000";  -- '8'
	when "1001"=> C <="0000100";  -- '9'
	--nothing is displayed when a number more than 9 is given as input. 
	when others=> C <="1111111"; 
	end case;	
end process segment_process;

clk_process: process(CLK, CLR, iterate)
begin
	if(CLK'event and CLK = '1') then
		if (CLR = '0') then
			present_state <= count;
		--	iterate <= iterate + '1';
		else
			present_state <= clear;
		end if;
	end if;
end process clk_process;

end Behavioral;

