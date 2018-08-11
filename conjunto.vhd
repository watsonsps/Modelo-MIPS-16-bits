library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity conjunto is port (
	clock, Load, reset: in std_logic;
	Addr: in std_logic_vector(15 downto 0);
	out1, out2: out std_logic_vector(15 downto 0)
	);
end entity; 

ARCHITECTURE comportamento OF conjunto IS 
component reg 
	port (
		Addr: in std_logic_vector (15 downto 0);
		reset: in std_logic;
		load: in std_logic;
		D: out std_logic_vector (15 downto 0);
		clk : in std_logic
	);
end component;

signal outA, outB:  std_logic_vector (15 downto 0);

begin

reg1 : reg
port map (Addr, reset, Load, outA, clock);

reg2 : reg
port map (Addr, reset, Load, outB, clock);

out1 <= outA;
out2 <= outB;

end comportamento;