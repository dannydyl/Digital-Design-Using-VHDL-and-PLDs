--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Feb 21 09:29:45 2024
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_xs3_to_BCD_LUT is
   port (
      p : in std_logic;
      q : in std_logic;
      r : in std_logic;
      s : in std_logic;
      d : out std_logic;
      c : out std_logic;
      b : out std_logic;
      a : out std_logic
   );
end wrapper_for_xs3_to_BCD_LUT;

architecture table_lookup of wrapper_for_xs3_to_BCD_LUT is

component xs3_to_BCD_LUT
 port (
   p : in std_logic;
   q : in std_logic;
   r : in std_logic;
   s : in std_logic;
   d : out std_logic;
   c : out std_logic;
   b : out std_logic;
   a : out std_logic
 );
end component;

signal tmp_p : std_logic;
signal tmp_q : std_logic;
signal tmp_r : std_logic;
signal tmp_s : std_logic;
signal tmp_d : std_logic;
signal tmp_c : std_logic;
signal tmp_b : std_logic;
signal tmp_a : std_logic;

begin

tmp_p <= p;

tmp_q <= q;

tmp_r <= r;

tmp_s <= s;

d <= tmp_d;

c <= tmp_c;

b <= tmp_b;

a <= tmp_a;



u1:   xs3_to_BCD_LUT port map (
		p => tmp_p,
		q => tmp_q,
		r => tmp_r,
		s => tmp_s,
		d => tmp_d,
		c => tmp_c,
		b => tmp_b,
		a => tmp_a
       );
end table_lookup;
