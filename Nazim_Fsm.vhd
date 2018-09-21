library ieee;
use ieee.std_logic_1164.all;

entity part4 is
Port(clk,rst : IN std_logic;
	 x : in character;
	 y : OUT std_logic);
end part4;

architecture arch of part4 is
type states is(Nstate,Astate,Zstate,Istate,Mstate,Ystate);
signal ps : states;
begin
	p1:process(clk,rst)
    begin 
    if(rst='0')then ps<=Nstate;
    elsif(clk='1' and clk'event) then
	case ps is
	when Nstate => if(x='N')then ps<=Astate;
				  else ps<=Nstate;end if;
	when Astate => if(x='A')then ps<=Zstate;
				 else ps<=Nstate;end if;
	when Zstate => if(x='Z')then ps<=Istate;
				 else ps<=Nstate;end if;
	when Istate => if(x='I')then ps<=Mstate;
				 else ps<=Nstate;end if;
	when Mstate => if(x='M')then ps<=Ystate;
				 else ps<=Nstate;end if;
	when Ystate => ps<=Nstate; end case;end if;end process;
   
    p2:process(x)
    begin
    if(ps=Ystate)then y<='1';
    else y<='0';end if;
    end process;
    
end arch; 