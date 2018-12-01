library IEEE;
use IEEE.std_logic_1164.all; 

entity RSA_CODER is
	port(
		MESSAGE 		: in STD_LOGIC_VECTOR(7 downto 0);
		PUBLIC_KEY 		: in STD_LOGIC_VECTOR(15 downto 0);
		CODED_MESSAGE 	: out STD_LOGIC_VECTOR(7 downto 0)  
		);
end RSA_CODER;  

architecture RSA_CODER_ARCH of RSA_CODER is
signal e : std_logic_vector(7 downto 0);
signal n : std_logic_vector(7 downto 0);

begin
	process is
		begin
			CODED_MESSAGE <= (MESSAGE**e)%n;
	end process;
end RSA_CODER_ARCH;