--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Feb 28 08:58:12 2024
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_converter_xs3_bcd is
   port (
      pqrs : in std_logic_vector(3 downto 0);
      dcba : out std_logic_vector(3 downto 0)
   );
end wrapper_for_converter_xs3_bcd;

architecture xs3_bcd_loop of wrapper_for_converter_xs3_bcd is

component converter_xs3_bcd
 port (
   pqrs : in std_logic_vector (3 downto 0);
   dcba : out std_logic_vector (3 downto 0)
 );
end component;

signal tmp_pqrs : std_logic_vector (3 downto 0);
signal tmp_dcba : std_logic_vector (3 downto 0);

begin

tmp_pqrs <= pqrs;

dcba <= tmp_dcba;



u1:   converter_xs3_bcd port map (
		pqrs => tmp_pqrs,
		dcba => tmp_dcba
       );
end xs3_bcd_loop;
