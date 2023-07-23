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

ENTITY Hazard_unit IS
  PORT (
    idexmemread      : IN  std_logic;
    rwa, rda1, rda2 : IN std_logic_vector(4 DOWNTO 0);
    branch : IN std_logic;
    pcwrite, ifidwrite, nop, flush : OUT std_logic
    );
END Hazard_unit;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Hazard_unit IS

BEGIN

process (idexmemread, rwa, rda1, rda2,branch)
BEGIN
IF (idexmemread = '1') THEN
	IF (rwa = rda1 OR rwa = rda2) THEN
		pcwrite <= '0';
		ifidwrite <= '0';
		nop <= '1';
	ELSE
		pcwrite <= '1';
		ifidwrite <= '1';
		nop <= '0';
	END IF;
ELSE
	pcwrite <= '1';
	ifidwrite <= '1';
	nop <= '0';

END IF;
IF (branch = '1') THEN
	flush <= '1';
ELSE
	flush <= '0';
END IF;
END PROCESS;
END TypeArchitecture;
