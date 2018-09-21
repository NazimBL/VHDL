library ieee;
use ieee.std_logic_1164.all;

entity MyGenerate is
port(a,b: in std_logic_vector(7 downto 0);
	 y : out std_logic_vector(7 downto 0));
	 
end entity;

architecture arch of MyGenerate is

Component AND_Gate 
port(a,b: in std_logic;
	 y : out std_logic);
	 end component;

begin

gen : for i in a'range generate
	AND1 : AND_Gate port map(a=>a(i),b=>b(i),y=>y(i));
	end generate;
end arch; 