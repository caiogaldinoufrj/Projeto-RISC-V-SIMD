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

ENTITY Forwarding_unit IS
  PORT (
    regwriteex,regwritemem    : IN  std_logic;
    pcra1, pcra2, pcradex, pcradmem       : IN  std_logic_vector(4 DOWNTO 0);
    fora,forb        : OUT std_logic_vector(1 DOWNTO 0) --00 register, 01 memory result, 10 alu result
    );
END Forwarding_unit;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Forwarding_unit IS

BEGIN

process(regwriteex, regwritemem, pcra1, pcra2, pcradex, pcradmem)
BEGIN
fora <= "00";
forb <= "00";
IF (regwritemem = '1' AND pcradmem /= "00000") THEN
	IF (pcra1 = pcradmem) THEN
		fora <= "01";
	END IF;
	IF (pcra2 = pcradmem AND pcradmem /= "00000") THEN
		forb <= "01";
	END IF;
END IF;
IF (regwriteex = '1') THEN
	IF (pcra1 = pcradex AND pcradex /=  "00000") THEN
		fora <= "10";
	END IF;
	IF (pcra2 = pcradex AND pcradex /= "00000") THEN
		forb <= "10";
	END IF;
END IF;
END PROCESS;
END TypeArchitecture;
