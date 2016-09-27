----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:50:25 06/03/2014 
-- Design Name: 
-- Module Name:    stopwatch - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stopwatch is
	port (	CLK : in std_logic;
				SW1 : in std_logic;
				PB0 :	in std_logic;
				AN	 : out std_logic_vector (3 downto 0);
				SEG : out std_logic_vector (6 downto 0)		);
end stopwatch;

architecture Behavioral of stopwatch is

	signal SMCLK : std_logic;
	signal SGCLK : std_logic;
	signal DBCLK : std_logic;
	
	signal SHIFTR1,SHIFTR2 : std_logic_vector (3 downto 0) := "0000";
	signal DPB0 : std_logic := '0';
	signal DSW1 : std_logic := '0';
	
	type state is (IDLE, COUNT, STOP, FREEZE);
	signal PRESENT_STATE : state:=IDLE;
	
	signal DIG1: std_logic_vector (3 downto 0) := "0000";
	signal DIG2: std_logic_vector (3 downto 0) := "0000";
	signal DIG3: std_logic_vector (3 downto 0) := "0000";
	signal DIG4: std_logic_vector (3 downto 0) := "0000";	
	
	signal BCD: std_logic_vector (3 downto 0);
	
	signal STOP_COUNT : boolean := true; 
	signal RESET_COUNT: boolean := false;
	signal DISPLAY_FREEZE : std_logic := '0'; 

begin

--------------------------------------------------
--------         1KHz Clock        ---------------
--------------------------------------------------
clk_process: process(CLK)
	variable DIVIDE : integer := 5;--100000;
	variable COUNTER_DIV : integer :=0;
begin
	if (rising_edge(CLK)) then
		if(COUNTER_DIV < DIVIDE/2-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			SMCLK <= '0';
		elsif (COUNTER_DIV < DIVIDE-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			SMCLK <= '1';
		else
			SMCLK <= '0';
			COUNTER_DIV := 0;
		end if; 
	end if;
	SGCLK <= SMCLK;
	DBCLK <= SMCLK;
end process clk_process;

--------------------------------------------------
--------      Debouncing SW1           -----------
--------------------------------------------------

process(DBCLK,SW1)
begin
	if (DBCLK='1' and DBCLK'event) then
		SHIFTR1(2 downto 0) <= SHIFTR1(3 downto 1);
		SHIFTR1(3) <= SW1;
		if (SHIFTR1 = "0000") then
			DSW1 <= '0';
		else
			DSW1 <= '1';
		end if;
	end if;
	-- simulaco
	DSW1 <= SW1;
end process;

--------------------------------------------------
--------      Debouncing PB0           -----------
--------------------------------------------------

process(DBCLK,PB0)
begin
	if (DBCLK='1' and DBCLK'event) then
		SHIFTR2(2 downto 0) <= SHIFTR2(3 downto 1);
		SHIFTR2(3) <= PB0;
		if (SHIFTR2 = "0000") then
			DPB0 <= '0';
		else
			DPB0 <= '1';
		end if;
	end if;
	-- simulaco
	DPB0 <= PB0;
end process;

--------------------------------------------------
--------      Display Controller       -----------
--------------------------------------------------

process(SGCLK, DISPLAY_FREEZE, BCD)
	variable SEL: STD_LOGIC_vector(1 downto 0) := "00";
	variable FDIG1: std_logic_vector (3 downto 0) ;
	variable FDIG2: std_logic_vector (3 downto 0) ;
	variable FDIG3: std_logic_vector (3 downto 0) ;
	variable FDIG4: std_logic_vector (3 downto 0) ;	
		
begin 
	if (SGCLK='1' and SGCLK'event ) then
		SEL:=SEL+1; 			 
	end if;
	if (DISPLAY_FREEZE = '1' and DISPLAY_FREEZE'event) then
		FDIG1 := DIG1;
		FDIG2 := DIG2;
		FDIG3 := DIG3;
		FDIG4 := DIG4;
	end if;
	
	case SEL is
		when "00" => 
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG1; 
			else	
				BCD <= DIG1; 
			end if;
			AN  <= "1110";
		when "01"=> 
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG2; 
			else	
				BCD <= DIG2; 
			end if;
			AN  <= "1101";
		when "10"=> 
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG3; 
			else	
				BCD <= DIG3; 
			end if;
			AN  <= "1011";
		when others=>
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG4; 
			else	
				BCD <= DIG4; 
			end if;
			AN  <= "0111"; 
	end case;

end process;

--------------------------------------------------
--------     7 segments Decoder        -----------
--------------------------------------------------
segment_process: process(BCD)
begin
	case  BCD is
	when "0000"=> SEG <="0000001";  -- '0'
	when "0001"=> SEG <="1001111";  -- '1'
	when "0010"=> SEG <="0010010";  -- '2'
	when "0011"=> SEG <="0000110";  -- '3'
	when "0100"=> SEG <="1001100";  -- '4' 
	when "0101"=> SEG <="0100100";  -- '5'
	when "0110"=> SEG <="0100000";  -- '6'
	when "0111"=> SEG <="0001111";  -- '7'
	when "1000"=> SEG <="0000000";  -- '8'
	when "1001"=> SEG <="0000100";  -- '9'
	when others=> SEG <="1111111"; 
	end case;	
end process segment_process;

--------------------------------------------------
--------          Counter          ---------------
--------------------------------------------------
counter: process(SMCLK, DIG4, DIG3, DIG2, DIG1, STOP_COUNT, RESET_COUNT)

begin
	
	if (SMCLK'event and SMCLK = '1' and STOP_COUNT = false) then
		if (RESET_COUNT = true) then
			DIG4 <= "0000";
			DIG3 <= "0000";
			DIG2 <= "0000";
			DIG1 <= "0000";
		elsif (DIG4 = "0101" and DIG3 = "1001" and DIG2 = "1001" and DIG1 = "1001") then -- 59.99
			DIG4 <= "0000";
			DIG3 <= "0000";
			DIG2 <= "0000";
			DIG1 <= "0000";
		elsif ( DIG3 = "1001" and DIG2 = "1001" and DIG1 = "1001") then -- X9.99
			DIG4 <= DIG4 + 1;
			DIG3 <= "0000";
			DIG2 <= "0000";
			DIG1 <= "0000";	
		elsif ( DIG2 = "1001" and DIG1 = "1001") then -- XX.99
			DIG3 <= DIG3 + 1;
			DIG2 <= "0000";
			DIG1 <= "0000";	
		elsif ( DIG1 = "1001") then -- XX.X9
			DIG2 <= DIG2 + 1;
			DIG1 <= "0000";	
		else -- XX.XX
			DIG1 <= DIG1 + 1;
		end if;
	end if;
	
end process counter;

--------------------------------------------------
--------         STATE MACHINE         -----------
--------------------------------------------------
machine: process(SMCLK, DSW1, DPB0, DIG4, DIG3, DIG2, DIG1)
	
begin

	case PRESENT_STATE is
	when IDLE =>	
		DISPLAY_FREEZE <= '0';
		if (DSW1 = '1') then
			PRESENT_STATE <= COUNT;
		else
			PRESENT_STATE <= IDLE;
		end if;
			
	when COUNT =>
		STOP_COUNT		<= false;
		DISPLAY_FREEZE <= '0';
		
		if (DSW1 = '0') then
			PRESENT_STATE <= STOP;
		elsif (DSW1 = '1' and DIG4 = "0000" and DIG3 = "0000" and DIG2 = "0000" and DIG1 = "0000") then
			RESET_COUNT <= false;
		elsif (DPB0 = '1') then
			PRESENT_STATE <= FREEZE;
		else
			PRESENT_STATE <= COUNT;
		end if;

	when STOP =>
		STOP_COUNT <= true;
		if (DSW1 = '1') then
			RESET_COUNT <= true;
			PRESENT_STATE <= COUNT;
		end if;
	
	when FREEZE =>
		DISPLAY_FREEZE <= '1';
	end case;

end process machine;

end Behavioral;

