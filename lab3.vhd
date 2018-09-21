library ieee;
use ieee.std_logic_1164.all;

entity lab3 is
	Port(rst,clk,w : IN std_logic;
		 y : OUT std_logic);
end lab3;

Architecture arch of lab3 is
	type states is(A,B,C,D,E,F);
	signal state : states;
Begin
	 	 p1 : process(rst,clk,w)
	 	 begin
	 	 if(rst='0')then state<=A;
	 	 elsif(clk='1' and clk'event) then
	 	 	 	Case state is
	 	 	 	when A => if(w='1')then state <= A;
						  else state <= B;end if;
						  
				when B => if(w='1')then state <= A;
						  else state <= C;end if;
						  
				when C => if(w='1')then state <= D;
						  else state <= B;end if;		  		  			
	 	 	 	 
	 	 	 	 when D => if(w='1')then state <= E;
						  else state <= B;end if;
						  
				 when  E => if(w='1')then state <= F;
						  else state <= B;end if;
						  
				 when F => if(w='1')then state <= A;
						  else state <= B;end if;
				end case;		  
		end if;
		end process;
		
		p2 : process(w)
		begin
		if(state=F)then y<='1';
		else y<='0';end if;
		end process;
end arch;		  		  				  		  		  		  				  		  