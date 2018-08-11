library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity mux4x1B is
	port (
		mux_1: in std_logic_vector (1 downto 0);
		out_m: out std_logic_vector (15 downto 0)
	);
end entity;

architecture comportamento of mux4x1B is

begin
process (mux_1)
begin
	case mux_1 is 
		when "00" =>
			out_m <= "0000000000010000";
		when "01" =>
			out_m <= "0000000000001010";
		when "10" =>
			out_m <= "0000000000000101";
		when others => -- exit_loop_pre
			out_m <= "0000000000000110";
	end case;
end process;
end comportamento;