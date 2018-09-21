library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part1 is
generic( times : integer :=1);
port(input : in std_logic_vector(7 downto 0);
	 output,parity : out Integer range 0 to input'length);
end part1;

architecture arch of part1 is

procedure counter(inp : in std_logic_vector;signal outp: out integer)is
variable x:integer range 0 to inp'length;
begin
For i in inp'range loop
	if(inp(i)='1')then x:=x+1;end if;
end loop;

outp<=x;
end counter;

begin
counter(input,output);
	
end arch;	 	 	 	 
