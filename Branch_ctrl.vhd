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

ENTITY Branch_ctrl IS
  PORT (
    aluzero : IN std_logic;
    branch : IN  std_logic_vector(1 DOWNTO 0);
    pcsrc        : OUT std_logic
    );
END Branch_ctrl;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF Branch_ctrl IS

BEGIN

PROCESS (branch,aluzero)
BEGIN
IF (branch = "00") THEN
	pcsrc <= '0';
ELSIF (branch = "11") THEN
	pcsrc <= '1';
ELSIF (branch = "01") THEN
	pcsrc <= aluzero;
ELSIF(branch = "10") THEN 
	pcsrc <= NOT(aluzero);
ELSE
	pcsrc <= '0';
END IF;
END PROCESS;
		

END TypeArchitecture;
