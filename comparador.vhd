library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity comparador is 
	generic(
		n: integer := 16);
	port (
		A, B : in std_logic_vector (n-1 downto 0);
		Load : in std_logic;
		A_Maior, Igual, A_Menor : out std_logic
		);
end comparador;

architecture comportamento of comparador is	
	signal x,y : integer;
	begin
		x <= conv_integer(A);
		y <= conv_integer(B);
		process (Load, x, y)
		begin
			if (Load = '1') then
				if(x = y) then
					A_Maior <= '0';
					Igual <= '1';
					A_Menor <= '0';
				elsif (x < y) then
					A_Maior <= '0';
					Igual <= '0';
					A_Menor <= '1';
				else 
					A_Maior <= '1';
					Igual <= '0';
					A_Menor <= '0';
				end if;
			else 
				A_Maior <= '0';
				A_Menor <= '0';
				Igual <= '0';
			end if;
		end process;
end comportamento;