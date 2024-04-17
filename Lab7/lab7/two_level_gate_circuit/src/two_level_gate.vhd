-------------------------------------------------------------------------------
--
-- Title       : two_level_gate
-- Design      : two_level_gate_circuit
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab7\lab7\two_level_gate_circuit\src\two_level_gate.vhd
-- Generated   : Thu Mar 14 15:45:52 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :two level gate using two process  
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;



entity two_level_gate is  
	port(
	a, b, c: in std_logic;
	f : out std_logic
	);			 		
	attribute loc : string;
	attribute loc of enable  : signal is "P3";
	attribute loc of sigout  : signal is "P27";

end two_level_gate;

--}} End of automatically maintained section

architecture behavioral of two_level_gate is 
	signal s1 : std_logic;
begin
	u0 : process(a)
	begin
		s1 <= a and b;
	end process u0;
	
	u1 : process(s1, c)
	begin
		f <= s1 or c;
	end process u1;
	
	 

end behavioral;
