LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY BITSDOWN IS PORT
	(
	H: IN std_logic;
	S : OUT std_logic :='0'
	);
END;

ARCHITECTURE LEDBITOFF OF BITSDOWN IS
	SIGNAL etat : integer range 0 to 59 := 0; --sert a regler la periode T=65*20ns
	
	
	
BEGIN
	PROCESS (H)
		BEGIN
		
			if (H'event and H='1')then
				
				if etat<14 then S <='1';
				else S <='0';
				end if;-- pour parametrer le cycle de l'horloge
				
				
				if etat>=59 then etat<= 0;
				else etat<=etat+1;
				end if;				
			end if;
			
	end process;
end;