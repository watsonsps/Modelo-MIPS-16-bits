library ieee;
use ieee.std_logic_1164.all;
use work.all;
use ieee.numeric_std.all;

entity memoriadeDados is 
	generic(
		n_log_Reg: integer := 4;
		n_Bits :integer := 16);
	port (
		Write_Reg  :in std_logic_vector(n_log_Reg-1 downto 0);
		Clock, Load, reset :in std_logic;
		Data : in std_logic_vector (n_Bits-1 downto 0);
		Reg_1: out std_logic_vector (n_Bits-1 downto 0)
		);
end memoriadeDados;

architecture comportamento of memoriadeDados is

	type reg_type is array (2**n_log_Reg-1 downto 0) of std_logic_vector (n_Bits-1 downto 0);
	signal regs: reg_type;
	signal Write_Reg_inteiro, Read_Reg_inteiro : integer range 0 to 15;

begin
	
	Write_Reg_inteiro <= to_integer(unsigned(Write_Reg));
	Read_Reg_inteiro <= to_integer(unsigned(Write_reg));
	
	Reg_1 <= regs(Read_Reg_inteiro);
	
	process(Clock, Load,reset)
	begin
	if (reset = '1') then
		regs(0) <= "0000000000001110";
		regs(1) <= "0000000000101011";
		regs(2) <= "0000000000000010";
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