-------------------------------------------------------------------------------
--
-- Title       : d_structural
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\d_latch.vhd
-- Generated   : Mon Mar 25 21:59:07 2024
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

------- top level entity -----
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity latch_vs_flip_flop is
  port (
    d   : in  std_logic;  -- data input
    clk : in  std_logic;  -- clock input
    ql  : out std_logic;  -- latch output
    qff : out std_logic   -- flip-flop output
  );
end latch_vs_flip_flop;

architecture structural of latch_vs_flip_flop is
begin
	u1 : entity d_latch port map (d => d, le_bar => clk, ql => ql);
	u2 : entity d_flip_flop port map (d => d, clk => clk, qff => qff);
end structural;
	


