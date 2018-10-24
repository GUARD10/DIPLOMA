library IEEE;
use IEEE.std_logic_1164.all;

entity RSA_DECODER is
port(
	MESS:in std_logic_vector(7 downto 0),
	PRIVATE_KEY:in std_logic_vector(15 downto 0),
	DECODED_MESS:out std_logic_vector(7 downto 0)
	);
end entity RSA_DECODER;

architecture RSA_DECODER_ARCH of RSA_DECODER is
	signal d:std_logic_vector(7 downto 0);
	signal n:std_logic_vector(7 downto 0); 
	signal tmp_mess:std_logic_vector(7 downto 0);
begin
	d <= PRIVATE_KEY(15 downto 8);
	n <= PRIVATE_KEY(7 downto 0);
	
	process is 
	begin
		tmp_mess <= (MESS**d)%n;
		DECODED_MESS <= tmp_mess;
	end process;	
	
end architecture RSA_DECODER_ARCH;