-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"
-- CREATED		"Sun Jun 10 19:29:34 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Processador IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		RESETall :  IN  STD_LOGIC;
		Chaves :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		comp_Cont :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		D :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		endPC :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Out41 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		outDBR :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		outPC :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		OutULA :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Reg1 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Reg2 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		regOUTF :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END Processador;

ARCHITECTURE bdf_type OF Processador IS 

COMPONENT caminhodedados
	PORT(resetPC : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 LoadMD : IN STD_LOGIC;
		 ResetMD : IN STD_LOGIC;
		 selULA : IN STD_LOGIC;
		 LoadULA : IN STD_LOGIC;
		 loadBR : IN STD_LOGIC;
		 resetBR : IN STD_LOGIC;
		 Mux_2 : IN STD_LOGIC;
		 Chaves : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Mux_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Mux_4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Mux_5 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 comp_Cont : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 D : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 endPC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Out41 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 outDBR : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 outPC : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 OutULA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Reg1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Reg2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 regOUTF : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT uc
	PORT(reset : IN STD_LOGIC;
		 comp_Cont : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 instr : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel_ula : OUT STD_LOGIC;
		 resetALL : OUT STD_LOGIC;
		 Load_BR : OUT STD_LOGIC;
		 mux_2 : OUT STD_LOGIC;
		 Load_MD : OUT STD_LOGIC;
		 LoadULA : OUT STD_LOGIC;
		 mux_1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mux_4 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mux_5 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	comp_Cont_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	D_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Load_BR :  STD_LOGIC;
SIGNAL	Load_MD :  STD_LOGIC;
SIGNAL	LoadULA :  STD_LOGIC;
SIGNAL	mux_1 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	mux_2 :  STD_LOGIC;
SIGNAL	mux_4 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	mux_5 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	reset :  STD_LOGIC;
SIGNAL	selULA :  STD_LOGIC;


BEGIN 



b2v_inst : caminhodedados
PORT MAP(resetPC => reset,
		 clock => clock,
		 LoadMD => Load_MD,
		 ResetMD => reset,
		 selULA => selULA,
		 LoadULA => LoadULA,
		 loadBR => Load_BR,
		 resetBR => reset,
		 Mux_2 => mux_2,
		 Chaves => Chaves,
		 Mux_1 => mux_1,
		 Mux_4 => mux_4,
		 Mux_5 => mux_5,
		 comp_Cont => comp_Cont_ALTERA_SYNTHESIZED,
		 D => D_ALTERA_SYNTHESIZED,
		 endPC => endPC,
		 Out41 => Out41,
		 outDBR => outDBR,
		 outPC => outPC,
		 OutULA => OutULA,
		 Reg1 => Reg1,
		 Reg2 => Reg2,
		 regOUTF => regOUTF);


b2v_inst1 : uc
PORT MAP(reset => RESETall,
		 comp_Cont => comp_Cont_ALTERA_SYNTHESIZED,
		 instr => D_ALTERA_SYNTHESIZED(15 DOWNTO 12),
		 sel_ula => selULA,
		 resetALL => reset,
		 Load_BR => Load_BR,
		 mux_2 => mux_2,
		 Load_MD => Load_MD,
		 LoadULA => LoadULA,
		 mux_1 => mux_1,
		 mux_4 => mux_4,
		 mux_5 => mux_5);

comp_Cont <= comp_Cont_ALTERA_SYNTHESIZED;
D <= D_ALTERA_SYNTHESIZED;

END bdf_type;