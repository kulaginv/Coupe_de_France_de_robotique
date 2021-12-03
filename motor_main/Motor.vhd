LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;							
use ieee.std_logic_signed.all;

entity Motor is 
port
	(
	clk:  in std_logic;							-- horloge du FPGA 50 MHz
	speed: in integer;         				-- vitesse de rotation du moteur
	pwm, int1, int2: out std_logic			-- signa pwm et 2 singaux qui gerent le sens de rotation
	);
end Motor;

architecture DC of Motor is
signal counter: integer range 0 to 2500;
begin 
	process(clk, speed)
	begin	
		if (clk'event and clk = '1') then
			--partie qui sert a definir le rapport cyclique
			counter <= counter + 1;
			if (counter = 2500) then 				-- 2500 la valeur max de la vitesse de rotation
				counter <= 0;
			end if;
			if (counter < abs(speed)) then
			-- reglade du sens de rotation
				if speed > 0 then         			
					int1 <= '1';
					int2 <= '0';
					pwm <= '1';
				else
				-- si le signe de la vitesse change, on change le sens de rotation
					int2 <= '1';
					int1 <= '0';
					pwm <= '1';
				end if;
			else
				pwm <= '0';
				int1 <= '0';
				int2 <= '0';
			end if;
		end if;
	end process;
end DC;
			
			
			
			
				
