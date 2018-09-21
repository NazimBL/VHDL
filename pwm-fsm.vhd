library ieee;
use ieee.std_logic_1164.all;

entity part3 is
Port(clk,rst,sync : IN std_logic;
	 pulse : OUT std_logic);
end part3;


architecture arch of part3 is
type states is(seek,find);
signal ps : states;

begin
	p1:process(clk,rst)
    begin 
    if(rst='0')then ps<=seek;
    elsif(clk='1' and clk'event)then
	case ps is
	when seek => if(sync='1')then ps<=seek;
				 else ps<=find;end if;
    when find =>if(sync='1') then ps<=seek;
				else ps<=find; end if;
    end case;
    end if;
    end process;
    
    p2:process(sync)
    begin
    if(sync='0' and ps=seek)then pulse<='1';
    else pulse<='0';end if;
    end process;
    
end arch;    
