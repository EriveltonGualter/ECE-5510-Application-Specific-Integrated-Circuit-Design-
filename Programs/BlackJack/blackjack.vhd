----------------------------------------------------------------------------------
library IEEE; 
use IEEE.std_logic_1164.all;

entity fulladder is
  port(A, B, Cin: in std_logic;     --inputs
       Sum, Cout: out std_logic);   --outputs
end fulladder;

architecture behavioral of fulladder is

begin			-- concurrent assignment statements
  Sum  <= A xor B xor Cin; 
  Cout <= (A and B) or (A and Cin) or (B and Cin);

end behavioral;
----------------------------------------------------------------------------------
library IEEE; 
use IEEE.std_logic_1164.all;

entity adder4b is
  port(	A 	: in std_logic_vector (3 downto 0);     
			B	: in std_logic_vector (3 downto 0);	
			Sum: out std_logic_vector (3 downto 0));   
end adder4b;

architecture behavioral of adder4b is

	signal c : std_logic_vector (3 downto 0);

	component fulladder port(
		A, B, Cin: in std_logic;     
		Sum, Cout: out std_logic);   
	end component fulladder;

begin
	adder0: fulladder port map(A(0), B(0), '0' , Sum(0), c(0));
	adder1: fulladder port map(A(1), B(1), c(0), Sum(1), c(1));
	adder2: fulladder port map(A(2), B(2), c(1), Sum(2), c(2));
	adder3: fulladder port map(A(3), B(3), c(2), Sum(3), c(3));
end behavioral;
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity randomNumber is
    generic ( width : integer :=  4);
port (
      clk : in std_logic;
      random_num : out std_logic_vector (width-1 downto 0)   --output vector            
    );
end randomNumber;

architecture Behavioral of randomNumber is
begin
process(clk)
	
	variable rand_temp : std_logic_vector(width-1 downto 0):=(width-1 => '1',others => '0');
	variable temp : std_logic := '0';
	
	begin
	if(rising_edge(clk)) then
		temp := rand_temp(width-1) xor rand_temp(width-2);
		rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
		rand_temp(0) := temp;
	end if;
	random_num <= rand_temp;
end process;

end Behavioral;
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blackjack is
	port(	DEAL : in std_logic;
			STAND: in std_logic;
			HIT  : in std_logic;
			RESET: in std_logic;
			CLOCK: in std_logic;
			SW3  : in std_logic;
			LED1 : out std_logic;
			LED2 : out std_logic;
			AN	  : out std_logic_vector (3 downto 0);
			C	  : out std_logic_vector (7 downto 0); 
			
			A  : in std_logic_vector (3 downto 0);
			B  : in std_logic_vector (3 downto 0);
			sum: out std_logic_vector(3 downto 0)
			
			);
end blackjack;

architecture Behavioral of blackjack is

	component adder4b port(	
		A 	: in std_logic_vector (3 downto 0);     
		B	: in std_logic_vector (3 downto 0);	
		Sum: out std_logic_vector (3 downto 0));
	end component;
		
begin
	
	sumAB: adder4b port map(A,B,sum);
end Behavioral;

