library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity converter_xs3_bcd_tb is
end converter_xs3_bcd_tb;

architecture TB_ARCHITECTURE of converter_xs3_bcd_tb is
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal p, q, r, s : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal d, c, b, a : std_logic;
	
	-- time between application of input stimulus vectors
	
	constant period : time := 20ns;	
begin

	-- Unit Under Test port map
	UUT : entity converter_xs3_bcd
		port map (p => p, q => q, 	r => r, s => s,
			d => d, c => c, b => b, a => a
		);

	-- Add your stimulus here ...
	stimulus: process
	begin
		-- Loop to apply input vectors from "0000" to "1111"
		-- in a binary count sequence.
		for i in 0 to 15 loop
			(p, q, r, s) <= to_unsigned(i, 4);
			wait for period;
		end loop;
		std.env.finish;	--stop simulation
	end process;	

end tb_architecture;


