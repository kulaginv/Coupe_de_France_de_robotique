--Diviseur de fr�quence
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Diviseur50 IS PORT
	(
	H,CE:IN std_logic;
	T50:out std_logic:='1'
	);
END ;
ARCHITECTURE a_Diviseur50 OF Diviseur50 IS
	signal etat:integer range 0 to 49;
BEGIN
--Registre et �tat futur
	PROCESS (H)
	BEGIN
		if (H'event and H='1') then
			case etat is
				when  0=>  
					T50<='0';
					if CE='1' then etat<=1; end if;
		 		when 49=>
		 			if CE='1' then 
		 				etat<=0;
		 				T50<='1';
		 			end if;	
				when others =>
		 			if CE='1' then 
		 				etat<=etat+1;
		 			end if;
			end case;
		end IF;
	END PROCESS;
END;

