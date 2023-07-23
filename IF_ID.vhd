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

ENTITY IF_ID IS
  PORT (
  ------------------------------------------------------------------------------
    pc, instruc        : IN  std_logic_vector(31 DOWNTO 0);
    clock, write_e              : IN std_logic;
    flush : IN std_logic;
    pcnext : IN std_logic_vector(31 DOWNTO 0);
    pc_o, instruc_o    : OUT std_logic_vector (31 DOWNTO 0);
    flush_next : OUT std_logic;
    pcnext_o : OUT std_logic_vector(31 DOWNTO 0));
END IF_ID;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF IF_ID IS

SIGNAL pc_mem,instruc_mem, pcnext_mem : std_logic_vector(31 DOWNTO 0);
BEGIN
PROCESS (clock,pc,instruc, flush, pcnext)
BEGIN
IF (write_e = '1') THEN
	IF (rising_edge(clock)) THEN
		pc_mem <= pc;
		instruc_mem <= instruc;
		pcnext_mem <= pcnext;
	END IF;
	IF (falling_edge(clock)) THEN
		IF (flush = '1') THEN 
			flush_next <= '1';
		ELSE
			flush_next <= '0';
			pc_o <= pc_mem;
			instruc_o <= instruc_mem;
			pcnext_o <= pcnext_mem;
		END IF;
	END IF;
END IF;

END PROCESS;
END TypeArchitecture;

