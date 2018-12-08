library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity rsa_device_tb is
end rsa_device_tb;

architecture TB_ARCHITECTURE of rsa_device_tb is
	-- Component declaration of the tested unit
	component rsa_device
	port(
		INPUT_MESSAGE : in STD_LOGIC_VECTOR(7 downto 0);
		SEND_MESSAGE_FLAG : in STD_LOGIC;
		OUTPUT_MESSAGE : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal INPUT_MESSAGE : STD_LOGIC_VECTOR(7 downto 0);
	signal SEND_MESSAGE_FLAG : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal OUTPUT_MESSAGE : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : rsa_device
		port map (
			INPUT_MESSAGE => INPUT_MESSAGE,
			SEND_MESSAGE_FLAG => SEND_MESSAGE_FLAG,
			OUTPUT_MESSAGE => OUTPUT_MESSAGE
		);

	input_mess_proc: process is
	begin
		for i in 0 to 7 loop
			INPUT_MESSAGE <= INPUT_MESSAGE(0)&INPUT_MESSAGE(7 downto 1);
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

configuration TESTBENCH_FOR_rsa_device of rsa_device_tb is
	for TB_ARCHITECTURE
		for UUT : rsa_device
			use entity work.rsa_device(rsa_device_arch);
		end for;
	end for;
end TESTBENCH_FOR_rsa_device;

