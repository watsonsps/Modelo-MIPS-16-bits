library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity deslocador is 
	generic (
		n: integer := 16
	);
	port (
		I : in std_logic_vector (n-1 downto 0);
		O : out std_logic_vector (n-1 downto 0)
		);
end deslocador;

architecture comportamento of deslocador is
begin
	process (I)
		begin
			O <= I(n-1) & I (n-4 downto 0) & "00"; 
	end process;
end comportamento;