library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity sign is

port(intput : in std_logic_vector(7 downto 0);
	 output : out std_logic);
	 
end sign;

architecture arch of sign is
	 
function sign_fc(signal inp :std_logic_vector) return std_logic is
	 	 
	 	 variable s:std_logic;
	 	 begin
	 	 if(inp(7)='1')s<='1';
	 	 else s<='0';end if;
	 	 
	 	 return s;
	 	 
end sign_fc;


begin
	output<=sign_fc(input);
end arch;	
	
	 	 
	 	 	 	 
