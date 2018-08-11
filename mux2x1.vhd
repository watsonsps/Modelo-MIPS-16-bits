library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity mux2x1 is
	port (
		a0: in std_logic_vector (15 downto 0);
		a1: in std_logic_vector (15 downto 0);
		mux_2: in std_logic;
		out_m: out std_logic_vector (15 downto 0)
	);
end entity;

architecture comportamento of mux2x1 is

begin
process (mux_2, a0, a1)
begin
	case mux_2 is 
		when '0' =>
			out_m <= a0;
		when '1' =>
			out_m <= a1;
		when others =>
			null;
	end case;
end process;
end comportamento;