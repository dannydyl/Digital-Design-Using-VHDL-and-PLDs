-- Ken Short 021824
-- Self-checking testbench for XS3 to BCD Decoder
-- This testbench works for functional and timing simulations
-- For functional simulations, block comment out loops l1 and l3

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity converter_xs3_bcd_tb is
end converter_xs3_bcd_tb;

architecture tb_architecture of converter_xs3_bcd_tb is
	
	-- Stimulus signals - signals mapped to the inputs of tested entity
	signal p, q, r, s : std_logic;
	-- Observed signals - signals mapped to the outputs of tested entity
	signal d, c, b, a : std_logic;
	
	-- time between application of input stimulus vectors	
	constant period : time := 20ns;
	
begin
	
	-- Unit Under Test port map
	UUT : entity converter_xs3_bcd
	port map (p => p, q => q, 	r => r, s => s,
		d => d, c => c, b => b, a => a
		);
	
	stimulus: process
	begin
		-- Loops to apply input vectors from "0000" to "1111"
		
		-- Block comment out loop l1 for timing simulation
		l1: for i in 0 to 2 loop
			(p, q, r, s) <= to_unsigned(i, 4);
			wait for period;
			assert (std_logic_vector'(d,c,b,a) = "----")
			report "Error for input " & to_string((p, q, r, s)) & "."
			severity error;
		end loop;
		
		-- Keep loop l2 for all simulations	
		l2: for i in 3 to 12 loop
			(p, q, r, s) <= to_unsigned(i, 4);
			wait for period;
			assert ((to_integer(unsigned'(p,q,r,s))) - 3) = (to_integer(unsigned'(d,c,b,a)))
			report "Error for input " & to_string((p, q, r, s)) & "."
			severity error;
		end loop;
		
		-- Block comment out loop l3 for timing simulation
		l3: for i in 13 to 15 loop
			(p, q, r, s) <= to_unsigned(i, 4);
			wait for period;
			assert (std_logic_vector'(d,c,b,a) = "----")
			report "Error for input " & to_string((p, q, r, s)) & "."
			severity error;
		end loop;		
		
		std.env.finish;	--stop simulation
	end process;	
	
end tb_architecture;


