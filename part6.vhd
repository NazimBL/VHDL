library ieee;
use ieee.std_logic_1164.all;

entity part6 is
Port(clk,rst : IN std_logic;
		   x : IN std_logic;
		   y : OUT std_logic);
end part6;


architecture arch of part6 is
type states is(A,B,C,D);
signal ps : states;

begin
	p1:process(clk,rst)
    begin 
    if(rst='0')then ps<=A;
    elsif(clk='1' and clk'event) then
	case ps is
	when A => if(x='0')then ps<=B;
				  else ps<=A;end if;
	when B => if(x='0')then ps<=A;
				 else ps<=C;end if;
	when C => if(x='0')then ps<=D;
				 else ps<=A;end if;
	when D => ps<=A;
				 				 				 				 		  
    end case;
    end if;
    end process;
    
    p2:process(x)
    begin
    if(ps=D)then y<='1';
    else y<='0';end if;
    end process;
    
end arch; 