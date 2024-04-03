-------------------------------------------------------------------------------
--
-- Title       : control_route_mux_tb
-- Design      : testbench
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : \\Mac\Home\Documents\Aldec_Codes\test\test\src\test.vhd
-- Generated   : 2024-03-04  15:00:00
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : for loop 0 to all 1
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.all;

entity control_route_mux_tb is
end control_route_mux_tb;

architecture tb_architecture of control_route_mux_tb is
	
    -- Stimulus signals - signals mapped to the inputs of tested entity
    signal a2, a1, b2, b1, gn, an: std_logic;
	-- Observed signals - signals mapped to the outputs of tested entity
	signal y2, y1 : std_logic;

begin
    verify : process
    begin
        for i in 0 to 2**6 - 1 loop
            (a2, a1, b2, b1, gn, an) <= std_logic_vector(to_unsigned((i, 6)));
            wait for 10 ns;
            
        end loop;
        wait;
    end process verify;
	std.env.finish;
end tb_architecture;
