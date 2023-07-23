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

ENTITY ID_EX IS
  PORT (
    clock      : IN  std_logic;
    imm,rd1,rd2,pc        : IN  std_logic_vector(31 DOWNTO 0);
    func3: IN std_logic_vector (2 DOWNTO 0);
    rw: IN std_logic_vector(4 DOWNTO 0);
    regwrite, alusrc, memread, memwrite, memtoreg, lui : IN std_logic;
    aluop,branch       : IN std_logic_vector(1 DOWNTO 0);
    func7 : IN std_logic;
    ra1,ra2 : IN std_logic_vector (4 DOWNTO 0);
    flush : IN std_logic;
    vec_size : IN std_logic_vector (1 DOWNTO 0);
    pcnext : IN std_logic_vector (31 DOWNTO 0);
    imm_o,rd1_o,rd2_o,pc_o        : OUT  std_logic_vector(31 DOWNTO 0);
    func3_o: OUT std_logic_vector (2 DOWNTO 0);
    rw_o: OUT std_logic_vector(4 DOWNTO 0);
    regwrite_o, alusrc_o, memread_o, memwrite_o, memtoreg_o, lui_o : OUT std_logic;
    aluop_o,branch_o       : OUT std_logic_vector(1 DOWNTO 0);
    func7_o : OUT std_logic;
    ra1_o, ra2_o : OUT std_logic_vector (4 DOWNTO 0);
    vec_size_o : OUT std_logic_vector (1 DOWNTO 0);
    pcnext_o : OUT std_logic_vector (31 DOWNTO 0)
    );
END ID_EX;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF ID_EX IS

SIGNAL imm_mem,rd1_mem,rd2_mem,pc_mem, pcnext_mem : std_logic_vector (31 DOWNTO 0);
SIGNAL func3_mem : std_logic_vector (2 DOWNTO 0);
SIGNAL rw_mem : std_logic_vector (4 DOWNTO 0);
SIGNAL regwrite_mem, alusrc_mem, memread_mem, memwrite_mem, memtoreg_mem, lui_mem, func7_mem :std_logic;
SIGNAL aluop_mem, branch_mem : std_logic_vector(1 DOWNTO 0);
SIGNAL ra1_mem, ra2_mem : std_logic_vector(4 DOWNTO 0);
SIGNAL vec_size_mem : std_logic_vector (1 DOWNTO 0);
BEGIN

PROCESS(clock, imm, rd1, rd2, pc, func3, rw, regwrite, alusrc, memread, memwrite, memtoreg, lui, aluop, branch, func7,flush, vec_size)
BEGIN
IF (rising_edge(clock)) THEN
	imm_mem <= imm;
	rd1_mem <= rd1;
	rd2_mem <= rd2;
	pc_mem <= pc;
	func3_mem <= func3;
	rw_mem <= rw;
	regwrite_mem <= regwrite;
	alusrc_mem <= alusrc;
	memread_mem <= memread;
	memwrite_mem <= memwrite;
	memtoreg_mem <= memtoreg;
	lui_mem <= lui;
	aluop_mem <= aluop;
	branch_mem <= branch;
	func7_mem <= func7;
	ra1_mem <= ra1;
	ra2_mem <= ra2;
	vec_size_mem <= vec_size;
	pcnext_mem <= pcnext;
END IF;
IF(falling_edge(clock)) THEN
	IF (flush = '1') THEN
		imm_o <= imm;
		rd1_o <= rd1;
		rd2_o <= rd2;
		pc_o <= pc;
		func3_o <= func3;
		rw_o <= rw;
		regwrite_o <= '0';
		alusrc_o <= '0';
		memread_o <= '0';
		memwrite_o <= '0';
		memtoreg_o <= '0';
		lui_o <= '0';
		aluop_o <= "00";
		branch_o <= "00";
		func7_o <= func7;
		ra1_o <= ra1;
		ra2_o <= ra2;
		vec_size_o <= vec_size;
		pcnext_o <= pcnext;
	ELSE
			imm_o <= imm_mem;
			rd1_o <= rd1_mem;
			rd2_o <= rd2_mem;
			pc_o <= pc_mem;
			func3_o <= func3_mem;
			rw_o <= rw_mem;
			regwrite_o <= regwrite_mem;
			alusrc_o <= alusrc_mem;
			memread_o <= memread_mem;
			memwrite_o <= memwrite_mem;
			memtoreg_o <= memtoreg_mem;
			lui_o <= lui_mem;
			aluop_o <= aluop_mem;
			branch_o <= branch_mem;
			func7_o <= func7_mem;
			ra1_o <= ra1_mem;
			ra2_o <= ra2_mem;
			vec_size_o <= vec_size_mem;
			pcnext_o <= pcnext_mem;
	END IF;
END IF;
END PROCESS;

END TypeArchitecture;

