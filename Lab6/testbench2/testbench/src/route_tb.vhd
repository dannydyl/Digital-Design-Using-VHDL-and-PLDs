-------------------------------------------------------------------------------
--
-- Title       : route_tb
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
-- Description : 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.all;

entity route_tb is
end route_tb;

architecture tb_architecture of route_tb is
	
	-- Stimulus signals - signals mapped to the inputs of tested entity
    signal a, ae, b, be: std_logic;
	-- Observed signals - signals mapped to the outputs of tested entity
	signal y : std_logic;
	

    type test_vector is record
        a : std_logic;
        ae : std_logic;
        b : std_logic;
        be : std_logic;
        y : std_logic;

    end record;

    type test_vector_array is array (natural range <>) of test_vector;  


    constant test_vectors : test_vector_array := (
    --    a,   ae,  b,   be,  y
        ('0', '0', '0', '0', '1'),
        ('0', '0', '0', '1', '1'),
        ('0', '0', '1', '0', '1'),
        ('0', '0', '1', '1', '0'),
        ('0', '1', '0', '0', '1'),
        ('0', '1', '0', '1', '1'),
        ('0', '1', '1', '0', '1'),
        ('0', '1', '1', '1', '0'),
        ('1', '0', '0', '0', '1'),
        ('1', '0', '0', '1', '1'),
        ('1', '0', '1', '0', '1'),
        ('1', '0', '1', '1', '0'),
        ('1', '1', '0', '0', '0'),
        ('1', '1', '0', '1', '0'),
        ('1', '1', '1', '0', '0'),
        ('1', '1', '1', '1', '0')
    );

	-- time between application of input stimulus vectors	
	--constant period : time := 20ns;
	 
begin
	-- Unit Under Test port map
	UUT : entity route
	port map (
            a => a, ae => ae, b => b, be => be, y => y
		);
	
	verify: process
	begin
    for i in test_vectors'range loop
        a <= test_vectors(i).a;
        ae <= test_vectors(i).ae;
        b <= test_vectors(i).b;
        be <= test_vectors(i).be;
        wait for 20 ns;
        assert (a = test_vectors(i).a) and (ae = test_vectors(i).ae) and (b = test_vectors(i).b) and (be = test_vectors(i).be)
        report "test vector " & integer'image(i)& " failed" & " for input a = " & std_logic'image(a) & " and ae = " & std_logic'image(ae) & " and b = " & std_logic'image(b) & " and be = " & std_logic'image(be)
        severity error;
    end loop;
		
		--std.env.finish;	--stop simulation
	end process;	
	
end tb_architecture;
