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

ENTITY RegAdress_Validator IS
  PORT (

    ra1,ra2     : IN  std_logic_vector(4 DOWNTO 0);
    opcode        : IN  std_logic_vector(6 DOWNTO 0);
    ra1_o,ra2_o        : OUT std_logic_vector(4 DOWNTO 0)
    );
END RegAdress_Validator;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF RegAdress_Validator IS

BEGIN

PROCESS (ra1,ra2,opcode)
BEGIN 
IF (opcode = "0110011" OR opcode = "0100011" OR opcode = "1100011" OR opcode = "0110000" OR opcode = "0110001" OR opcode = "0110010") THEN --Há reg 2 e reg 1
	ra2_o <= ra2;
	ra1_o <= ra1;
ELSIF (opcode = "0000011" OR opcode = "0010011" OR opcode = "0010000" OR opcode = "0010001" OR opcode = "0010010") THEN --Só há reg 1
	ra2_o <= "00000";
	ra1_o <= ra1;
ELSE --Não há nenhum reg
	ra2_o <= "00000";
	ra1_o <= "00000";
END IF;

END PROCESS;
END TypeArchitecture;
