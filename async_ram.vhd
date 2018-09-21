library ieee;
use ieee.std_logic_1164.all;

entity lab52 is
port(add : in integer range 0 to 31;
	 cs,rw : in std_logic ;
	 Din : in std_logic_vector(3 downto 0);
	 Dout : out std_logic_vector(3 downto 0));
	 
end lab52;

Architecture arch of lab52 is

type abc is array(0 to 31) of std_logic_vector(3 downto 0);
signal ram :abc;

begin
process(cs,rw,add)
	 begin
	 if(cs='1')then Dout<="ZZZZ";
	 if(rw='1')then Dout<=ram(add);
		else ram(add)<=Din;end if;
	 end if;	
end process;
end arch;