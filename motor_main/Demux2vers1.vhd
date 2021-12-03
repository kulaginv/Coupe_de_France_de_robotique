
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
ENTITY Demux2vers1 IS PORT
	(
	-- si le comtage est autorise alors le phare doit descendre et on prend la valeur de S0
	-- quand le phare se monte alors le comtage n'est pas autorise et on prend la valeur de S1
	Adr:IN integer range 0 to 1;
	S0,S1:in integer;
	speed :out integer 
	);
END;
ARCHITECTURE a_Demux2vers1 OF demux2vers1 IS
BEGIN
speed <= S0 when Adr = 1 else S1;
END;
