library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package arithPackage is

function countZeros(signal input :std_logic_vector) return integer;
procedure convert(signal inp :in std_logic_vector,signal outp : out integer);

end package;

package body arithPackage is

procedure convert(signal inp :in std_logic_vector,signal outp : out integer)is
	
	variable result:integer;
	
	begin
	for i in 0 to inp'range loop
	result:=result+2**i;
	end loop;
	
	outp<=result;
	end convert;
	
	
function countZeros(signal input :std_logic_vector) return integer is
	variable count:integer 0 range to 16;
	
	begin
		for i in 0 to input'range loop
		if(input(i)='0')then count:=count+1;end if;end loop;
		
	return count;
	end countZeros;
	
end arithPackage;		
		
