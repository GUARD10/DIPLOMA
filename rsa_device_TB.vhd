library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
	

entity RSA_DEVICE_TB is
end RSA_DEVICE_TB;

architecture TB_ARCHITECTURE of rsa_device_tb is
	-- Component declaration of the tested unit
	component RSA_DEVICE
	port(
		INPUT_MESSAGE_DEV	  :in	std_logic_vector(7 downto 0);
		SEND_MESSAGE_FLAG :in	std_logic;
		OUTPUT_MESSAGE_DEV	  :out	std_logic_vector(7 downto 0)
		);
	end component;
	
	--Inputs
	signal INPUT_MESSAGE_TB	 :std_logic_vector(7 downto 0):="00000000";
	signal SEND_MESSAGE_FLAG :std_logic:='0';
	
	--Output
	signal OUTPUT_MESSAGE_TB :std_logic_vector(7 downto 0):="00000000";
	
begin

	-- Unit Under Test port map
	UUT : RSA_DEVICE
		port map (
			INPUT_MESSAGE_DEV => INPUT_MESSAGE_TB,
			SEND_MESSAGE_FLAG => SEND_MESSAGE_FLAG,
			OUTPUT_MESSAGE_DEV => OUTPUT_MESSAGE_TB
			);

	input_mess_proc: process is
	begin
		for i in 0 to 7 loop
			INPUT_MESSAGE_TB <= INPUT_MESSAGE_TB(0)&INPUT_MESSAGE_TB(7 downto 1);
		end loop;
	end process;
	
	flad_gen_proc: process is
	begin
		wait for 10 ns;
		SEND_MESSAGE_FLAG <= '1';
		wait for 100 ns;
		SEND_MESSAGE_FLAG <= '0';
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_RSA_DEVICE of RSA_DEVICE_TB is
	for TB_ARCHITECTURE
		for UUT : rsa_device
			use entity work.rsa_device(rsa_device_arch);
		end for;
	end for;
end TESTBENCH_FOR_RSA_DEVICE;

