library ieee;
use ieee.std_logic_1164.all;

entity part4 is
port(A,B : in std_logic_vector(7 downto 0);
	 A_GT_B,A_LT_B,A_EQ_B : out std_logic);
end part4;

architecture arch of part4 is
signal vec :std_logic_vector(2 downto 0);
function COMP(X :std_logic_vector;
			  Y :std_logic_vector ) return std_logic_vector is
variable q:std_logic_vector(2 downto 0);
begin
q:="000";
if(X>=Y)then q:="101";
elsif (Y>=X) then q:="110";
elsif(X=Y)then q :="100";
else q:="000";end if;

return q;	
end COMP;

begin
vec<=COMP(A,B);
A_GT_B<=vec(0);
A_LT_B<=vec(1);
A_EQ_B<=vec(2);

end arch;