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
USE ieee.numeric_std.all;

ENTITY Imm_gen IS
  PORT (
    instruc        : IN  std_logic_vector(31 DOWNTO 0);
    imm            : OUT std_logic_vector(31 DOWNTO 0)
    );
END Imm_gen;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF Imm_gen IS
SIGNAL opcode : std_logic_vector (6 DOWNTO 0)
;
SIGNAL temp_imm: std_logic_vector (31 DOWNTO 0);
BEGIN
process(opcode,instruc,temp_imm)
begin
opcode (6 DOWNTO 0) <= instruc(6 DOWNTO 0);
temp_imm <= (others => '0');
IF (opcode = "0000011" OR opcode = "0010011" OR opcode = "0010000" OR opcode = "0010001" OR opcode = "0010010") THEN --Tipo I
	temp_imm (11 DOWNTO 0) <= instruc (31 DOWNTO 20);
	temp_imm (31 DOWNTO 12) <= (31 DOWNTO 12 => instruc(31));
ELSIF (opcode = "0100011") THEN --Tipo S
	temp_imm (11 DOWNTO 5) <= instruc (31 DOWNTO 25);
	temp_imm (4 DOWNTO 0) <= instruc (11 DOWNTO 7);
	temp_imm (31 DOWNTO 12) <= (31 DOWNTO 12 => instruc(31));

ELSIF (opcode = "1100011") THEN --Tipo SB
	temp_imm (12) <= instruc(31);
	temp_imm (11) <= instruc(7);
	temp_imm (10 DOWNTO 5) <= instruc (30 DOWNTO 25);
	temp_imm (4 DOWNTO 1) <= instruc (11 DOWNTO 8);
	temp_imm (31 DOWNTO 13) <= (31 DOWNTO 13 => instruc(31));
ELSIF(opcode = "0110111" OR opcode = "0010111") THEN --Tipo U
	temp_imm (31 DOWNTO 12) <= instruc(31 DOWNTO 12);
ELSIF(opcode = "1101111" OR opcode = "0010100" OR opcode = "0010101" OR opcode = "0010110") THEN --Tipo UJ
	temp_imm(20) <= instruc(31);
	temp_imm(10 DOWNTO 1) <= instruc(30 DOWNTO 21);
	temp_imm(11) <= instruc(20);
	temp_imm(19 DOWNTO 12) <= instruc(19 DOWNTO 12);
	temp_imm(31 DOWNTO 21) <= (31 DOWNTO 21 => instruc(31));
ELSE
	temp_imm(31 DOWNTO 0) <= "11111111111111111111111111111111";
END IF;
imm  <= temp_imm;
END process;
imm <= temp_imm;
END Behavioral;
