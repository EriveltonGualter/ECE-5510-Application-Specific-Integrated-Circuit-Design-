----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:38 05/19/2014 
-- Design Name: 
-- Module Name:    Counter_vhdl - Behavioral 
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

entity Counter_vhdl is
	port(	A, B, C, D	: in std_logic;
			ENP			: in std_logic;
			ENT			: in std_logic;
			CLR			: in std_logic;
			CLK			: in std_logic;
			load			: in std_logic;
			Rco			: out std_logic;
			Qa, Qb, Qc, Qd	: out std_logic);
end Counter_vhdl;

architecture Behavioral of Counter_vhdl is
	type state_type is (start, load_in, clear, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);
	signal present_state, next_state: state_type := start; --initial state idle
	signal vector   : std_logic_vector( 3 downto 0 );
	signal vector_Q : std_logic_vector( 3 downto 0 );
begin

Load_abcd: process(A, B, C, D)
begin
	vector(0)<=A;
	vector(1)<=B;
	vector(2)<=C;
	vector(3)<=D;
end process Load_abcd;

count_process: process(present_state, load, ENP, ENT, CLR, vector)
begin
	case present_state is
	when start =>
		if (load = '0' and CLR = '1') then
			if (vector = "0000") then		-- 0
				next_state <= s0;
			elsif (vector = "0001") then	-- 1
				next_state <= s1;
			elsif (vector = "0010") then  -- 2
				next_state <= s2;
			elsif (vector = "0011") then	-- 3
				next_state <= s3;
			elsif (vector = "0100") then	-- 4
				next_state <= s4;			
			elsif (vector = "0101") then	-- 5
				next_state <= s5;	
			elsif (vector = "0110") then	-- 6
				next_state <= s6;	
			elsif (vector = "0111") then	-- 7
				next_state <= s7;	
			elsif (vector = "1000") then	-- 8
				next_state <= s8;	
			elsif (vector = "1001") then	-- 9
				next_state <= s9;	
			elsif (vector = "1010") then	-- 10
				next_state <= s10;	
			elsif (vector = "1011") then	-- 11
				next_state <= s11;	
			elsif (vector = "1100") then	-- 12
				next_state <= s12;	
			elsif (vector = "1101") then	-- 13
				next_state <= s13;	
			elsif (vector = "1110") then	-- 14
				next_state <= s14;	
			elsif (vector = "1111") then	-- 15
				next_state <= s15;	
			end if;
		else
			vector_Q <= "0000";
		end if;
	when load_in =>
	when clear =>
	when s0 =>
		vector_Q <= "0000";
		Rco <= '0';
		if (ENP = '1' and ENT = '1' ) then
			next_state <= s1;
		else
			next_state <= s0;
		end if;
	when s1 =>
		vector_Q <= "0001";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s2;
		else
			next_state <= s1;
		end if;
	when s2 =>
		vector_Q <= "0010";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s3;
		else
			next_state <= s2;
		end if;
	when s3 =>
		vector_Q <= "0011";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s4;
		else
			next_state <= s3;
		end if;
	when s4 =>
		vector_Q <= "0100";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s5;
		else
			next_state <= s4;
		end if;
	when s5 =>
		vector_Q <= "0101";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s6;
		else
			next_state <= s5;
		end if;
	when s6 =>
		vector_Q <= "0110";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s7;
		else
			next_state <= s6;
		end if;
	when s7 =>
		vector_Q <= "0111";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s8;
		else
			next_state <= s7;
		end if;
	when s8 =>
		vector_Q <= "1000";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s9;
		else
			next_state <= s8;
		end if;
	when s9 =>
		vector_Q <= "1001";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s10;
		else
			next_state <= s9;
		end if;
	when s10 =>
		vector_Q <= "1010";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s11;
		else
			next_state <= s10;
		end if;
	when s11 =>
		vector_Q <= "1011";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s12;
		else
			next_state <= s11;
		end if;
	when s12 =>
		vector_Q <= "1100";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s13;
		else
			next_state <= s12;
		end if;
	when s13 =>
		vector_Q <= "1101";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s14;
		else
			next_state <= s13;
		end if;
	when s14 =>
		vector_Q <= "1110";
		Rco <= '0';
		if (ENP = '1' and ENT = '1') then
			next_state <= s15;
		else
			next_state <= s14;
		end if;
	when s15 =>
		vector_Q <= "1111";
		Rco <= '1';
		if (ENP = '1' and ENT = '1') then
			next_state <= s0;
		else
			next_state <= s15;
		end if;
	end case;
end process count_process;

Q_process: process(vector_Q)
begin
	Qa <= vector_Q(0);
	Qb <= vector_Q(1);
	Qc <= vector_Q(2);
	Qd <= vector_Q(3);
end process Q_process;

clk_process: process(CLK)
begin
	--wait until (CLK'event and CLK = '1'); --wait until the rising edge
	if (CLK'event and CLK = '1') then
		if (CLR = '0') then
			present_state <= start; 
		else
			present_state <= next_state;
		end if;
	end if;
end process clk_process;

end Behavioral;

