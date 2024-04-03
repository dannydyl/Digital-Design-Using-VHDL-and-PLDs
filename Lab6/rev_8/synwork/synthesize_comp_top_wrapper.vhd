--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Mar  6 10:29:14 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_data_selector is
   port (
      a1 : in std_logic;
      b1 : in std_logic;
      a2 : in std_logic;
      b2 : in std_logic;
      gn : in std_logic;
      an : in std_logic;
      y1 : out std_logic;
      y2 : out std_logic
   );
end wrapper_for_data_selector;

architecture structural of wrapper_for_data_selector is

component data_selector
 port (
   a1 : in std_logic;
   b1 : in std_logic;
   a2 : in std_logic;
   b2 : in std_logic;
   gn : in std_logic;
   an : in std_logic;
   y1 : out std_logic;
   y2 : out std_logic
 );
end component;

signal tmp_a1 : std_logic;
signal tmp_b1 : std_logic;
signal tmp_a2 : std_logic;
signal tmp_b2 : std_logic;
signal tmp_gn : std_logic;
signal tmp_an : std_logic;
signal tmp_y1 : std_logic;
signal tmp_y2 : std_logic;

begin

tmp_a1 <= a1;

tmp_b1 <= b1;

tmp_a2 <= a2;

tmp_b2 <= b2;

tmp_gn <= gn;

tmp_an <= an;

y1 <= tmp_y1;

y2 <= tmp_y2;



u1:   data_selector port map (
		a1 => tmp_a1,
		b1 => tmp_b1,
		a2 => tmp_a2,
		b2 => tmp_b2,
		gn => tmp_gn,
		an => tmp_an,
		y1 => tmp_y1,
		y2 => tmp_y2
       );
end structural;
