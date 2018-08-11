library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity regin is
	port (
		S: in std_logic_vector (15 downto 0) ;
		D: out std_logic_vector (15 downto 0);
		clock : in std_logic
	);
end entity; 

architecture Reg_behavioral of regin is 
begin
	process (S, clock)
		begin
			if(rising_edge(clock)) then 
				D <= S;
			end if; 	
	end process;
end Reg_behavioral;