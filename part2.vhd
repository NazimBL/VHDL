
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity part2 is
Port(rst,clk :IN std_logic;
	 NS,EW :OUT std_logic_vector(6 downto 0));
end part2;



architecture arch of part2 is
type states is(s0,s1,s2,s3);
signal ps :states;
signal Clock :std_logic_vector(24 downto 0);
signal clk_slow : std_logic;
signal Q :std_logic_vector(2 downto 0);
signal y :std_logic_vector(5 downto 0);
signal Timer : std_logic;

begin

	clk_process:process(clk,rst)
	begin
	if(rst='0')then Clock<=(others=>'0');
	elsif(clk='1' and clk'event) then Clock<=Clock+1;
	end if;end process;
	clk_slow<=Clock(24);
	
	cycle_timer:process(rst,clk_slow)
	begin
	if(rst='0')then Q<="000";
	elsif(clk_slow='1'and clk_slow'event) then Q<=Q+1;end if;
	if(Q="101") then Q<="000";end if;
	end process;
	Timer<=Q(2);
	
	state_process:process(rst,clk_slow)
	begin
	if(rst='0')then ps<=s0;
	elsif(clk_slow='1' and clk_slow'event)then
	case ps is
	when s0 => if(Timer='0') then ps<=s0;
			   else ps<=s1;end if;
	when s1=> ps<=s2;
	when s2 => if(Timer='0') then ps<=s2;
			   else ps<=s3;end if;
	when s3 => ps<=s0;end case;
	end if;
	end process;
	
	output_process:process(ps,Timer)
	begin
	case ps is
	when s0=> if(Timer='0')then y<="011110";
			  else y<="011101";end if;
    
    when s1=> y<="110011";
    when s2=> if(Timer='0')then y<="110011";
			  else y<="101011";end if;
	when s3=> y<="011110";end case;
	end process;
	
	
	 NS<=(0=>y(0), 3=>y(2), 6=>y(1), others=>'1');
     EW<=(0=>y(3), 3=>y(5), 6=>y(4), others=>'1');
			   
end arch;	  	 
	  
	