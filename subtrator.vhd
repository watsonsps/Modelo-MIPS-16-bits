LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_signed.all ;
use work.all;

ENTITY subtrator IS
generic(
		n: integer := 16);
PORT ( X, Y : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
S : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0) ) ;
END subtrator ;

ARCHITECTURE Behavior OF subtrator IS
BEGIN
S <= X - Y ;
END Behavior ;