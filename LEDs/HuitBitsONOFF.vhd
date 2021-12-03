LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY HuitBitsONOFF IS PORT
	(
	H,UP,DOWN,Cmd: IN std_logic;--UP et DOWN sont les PWM qu'on recois des autres modules
	-- Cmd la commande qui indique qu'on a atteint le sommet de la tour
	--Cmd = 1 les deux interrupteur sont fermer 
	--Cmd = 0 un ou les deux interupteur sont ouvert
	S : OUT std_logic :='0'
	);
END;

ARCHITECTURE LED OF HuitBitsONOFF IS
	SIGNAL etat : integer range 0 to 999999 := 0;
	--l'etat sert a definir le temps durant le quelle une led reste allume et a gerer les entrer UP et DOWN
	SigNAL Num_LED : integer range 0 to 22 :=0;
	--Num_LED sert a savoir quelle LED doit s'allumer
	
BEGIN
	PROCESS (H)
		BEGIN
		if (H'event and H='1')then
			
			if (Cmd = '1' and etat<10000) then S<='0';
			elsif (Cmd = '1') then S<=DOWN;
			
			elsif etat <Num_LED*1440 then S<=DOWN;
			elsif etat<(3+Num_LED)*1440 then S<=UP;
			
			elsif etat <(Num_LED+23)*1440 then S<=DOWN;
			elsif etat<(3+Num_LED+23)*1440 then S<=UP;
			
			elsif etat <(Num_LED+46)*1440 then S<=DOWN;
			elsif etat<(3+Num_LED+46)*1440 then S<=UP;
			
			elsif etat <(Num_LED+69)*1440 then S<=DOWN;
			elsif etat<(3+Num_LED+69)*1440 then S<=UP;
			
			elsif etat<900000 then S<=DOWN;
			else S<='0';end if;
				
			if etat /= 999999 then etat<=etat+1;
			
			else
				etat<=0;
				if Num_LED/=22 then Num_LED<=Num_LED+1;
				else Num_LED<=0;end if;
			end if;
		
		end if;
	end process;
end;