library ieee;
use ieee.std_logic_1164.all;

entity name is

port(clk,clr : in std_logic;
	 letter : in character ;
	 output : out std_logic);
	 
end name;

architecture arch of name is

type states is (N,A,Z);
signal ps :	states;

begin

	p1 : process(clk,clr,letter)
	begin
		if(clr='0')then ps<=N;
	   	elsif(clk='1' and clk'event) then
		case ps is
		when N => if(letter='A')then ps<=A;
				  else ps<=N;end if;
				  
		when A => if(letter='Z')then ps<=Z;
				  else ps<=N;end if;
	   	end case;end if;end process;
	   	
	p2 : process(ps,letter)
	begin
		if(ps=Z)then output<='1';
		else output<='0';
	end process;
	
end arch;		
	   	
	   	
	
 