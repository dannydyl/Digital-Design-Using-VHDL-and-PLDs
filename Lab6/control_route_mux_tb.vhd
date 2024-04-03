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
-- Description : testbench for control_route_mux without self checking
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
    -- Instantiate the tested entity
	UUT : entity data_selector
	port map (
            gn => gn, an =>an, a2 => a2, a1 => a1, b2 => b2, b1 => b1, y2 => y2, y1 => y1
		);
    
    -- Stimulus process
    verify : process		 
    begin
        for i in 0 to 2**6 - 1 loop -- 2^6 = 64 
            (gn, an, a2, a1, b2, b1) <= std_logic_vector(to_unsigned(i, 6)); 
            wait for 10 ns;
            
        end loop;	
		std.env.finish;
    end process verify;

end tb_architecture;
