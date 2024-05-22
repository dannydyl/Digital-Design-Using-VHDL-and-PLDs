-------------------------------------------------------------------------------
--
-- Title       : dff_en
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\dff_en.vhd
-- Generated   : Tue Mar 26 14:56:15 2024
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

entity dff_en is
  port (
    d       : in  std_logic;  -- data input
    clk     : in  std_logic;  -- clock input
    en      : in  std_logic;  -- enable input
    rst_bar : in  std_logic;  -- asynchronous reset
    q       : out std_logic   -- output
  );
end dff_en;

architecture behavioral of dff_en is
begin
	flipflop : process (clk, rst_bar)
	begin
		if rst_bar = '0' then
			q <= '0';			
		elsif rising_edge(clk) then	 
			if en = '1' then
				q <= d;		 
			end if;
			
		end if;
	end process;
end behavioral;
		

