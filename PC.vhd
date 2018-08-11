library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity PC is
	port (
		Addr: in std_logic_vector (15 downto 0);
		reset: in std_logic;
		D: out std_logic_vector (15 downto 0);
		clk : in std_logic
	);
end entity; 

architecture Register_behavioral of PC is 
begin 
	process (clk, reset)
		begin
			if reset = '1' then 
				D <= "0000000000000000";
			else 
				if (rising_edge(clk)) then
					D <= Addr;
				end if;
			end if;
	end process;
end Register_behavioral;