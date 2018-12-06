library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity DEVICE_TB is
end DEVICE_TB;  

architecture DEVICE_TB_ARCH of DEVICE_TB is

	-- Component Declaration for the Unit Under Test (UUT) 
	component RSA_DEVICE
		port(
			INPUT_MESSAGE	  :in	std_logic_vector(7 downto 0);
			SEND_MESSAGE_FLAG :in	std_logic;
			OUTPUT_MESSAGE	  :out	std_logic_vector(7 downto 0)
			);
	end component;
	
	--Inputs
	signal INPUT_MESSAGE	 :std_logic_vector:="00000000";
	signal SEND_MESSAGE_FLAG :std_logic:='0';
	
	--Output
	signal OUTPUT_MESSAGE	 :std_logic_vector:="00000000";
	
	-- Clock period definitions 
	constant clk_period : time := 10ns; 
	
begin	
	-- Instantiate the Unit Under Test (UUT) 
	UUT: RSA_DEVICE port map(INPUT_MESSAGE,SEND_MESSAGE_FLAG,OUTPUT_MESSAGE);
			
	input_mess_proc: process
	begin
		for i in 0 to 7 loop
			INPUT_MESSAGE <= INPUT_MESSAGE << 1;
		end loop;
	end process;
	
	flad_gen_proc: process
	begin
		wait 10 ns;
		SEND_MESSAGE_FLAG <= '1';
		wait 100 ns;
		SEND_MESSAGE_FLAG <= '0';
	end process;
end DEVICE_TB_ARCH;