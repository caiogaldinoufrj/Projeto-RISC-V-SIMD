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

ENTITY MEM_WB IS
  PORT (

    clock      : IN  std_logic;
    rdm, alu_res        : IN  std_logic_vector(31 DOWNTO 0);
    regwrite, memtoreg : IN std_logic;
    rw : IN std_logic_vector (4 DOWNTO 0);
    rdm_o, alu_res_o: OUT std_logic_vector (31 DOWNTO 0);
    regwrite_o, memtoreg_o : OUT std_logic;
    rw_o : OUT std_logic_vector (4 DOWNTO 0)
    
    );
END MEM_WB;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF MEM_WB IS

SIGNAL rdm_mem, alu_res_mem : std_logic_vector(31 DOWNTO 0);
SIGNAL regwrite_mem, memtoreg_mem : std_logic;
SIGNAL rw_mem : std_logic_vector (4 DOWNTO 0);
BEGIN

PROCESS (rdm, alu_res, regwrite, memtoreg, rw,clock)
BEGIN
IF (rising_edge(clock)) THEN 
	rdm_mem <= rdm;
	alu_res_mem <= alu_res;
	regwrite_mem <= regwrite;
	memtoreg_mem <= memtoreg;
	rw_mem <= rw;
END IF;
IF (falling_edge(clock)) THEN 
	rdm_o <= rdm_mem;
	alu_res_o <= alu_res_mem;
	regwrite_o <= regwrite_mem;
	memtoreg_o <= memtoreg_mem;
	rw_o <= rw_mem;

END IF;
END PROCESS;
END TypeArchitecture;
