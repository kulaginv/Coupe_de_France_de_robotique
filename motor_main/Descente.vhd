LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Descente is 
port
	(
	clk, sum_sw, rot:  in std_logic;
	speed: out integer;
	CE: out std_logic:='0'
	);
end Descente;

architecture a_Descente of Descente is				
signal etat: integer range 0 to 750_000_000:=0;-- le temps qu'il faut pour que le phare descende (en secondes)

begin 
	process(clk, sum_sw, rot)
	begin
		if (clk'event and clk='1') then
			if rot='1' then
				speed <= 0;
				etat <= 0;
				CE<='0';
			elsif etat/=750000000 then				-- le phare commence a descendre
				etat<=etat+1;
				speed <= 2000;						-- la vitesse du moteur (2500 max!)
				CE<='1';
				
			else
				speed <=0;
				
			end if;
		end if;
	end process;
end a_Descente;
	