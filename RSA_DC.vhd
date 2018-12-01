library IEEE;
use IEEE.std_logic_1164.all;   
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity RSA_DECODER is
	port(
		MESSAGE 		: in std_logic_vector(7 downto 0);
		PRIVATE_KEY 	: in	std_logic_vector(15 downto 0);
		DECODED_MESSAGE : out	std_logic_vector( 7 downto 0)
		);
end RSA_DECODER;

architecture RSA_DECODER_ARCH of RSA_DECODER is
	signal d	:	std_logic_vector(7 downto 0);
	signal n	:	std_logic_vector(7 downto 0);
begin
	d <= PRIVATE_KEY(15 downto 8);
	n <= PRIVATE_KEY(7 downto 0);
	
	process is 
	begin
		DECODED_MESSAGE <= conv_std_logic_vector((conv_integer(MESSAGE)**(conv_integer(d) rem (conv_integer(n)))), 8);
		wait;
	end process;	
	
end RSA_DECODER_ARCH;