library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity extensor2 is
	port (
		I: in std_logic_vector (11 downto 0);
		extend: out std_logic_vector (15 downto 0)
	);
end entity;

architecture sim of extensor2 is
    signal s8  : std_logic_vector( 11 downto 0);
    signal s16 : std_logic_vector(15 downto 0);
begin
	s8 <= I;
   s16 <=I(11) & I(11) & I(11) & I(11) &  s8;
	extend <= s16;
end architecture;