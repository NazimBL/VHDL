library ieee;
use ieee.std_logic_1164.all;

entity part6 is
port(A,B: in std_logic_vector(3 downto 0);
	 output : std_logic_vector(7 downto 0));
end part6;

architecture arch of part6 is

function multiplier(X :std_logic_vector;
					Y:std_logic_vector) return integer is
variable n:std_logic_vector(7 downto 0);
begin
n:=X;
for i in 0 to 3 loop
	n:=n+Y;end loop; 

return n;	
end multiplier;

begin
output<=multiplier(input);
end arch;