--------------------------------------------------------------------------------
-- Project :
-- File    :
-- Autor   :
-- Date    :
--
--------------------------------------------------------------------------------
-- Description :
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PC IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock, reset,write_e      : IN  std_logic;
    a : IN std_logic_vector (31 DOWNTO 0);
    b : OUT std_logic_vector (31 DOWNTO 0)
    );
END PC;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF PC IS

BEGIN

PROCESS (clock, reset)
BEGIN
IF (write_e = '1') THEN
IF (rising_edge(clock)) THEN
	IF (a = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") THEN 
		 b <= "00000000000000000000000000000000";
	ELSE
		b <= a;
	END IF;
END IF;
IF (reset = '1') THEN
	 b <= "00000000000000000000000000000000";
END IF; 
END IF;
END PROCESS;

END TypeArchitecture;
