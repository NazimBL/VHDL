
package myPackage is

	function integerToBCD(signal input :Integer range 0 to 9 )return std_logic_vector;
	
end package;

package body myPackage is
		
		function integerToBCD(signal input :Integer range 0 to 9 )return std_logic_vector is
		
		variable output: std_logic(7 downto 0);
		
		begin
		if(input=0)then output:=x"E7";
		else output:=x"E7";
		
		return output;
		end integerToBCD;
		
end package body;		