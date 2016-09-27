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
use IEEE.std_logic_1164.all;

entity fulladder is
  port(A, B, Cin: in std_logic;     --inputs
       Cout, Sum: out std_logic);   --outputs
end fulladder;

architecture behavioral of fulladder is

begin			-- concurrent assignment statements
  Sum  <= A xor B xor Cin; 
  Cout <= (A and B) or (A and Cin) or (B and Cin);

end behavioral;
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.std_logic_1164.all;

entity count is
  port(abcd 	: in std_logic_vector (3 downto 0);     --inputs
       count1	: out std_logic_vector (3 downto 0));   --outputs
end count;

architecture behavioral of count is

signal co, add, zero : std_logic;
signal c1 : std_logic_vector (3 downto 0);

component fulladder port(A, B, Cin: in std_logic;     
								 Cout, Sum: out std_logic);   
end component fulladder;

begin
	add <= '1';
	zero <= '0';
	adder0: fulladder port map(A=>abcd(0), B=>add, Cin=>zero, Cout=>c1(0), Sum=>count1(0));
	adder1: fulladder port map(A=>abcd(1), B=>zero, Cin=>c1(0), Cout=>c1(1), Sum=>count1(1));
	adder2: fulladder port map(A=>abcd(2), B=>zero, Cin=>c1(1), Cout=>c1(2), Sum=>count1(2));
	adder3: fulladder port map(A=>abcd(3), B=>zero, Cin=>c1(2), Cout=>c1(3), Sum=>count1(3));
end behavioral;
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
			Load			: in std_logic;
			Rco			: out std_logic;
			Qa, Qb, Qc, Qd	: out std_logic);
end Counter_vhdl;

architecture Behavioral of Counter_vhdl is
	signal vector, Qabcd: std_logic_vector (3 downto 0);
	
	component count port(abcd 	: in std_logic_vector (3 downto 0);    
							   count1: out std_logic_vector (3 downto 0)); 
	end component count;

begin

counter_process: process
	begin
	wait until (CLK'event and CLK = '1');
	
	if( CLK'event and CLK = '1' and load = '0' ) then
		vector(0) <= A;
		vector(1) <= B;
		vector(2) <= C;
		vector(3) <= D;
	else 
		vector<=Qabcd;
	end if;
end process counter_process;

count4: count port map(abcd=>vector, count1=>Qabcd);

end Behavioral;

