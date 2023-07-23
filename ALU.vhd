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
use ieee.numeric_std.all;

ENTITY ALU IS
  PORT (
    a,b      : IN  std_logic_vector(31 DOWNTO 0);
    op        : IN  std_logic_vector(3 DOWNTO 0);
    r_select, mode        : OUT std_logic;
    r,ae,be        : OUT std_logic_vector(31 DOWNTO 0);
    vec_size : IN std_logic_vector(1 DOWNTO 0)
    );
END ALU;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF ALU IS

SIGNAL b_i : integer;
SIGNAL b_2i : integer;
SIGNAL b_3i : integer;
SIGNAL b_4i : integer;
SIGNAL b_5i : integer;
SIGNAL b_6i : integer;
SIGNAL b_7i : integer;
SIGNAL b_8i : integer;
BEGIN

PROCESS(a,b,op,b_i,b_2i,b_3i,b_4i,b_5i,b_6i,b_7i,b_8i)
BEGIN
case op is
when "0000" => --AND
	r <= a AND b;
	r_select <= '0';
when "0001" => --OR
	r <= a OR b;
	r_select <= '0';
when "0111" => --XOR
	r <= a XOR b;
	r_select <= '0';
when "0010" => --Soma
	ae <= a;
	be <= b;
	r_select <= '1';
	mode <= '0';
when "0110" => --Sub
	ae <= a;
	be <= b;
	r_select <= '1';
	mode <= '1';
when "1000"=> --Shift Left
	
	if(vec_size = "10") then
	b_2i <= to_integer(unsigned(b(31 downto 16)));
	b_i <= to_integer(unsigned(b(15 downto 0)));
	r(31 downto 16) <= std_logic_vector(shift_left(unsigned(a(31 DOWNTO 16)), b_2i));
	r(15 downto 0) <= std_logic_vector(shift_left(unsigned(a(15 DOWNTO 0)), b_i));
	r_select <= '0';
     elsif(vec_size="01")then
     b_4i <= to_integer(unsigned(b(31 downto 24)));
	b_3i <= to_integer(unsigned(b(23 downto 16)));
	b_2i <= to_integer(unsigned(b(15 downto 8)));
	b_i <= to_integer(unsigned(b(7 downto 0)));
	
	r(31 downto 24) <= std_logic_vector(shift_left(unsigned(a(31 DOWNTO 24)), b_4i));
	r(23 downto 16) <= std_logic_vector(shift_left(unsigned(a(23 DOWNTO 16)), b_3i));
	r(15 downto 8)  <= std_logic_vector(shift_left(unsigned(a(15 DOWNTO 8)), b_2i));
	r(7 downto 0)   <= std_logic_vector(shift_left(unsigned(a(7 DOWNTO 0)), b_i));
	r_select <= '0';
	elsif(vec_size="00")then
	b_8i <= to_integer(unsigned(b(31 downto 28)));
	b_7i <= to_integer(unsigned(b(27 downto 24)));
	b_6i <= to_integer(unsigned(b(23 downto 20)));
	b_5i <= to_integer(unsigned(b(19 downto 16)));
	b_4i <= to_integer(unsigned(b(15 downto 12)));
	b_3i <= to_integer(unsigned(b(11 downto 8)));
	b_2i <= to_integer(unsigned(b(7 downto 4)));
	b_i <= to_integer(unsigned(b(3 downto 0)));
	
	r(31 downto 28) <= std_logic_vector(shift_left(unsigned(a(31 DOWNTO 28)), b_8i));
	r(27 downto 24) <= std_logic_vector(shift_left(unsigned(a(27 DOWNTO 24)), b_7i));
	r(23 downto 20)  <= std_logic_vector(shift_left(unsigned(a(23 DOWNTO 20)), b_6i));
	r(19 downto 16)   <= std_logic_vector(shift_left(unsigned(a(19 DOWNTO 16)), b_5i));
	r(15 downto 12) <= std_logic_vector(shift_left(unsigned(a(15 DOWNTO 12)), b_4i));
	r(11 downto 8) <= std_logic_vector(shift_left(unsigned(a(11 DOWNTO 8)), b_3i));
	r(7 downto 4)  <= std_logic_vector(shift_left(unsigned(a(7 DOWNTO 4)), b_2i));
	r(3 downto 0)   <= std_logic_vector(shift_left(unsigned(a(3 DOWNTO 0)), b_i));
	r_select <= '0';
	else
	b_i <= to_integer(unsigned(b));
	r <= std_logic_vector(shift_left(unsigned(a), b_i));
	r_select <= '0';
	end if;
	
when "1001"=> --Shift Right
	
	if(vec_size = "10") then
	b_2i <= to_integer(unsigned(b(31 downto 16)));
	b_i <= to_integer(unsigned(b(15 downto 0)));
	r(31 downto 16) <= std_logic_vector(shift_right(unsigned(a(31 DOWNTO 16)), b_2i));
	r(15 downto 0) <= std_logic_vector(shift_right(unsigned(a(15 DOWNTO 0)), b_i));
	r_select <= '0';
     elsif(vec_size="01")then
     b_4i <= to_integer(unsigned(b(31 downto 24)));
	b_3i <= to_integer(unsigned(b(23 downto 16)));
	b_2i <= to_integer(unsigned(b(15 downto 8)));
	b_i <= to_integer(unsigned(b(7 downto 0)));
	
	r(31 downto 24) <= std_logic_vector(shift_right(unsigned(a(31 DOWNTO 24)), b_4i));
	r(23 downto 16) <= std_logic_vector(shift_right(unsigned(a(23 DOWNTO 16)), b_3i));
	r(15 downto 8)  <= std_logic_vector(shift_right(unsigned(a(15 DOWNTO 8)), b_2i));
	r(7 downto 0)   <= std_logic_vector(shift_right(unsigned(a(7 DOWNTO 0)), b_i));
	r_select <= '0';
	elsif(vec_size="00")then
	b_8i <= to_integer(unsigned(b(31 downto 28)));
	b_7i <= to_integer(unsigned(b(27 downto 24)));
	b_6i <= to_integer(unsigned(b(23 downto 20)));
	b_5i <= to_integer(unsigned(b(19 downto 16)));
	b_4i <= to_integer(unsigned(b(15 downto 12)));
	b_3i <= to_integer(unsigned(b(11 downto 8)));
	b_2i <= to_integer(unsigned(b(7 downto 4)));
	b_i <= to_integer(unsigned(b(3 downto 0)));
	
	r(31 downto 28) <= std_logic_vector(shift_right(unsigned(a(31 DOWNTO 28)), b_8i));
	r(27 downto 24) <= std_logic_vector(shift_right(unsigned(a(27 DOWNTO 24)), b_7i));
	r(23 downto 20)  <= std_logic_vector(shift_right(unsigned(a(23 DOWNTO 20)), b_6i));
	r(19 downto 16)   <= std_logic_vector(shift_right(unsigned(a(19 DOWNTO 16)), b_5i));
	r(15 downto 12) <= std_logic_vector(shift_right(unsigned(a(15 DOWNTO 12)), b_4i));
	r(11 downto 8) <= std_logic_vector(shift_right(unsigned(a(11 DOWNTO 8)), b_3i));
	r(7 downto 4)  <= std_logic_vector(shift_right(unsigned(a(7 DOWNTO 4)), b_2i));
	r(3 downto 0)   <= std_logic_vector(shift_right(unsigned(a(3 DOWNTO 0)), b_i));
	r_select <= '0';
	else
	b_i <= to_integer(unsigned(b));
	r <= std_logic_vector(shift_right(unsigned(a), b_i));
	r_select <= '0';
	end if;


when others =>
	ae <= a;
	be <= b;
	r_select <= '1';
	mode <= '1';
END case;
END PROCESS;
END TypeArchitecture;

