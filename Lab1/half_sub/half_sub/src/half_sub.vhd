-------------------------------------------------------------------------------
--
-- Title       : half_sub
-- Design      : half_sub
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : F:\ESE382-Lab\Lab1\half_sub\half_sub\src\half_sub.vhd
-- Generated   : Wed Jan 31 09:30:28 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 						  6
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_sub} architecture {half_sub}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_sub is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 diff : out STD_LOGIC;
		 borrow : out STD_LOGIC
	     );
end half_sub;

--}} End of automatically maintained section

architecture dataflow of half_sub is
begin
	
	diff <= a xor b;
	borrow <= not a and b;
	 
end dataflow;
