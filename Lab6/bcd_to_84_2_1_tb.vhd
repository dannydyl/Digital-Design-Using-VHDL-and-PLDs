-------------------------------------------------------------------------------
--
-- Title       : bcd_to_84_2_1 testbench
-- Design      : 
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
-- Description : testbench for bcd_to_84_2_1 using truth table with single process testbench
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.all;

entity bcd_to_84_2_1_tb is
end bcd_to_84_2_1_tb;

architecture tb_architecture of bcd_to_84_2_1_tb is
	
	-- Stimulus signals - signals mapped to the inputs of tested entity
    signal d, c, b, a : std_logic;
	-- Observed signals - signals mapped to the outputs of tested entity
	signal p, q, r, s : std_logic;

begin
	-- Unit Under Test port map
	UUT : entity bcd_to_84_2_1
	port map (
            p => p, q => q, r => r, s => s,
		    d => d, c => c, b => b, a => a
		);
	
	verify : process
    constant period : time := 20 ns;

    begin

        d <= '0';
        c <= '0';
        b <= '0';
        a <= '0';
        wait for period;
        assert (p = '0' and q = '0' and r = '0' and s = '0') 
        report "Test failed for input combination 0000" 
        severity error;
       
        d <= '0';
        c <= '0';
        b <= '0';
        a <= '1';
        wait for period;
        assert (p = '0' and q = '1' and r = '1' and s = '1')
        report "Test failed for input combination 0001"
        severity error;

        d <= '0';   
        c <= '0';
        b <= '1';
        a <= '0';
        wait for period;
        assert (p = '0' and q = '1' and r = '1' and s = '0')
        report "Test failed for input combination 0010"
        severity error;

        d <= '0';
        c <= '0';
        b <= '1';
        a <= '1';
        wait for period;
        assert (p = '0' and q = '1' and r = '0' and s = '1')
        report "Test failed for input combination 0011"
        severity error;

        d <= '0';
        c <= '1';
        b <= '0';
        a <= '0';
        wait for period;
        assert (p = '0' and q = '1' and r = '0' and s = '0')
        report "Test failed for input combination 0100"
        severity error;

        d <= '0';
        c <= '1';
        b <= '0';
        a <= '1';
        wait for period;
        assert (p = '1' and q = '0' and r = '1' and s = '1')
        report "Test failed for input combination 0101"
        severity error;

        d <= '0';
        c <= '1';
        b <= '1';
        a <= '0';
        wait for period;
        assert (p = '1' and q = '0' and r = '1' and s = '0')
        report "Test failed for input combination 0110"
        severity error;

        d <= '0';
        c <= '1';
        b <= '1';
        a <= '1';
        wait for period;
        assert (p = '1' and q = '0' and r = '0' and s = '1')
        report "Test failed for input combination 0111"
        severity error;

        d <= '1';
        c <= '0';
        b <= '0';
        a <= '0';
        wait for period;
        assert (p = '1' and q = '0' and r = '0' and s = '0')
        report "Test failed for input combination 1000"
        severity error;

        d <= '1';
        c <= '0';
        b <= '0';
        a <= '1';
        wait for period;
        assert (p = '1' and q = '1' and r = '1' and s = '1')
        report "Test failed for input combination 1001"
        severity error;

    end process verify;    
end tb_architecture;
