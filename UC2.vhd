library IEEE;
use IEEE.std_logic_1164.all;

entity UC2 is
	port(
		clear, resetOK, fim: in std_logic;
		instr : in std_logic_vector(3 downto 0);
		comp_Cont: in std_logic_vector (2 downto 0);
		resetPC, resetBR, ResetMD: out std_logic;
		mux_1, mux_4, mux_5: out std_logic_vector(1 downto 0);
		sel_ula: out std_logic;
		Load_BR, mux_2,mux_3, mux_6, Load_MD, LoadULA: out std_logic
	);
end UC2;

architecture comportamento of UC2 is
	type estado is (s0, s1, s2);
	signal estado_atual, proximo_estado: estado;
begin
	sequencial:
	process (clear, clk) is
	begin
		if(clear = '1') then
			estado_atual <= s0;
		elsif(rising_edge(clk)) then
			estado_atual <= proximo_estado;
		end if;
	end process;


	combinacional:
	process() is
	begin
		case estado_atual is
			when s0 => -- wait for reset	= 1
				resetBR <= '0';
				resetMD <= '0'; 
				resetPC <= '0';
				if resetOK = '1' then 
					proximo_estado <=  s1;
				else 
					proximo_estado <= s0;
			when s1 => 
				resetBR <= '1';
				resetMD <= '1'; 
				resetPC <= '1';
				if resetOK = '0' then 
					proximo_estado <= s2;
				else 
					proximo_estado <= s1;
			when s2 =>
				resetBR <= '0';
				resetMD <= '0'; 
				resetPC <= '0';
				case instr is 
				-- Add
				when "0000" => 
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				--addi
				when "0001" =>
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "10";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				--addu
				when "0010" => 
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				--lw
				when "0011" => 
					mux_1 <="01";
					mux_2 <= '0';
					mux_3 <= '0';
					mux_4 <= "11";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				--sw
				when "0100" => 
					mux_1 <="01";
					mux_2 <= '0';
					mux_3 <= '0';
					mux_4 <= "11";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1'; 
					Load_BR <= '0';
					Load_MD <='1';
					LoadULA <= '0';
				-- la ~ addi
				when "0101" => 
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				-- move ~ add
				when "0110" => 
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '1';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				--slt
				when "0111" => 
					mux_1 <="01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "00";
					if(comp_Cont="001") then
						mux_5<="01";
					else
						mux_5<="10";
					end if;
					mux_6 <= '0';	
					sel_ula <= '-'; 
					Load_BR <= '1';
					Load_MD <='0';
					LoadULA <= '1';
				--slti
				when "1000" => 
					mux_1 <="01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "11";
					if(comp_Cont="001") then
						mux_5<="01";
					else
						mux_5<="10";
					end if;	
					mux_6 <= '0';
					sel_ula <='-'; 
					Load_BR <= '1';
					Load_MD <='0';
					LoadULA <= '1';
				--beq
				when "1001" => 
					LoadULA <= '1';
					if (comp_Cont = "010") then
						mux_1 <= "11";      
					else
						mux_1 <= "01";
					end if;
					mux_2 <='0'; 
					mux_3 <= '0';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= 'Z';
					Load_BR <= '0';
					Load_MD <='0';
				--bne
				when "1010" =>  
					if (comp_Cont = "100") then
						mux_1 <= "11";      
					elsif (comp_Cont = "001") then
						mux_1 <= "11";
					else
						mux_1 <="01";	
					end if;
					mux_2 <='0'; 
					mux_3 <= '0';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '-';
					Load_BR <= '0';
					Load_MD <='0';
					LoadULA <= '1';
				--j
				when "1011" => 
					mux_1 <="00";
					mux_2 <= '0';
					mux_3 <= '0';
					mux_4 <= "00";
					mux_5 <= "00";
					mux_6 <= '1';
					sel_ula <= '1';
					Load_BR <= '0';
					Load_MD <='0';
					LoadULA <= '0';
		
				--subi
				when others => 
					mux_1 <= "01";
					mux_2 <= '0';
					mux_3 <= '1';
					mux_4 <= "01";
					mux_5 <= "00";
					mux_6 <= '0';
					sel_ula <= '0';
					Load_BR <= '1';
					Load_MD <= '0';
					LoadULA <= '0';
				if fim = '1' then
					proximo_estado <= s0;
				else 
					proximo_estado <= s2;
		end case;		
	end process;
end comportamento;