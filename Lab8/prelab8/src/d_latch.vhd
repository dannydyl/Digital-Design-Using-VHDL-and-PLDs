-------------------------------------------------------------------------------
--
-- Title       : d_latch
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\d_latch.vhd
-- Generated   : Tue Mar 26 14:45:16 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

----- d latch -------
library ieee;
use ieee.std_logic_1164.all;


entity d_latch is	 
	port(
	d : in std_logic;		-- data input					   	
	le_bar : in std_logic;	-- latch enable input
	ql	: out std_logic		--latch output
	);						
end d_latch;


architecture behavioral of d_latch is
begin
	latch: process (d, le_bar)
	begin
		if le_bar = '0' then
			ql <= d;	-- updates the output to the value of data(input)
		end if;
	end process;

end behavioral;	   
