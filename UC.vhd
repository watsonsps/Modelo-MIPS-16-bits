library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.all;

entity UC is
port(
		reset: in std_logic;
		instr : in std_logic_vector(3 downto 0);
		comp_Cont: in std_logic_vector (2 downto 0);
		mux_1, mux_4, mux_5: out std_logic_vector(1 downto 0);
		sel_ula, resetALL: out std_logic;
		Load_BR, mux_2, Load_MD, LoadULA: out std_logic
	);
end entity;

architecture controla of UC is 
	begin
		process(instr, comp_Cont, reset)
		begin 
			if reset = '1' then 
				mux_1 <= "10";
				mux_2 <= '0';
				
				mux_4 <= "00";
				mux_5 <= "00";
				
				sel_ula <= '0';
				Load_BR <= '0';
				Load_MD <= '0';
				LoadULA <= '0';
				resetALL <= '1';
			else
				case instr is 
					-- Add
					when "0000" => 
						mux_1 <= "01";
						mux_2 <= '0';
						
						mux_4 <= "00";
						mux_5 <= "00";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					--addi
					when "0001" =>
						mux_1 <= "01";
						mux_2 <= '1';
						
						mux_4 <= "11";
						mux_5 <= "00";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					--addu
					when "0010" => 
						mux_1 <= "01";
						mux_2 <= '0';
						
						mux_4 <= "00";
						mux_5 <= "00";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					--lw
					when "0011" => 
						mux_1 <="01";
						mux_2 <= '1';
						
						mux_4 <= "11";
						mux_5 <= "11";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					--sw
					when "0100" => 
						mux_1 <="01";
						mux_2 <= '0';
						
						mux_4 <= "11";
						mux_5 <= "00";
						
						sel_ula <= '1'; 
						Load_BR <= '0';
						Load_MD <='1';
						LoadULA <= '0';
						resetALL <= '0';
					-- la ~ addi
					when "0101" => 
						mux_1 <= "01";
						mux_2 <= '1';
						
						mux_4 <= "11";
						mux_5 <= "00";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					-- move ~ add
					when "0110" => 
						mux_1 <= "01";
						mux_2 <= '0';
						
						mux_4 <= "00";
						mux_5 <= "00";
						
						sel_ula <= '1';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';
					--slt
					when "0111" => 
						mux_1 <="01";
						mux_2 <= '0';
						
						mux_4 <= "00";
						if(comp_Cont="001") then
							mux_5<="01";
						else
							mux_5<="10";
						end if;
							
						sel_ula <= '-'; 
						Load_BR <= '1';
						Load_MD <='0';
						LoadULA <= '1';
						resetALL <= '0';
					--slti
					when "1000" => 
						mux_1 <="01";
						mux_2 <= '1';
						
						mux_4 <= "11";
						if(comp_Cont="001") then
							mux_5<="01";
						else
							mux_5<="10";
						end if;	
						
						sel_ula <='-'; 
						Load_BR <= '1';
						Load_MD <='0';
						LoadULA <= '1';
						resetALL <= '0';
					--beq
					when "1001" => 
						LoadULA <= '1';
						if (comp_Cont = "010") then
							mux_1 <= "11";      
						else
							mux_1 <= "01";
						end if;
						mux_2 <='0'; 
						
						mux_4 <= "00";
						mux_5 <= "00";
						
						sel_ula <= 'Z';
						Load_BR <= '0';
						Load_MD <='0';
						resetALL <= '0';
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
						
						mux_4 <= "00";
						mux_5 <= "00";
						
						sel_ula <= '-';
						Load_BR <= '0';
						Load_MD <='0';
						LoadULA <= '1';
						resetALL <= '0';
					--j
					when "1011" => 
						mux_1 <="00";
						mux_2 <= '0';
						
						mux_4 <= "00";
						mux_5 <= "00";
						sel_ula <= '1';
						Load_BR <= '0';
						Load_MD <='0';
						LoadULA <= '0';
						resetALL <= '0';
					--subi
					when others => 
						mux_1 <= "01";
						mux_2 <= '1';
						
						mux_4 <= "01";
						mux_5 <= "00";
						sel_ula <= '0';
						Load_BR <= '1';
						Load_MD <= '0';
						LoadULA <= '0';
						resetALL <= '0';	
				end case;
			end if;
	end process;
end controla;