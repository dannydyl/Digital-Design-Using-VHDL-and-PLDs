-------------------------------------------------------------------------------
--
-- Title       : \3_to_8_decoder\
-- Design      : prelab8
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : X:\ESE382-Lab\Lab8\prelab8\prelab8\src\3_to_8_decoder.vhd
-- Generated   : Tue Mar 26 16:29:37 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-------------input latch ------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity input_latch is
	port(
	a : in std_logic_vector(2 downto 0);
	le_bar : in std_logic;
	a_lat : out std_logic_vector(2 downto 0)
	);
end input_latch;

architecture behavioral of input_latch is
begin
	latch: process (a, le_bar)
	begin
		if le_bar = '0' then
			a_lat <= a;	-- updates the output to the value of data(input)
		end if;
	end process;
end behavioral;		  

-------------3 to 8 decoder ---------------------------------
library ieee;
use ieee.std_logic_1164.all;   
use ieee.numeric_std.all;

entity decoder_3to8 is
	port(
	a_lat : in std_logic_vector(2 downto 0);
	g : in std_logic;
	y : out std_logic_vector(0 to 7)
	);
end decoder_3to8;

architecture cond of decoder_3to8 is			  
begin											  
	decoder : process (a_lat, g)
	begin
		y <= "00000000";	   
		if g = '1' then
			for i in 0 to 7 loop
				if unsigned(a_lat) = to_unsigned(i,3) then
					y(i) <= '1';
				end if;		
				end loop;
		end if;			
	end process;
end cond;


--------------top level entity latched 3 to 8 decoder -----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	 
use work.all;

entity latched_3to8_decoder is 
	port(
	a	: in std_logic_vector(2 downto 0);
	le_bar, e1_bar, e2 : in std_logic;
	y	: out std_logic_vector(0 to 7)
	);
end latched_3to8_decoder;

architecture structural of latched_3to8_decoder is
signal a_lat : std_logic_vector(2 downto 0); 
signal g 	 : std_logic;
begin
	u0 : entity input_latch port map (a => a, le_bar => le_bar, a_lat => a_lat);
	u1 : entity decoder_3to8 port map (a_lat => a_lat, g => g, y => y);   
	u2 : g <= '1' when (e1_bar = '0') and (e2 = '1') else '0';
	
end structural;
	