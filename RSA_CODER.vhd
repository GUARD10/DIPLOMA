------------------------------------------
--	RSA coder
------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity RSA_CODER is
	port(
		MESSAGE:				in	std_logic_vector( 7 downto 0),
		PUBLIC_KEY:			in	std_logic_vector(15 downto 0),
		CODED_MESSAGE:	out	std_logic_vector( 7 downto 0));
end entity RSA_CODER;

architecture RSA_CODER_ARCH of RSA_CODER is
	signal e	:	std_logic_vector(7 downto 0);
	signal n	:	std_logic_vector(7 downto 0);
begin
	e <= PUBLIC_KEY(15 downto 8);
	n <= PUBLIC_KEY(7 downto 0);
	
	process is 
	begin
		CODED_MESSAGE <= (MESSAGE**e)%n;
	end process;	
	
end architecture RSA_CODER_ARCH;