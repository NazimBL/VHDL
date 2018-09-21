library ieee;
use ieee.std_logic_1164.all;

entity part3 is
port(input : in std_logic_vector(7 downto 0);
	 output : out std_logic_vector(7 downto 0));
end part3;

architecture arch of part3 is

function vector_shift(X :std_logic_vector;
						n:Integer) return std_logic_vector is
variable out_vec:std_logic_vector(n downto 0); 

begin
out_vec:='0' & X(n downto 1);

return out_vec;	
end vector_shift;

begin
output<=vector_shift(input,7);
end arch;