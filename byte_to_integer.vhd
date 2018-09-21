library ieee;
use ieee.std_logic_1164.all;

entity part5 is
port(input: in std_logic_vector(7 downto 0);
	 output : out integer range 0 to 255);
end part5;

architecture arch of part5 is

function byte_to_integer(X :std_logic_vector) return integer is
variable n:integer range 0 to 255;
begin
n:=0;
for i in 0 to 7 loop
	if(X(i)='1')then n:=n+2**i;end if;end loop; 

return n;	
end byte_to_integer;

begin
output<=byte_to_integer(input);
end arch;