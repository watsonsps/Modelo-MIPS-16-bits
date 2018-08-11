library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity bancoRegistradores is 
	generic(
		n_log_Reg: integer := 4;
		n_Bits: integer := 16);
	port (
		Read_Reg_1, Read_Reg_2, Write_Reg : in std_logic_vector(n_log_Reg-1 downto 0);
		Clock, Load, reset : in std_logic;
		Data : in std_logic_vector (n_Bits-1 downto 0);
		Reg_1, Reg_2 : out std_logic_vector (n_Bits-1 downto 0)
		);
end bancoRegistradores;

architecture comportamento of bancoRegistradores is

	type reg_type is array (2**n_log_Reg-1 downto 0) of std_logic_vector (n_Bits-1 downto 0);
	signal regs: reg_type:= (others => (others => '0'));
	signal Read_Reg_1_inteiro, Read_Reg_2_inteiro, Write_Reg_inteiro : integer range 0 to 15;

begin

	Read_Reg_1_inteiro <= to_integer(unsigned(Read_Reg_1));
	Read_Reg_2_inteiro <= to_integer(unsigned(Read_Reg_2));
	Write_Reg_inteiro <= to_integer(unsigned(Write_Reg));
	
	Reg_1 <= regs(Read_Reg_1_inteiro);
	Reg_2 <= regs(Read_Reg_2_inteiro);
	
	process(Clock, Load, reset)
	begin
		if (reset = '1') then
		regs(0) <= "0000000000000000";
		regs(1) <= "0000000000000000";
		regs(2) <= "0000000000000000";
		regs(3) <= "0000000000000000";
		regs(4) <= "0000000000000000";
		regs(5) <= "0000000000000000";
		regs(6) <= "0000000000000000";
		regs(7) <= "0000000000000000";
		regs(8) <= "0000000000000000";
		regs(9) <= "0000000000000000";
		regs(10) <= "0000000000000000";
		regs(11) <= "0000000000000000";
		regs(12) <= "0000000000000000";
		regs(13) <= "0000000000000000";
		regs(14) <= "0000000000000000";
		regs(15) <= "0000000000000000";
		elsif (rising_edge(Clock) and Load = '1') then
			regs(Write_Reg_inteiro) <= Data;
		end if;
	end process;	
	
end comportamento;