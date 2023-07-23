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

ENTITY Control IS
  PORT (
    opcode        : IN  std_logic_vector(6 DOWNTO 0);
    nop : IN std_logic;
    func3 : IN std_logic_vector(2 DOWNTO 0);
    regwrite, alusrc, memread, memwrite, memtoreg, lui : OUT std_logic;
    aluop,branch       : OUT std_logic_vector(1 DOWNTO 0);
    jalr, auipc : OUT std_logic
    
    );
END Control;

ARCHITECTURE TypeArchitecture OF Control IS
BEGIN

PROCESS(opcode, nop)
BEGIN
IF (nop = '1') THEN
	aluop <= "00";
	regwrite <= '0';
	alusrc <= '0';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
ELSE
case opcode is
when "0110011"|"0110000"|"0110001"|"0110010" => --Tipo R
	aluop <= "10";
	regwrite <= '1';
	alusrc <= '0';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
when "0010011"|"0010000"|"0010001"|"0010010" => --Tipo I
	aluop <= "10";
	regwrite <= '1';
	alusrc <= '1';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
when "1100011" => --bne e beq
	aluop <= "01";
	regwrite <= '0';
	alusrc <= '0';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
	IF (func3 = "000") THEN --beq
		branch <= "01";
	ELSIF (func3 = "001") THEN --bne
		branch <= "10";
	END IF;
when "1101111" => --jal
	aluop <= "01";
	regwrite <= '1';
	alusrc <= '0';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "11";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';

when "1100111" => --jalr
	aluop <= "01";
	regwrite <= '1';
	alusrc <= '0';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "11";
	lui <= '0';
	jalr <= '1';
	auipc <= '0';

when "0000011" => --lw
	aluop <= "00";
	regwrite <= '1';
	alusrc <= '1';
	memread <= '1';
	memwrite <= '0';
	memtoreg <= '1';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
when "0100011" =>--sw
	aluop <= "00";
	regwrite <= '0';
	alusrc <= '1';
	memread <= '0';
	memwrite <= '1';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
when "0110111" => --lui
	aluop <= "00";
	regwrite <= '1';
	alusrc <= '1';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '1';
	jalr <= '0';
	auipc <= '0';
when "0010111"|"0010100"|"0010101"|"0010110" =>--auipc
	aluop <= "00";
	regwrite <= '1';
	alusrc <= '1';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '1';
when others =>
	aluop <= "00";
	regwrite <= '0';
	alusrc <= '1';
	memread <= '0';
	memwrite <= '0';
	memtoreg <= '0';
	branch <= "00";
	lui <= '0';
	jalr <= '0';
	auipc <= '0';
END case;
END IF;
END PROCESS;
END TypeArchitecture;
