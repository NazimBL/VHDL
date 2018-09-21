library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab61 is
port(i1, i2: in std_logic_vector(3 downto 0);
o: out std_logic_vector(7 downto 0));
end lab61;

architecture arch of lab61 is
function shifft(signal x : std_logic_vector) return std_logic_vector is
variable internal : std_logic_vector(3 downto 0);
variable output : std_logic_vector(3 downto 0);
begin
for i in 1 to 3 loop
internal(i) := x(i-1);
end loop;
internal(0) := '0';
output := internal;
return output;
end shifft;

function conv (signal a, b: std_logic_vector(3 downto 0)) return std_logic_vector is
variable s : std_logic_vector(7 downto 0):="00000000";
begin
if (b(0) = '1') then s := s + a; end if;
if (b(1) = '1') then s := s + shifft(a);end if;
if (b(2) = '1') then s := s + shifft(shifft(a)); end if;
if (b(3) = '1') then s := s + shifft(shifft(shifft(a))); end if;
return s;
end conv;
begin
o <= conv(i1, i2);
end arch;
