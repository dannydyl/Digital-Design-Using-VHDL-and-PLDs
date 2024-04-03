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
-- Description : 
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
	

    type test_vector is record
        d : std_logic;
        c : std_logic;
        b : std_logic;
        a : std_logic;
        p : std_logic;
        q : std_logic;
        r : std_logic;
        s : std_logic;
    end record;

    type test_vector_array is array (natural range <>) of test_vector;  


    constant test_vectors : test_vector_array := (
    --    d,   c,   b,   a,   p,   q,   r,   s
        ('0', '0', '0', '0', '0', '0', '0', '0'),
        ('0', '0', '0', '1', '0', '1', '1', '1'),
        ('0', '0', '1', '0', '0', '1', '1', '0'),
        ('0', '0', '1', '1', '0', '1', '0', '1'),
        ('0', '1', '0', '0', '0', '1', '0', '0'),
        ('0', '1', '0', '1', '1', '0', '1', '1'),
        ('0', '1', '1', '0', '1', '0', '1', '0'),
        ('0', '1', '1', '1', '1', '0', '0', '1'),
        ('1', '0', '0', '0', '1', '0', '0', '0'),
        ('1', '0', '0', '1', '1', '1', '1', '1')
        );

	-- time between application of input stimulus vectors	
	--constant period : time := 20ns;
	
begin
	-- Unit Under Test port map
	UUT : entity bcd_to_84_2_1
	port map (
            p => p, q => q, r => r, s => s,
		    d => d, c => c, b => b, a => a
		);
	
	verify: process
	begin
    for i in test_vectors'range loop
        d <= test_vectors(i).d;
        c <= test_vectors(i).c;
        b <= test_vectors(i).b;
        a <= test_vectors(i).a;
        wait for 20 ns;
        assert (p = test_vectors(i).p) and (q = test_vectors(i).q) and (r = test_vectors(i).r) and (s = test_vectors(i).s)
        report "test vector " & integer'image(i)& " failed" & " for input d = " & std_logic'image(d) & " and c = " & std_logic'image(c) & " and b = " & std_logic'image(b) & " and a = " & std_logic'image(a) 
        severity error;
    end loop;
		
		--std.env.finish;	--stop simulation
	end process;	
	
end tb_architecture;
