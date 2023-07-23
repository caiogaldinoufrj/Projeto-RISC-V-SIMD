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

ENTITY ALU_ctrl IS
  PORT (
    func7      : IN  std_logic;
    func3        : IN  std_logic_vector(2 DOWNTO 0);
    aluop : IN std_logic_vector(1 DOWNTO 0);
    aluctrl        : OUT std_logic_vector(3 DOWNTO 0)
    );
END ALU_ctrl;

ARCHITECTURE TypeArchitecture OF ALU_ctrl IS
BEGIN

PROCESS (func7,func3,aluop)
BEGIN

IF (aluop = "00") THEN
	aluctrl <= "0010";
ELSIF (aluop = "01") THEN
	aluctrl <= "0110";
ELSIF (aluop = "10") THEN
	IF (func7 = '1') THEN
		aluctrl <= "0110";
	ELSIF (func7 = '0') THEN
		IF (func3 = "000") THEN
			aluctrl <= "0010";
		ELSIF (func3 = "111") THEN
			aluctrl <= "0000";
		ELSIF (func3 = "110") THEN
			aluctrl <= "0001";
		ELSIF (func3 = "001") THEN
			aluctrl <= "1000";
		ELSIF (func3 = "101") THEN
			aluctrl <= "1001";
		ELSIF (func3 = "100") THEN
			aluctrl <= "0111";
		END IF;
	END IF;
END IF;
END PROCESS;

END TypeArchitecture;
