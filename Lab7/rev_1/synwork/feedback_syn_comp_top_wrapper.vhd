--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Mar 20 10:25:46 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_nandwfb is
   port (
      enable : in std_logic;
      sigout : out std_logic
   );
end wrapper_for_nandwfb;

architecture fb of wrapper_for_nandwfb is

component nandwfb
 port (
   enable : in std_logic;
   sigout : out std_logic
 );
end component;

signal tmp_enable : std_logic;
signal tmp_sigout : std_logic;

begin

tmp_enable <= enable;

sigout <= tmp_sigout;



u1:   nandwfb port map (
		enable => tmp_enable,
		sigout => tmp_sigout
       );
end fb;
