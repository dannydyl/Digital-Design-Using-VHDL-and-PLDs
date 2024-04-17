-------------------------------------------------------------------------------
--
-- Title       : two_level_gate_tb
-- Design      : two_level_gate_circuit
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab7\lab7\two_level_gate_circuit\src\two_level_gate_tb.vhd
-- Generated   : Thu Mar 14 15:52:39 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : testbench for two level gates, using record. 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;



entity two_level_gate_tb is
end two_level_gate_tb;


architecture testbench of two_level_gate_tb is
	-- stimulus signals
	signal a, b, c : std_logic;			  
	-- observed signals
	signal s1, f : std_logic;		
	
	type test_vector is record
		a, b, c, s1, f : std_logic;
	end record;
	
	type test_vector_array is array (natural range <>) of test_vector;
	
	constant test_vectors : test_vector_array := (
	--    a	   b	c	 s1	  f
		('0', '0', '0', '0', '0'),
		('0', '0', '1', '0', '1'),
		('0', '1', '0', '0', '0'),
		('0', '1', '1', '0', '1'),
		('1', '0', '0', '0', '0'),
		('1', '0', '1', '0', '1'),
		('1', '1', '0', '1', '1'),
		('1', '1', '1', '1', '1')
		);
		
	
	
begin
	UUT : entity two_level_gate
		port map (
			a => a, b => b, c => c, f => f
		);					
		
	verify : process
	begin
		for i in test_vectors'range loop
			a <= test_vectors(i).a;
			b <= test_vectors(i).b;
			c <= test_vectors(i).c;
			s1 <= test_vectors(i).s1;
			f <= test_vectors(i).f;
			wait for 20ns;
			assert (a = test_vectors(i).a) and (b = test_vectors(i).b) and (c = test_vectors(i).c) and (s1 = test_vectors(i).s1) and (f = test_vectors(i).f)
			report "test_vector " & integer'image(i) & "failed" & " for input a = " & std_logic'image(a) & " b = " & std_logic'image(b) & " c = " & std_logic'image(c)
			severity error;
		end loop;
		
		std.env.finish;
		end process;
				
	
	

end testbench;
