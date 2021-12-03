--Diviseur de fr�quence
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Div_13 IS PORT
	(
	H,CE:IN std_logic;
	T13s:out std_logic:='1'
	);
END ;
ARCHITECTURE a_Div_13 OF Div_13 IS
	signal etat:integer range 0 to 650_000_000;
BEGIN
--Registre et �tat futur
	PROCESS (H)
	BEGIN
		if (H'event and H='1') then
			case etat is
				when  0=>  
					T13s<='0';
					if CE='1' then etat<=1; end if;
		 		when 650_000_000=>
		 			if CE='1' then 
		 				etat<=0;
		 				T13s<='1';
		 			end if;	
				when others =>
		 			if CE='1' then 
		 				etat<=etat+1;
		 			end if;
			end case;
		end IF;
	END PROCESS;
END;

