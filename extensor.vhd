library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity extensor is
	port (
		I: in std_logic_vector (3 downto 0);
		extend: out std_logic_vector (15 downto 0)
	);
end entity;

architecture sim of extensor is
    signal s3  : std_logic_vector( 3 downto 0);
    signal s16 : std_logic_vector(15 downto 0);
begin
	s3 <= I;
   s16 <=I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & I(3) & s3;
	extend <= s16;
end architecture;