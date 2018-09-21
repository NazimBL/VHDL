library ieee;
use ieee.std_logic_1164.all;

entity part5 is
Port(clk,rst : IN std_logic;
	 x : in integer;
	 y : OUT std_logic);
end part5;

architecture arch of part5 is
type states is(state1,state2,state3,state4,state5,Ystate);
signal ps : states;
begin
	p1:process(clk,rst)
    begin 
    if(rst='0')then ps<=state1;
    elsif(clk='1' and clk'event) then
	case ps is
	when state1 => if(x=1)then ps<=state2;
				  else ps<=state1;end if;
	when state2 => if(x=2)then ps<=state3;
				 else ps<=state1;end if;
	when state3 => if(x=3)then ps<=state4;
				 else ps<=state1;end if;
	when state4 => if(x=4)then ps<=state5;
				 else ps<=state1;end if;
	when state5 => if(x=5)then ps<=Ystate;
				 else ps<=state1;end if;
	when Ystate => ps<=state1;			 				 				 				 			 			 
    end case;
    end if;
    end process;
    
    p2:process(x)
    begin
    if(ps=Ystate)then y<='1';
    else y<='0';end if;
    end process;
    
end arch; 