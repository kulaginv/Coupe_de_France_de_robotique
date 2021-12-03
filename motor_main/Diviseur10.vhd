--Diviseur de fr�quence
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Diviseur10 IS PORT
	(
	H,CE:IN std_logic;
	T10:out std_logic:='1'
	);
END ;
ARCHITECTURE a_Diviseur10 OF Diviseur10 IS
	signal etat:integer range 0 to 9;
BEGIN
--Registre et �tat futur
	PROCESS (H)
	BEGIN
		if (H'event and H='1') then
			case etat is
				when  0=>  
					T10<='0';
					if CE='1' then etat<=1; end if;
		 		when 9=>
		 			if CE='1' then 
		 				etat<=0;
		 				T10<='1';
		 			end if;	
				when others =>
		 			if CE='1' then 
		 				etat<=etat+1;
		 			end if;
			end case;
		end IF;
	END PROCESS;
END;

