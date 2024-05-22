-------------------------------------------------------------------------------
--
-- Title       : latched_3to8_decoder_tb
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : Z:\Desktop\SBU 2024 Spring\ESE 382\lab-backup\Lab8\prelab8\prelab8\src\latched_3to8_decoder_tb.vhd
-- Generated   : Sat Mar 30 16:39:02 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : testbench for latched 3 to 8 decoder
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity latched_3to8_decoder_tb is
end latched_3to8_decoder_tb;


architecture latched_3to8_decoder_tb of latched_3to8_decoder_tb is
   signal a      : std_logic_vector(2 downto 0);
   signal le_bar : std_logic;
   signal e1_bar : std_logic;
   signal e2     : std_logic;				  
   signal y		 : std_logic_vector(0 to 7);   	 
   
type test_vector is record
	le_bar : std_logic;		 
	e1_bar : std_logic;
    e2     : std_logic;
    a      : std_logic_vector(2 downto 0);				  
    y	   : std_logic_vector(0 to 7);   
end record;									   

type test_vectors is array (natural range <>) of test_vector;

constant test_table : test_vectors := (
  -- el_   e1_  e2     a       y
    ( '-', '1', '-', "---", "00000000"), -- When E1 is low, all outputs are low
    ( '-', '-', '0', "---", "00000000"), -- When E2 is low, all outputs are low
    -- Latch enabled and E1 is low, decoder is active
    ( '0', '0', '1', "000", "10000000"), -- Input A is 0, Y0 is high
    ( '0', '0', '1', "001", "01000000"), -- Input A is 1, Y1 is high
    ( '0', '0', '1', "010", "00100000"), -- Input A is 2, Y2 is high
    ( '0', '0', '1', "011", "00010000"), -- Input A is 3, Y3 is high
		( '1', '0', '1', "---", "--------"), -- When LE is high, outputs are stable 
    ( '0', '0', '1', "100", "00001000"), -- Input A is 4, Y4 is high
    ( '0', '0', '1', "101", "00000100"), -- Input A is 5, Y5 is high
    ( '0', '0', '1', "110", "00000010"), -- Input A is 6, Y6 is high
    ( '0', '0', '1', "111", "00000001") -- Input A is 7, Y7 is high 
);
   
begin	   
	UUT : entity latched_3to8_decoder port map (           
		  a => a,
          le_bar => le_bar,
          e1_bar => e1_bar,
          e2 => e2,
          y => y   
		  );
	tb : process		  
	variable memory : std_logic_vector(7 downto 0);
	begin				 
		
		for i in test_table'range loop
		    a <= test_table(i).a;
	        le_bar <= test_table(i).le_bar;
	        e1_bar <= test_table(i).e1_bar;
	        e2 <= test_table(i).e2;		  
			wait for 20ns;				  
			if le_bar = '1' and e1_bar = '0' and e2 = '1' then
				assert y = memory;
				report "Error at le_bar = '1' and e1_bar = '0' and e2 = '1'. Output should be stable"
				severity error;
			else						 
				memory := test_table(i).y;
				assert y = test_table(i).y
				report "Error at input a, le_bar, e1_bar, e2 : " & to_string(a) & to_string(le_bar) & to_string(e1_bar) & to_string(e2)
				severity error;		
			end if;
			
			
		end loop;
		std.env.finish;
	end process;


end latched_3to8_decoder_tb;
