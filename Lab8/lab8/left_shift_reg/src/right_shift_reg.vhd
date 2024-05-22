-------------------------------------------------------------------------------
--
-- Title       : right_shift_reg
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\right_shift_reg.vhd
-- Generated   : Tue Mar 26 15:31:56 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity right_shift_reg is
  port (
    d          : in std_logic_vector(3 downto 0);  -- parallel input data
    load       : in std_logic;                     -- synchronous load parallel input
    en_shift   : in std_logic;                     -- enable shift if load is unasserted
    clk        : in std_logic;                     -- clk
    rst_bar    : in std_logic;                     -- asynchronous reset
    serial_out : out std_logic                     -- serial output
  );
end right_shift_reg;


architecture behavior of right_shift_reg is	   

begin		   
	reg : process (clk, rst_bar)   	
	variable memory : std_logic_vector(3 downto 0);
	begin				   
		if rst_bar = '0' then
			memory := "0000"; 
		elsif rising_edge(clk) then	 
			if load = '1' then
				memory := d;	
			elsif load = '0' and en_shift = '1' then	  
				memory := '0' & memory(3 downto 1);
			end if;		
		end if;
		serial_out <= memory(0);
	end process;		
	
   	

end behavior;
