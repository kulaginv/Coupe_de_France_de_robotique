LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY HuitBitsONOFF IS PORT
	(
	H,UP,DOWN,Cmd, T10ms: in std_logic;
	S : out std_logic_vector(0 to 2208):= (others => '0')
	);
END;

ARCHITECTURE LED OF HuitBitsONOFF IS
	signal Num_LED : integer range 0 to 91 := 91;    --- >> 23
	signal LED1 : integer := 23;
	signal LED2 : integer := 46;
	signal LED3 : integer := 69;
	signal etat : integer range 0 to LED1 := 0;
	signal cnt : integer range 0 to Num_LED*8 := 0;
	
BEGIN
	PROCESS (H, Cmd)
		BEGIN
		if (H'event and H='1')then
			case etat is
				when 0 =>
					S <= (others => DOWN);
					cnt <= 0;
					if Cmd = '0' then
						etat <= 1;
					end if;
				when others =>
					S <= (others => DOWN);
					for i in cnt to cnt + 7 loop
						S(i) <= UP;
					end loop;
					for i in LED1 + cnt to LED1 + cnt + 7 loop
						S(i) <= UP;
					end loop;
					for i in LED2 + cnt to LED2 + cnt + 7 loop
						S(i) <= UP;
					end loop;
					for i in LED3 + cnt to LED3 + cnt + 7 loop
						S(i) <= UP;
					end loop;
					cnt <= cnt + 8;
					if T10ms = '1' then etat <= etat + 1;
					end if;
					if Cmd = '1' then
						etat <= 0;
					end if;
			end case;
		end if;
	end process;
end;