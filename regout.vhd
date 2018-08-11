library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity regout is
	port (
		S: in std_logic_vector (15 downto 0);
		D: out std_logic_vector (15 downto 0);
		load : in std_logic;
		clock : in std_logic
	);
end entity; 

architecture Reg_behavioral of regout is 
begin 
	process (load, S, clock)
		begin 
			if (rising_edge(clock) and load = '1') then
					D <= S;
			--else
			--	D <= "0000000000000000";
			end if;	
	end process;
end Reg_behavioral;