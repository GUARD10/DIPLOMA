library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity CODER_TB is
end CODER_TB;  

architecture CODER_TB_ARCH of CODER_TB is

	-- Component Declaration for the Unit Under Test (UUT) 
	component RSA_CD
		port(
			MESSAGE 		: in STD_LOGIC_VECTOR(7 downto 0);
			PUBLIC_KEY 		: in STD_LOGIC_VECTOR(15 downto 0);
			CODED_MESSAGE 	: out STD_LOGIC_VECTOR(7 downto 0)
			);
	end component;
	
	--Inputs
	signal MESSAGE	  :std_logic_vector:="00000000";
	signal PUBLIC_KEY :std_logic_vector:="0000000000000000";
	
	--Output
	signal CODED_MESSAGE :std_logic_vector:="00000000";
	
	-- Clock period definitions 
	constant clk_period : time := 10ns; 
	
begin	
	-- Instantiate the Unit Under Test (UUT) 
	UUT: RSA_DEVICE port map(MESSAGE,PUBLIC_KEY,CODED_MESSAGE);
			
	input_mess_proc: process
	begin
		for i in 0 to 7 loop
			MESSAGE <= MESSAGE << 1;
		end loop;
	end process;
	
	public_key_proc: process
	begin
		for i in 0 to 15 loop
			PUBLIC_KEY <= PUBLIC_KEY << 1;
		end loop;
	end process;
end CODER_TB_ARCH;