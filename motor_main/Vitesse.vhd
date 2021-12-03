LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Vitesse is 
port
	(
	clk, sum_sw, rot, enable:  in std_logic;
	speed: out integer
	);
end Vitesse;

architecture a_Vitesse of Vitesse is
signal etat: integer range 0 to 1;
begin 
	process(clk, sum_sw, rot, enable)
	begin
		if (clk'event and clk='1') then
			case etat is
				when 0 =>											-- le moteur est éteint
					speed <= 0;
					if enable = '0' then 
						etat <= 1;
					end if;
				when 1 =>											-- moteur commence a tourner
					if rot = '1' then speed <= -2000; 		-- la vitesse de rotation (max 2500!)
					else 
					-- si les 2 boutons seront appuies en meme temps le moteur va descendre
					-- si dans le processus de levage on appuie sur le deusieme boutton, le moteur s'arrete 
						speed <= 2000;								-- on change le sens de rotation
						if enable = '1' then etat <= 0;
						end if;
					end if;
					if (sum_sw = '0') then						-- si le phare est monté on eteint le moteur
						etat <= 0;
					end if;
			end case;
		end if;
	end process;
end a_Vitesse;