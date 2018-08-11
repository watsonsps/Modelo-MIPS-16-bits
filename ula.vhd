library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.all;
 
entity ula is 
	generic (
	n : integer := 16);
	port ( 
		x : in std_logic_vector(n-1 downto 0);
		y : in std_logic_vector(n-1 downto 0);
		sel : in std_logic;
		Load1 : in std_logic;
		out_ula : out std_logic_vector(n-1 downto 0);
		Maior, Equal, Menor: out std_logic
	);
end ula;
 
architecture comportamento of ula is
	
	signal Amenor, Amaior, ig: std_logic;
	signal out1, out3: std_logic_vector (n-1 downto 0);	
	
	component comparador port (
		A, B : in std_logic_vector (n-1 downto 0);
		Load : in std_logic;
		A_Maior, Igual, A_Menor : out std_logic
	);
	end component;
	
	component somadorU is 
	port (
		A, B : in std_logic_vector (n-1 downto 0);
		O: out std_logic_vector (n-1 downto 0)
		);
	end component;
	
	component subtrator is 

	PORT ( X, Y : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0) ;
		S : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0) ) ;
	end component;

begin
			
	comparador1: comparador 
		port map (x,y,Load1,Amaior,ig,Amenor);
					
	somador1: somadorU
		port map(x,y,out1);	
		
	subtrator1: subtrator
		port map (x,y,out3);
		
	Maior <= Amaior;
	Equal <= ig;
	Menor <= Amenor;		
	process(sel, out1, out3) 
		begin
			if sel = '1' then-- soma
				out_ula <= out1;
			else -- SUB
				out_ula <= out3;
			end if;
	end process;
end comportamento;
