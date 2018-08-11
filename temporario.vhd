library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity temporario is port (
	A: in std_logic_vector(15 downto 0);
	B: out std_logic_vector(15 downto 0)
	);
end entity;

architecture comportamento of temporario is 
	signal temp: std_logic_vector (15 downto 0) := "0000000000000000";
begin 
	process (temp)
	begin
		B <= temp;
		B <= A after 5 ns;
	end process;
end architecture;
	
	