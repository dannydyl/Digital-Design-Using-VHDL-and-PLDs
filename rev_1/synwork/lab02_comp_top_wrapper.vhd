--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Feb  7 08:59:03 2024
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_half_adder is
   port (
      a : in std_logic;
      b : in std_logic;
      carry_out : out std_logic;
      sum : out std_logic
   );
end wrapper_for_half_adder;

architecture dataflow of wrapper_for_half_adder is

component half_adder
 port (
   a : in std_logic;
   b : in std_logic;
   carry_out : out std_logic;
   sum : out std_logic
 );
end component;

signal tmp_a : std_logic;
signal tmp_b : std_logic;
signal tmp_carry_out : std_logic;
signal tmp_sum : std_logic;

begin

tmp_a <= a;

tmp_b <= b;

carry_out <= tmp_carry_out;

sum <= tmp_sum;



u1:   half_adder port map (
		a => tmp_a,
		b => tmp_b,
		carry_out => tmp_carry_out,
		sum => tmp_sum
       );
end dataflow;
