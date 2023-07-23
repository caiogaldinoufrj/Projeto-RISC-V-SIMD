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

ENTITY zero_analyzer IS
  PORT (
    r        : IN  std_logic_vector(31 DOWNTO 0);
    zero       : OUT std_logic
    );
END zero_analyzer;
ARCHITECTURE TypeArchitecture OF zero_analyzer IS

BEGIN

process(r)
BEGIN

IF (r = "00000000000000000000000000000000") THEN
	zero <= '1';
ELSE
	zero <= '0';
END IF;
END PROCESS;

END TypeArchitecture;
