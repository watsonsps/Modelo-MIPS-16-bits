library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity mux4x1 is
	port (
		a0: in std_logic_vector (15 downto 0);
   	a3: in std_logic_vector (15 downto 0);
		mux_1: in std_logic_vector (1 downto 0);
		out_m: out std_logic_vector (15 downto 0)
	);
end entity;

architecture comportamento of mux4x1 is

begin
process (mux_1, a0, a3)
begin
	case mux_1 is 
		when "00" =>
			out_m <= a0;
		when "01" =>
			out_m <= "0000000000000001";
		when "10" =>
			out_m <= "0000000000000000";
		when others =>
			out_m <= a3;
	end case;
end process;
end comportamento;