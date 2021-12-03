LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Comptage is 
port
	(
	clk, sum_sw, rot, C_E:  in std_logic;
	CE: out std_logic										-- autorisation du comptage
	);
end Comptage;
architecture a_Comptage of Comptage is
signal etat: integer range 0 to 1;
begin 
	process(clk, sum_sw, rot)
	begin
		if (clk'event and clk='1') then
			case etat is
				when 0 =>
					CE <= '0';
					-- si le phare est en haut et le deuxieme bouton a ete appuie, on change l'etat
					if (rot = '0' and sum_sw = '0') then etat <= 1;  
					end if;
				when 1 =>
					-- autorise a compter jusq'a ce qu'il y ait un signal (C_E) que les 15 secondes sont passees 
					CE <= '1';
					if C_E = '0' then etat <= 0;
					end if;
			end case;
		end if;
	end process;
end a_Comptage;