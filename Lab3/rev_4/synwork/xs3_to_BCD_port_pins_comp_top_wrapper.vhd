--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Feb 14 10:26:25 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_converter_xs3_bcd is
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
end wrapper_for_converter_xs3_bcd;

architecture converter_xs3_bcd of wrapper_for_converter_xs3_bcd is

component converter_xs3_bcd
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



u1:   converter_xs3_bcd port map (
		p => tmp_p,
		q => tmp_q,
		r => tmp_r,
		s => tmp_s,
		d => tmp_d,
		c => tmp_c,
		b => tmp_b,
		a => tmp_a
       );
end converter_xs3_bcd;
