library ieee;
use ieee.std_logic_1164.all;

entity part2 is
port(a : in std_logic_vector(7 downto 0);
	 b : out std_logic);
end part2;

architecture arch of part2 is

function parity(X :std_logic_vector) return std_logic is

Variable even :std_logic;
begin
even:='1';
for i IN X'range loop
	even:=even xor X(i);	
	end loop;
return even;	
end parity;

begin
b<=parity(a);
end arch;