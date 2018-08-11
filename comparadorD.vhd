library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity comparadorD is 
	port (
		A : in std_logic_vector (3 downto 0);
		RegOut, MD, Mux: out std_logic
		);
end comparadorD;

architecture comportamento of comparadorD is	
	signal x : integer;
	begin
		x <= to_integer(unsigned(A));
		process (x, A)
		begin
			if (x = 14) then
				MD <= '0';
				RegOUT <= '0';
				Mux <= '1';
			elsif (x = 15) then
				MD <= '0';
				RegOUT <= '1';
				Mux <= '0';
			elsif (x <= 13) then
				MD <= '1';
				RegOUT <= '0';
				Mux <= '0';
			else 
				MD <= '0';
				RegOUT <= '0';
				Mux <= '0';
			end if;
		end process;
end comportamento;