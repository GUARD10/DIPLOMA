library IEEE;
use IEEE.std_logic_1164.all;

entity RSA_DEVICE is
	port(
		MESS_IN:in std_logic_vector(7 downto 0),
		MESS_OUT:out std_logic_vector(7 downto 0),
		SEND_MESS:in std_logic
		);
end entity RSA_DECODER;

architecture RSA_DECODER_ARCH of RSA_DECODER is
	component RSA_CODER is 
		port(
			MESS:in std_logic_vector(7 downto 0),
			PUBLIC_KEY:in std_logic_vector(15 downto 0),
			CODED_MESS:out std_logic_vector(7 downto 0)
			);
	end component;
	
	component RSA_DECODER is
		port(
			MESS:in std_logic_vector(7 downto 0),
			PRIVATE_KEY:in std_logic_vector(15 downto 0),
			DECODED_MESS:out std_logic_vector(7 downto 0)
			);
	end component;	

	constant PUBLIC_KEY: std_logic_vector(15 downto 0) := "00000101";
	constant PRIVATE_KEY: std_logic_vector(15 downto 0):= "00010001";
	signal MESSEGE:std_logic_vector(7 downto 0);
begin
	process (MESS_IN) is 
	begin
		DECODER: RSA_DECODER
			port map(
					MESS => MESS_IN,
					PRIVATE_KEY => PRIVATE_KEY,
					DECODED_MESS => MESSEGE
					);
	end process;
	
	process (SEND_MESS) is
	begin
		if (SEND_MESS == '1') then
			CODER: RSA_CODER
				port map(
						MESS => MESSEGE,
						PUBLIC_KEY => PUBLIC_KEY,
						CODED_MESS => MESS_OUT
						);
		end if
	end process;
	
	
end architecture RSA_DECODER_ARCH;