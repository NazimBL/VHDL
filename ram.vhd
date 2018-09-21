
library ieee;
use ieee.std_logic_1164.all;

entity lab5 is
port(add : in integer range 0 to 31;
	 CS,RW,CLK : in std_logic ;
	 Din : in std_logic_vector(3 downto 0);
	 Dout : out std_logic_vector(3 downto 0));
	 
end lab5;

Architecture arch of lab5 is

type ram_array is array(0 to 31) of std_logic_vector(3 downto 0);
signal ram : ram_array;
signal cs1 : std_logic;


begin
cs1<='0';
process(CLK,CS,RW,add)
	 begin
	 
	 if(cs1='1')then Dout<="ZZZZ";
	 elsif(CLK ='1' and CLK'event) then
		if(RW='1')then ram(add)<=Din;
		else Dout<=ram(add);end if;
	 end if;
	  
end process;
end arch;	 	 	 	 
	 	 
	 