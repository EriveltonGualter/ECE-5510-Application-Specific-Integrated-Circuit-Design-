library IEEE;							-- Declaration of the library
use IEEE.STD_LOGIC_1164.ALL;		-- Declaration of the packages
use IEEE.NUMERIC_STD.ALL;

entity parity_vhdl is									-- partity_vhdl entity
	port( A	: in  std_logic_vector(6 downto 0);	-- Input:  7-but words
			p	: out std_logic_vector(7 downto 0));							-- Output: parity bit
end parity_vhdl;

architecture Behavioral of parity_vhdl is		
begin
	process(A)
	variable count: integer;	-- Count how many 1s there are

	begin
	count:=0;						
	for i in 0 to 6 loop
		p(i+1) <= A(i);
		if(A(i) = '1') then	
			count:=count+1;
		end if;
	end loop;
	
	if ( (count mod 2) = 1) then	-- It means that the vector is even
		p(0) <= '1';
	else									-- It means that the vector is odd
		p(0) <= '0';
	end if;
	
	end process;	
end Behavioral;
