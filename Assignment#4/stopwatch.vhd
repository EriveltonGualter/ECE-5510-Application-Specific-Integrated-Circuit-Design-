----------------------------------------------------------------------------------
-- Company: Western Michigan University
-- Engineer: Erivelton Gualter dos Santos
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
				DP	 : out std_logic;
				AN	 : out std_logic_vector (3 downto 0);
				SEG : out std_logic_vector (6 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is

	signal CCLK : std_logic;
	signal MCLK : std_logic;
	
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
	
	signal COUNTING   : boolean := false; 
	signal RESET_COUNT: boolean := false;
	signal DISPLAY_FREEZE: std_logic := '0'; 

begin

--------------------------------------------------
--------         Count Clock       ---------------
--------------------------------------------------
clk_main: process(CLK, CCLK)
	variable DIVIDE : integer := 50;--0000;
	variable COUNTER_DIV : integer :=0;
begin
	if (rising_edge(CLK)) then
		if(COUNTER_DIV < DIVIDE/2-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			CCLK <= '0';
		elsif (COUNTER_DIV < DIVIDE-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			CCLK <= '1';
		else
			CCLK <= '0';
			COUNTER_DIV := 0;
		end if; 
	end if;
end process clk_main;

--------------------------------------------------
--------         Main Clock        ---------------
--------------------------------------------------
clk_segment: process(CLK, MCLK)
	variable DIVIDE : integer := 16;--00;
	variable COUNTER_DIV : integer :=0;
begin
	if (rising_edge(CLK)) then
		if(COUNTER_DIV < DIVIDE/2-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			MCLK <= '0';
		elsif (COUNTER_DIV < DIVIDE-1) then
			COUNTER_DIV := COUNTER_DIV + 1;
			MCLK <= '1';
		else
			MCLK <= '0';
			COUNTER_DIV := 0;
		end if; 
	end if;
end process clk_segment;

--------------------------------------------------
--------      Debouncing SW1           -----------
--------------------------------------------------

process(MCLK,SW1)
begin
	if (MCLK='1' and MCLK'event) then
		SHIFTR1(2 downto 0) <= SHIFTR1(3 downto 1);
		SHIFTR1(3) <= SW1;
		if (SHIFTR1 = "0000") then
			DSW1 <= '0';
		else
			DSW1 <= '1';
		end if;
	end if;
	-- simulaco
	-- DSW1 <= SW1;
end process;

--------------------------------------------------
--------      Debouncing PB0           -----------
--------------------------------------------------

process(MCLK,PB0)
begin
	if (MCLK='1' and MCLK'event) then
		SHIFTR2(2 downto 0) <= SHIFTR2(3 downto 1);
		SHIFTR2(3) <= PB0;
		if (SHIFTR2 = "0000") then
			DPB0 <= '0';
		else
			DPB0 <= '1';
		end if;
	end if;
	-- simulaco
	-- DPB0 <= PB0;
end process;

--------------------------------------------------
--------      Display Controller       -----------
--------------------------------------------------

process(MCLK, DISPLAY_FREEZE, DIG1, DIG2, DIG3, DIG4)
	variable SEL: STD_LOGIC_vector(1 downto 0) := "00";
	variable FDIG1: std_logic_vector (3 downto 0) ;
	variable FDIG2: std_logic_vector (3 downto 0) ;
	variable FDIG3: std_logic_vector (3 downto 0) ;
	variable FDIG4: std_logic_vector (3 downto 0) ;	
		
begin 
	if (MCLK='1' and MCLK'event ) then
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
			DP <= '1';
		when "01"=> 
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG2; 
			else	
				BCD <= DIG2; 
			end if;
			AN  <= "1101";
			DP <= '1';
		when "10"=> 
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG3; 
			else	
				BCD <= DIG3; 
			end if;
			AN  <= "1011";
			DP <= '0';
		when others=>
			if (DISPLAY_FREEZE = '1') then 
				BCD <= FDIG4; 
			else	
				BCD <= DIG4; 
			end if;
			AN  <= "0111";
			DP <= '1';
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
counter: process(CCLK, DSW1, RESET_COUNT)

begin
	if (CCLK'event and CCLK = '1') then
		if (COUNTING = true) then
			if (DIG4 = "0101" and DIG3 = "1001" and DIG2 = "1001" and DIG1 = "1001") then -- 59.99
				DIG4 <= "0000";
				DIG3 <= "0000";
				DIG2 <= "0000";
				DIG1 <= "0000";
			elsif (DIG3 = "1001" and DIG2 = "1001" and DIG1 = "1001") then -- X9.99
				DIG4 <= DIG4 + 1;
				DIG3 <= "0000";
				DIG2 <= "0000";
				DIG1 <= "0000";	
			elsif (DIG2 = "1001" and DIG1 = "1001") then -- XX.99
				DIG3 <= DIG3 + 1;
				DIG2 <= "0000";
				DIG1 <= "0000";	
			elsif (DIG1 = "1001") then -- XX.X9
				DIG2 <= DIG2 + 1;
				DIG1 <= "0000";	
			else -- XX.XX
				DIG1 <= DIG1 + 1;
			end if;
		elsif (RESET_COUNT = true) then
			DIG4 <= "0000";
			DIG3 <= "0000";
			DIG2 <= "0000";
			DIG1 <= "0000";
		end if;
	end if;
	
end process counter;

--------------------------------------------------
--------         STATE MACHINE         -----------
--------------------------------------------------
machine: process(MCLK, DSW1, CCLK)
	--variable reset: integer :=0;
	--variable regreset: boolean := false;
begin
	if (MCLK'event and MCLK = '1') then
		case PRESENT_STATE is
		when IDLE =>	
			DISPLAY_FREEZE <= '0';
			COUNTING 		<= false;
							
			if (DPB0 = '1') then
				PRESENT_STATE <= FREEZE;
			elsif (DSW1 = '1') then
				PRESENT_STATE <= COUNT;
			else
				PRESENT_STATE <= IDLE;
			end if;
			
		when COUNT =>
			DISPLAY_FREEZE <= '0';
			COUNTING 		<= true;
			RESET_COUNT 	<= false;
			
			if(DSW1 = '1' and DPB0 = '1') then
				PRESENT_STATE <= FREEZE;
			elsif (DSW1 = '1') then
				PRESENT_STATE <= COUNT;
			elsif (DSW1 = '0') then
				PRESENT_STATE <= STOP;
			end if;
			
		when STOP =>
			COUNTING 	   <= false;
			RESET_COUNT 	<= true;
			DISPLAY_FREEZE <= '1';
			
			if (DSW1 = '1') then
				PRESENT_STATE <= COUNT;
			else
				PRESENT_STATE <= STOP;
			end if;	
					
		when FREEZE =>
			DISPLAY_FREEZE <= '1';
			COUNTING			<= true;
			
			if (DPB0 = '1') then
				PRESENT_STATE <= FREEZE;
			else
				PRESENT_STATE <= COUNT;
			end if;
					
		end case;
	end if;
end process machine;

end Behavioral;

