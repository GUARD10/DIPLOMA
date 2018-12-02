------------------------------------------
--	RSA coding/decoding device
------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity RSA_DEVICE is
	port(
		INPUT_MESSAGE:			in	std_logic_vector(7 downto 0);
		SEND_MESSAGE_FLAG:		in	std_logic;
		OUTPUT_MESSAGE:			out	std_logic_vector(7 downto 0));
end RSA_DEVICE;

architecture RSA_DEVICE_ARCH of RSA_DEVICE is
	component RSA_CODER is 
		port(
			MESS:in std_logic_vector(7 downto 0);
			PUBLIC_KEY:in std_logic_vector(15 downto 0);
			CODED_MESS:out std_logic_vector(7 downto 0)
			);
	end component;
	component RSA_DECODER is
		port(
			MESS:in std_logic_vector(7 downto 0);
			PRIVATE_KEY:in std_logic_vector(15 downto 0);
			DECODED_MESS:out std_logic_vector(7 downto 0)
			);
	end component;	
	
	constant PUBLIC_KEY  : std_logic_vector(15 downto 0) := "00000101";
	constant PRIVATE_KEY : std_logic_vector(15 downto 0) := "00010001";
	
	signal MESSEGE : std_logic_vector(7 downto 0);
begin

	DECODER: RSA_DECODER port map(
		MESS => INPUT_MESSAGE,
		PRIVATE_KEY => PRIVATE_KEY,
		DECODED_MESS => MESSEGE);

	if (SEND_MESSAGE_FLAG == '1') then
		CODER: RSA_CODER port map(
			MESS => MESSEGE,
			PUBLIC_KEY => PUBLIC_KEY,
			CODED_MESS => OUTPUT_MESSAGE);
	end if;
end RSA_DEVICE_ARCH;