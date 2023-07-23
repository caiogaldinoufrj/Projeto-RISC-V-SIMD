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

ENTITY EX_MEM IS
  PORT (

    clock      : IN  std_logic;
    branch_res, alu_res, rd2        : IN  std_logic_vector(31 DOWNTO 0);
    rw : IN std_logic_vector(4 DOWNTO 0);
    regwrite, memread, memwrite, memtoreg, zero : IN std_logic;
    branch : IN std_logic_vector(1 DOWNTO 0);
    flush : IN std_logic;
    branch_res_o, alu_res_o, rd2_o        : OUT  std_logic_vector(31 DOWNTO 0);
    rw_o : OUT std_logic_vector(4 DOWNTO 0);
    regwrite_o, memread_o, memwrite_o, memtoreg_o, zero_o : OUT std_logic;
    branch_o : OUT std_logic_vector(1 DOWNTO 0)
    );
END EX_MEM;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF EX_MEM IS

SIGNAL branch_res_mem, alu_res_mem, rd2_mem : std_logic_vector(31 DOWNTO 0);
SIGNAL rw_mem : std_logic_vector(4 DOWNTO 0);
SIGNAL regwrite_mem, memread_mem, memwrite_mem, memtoreg_mem, zero_mem : std_logic;
Signal branch_mem : std_logic_vector(1 DOWNTO 0);
BEGIN

PROCESS(clock, branch_res, alu_res, zero, rd2, rw, regwrite, memread, memwrite, memtoreg, branch,flush)
BEGIN
	IF (rising_edge(clock)) THEN
		branch_res_mem <= branch_res;
		alu_res_mem <= alu_res;
		zero_mem <= zero;
		rd2_mem <= rd2;
		rw_mem <= rw;
		regwrite_mem <= regwrite;
		memread_mem <= memread;
		memwrite_mem <= memwrite;
		memtoreg_mem <= memtoreg;
		branch_mem <= branch;
	END IF;
	IF(falling_edge(clock)) THEN 
		IF (flush = '1') THEN
			branch_res_o <= branch_res;
			alu_res_o <= alu_res;
			zero_o <= zero;
			rd2_o <= rd2;
			rw_o <= rw;
			regwrite_o <= '0';
			memread_o <= '0';
			memwrite_o <= '0';
			memtoreg_o <= '0';
			branch_o <= "00";
		ELSE
			branch_res_o <= branch_res_mem;
			alu_res_o <= alu_res_mem;
			zero_o <= zero_mem;
			rw_o <= rw_mem;
			regwrite_o <= regwrite_mem;
			memread_o <= memread_mem;
			memwrite_o <= memwrite_mem;
			memtoreg_o <= memtoreg_mem;
			branch_o <= branch_mem;
			IF (rd2_mem = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") THEN
				rd2_o <= "00000000000000000000000000000000";
			ELSE
				rd2_o <= rd2_mem;
			END IF;
		END IF;

	END IF;
END PROCESS;
END TypeArchitecture;

