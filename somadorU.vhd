library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity somadorU is 
	generic(
		n: integer := 16);
	port (
		A, B : in std_logic_vector (n-1 downto 0);
		O: out std_logic_vector (n-1 downto 0)
		);
end somadorU;

architecture comportamento of somadorU is
	
	signal O_interno : std_logic_vector (n downto 0);
	
begin
		O_interno <= std_logic_vector((signed('0' & A) + signed('0' & B)));
		O <= O_interno(n-1 downto 0);
end comportamento;