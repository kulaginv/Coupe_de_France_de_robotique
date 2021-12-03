--Diviseur de fr�quence
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Diviseur1000 IS PORT
	(
	H,CE:IN std_logic;
	T1000:out std_logic:='1'
	);
END ;
ARCHITECTURE a_Diviseur1000 OF Diviseur1000 IS
	signal etat:integer range 0 to 999;
BEGIN
--Registre et �tat futur
	PROCESS (H)
	BEGIN
		if (H'event and H='1') then
			case etat is
				when  0=>  
					T1000<='0';
					if CE='1' then etat<=1; end if;
		 		when 999=>
		 			if CE='1' then 
		 				etat<=0;
		 				T1000<='1';
		 			end if;	
				when others =>
		 			if CE='1' then 
		 				etat<=etat+1;
		 			end if;
			end case;
		end IF;
	END PROCESS;
END;

