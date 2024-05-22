-------------------------------------------------------------------------------
--
-- Title       : d_flip_flop
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\d_flip_flop.vhd
-- Generated   : Mon Mar 25 22:08:18 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-------- flip flop ----
library ieee;
use ieee.std_logic_1164.all;



entity d_flip_flop is
	port(
		d : in std_logic;
		clk : in std_logic;
		qff : out std_logic
	);				   
end d_flip_flop;


architecture behavioral of d_flip_flop is
begin 
	flipflop: process (clk)
	begin
		if clk'event and clk = '1' then
			qff <= d;
		end if;
	end process;

end behavioral;			