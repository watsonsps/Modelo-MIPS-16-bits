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
-- CREATED		"Sun Jun 10 19:28:47 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CaminhoDeDados IS 
	PORT
	(
		clock :  IN  STD_LOGIC;
		loadBR :  IN  STD_LOGIC;
		resetBR :  IN  STD_LOGIC;
		LoadMD :  IN  STD_LOGIC;
		ResetMD :  IN  STD_LOGIC;
		LoadULA :  IN  STD_LOGIC;
		resetPC :  IN  STD_LOGIC;
		Mux_2 :  IN  STD_LOGIC;
		selULA :  IN  STD_LOGIC;
		Chaves :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Mux_1 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Mux_4 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Mux_5 :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
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
END CaminhoDeDados;

ARCHITECTURE bdf_type OF CaminhoDeDados IS 

COMPONENT pc
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 Addr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 D : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT comparadord
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 RegOut : OUT STD_LOGIC;
		 MD : OUT STD_LOGIC;
		 Mux : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ir
	PORT(Write_Reg : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Reg_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT extensor
	PORT(I : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 extend : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux4x1b
	PORT(mux_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out_m : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT somadorc
GENERIC (n : INTEGER
			);
	PORT(X : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT regin
	PORT(S : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 D : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT bancoregistradores
GENERIC (n_Bits : INTEGER;
			n_log_Reg : INTEGER
			);
	PORT(Clock : IN STD_LOGIC;
		 Load : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 Data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Read_Reg_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Read_Reg_2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Write_Reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Reg_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Reg_2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT regout
	PORT(load : IN STD_LOGIC;
		 S : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 D : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT extensor2
	PORT(I : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 extend : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT memoriadedados
GENERIC (n_Bits : INTEGER;
			n_log_Reg : INTEGER
			);
	PORT(Clock : IN STD_LOGIC;
		 Load : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 Data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Write_Reg : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Reg_1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ula
GENERIC (n : INTEGER
			);
	PORT(sel : IN STD_LOGIC;
		 Load1 : IN STD_LOGIC;
		 x : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Maior : OUT STD_LOGIC;
		 Equal : OUT STD_LOGIC;
		 Menor : OUT STD_LOGIC;
		 out_ula : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux4x1
	PORT(a0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 a3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 mux_1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 out_m : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1a
	PORT(mux_2 : IN STD_LOGIC;
		 a0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 a1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out_m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1
	PORT(mux_2 : IN STD_LOGIC;
		 a0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 a1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 out_m : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	comp_Cont_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	D_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	endPC_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	ext :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	extPC :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Load :  STD_LOGIC;
SIGNAL	loadRegOut :  STD_LOGIC;
SIGNAL	MD :  STD_LOGIC;
SIGNAL	memD :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Mux :  STD_LOGIC;
SIGNAL	Mux21extPC :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Mux21W :  STD_LOGIC;
SIGNAL	Mux41 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	mux7 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	MUXB :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	MuxDBR :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	Out_ALTERA_SYNTHESIZED41 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	outDBR_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	OutextPC :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	OutULA_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	P :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Reg_ALTERA_SYNTHESIZED1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Reg_ALTERA_SYNTHESIZED2 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	regINF :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	RegO :  STD_LOGIC;
SIGNAL	ToExt :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : pc
PORT MAP(reset => resetPC,
		 clk => clock,
		 Addr => endPC_ALTERA_SYNTHESIZED,
		 D => P);


b2v_inst10 : comparadord
PORT MAP(A => OutULA_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 RegOut => RegO,
		 MD => MD,
		 Mux => Mux);


b2v_inst11 : ir
PORT MAP(Write_Reg => P,
		 Reg_1 => D_ALTERA_SYNTHESIZED);


b2v_inst12 : extensor
PORT MAP(I => ToExt,
		 extend => ext);


b2v_inst13 : mux4x1b
PORT MAP(mux_1 => D_ALTERA_SYNTHESIZED(11 DOWNTO 10),
		 out_m => MUXB);


loadRegOut <= RegO AND LoadMD;


Load <= MD AND LoadMD;


b2v_inst2 : somadorc
GENERIC MAP(n => 16
			)
PORT MAP(X => P,
		 Y => OutextPC,
		 S => endPC_ALTERA_SYNTHESIZED);


b2v_inst3 : regin
PORT MAP(S => Chaves,
		 D => regINF);


b2v_inst4 : bancoregistradores
GENERIC MAP(n_Bits => 16,
			n_log_Reg => 4
			)
PORT MAP(Clock => clock,
		 Load => loadBR,
		 reset => resetBR,
		 Data => outDBR_ALTERA_SYNTHESIZED,
		 Read_Reg_1 => D_ALTERA_SYNTHESIZED(7 DOWNTO 4),
		 Read_Reg_2 => D_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 Write_Reg => D_ALTERA_SYNTHESIZED(11 DOWNTO 8),
		 Reg_1 => Reg_ALTERA_SYNTHESIZED1,
		 Reg_2 => Reg_ALTERA_SYNTHESIZED2);


b2v_inst5 : regout
PORT MAP(load => loadRegOut,
		 S => Reg_ALTERA_SYNTHESIZED2,
		 D => regOUTF);


b2v_inst6 : extensor2
PORT MAP(I => D_ALTERA_SYNTHESIZED(11 DOWNTO 0),
		 extend => extPC);


b2v_inst7 : memoriadedados
GENERIC MAP(n_Bits => 16,
			n_log_Reg => 4
			)
PORT MAP(Clock => clock,
		 Load => Load,
		 reset => ResetMD,
		 Data => Reg_ALTERA_SYNTHESIZED2,
		 Write_Reg => OutULA_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 Reg_1 => memD);


b2v_inst9 : ula
GENERIC MAP(n => 16
			)
PORT MAP(sel => selULA,
		 Load1 => LoadULA,
		 x => Reg_ALTERA_SYNTHESIZED1,
		 y => Out_ALTERA_SYNTHESIZED41,
		 Maior => comp_Cont_ALTERA_SYNTHESIZED(2),
		 Equal => comp_Cont_ALTERA_SYNTHESIZED(1),
		 Menor => comp_Cont_ALTERA_SYNTHESIZED(0),
		 out_ula => OutULA_ALTERA_SYNTHESIZED);


b2v_Mux1 : mux4x1
PORT MAP(a0 => extPC,
		 a3 => MUXB,
		 mux_1 => Mux21extPC,
		 out_m => OutextPC);


b2v_Mux2 : mux2x1a
PORT MAP(mux_2 => Mux21W,
		 a0 => D_ALTERA_SYNTHESIZED(11 DOWNTO 8),
		 a1 => D_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 out_m => ToExt);


b2v_Mux4 : mux4x1
PORT MAP(a0 => Reg_ALTERA_SYNTHESIZED2,
		 a3 => ext,
		 mux_1 => Mux41,
		 out_m => Out_ALTERA_SYNTHESIZED41);


b2v_Mux5 : mux4x1
PORT MAP(a0 => OutULA_ALTERA_SYNTHESIZED,
		 a3 => mux7,
		 mux_1 => MuxDBR,
		 out_m => outDBR_ALTERA_SYNTHESIZED);


b2v_mux_7 : mux2x1
PORT MAP(mux_2 => Mux,
		 a0 => memD,
		 a1 => regINF,
		 out_m => mux7);

comp_Cont <= comp_Cont_ALTERA_SYNTHESIZED;
MuxDBR <= Mux_5;
Mux21extPC <= Mux_1;
Mux21W <= Mux_2;
Mux41 <= Mux_4;
D <= D_ALTERA_SYNTHESIZED;
endPC <= endPC_ALTERA_SYNTHESIZED;
Out41 <= Out_ALTERA_SYNTHESIZED41;
outDBR <= outDBR_ALTERA_SYNTHESIZED;
outPC <= P;
OutULA <= OutULA_ALTERA_SYNTHESIZED;
Reg1 <= Reg_ALTERA_SYNTHESIZED1;
Reg2 <= Reg_ALTERA_SYNTHESIZED2;

END bdf_type;