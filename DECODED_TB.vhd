library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity DECODER_TB is
end DECODER_TB;  

architecture DECODER_TB_ARCH of DECODER_TB is

	-- Component Declaration for the Unit Under Test (UUT) 
	component RSA_CD
		port(
			MESSAGE 		: in std_logic_vector(7 downto 0);
			PRIVATE_KEY 	: in	std_logic_vector(15 downto 0);
			DECODED_MESSAGE : out	std_logic_vector(7 downto 0)
			);
	end component;
	
	--Inputs
	signal MESSAGE	   :std_logic_vector( 7 downto 0):="00000000";
	signal PRIVATE_KEY :std_logic_vector(15 downto 0):="0000000000000000";
	
	--Output
	signal DECODED_MESSAGE :std_logic_vector(7 downto 0):="00000000";
	
	-- Clock period definitions 
	constant clk_period : time := 10ns; 
	
begin	
	-- Instantiate the Unit Under Test (UUT) 
	UUT: RSA_DEVICE port map(MESSAGE,PUBLIC_KEY,CODED_MESSAGE);
			
	mess_proc: process
	begin
		for i in 0 to 7 loop
			MESSAGE <= MESSAGE << 1;
		end loop;
	end process;
	
	private_key_proc: process
	begin
		for i in 0 to 15 loop
			PRIVATE_KEY <= PRIVATE_KEY << 1;
		end loop;
	end process;
end DECODER_TB_ARCH;