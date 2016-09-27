----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:25 05/24/2014 
-- Design Name: 
-- Module Name:    BLACKJACK - Behavioral 
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


entity BLACKJACK is 
      port(
		     CLK,RESET,DEALPB:in std_logic;
			  STAND,HIT,DISP:in std_logic;
			  SEG:out std_logic_vector(6 downto 0);
			  AN: out std_logic_vector(3 downto 0);
			  RES:out std_logic_vector(1 downto 0);
			  PLED:out std_logic_vector(2 downto 0);
			  DLED:out std_logic_vector(2 downto 0)
			  );
end BLACKJACK;

architecture Behavioral of BLACKJACK is
    signal SGCLK,DBCLK,SMCLK,RGCLK: std_logic;
	 	 
	 signal DBDEAL:std_logic:='0';
	 signal DBHIT:std_logic:='0';
	 signal DBSTAND:std_logic:='0';
	 
	 signal RANDOMNUM:std_logic_vector(3 downto 0):="0000";
	 signal BCD:std_logic_vector(19 downto 0):=X"00000";
	 signal DIGIT: std_logic_vector(3 downto 0);
	 signal SHIFTR,SHIFTR1,SHIFTR2:std_logic_vector(3 downto 0):="0000";
	 signal DISPLAYDATA:std_logic_vector(15 downto 0):=X"0000";
	 
	 signal DISSTAT: boolean :=false;
	 shared variable PACECARD,DACECARD:integer range 0 to 3:=0;
	 shared variable PSTAND:boolean :=false;
	 shared variable DSTAND:boolean :=false;
	 subtype COLORS is integer range 0 to 4;
	 type DECK is array(12 downto 0) of COLORS;
	 
	 signal GAMEDECK:DECK;
	 
	 signal PCARD,DCARD:std_logic_vector(3 downto 0):="0000";
	 shared variable PSCORE,DSCORE:integer range 0 to 31:=0;
	 signal PTOTAL,DTOTAL:integer range 0 to 7:=0;
	 
	 type state is (IDLE,DC1,DC2,DC3,DC4,DC5,PC1,PC2,PC3,PC4,PC5,CARD2,CARD3,CARD4,CARD5,CARD6,PWIN,DWIN,GAMED);
	 
	 type CARDS_SCORE is array(4 downto 0) of integer range 0 to 15 ;
	 shared variable PLAYERCARDS,DEALERCARDS: CARDS_SCORE:=(0,0,0,0,0);
	 signal CSTATE : state:=IDLE;
	 
	 

begin


--------------------------------------------------
--------   Random number generator  --------------
--------------------------------------------------

process(RGCLK)

      variable rand_temp : std_logic_vector(3 downto 0):="1000";
      variable temp : std_logic := '0';
		variable counter: std_logic_vector(3 downto 0):="0000";
begin
     if(RGCLK='1' and RGCLK'event) then
        temp := rand_temp(3) xor rand_temp(2);
        rand_temp(3 downto 1) := rand_temp(2 downto 0);
        rand_temp(0) := temp;
		  counter:=counter+1;
		  if(counter ="1111")then
		     rand_temp:=rand_temp+1;
			  counter:="0000";
			  if(rand_temp="0000") then
			  rand_temp:=rand_temp+1;
			  end if;
		  end if;	  
		  
     end if;
     RANDOMNUM <= rand_temp;
end process;


--------------------------------------------------
--------        1KHz Clock         ---------------
--------------------------------------------------
process(CLK)
	 variable CLKDIV: std_logic_vector(25 downto 0);
begin
	  if(CLK='1' and CLK'event) then
		  CLKDIV:=CLKDIV+1;
        SMCLK<=CLKDIV(25); 
		  RGCLK<=CLKDIV(24); 
		  DBCLK<=CLKDIV(21);
        SGCLK<=CLKDIV(17);		  
     
      end if; 
end process;	



--------------------------------------------------
--------     7 segments controller     -----------
--------------------------------------------------

process(SGCLK,DISPLAYDATA,DISSTAT)
	  variable SEL: STD_LOGIC_vector(1 downto 0):="00"; 
begin 
     if (SGCLK='1' and SGCLK'event ) then
	     SEL:=SEL+1; 			 
	  end if;
	  
	  if(DISSTAT) then
	     AN<="1111";
	     case SEL is
		       when "00"=> DIGIT<=DISPLAYDATA(3 downto 0); AN<="1110";
		       when "01"=> DIGIT<=DISPLAYDATA(7 downto 4);
		        if(DISPLAYDATA(15 downto 4)=X"000") then
				     AN(1)<='1';
				  else
				     AN(1)<='0';
				  end if;
		      
		      when "10"=> DIGIT<=DISPLAYDATA(11 downto 8); 
		        if(DISPLAYDATA(15 downto 8)=X"00") then
				     AN(2)<='1';
				  else
				     AN(2)<='0';
				  end if;
		     when others=> DIGIT<=DISPLAYDATA(15 downto 12); 
		        if(DISPLAYDATA(15 downto 12)=X"0") then
				     AN(3)<='1';
				  else
				     AN(3)<='0';
				  end if;
		                 
		end case;
      else
		   AN<="1111";
			DIGIT<="0000";
		end if;
		
end process;
--------------------------------------------------
--------     7 segments Decoder        -----------
--------------------------------------------------

process(DIGIT)
begin
	       case DIGIT is
			    when x"0"=> SEG<="0000001";
				 when x"1"=> SEG<="1001111";
				 when x"2"=> SEG<="0010010";
				 when x"3"=> SEG<="0000110";
				 when x"4"=> SEG<="1001100";
				 when x"5"=> SEG<="0100100";
				 when x"6"=> SEG<="0100000";
				 when x"7"=> SEG<="0001111";
				 when x"8"=> SEG<="0000000";
				 when x"9"=> SEG<="0000100";
				 when x"A"=> SEG<="1111111";
				 when x"B"=> SEG<="1000011";
				 when x"C"=> SEG<="0010100";
				 when x"D"=> SEG<="1001000";
				 when x"E"=> SEG<="0001000";
				 when others=> SEG<="0110001";
			end case;	       
end process;
--------------------------------------------------
--------     Debouncing STAND          -----------
--------------------------------------------------
process(DBCLK,STAND)
begin
     -- Using a shift register to filter switch contact bounce
  	  if(DBCLK='1' and DBCLK'event) then
	     SHIFTR2(2 downto 0)<= SHIFTR2(3 downto 1);
		  SHIFTR2(3) <= STAND;
		  if SHIFTR2="0000" THEN
   				DBSTAND<= '0';
  		  else
   	 			DBSTAND<= '1';
  		  end if;
	  end if;
end process;

--------------------------------------------------
--------     Debouncing HIT            -----------
--------------------------------------------------
process(DBCLK,HIT)
begin
     -- Using a shift register to filter switch contact bounce
  	  if(DBCLK='1' and DBCLK'event) then
	     SHIFTR1(2 downto 0)<= SHIFTR1(3 downto 1);
		  SHIFTR1(3) <= HIT;
		  if SHIFTR1="0000" THEN
   				DBHIT<= '0';
  		  else
   	 			DBHIT<= '1';
  		  end if;
	  end if;
end process;

--------------------------------------------------
--------     Debouncing DEAL           -----------
--------------------------------------------------

process(DBCLK,DEALPB)
begin
     -- Using a shift register to filter switch contact bounce
  	  if(DBCLK='1' and DBCLK'event) then
	     SHIFTR(2 downto 0)<= SHIFTR(3 downto 1);
		  SHIFTR(3) <=DEALPB;
		  if SHIFTR="0000" THEN
   				DBDEAL<= '0';
  		  else
   	 			DBDEAL<= '1';
  		  end if;
	  end if;
end process;

--------------------------------------------------
--------     SYSTEM STATE MACHINE     -----------
--------------------------------------------------
process(SMCLK,RESET)
   
   
--------------------------------------------------
--------     Binary to BCD(16bits)    ------------
--------------------------------------------------
function BIN2BCD(X :in std_logic_vector(15 downto 0)) return std_logic_vector is 
				
	 variable TEMP: STD_LOGIC_VECTOR(35 downto 0);
begin
	  for i in 0 to 35 loop
		 TEMP(i):='0';
	  end loop;	
	  TEMP(18 downto 3):=X;
     for i in 0 to 12 loop
			    
				 --Unit Check
	          if Temp(19 downto 16)>4 then
				   Temp(19 downto 16):=Temp(19 downto 16)+3;
             end if; 
				 --Tens Check
				 if Temp(23 downto 20)>4 then
				   Temp(23 downto 20):=Temp(23 downto 20)+3;
             end if; 
				 --Handreds Check
				 if Temp(27 downto 24)>4 then
				   Temp(27 downto 24):=Temp(27 downto 24)+3;
             end if;
				 --Thousend Check
				 if Temp(31 downto 28)>4 then
				   Temp(31 downto 28):=Temp(31 downto 28)+3;
             end if; 
				 --Tenthousends Check
				 if Temp(35 downto 32)>4 then
				   Temp(35 downto 32):=Temp(35 downto 32)+3;
             end if; 				 
             Temp(35 downto 1):=Temp(34 downto 0); 
      end loop;			
		return temp(31 downto 16);
end BIN2BCD;




impure function INTSCORE(CARD :in std_logic_vector(3 downto 0)) return integer is 
	 			
	 variable SCORE: integer range 0 to 15;
begin
	  case(CARD) is
	      when X"E"=> if(GAMEDECK(0)=4) then
			              SCORE:=0;
			            else
			              SCORE:=11;
							  GAMEDECK(0)<=GAMEDECK(0)+1;							  
							end if;  
         when X"2"=>if(GAMEDECK(1)=4) then
			              SCORE:=0;
			            else
			              SCORE:=2;
							  GAMEDECK(1)<=GAMEDECK(1)+1;							  
							end if;  
         when X"3"=>if(GAMEDECK(2)=4) then
			              SCORE:=0;
			            else
			              SCORE:=3;
							  GAMEDECK(2)<=GAMEDECK(2)+1;							  
							end if;  
         when X"4"=>if(GAMEDECK(3)=4) then
			              SCORE:=0;
			            else
			              SCORE:=4;
							  GAMEDECK(3)<=GAMEDECK(3)+1;							  
							end if;  
         when X"5"=>if(GAMEDECK(4)=4) then
			              SCORE:=0;
			            else
			              SCORE:=5;
							  GAMEDECK(4)<=GAMEDECK(4)+1;							  
							end if;  
         when X"6"=>if(GAMEDECK(5)=4) then
			              SCORE:=0;
			            else
			              SCORE:=6;
							  GAMEDECK(5)<=GAMEDECK(5)+1;							  
							end if;  
         when X"7"=>if(GAMEDECK(6)=4) then
			              SCORE:=0;
			            else
			              SCORE:=7;
							  GAMEDECK(6)<=GAMEDECK(6)+1;							  
							end if;  
         when X"8"=>if(GAMEDECK(7)=4)then
			              SCORE:=0;
			            else
			              SCORE:=8;
							  GAMEDECK(7)<=GAMEDECK(7)+1;							  
							end if;  
         when X"9"=>if(GAMEDECK(8)=4)then
			              SCORE:=0;
			            else
			              SCORE:=9;
							  GAMEDECK(8)<=GAMEDECK(8)+1;							  
							end if;  	
         when X"A"=>if(GAMEDECK(9)=4)then
			              SCORE:=0;
			            else
			              SCORE:=10;
							  GAMEDECK(9)<=GAMEDECK(9)+1;							  
							end if;  
         when X"B"=>if(GAMEDECK(10)=4) then
			              SCORE:=0;
			            else
			              SCORE:=10;
							  GAMEDECK(10)<=GAMEDECK(10)+1;
                     end if;							  
         when X"C"=>if(GAMEDECK(11)=4)then
			              SCORE:=0;
			            else
			              SCORE:=10;
							  GAMEDECK(11)<=GAMEDECK(11)+1;	
							end if;	
			when X"D"=>if(GAMEDECK(12)=4) then
			              SCORE:=0;
			            else
			              SCORE:=10;
							  GAMEDECK(12)<=GAMEDECK(12)+1;	
							end if;	
			when others=>SCORE:=0;
			
	  end case;		
		return SCORE;
end INTSCORE;
begin
   
	 if(RESET='1') then
	    
	    CSTATE<=IDLE;
	 elsif(SMCLK='1' and SMCLK'event) then
	
	 
	 
    case(CSTATE) is
	    when IDLE=> 
		             DISSTAT<=false;
						 DSTAND:=false;
						 PSTAND:=false;
						 DISPLAYDATA<=X"FFFF";
	                PACECARD:=0;
	                DACECARD:=0;
						 GAMEDECK<=(0,0,0,0,0,0,0,0,0,0,0,0,0);
						 PLAYERCARDS:=(0,0,0,0,0);
						 DEALERCARDS:=(0,0,0,0,0);
		             PCARD<="0000";
						 DCARD<="0000";
						 PSCORE:=0;
						 DSCORE:=0;
						 RES<="11";
	                PLED<="111";
	                DLED<="111";
						 if(PTOTAL=7 or DTOTAL= 7) then
						    PTOTAL<=0;
							 DTOTAL<=0;
							 DISSTAT<=true;
						 end if;
						 if(DBDEAL='1')then
						    CSTATE<=PC1;
						 else
						    CSTATE<=IDLE;
						 end if;
						 
						 
			when PC1=>PCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="111";
	                DLED<="000";
			          if(INTSCORE(PCARD)=0) then
							 CSTATE<=PC1;
						 else
						    PLAYERCARDS(0):=INTSCORE(PCARD);
							 DISSTAT<=true;
						    if(PCARD=X"A") then 
						       DISPLAYDATA<=X"F110";
							 elsif(PCARD=X"E")then
							    PACECARD:=PACECARD+1;
							    DISPLAYDATA<=X"F1AE"; 
                      else
							    DISPLAYDATA<=X"F1A"&PCARD;
                      end if;	
							 CSTATE<=DC1;
						 end if;
			         
		   when DC1=>DCARD<=RANDOMNUM;
			          DISSTAT<=false;
						 RES<="00";
	                PLED<="000";
	                DLED<="111";
			          if(INTSCORE(DCARD)=0) then
						    CSTATE<=DC1;
						 else
						    DEALERCARDS(0):=INTSCORE(DCARD);
							 if(DCARD=X"E") then 
						       DACECARD:=DACECARD+1;
							 end if;
							 
						    CSTATE<=CARD2;
						 end if;
			when CARD2=>			 
						 if(DBDEAL='1')then
						    CSTATE<=PC2;
						 else
						    CSTATE<=CARD2;
						 end if;
			when PC2=>PCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="111";
	                DLED<="000";
			          if(INTSCORE(PCARD)=0) then
							 CSTATE<=PC2;
						 else
						    PLAYERCARDS(1):=INTSCORE(PCARD);
							 DISSTAT<=true;
						    if(PCARD=X"A") then 
						       DISPLAYDATA<=X"F210";
							 elsif(PCARD=X"E")then
							    PACECARD:=PACECARD+1;
							    DISPLAYDATA<=X"F2AE"; 
                      else
							    DISPLAYDATA<=X"F2A"&PCARD;
                      end if;	
							 CSTATE<=DC2;
						 end if;
		   when DC2=>DCARD<=RANDOMNUM;
		             RES<="00";
	                PLED<="000";
	                DLED<="111";
		             
			          if(INTSCORE(DCARD)=0) then
						    CSTATE<=DC2;
						 else
						    DEALERCARDS(1):=INTSCORE(DCARD);
							 DISSTAT<=true;
							 if(DCARD=X"A") then 
						       DISPLAYDATA<=X"F210";
							 elsif(DCARD=X"E")then
							    DACECARD:=DACECARD+1;
							    DISPLAYDATA<=X"F2AE"; 
                      else
							    DISPLAYDATA<=X"F2A"&DCARD;
                      end if;	
							
							 
						    CSTATE<=CARD3;
						 end if;
						 
		   when CARD3=>DISSTAT<=true;
			          
						 RES<="00";
	                PLED<="000";
	                DLED<="000";
						 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1);
						 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1);
						 if(PSCORE>21 and PACECARD/=0) then
						       PLAYERCARDS(1):=1;
								 PACECARD:=PACECARD-1;
								 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1);
						 end if;
						 if(DSCORE>21 and DACECARD/=0) then
						       DEALERCARDS(1):=1;
								 DACECARD:=DACECARD-1;
								 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1);
						 end if;
						 
						 
						 if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						 end if;
					
			          if(DSCORE>=17) then
						    DSTAND:=true;
						 end if;
						 if((DSCORE=21 and PSCORE/=21) or PSCORE>21) then
						    CSTATE<=DWIN;
							 DTOTAL<=DTOTAL+1;
						 elsif(PSCORE=21 and DSCORE/=21) then
						    CSTATE<=PWIN;
							 PTOTAL<=PTOTAL+1;
						 elsif(PSCORE=21 and DSCORE=21) then
						    CSTATE<=GAMED; 
						 elsif(PSTAND and DSTAND) then
						    if(DSCORE>PSCORE and DSCORE<22)  then
						      CSTATE<=DWIN;
							   DTOTAL<=DTOTAL+1;
						    elsif((PSCORE>DSCORE and PSCORE<22) or DSCORE>21) then
						       CSTATE<=PWIN;
							    PTOTAL<=PTOTAL+1;
						    elsif(PSCORE=DSCORE) then
						       CSTATE<=GAMED; 
						    end if;
			           
						 elsif(DBSTAND='1')then
						    PSTAND:=true;
						    if (DSTAND) then
						       CSTATE<=CARD4;
							 else
                         CSTATE<=DC3;
							 end if;	
						    
							 
						 elsif(DBHIT='1') then
						    CSTATE<=PC3;
						 
						 end if;
						 
			 when PC3=>PCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="111";
	                DLED<="000";
			          if(INTSCORE(PCARD)=0) then
							 CSTATE<=PC3;
						 else
						    PLAYERCARDS(2):=INTSCORE(PCARD);
							 DISSTAT<=true;
						    if(PCARD=X"A") then 
						       DISPLAYDATA<=X"F310";
							 elsif(PCARD=X"E")then
							    PACECARD:=PACECARD+1;
							    DISPLAYDATA<=X"F3AE"; 
                      else
							    DISPLAYDATA<=X"F3A"&PCARD;
                      end if;	
							 if (DSTAND) then
							     CSTATE<=CARD4;
							 else
							     CSTATE<=DC3;
							 end if;
						 end if;
						 
			  when DC3=>DCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="000";
	                DLED<="111";
			          if(INTSCORE(DCARD)=0) then
							 CSTATE<=DC3;
						 else
						    DEALERCARDS(2):=INTSCORE(DCARD);
							 DISSTAT<=false;
							 if(DCARD=X"E")then
							    DACECARD:=DACECARD+1;
							
                      end if;	
							
						    CSTATE<=CARD4;
						 end if;
			  when CARD4=>DISSTAT<=true;
			      	 RES<="00";
	                PLED<="000";
	                DLED<="000";
						 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2);
						 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2);
						 if(PSCORE>21 and PACECARD/=0) then
						    PLAYERCARDS(2):=1;
						    PACECARD:=PACECARD-1;
							 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2);
						 end if;
						 if(DSCORE>21 and DACECARD/=0) then
						    DEALERCARDS(2):=1;
						    DACECARD:=DACECARD-1;
							 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2);
						 end if;
						 
						 
						 if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						 end if;
					
			          if(DSCORE>=17) then
						    DSTAND:=true;
						 end if;
						 if((DSCORE=21 and PSCORE/=21) or PSCORE>21) then
						    CSTATE<=DWIN;
							 DTOTAL<=DTOTAL+1;
						 elsif(PSCORE=21 and DSCORE/=21) then
						    CSTATE<=PWIN;
							 PTOTAL<=PTOTAL+1;
						 elsif(PSCORE=21 and DSCORE=21) then
						    CSTATE<=GAMED; 
						 elsif(PSTAND and DSTAND) then
						    if(DSCORE>PSCORE and DSCORE<22)  then
						      CSTATE<=DWIN;
							   DTOTAL<=DTOTAL+1;
						    elsif((PSCORE>DSCORE and PSCORE<22) or DSCORE>21) then
						       CSTATE<=PWIN;
							    PTOTAL<=PTOTAL+1;
						    elsif(PSCORE=DSCORE) then
						       CSTATE<=GAMED; 
						    end if;
			           
						 elsif(DBSTAND='1')then
						    PSTAND:=true;
						    if (DSTAND) then
						       CSTATE<=CARD5;
							 else
                         CSTATE<=DC4;
							 end if;
						 elsif(DBHIT='1') then
						    CSTATE<=PC4;
						 
						 end if;
			when PC4=>PCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="111";
	                DLED<="000";
			          if(INTSCORE(PCARD)=0) then
							 CSTATE<=PC4;
						 else
						    PLAYERCARDS(3):=INTSCORE(PCARD);
							 DISSTAT<=true;
						    if(PCARD=X"A") then 
						       DISPLAYDATA<=X"F410";
							 elsif(PCARD=X"E")then
							    PACECARD:=PACECARD+1;
							    DISPLAYDATA<=X"F4AE"; 
                      else
							    DISPLAYDATA<=X"F4A"&PCARD;
                      end if;	
							 if (DSTAND) then
							     CSTATE<=CARD5;
							 else
						    CSTATE<=DC4;
							 end if;
						 end if;
						 
			  when DC4=>DCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="000";
	                DLED<="111";
			          if(INTSCORE(DCARD)=0) then
							 CSTATE<=DC4;
						 else
						    DEALERCARDS(3):=INTSCORE(DCARD);
							 DISSTAT<=false;
							 if(DCARD=X"E")then
							    DACECARD:=DACECARD+1;
							
                      end if;	
							 							 
						    CSTATE<=CARD5;
						 end if;
			  when CARD5=>DISSTAT<=true;
			      	 RES<="00";
	                PLED<="000";
	                DLED<="000";
						 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2)+PLAYERCARDS(3);
						 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2)+DEALERCARDS(3);
						 if(PSCORE>21 and PACECARD/=0) then
						       PLAYERCARDS(3):=1;
								 PACECARD:=PACECARD-1;
								 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2)+PLAYERCARDS(3);

						 end if;
						 if(DSCORE>21 and DACECARD/=0) then
						       DEALERCARDS(3):=1;
								 DACECARD:=DACECARD-1;
								 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2)+DEALERCARDS(3);
					    end if;
						 						 
						 if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						 end if;
					
			          if(DSCORE>=17) then
						    DSTAND:=true;
						 end if;
						 if((DSCORE=21 and PSCORE/=21) or PSCORE>21) then
						    CSTATE<=DWIN;
							 DTOTAL<=DTOTAL+1;
						 elsif(PSCORE=21 and DSCORE/=21) then
						    CSTATE<=PWIN;
							 PTOTAL<=PTOTAL+1;
						 elsif(PSCORE=21 and DSCORE=21) then
						    CSTATE<=GAMED; 
						 elsif(PSTAND and DSTAND) then
						    if(DSCORE>PSCORE and DSCORE<22) then
						      CSTATE<=DWIN;
							   DTOTAL<=DTOTAL+1;
						    elsif((PSCORE>DSCORE and PSCORE<22) or DSCORE>21) then
						       CSTATE<=PWIN;
							    PTOTAL<=PTOTAL+1;
						    elsif(PSCORE=DSCORE) then
						       CSTATE<=GAMED; 
						    end if;
			           
						 elsif(DBSTAND='1')then
						    PSTAND:=true;
						    if (DSTAND) then
						       CSTATE<=CARD6;
							 else
                         CSTATE<=DC5;
							 end if;
						 elsif(DBHIT='1') then
						    CSTATE<=PC5;
						 end if;
			when PC5=>PCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="111";
	                DLED<="000";
			          if(INTSCORE(PCARD)=0) then
							 CSTATE<=PC5;
						 else
						    PLAYERCARDS(4):=INTSCORE(PCARD);
							 DISSTAT<=true;
						    if(PCARD=X"A") then 
						       DISPLAYDATA<=X"F510";
							 elsif(PCARD=X"E")then
							    PACECARD:=PACECARD+1;
							    DISPLAYDATA<=X"F5AE"; 
                      else
							    DISPLAYDATA<=X"F5A"&PCARD;
                      end if;
                      if (DSTAND) then
							    CSTATE<=CARD6;
							 else
						       CSTATE<=DC5;
							 end if;							 
			
						 end if;
						 
			  when DC5=>DCARD<=RANDOMNUM;
			          RES<="00";
	                PLED<="000";
	                DLED<="111";
			          if(INTSCORE(DCARD)=0) then
							 CSTATE<=DC5;
						 else
						    DEALERCARDS(4):=INTSCORE(DCARD);
							 DISSTAT<=false;
							 if(DCARD=X"E")then
							    DACECARD:=DACECARD+1;
							
                      end if;	
							 
							
						    CSTATE<=CARD6;
						 end if;		
        when CARD6=>DISSTAT<=true;
			      	 RES<="00";
	                PLED<="000";
	                DLED<="000";
						 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2)+PLAYERCARDS(3)+PLAYERCARDS(4);
						 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2)+DEALERCARDS(3)+DEALERCARDS(4);
						 if(PSCORE>21 and PACECARD/=0) then
						    PLAYERCARDS(4):=1;
						    PACECARD:=PACECARD-1;
							 PSCORE:=PLAYERCARDS(0)+PLAYERCARDS(1)+PLAYERCARDS(2)+PLAYERCARDS(3)+PLAYERCARDS(4);
						 end if;
						 if(DSCORE>21 and DACECARD/=0) then
						    DEALERCARDS(4):=1;
							 DACECARD:=DACECARD-1;
							 DSCORE:=DEALERCARDS(0)+DEALERCARDS(1)+DEALERCARDS(2)+DEALERCARDS(3)+DEALERCARDS(4);
				       end if;
						
						 
						 if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						 end if;
					
			          
						 if(DSCORE=21 and PSCORE/=21) or ((DSCORE>PSCORE and DSCORE<22) or PSCORE>21) then
						    CSTATE<=DWIN;
							 DTOTAL<=DTOTAL+1;
						 elsif((PSCORE=21 and DSCORE/=21) or (PSCORE>DSCORE) or DSCORE>21) then
						    CSTATE<=PWIN;
							 PTOTAL<=PTOTAL+1;
						 elsif(PSCORE=DSCORE) then
						       CSTATE<=GAMED; 
						 end if;
			           
												 
			         
						  
		   when DWIN=>DISSTAT<=true;
			           RES<="10";
						  PLED<=conv_std_logic_vector(PTOTAL,3);
						  DLED<=conv_std_logic_vector(DTOTAL,3);
						  if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						  else
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(DSCORE,16));
						  end if;
						  if(DBDEAL='1')then
						    CSTATE<=IDLE;
						  else
						    CSTATE<=DWIN;
						  end if;
			when PWIN=>DISSTAT<=true;
			           RES<="01";
						  PLED<=conv_std_logic_vector(PTOTAL,3);
						  DLED<=conv_std_logic_vector(DTOTAL,3);
						  if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						  else
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(DSCORE,16));
						  end if;
						  if(DBDEAL='1')then
						    CSTATE<=IDLE;
						  else
						    CSTATE<=PWIN;
						  end if;
		   when GAMED=>DISSTAT<=true;
			           RES<="11";
						  PLED<=conv_std_logic_vector(PTOTAL,3);
						  DLED<=conv_std_logic_vector(DTOTAL,3);
						  if DISP='0' then
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(PSCORE,16));
						  else
						    DISPLAYDATA<=BIN2BCD(conv_std_logic_vector(DSCORE,16));
						  end if;
						  if(DBDEAL='1')then
						    CSTATE<=IDLE;
						  else
						    CSTATE<=GAMED;
						  end if;
										 
			when others=>CSTATE<=IDLE; 
			           
			 
			
    end case;
	 
	 end if;

end process;




end Behavioral;

