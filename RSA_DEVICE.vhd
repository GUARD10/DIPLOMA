------------------------------------------
--	RSA coding/decoding device
------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity RSA_DEVICE is
	port(
		INPUT_MESSAGE_DEV  : in	std_logic_vector(7 downto 0);
		SEND_MESSAGE_FLAG  : in	std_logic;
		OUTPUT_MESSAGE_DEV : out	std_logic_vector(7 downto 0));
end RSA_DEVICE;

architecture RSA_DEVICE_ARCH of RSA_DEVICE is
	component RSA_CODER is 
		port(
			EN: in std_logic;
			MESSAGE_CD:in std_logic_vector(7 downto 0);
			PUBLIC_KEY_CD:in std_logic_vector(15 downto 0);
			CODED_MESSAGE:out std_logic_vector(7 downto 0)
			);
	end component;
	component RSA_DECODER is
		port(
			MESSAGE_DC:in std_logic_vector(7 downto 0);
			PRIVATE_KEY_DC:in std_logic_vector(15 downto 0);
			DECODED_MESSAGE:out std_logic_vector(7 downto 0)
			);
	end component;	
	
	signal PUBLIC_KEY_DEV  : std_logic_vector(15 downto 0):= "00000000"&"00010001" ;
	signal PRIVATE_KEY_DEV : std_logic_vector(15 downto 0):= "00000000"&"00010101" ;
	signal MESSEGE_DEV : std_logic_vector(7 downto 0) := "00000000";
begin

	DECODER: RSA_DECODER port map(
		MESSAGE_DC => INPUT_MESSAGE_DEV,
		PRIVATE_KEY_DC => PRIVATE_KEY_DEV,
		DECODED_MESSAGE => MESSEGE_DEV);

	CODER: RSA_CODER port map(
		EN => SEND_MESSAGE_FLAG,
		MESSAGE_CD => MESSEGE_DEV,
		PUBLIC_KEY_CD => PUBLIC_KEY_DEV,
		CODED_MESSAGE => OUTPUT_MESSAGE_DEV);
end RSA_DEVICE_ARCH;
