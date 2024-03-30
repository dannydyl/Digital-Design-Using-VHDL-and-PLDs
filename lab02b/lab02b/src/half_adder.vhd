-------------------------------------------------------------------------------
--
-- Title       : half_adder
-- Design      : Lab01_half_adder
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : F:\ESE382-Lab\Lab1\Lab01_half_adder\Lab01_half_adder\src\half_adder.vhd
-- Generated   : Wed Jan 31 09:02:10 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_adder} architecture {dataflow}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	port (a, b : in std_logic;
	sum, carry_out: out std_logic);
	
	attribute loc : string;
	attribute loc of a : signal is "P3";
	attribute loc of b : signal is "P4";
	attribute loc of sum : signal is "P27";
	attribute loc of carry_out : signal is "P26";
	
end entity half_adder;

--}} End of automatically maintained section

architecture dataflow of half_adder is
begin

	sum <= (not a and b) or (a and not b);
	carry_out <= a and b;

end dataflow;
