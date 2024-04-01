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
	signal pqrs : std_logic_vector(3 downto 0);
	-- Observed signals - signals mapped to the outputs of tested entity
	signal dcba : std_logic_vector(3 downto 0);
	
	-- time between application of input stimulus vectors	
	constant period : time := 20ns;
	
begin
	
	-- Unit Under Test port map
	UUT : entity work.converter_xs3_bcd -- Ensure this is the correct entity name
    port map (
        pqrs => pqrs,
        dcba => dcba
    );	
	stimulus: process
	begin
		-- Loops to apply input vectors from "0000" to "1111"
		
		-- Keep loop l2 for all simulations	
		l2: for i in 3 to 12 loop
			pqrs <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			assert (to_integer(unsigned(dcba)) = i - 3);
			--report "Error for input " & to_string((p, q, r, s)) & "."
			--severity error;
		end loop;
		
		std.env.finish;	--stop simulation
	end process;	
	
end tb_architecture;


