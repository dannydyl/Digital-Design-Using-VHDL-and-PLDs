library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xs3_to_BCD_LUT is
    port( p, q, r, s : in std_logic;
	d, c, b, a : out std_logic);
	attribute loc : string;
	attribute loc of p : signal is "P3";
	attribute loc of q : signal is "P4";
	attribute loc of r : signal is "P5";
	attribute loc of s : signal is "P6";
	attribute loc of d : signal is "P27";
	attribute loc of c : signal is "P26";
	attribute loc of b : signal is "P25";
	attribute loc of a : signal is "P24";
	
end entity xs3_to_BCD_LUT;

architecture table_lookup of xs3_to_BCD_LUT is

    subtype LUT_out is std_logic_vector(3 downto 0);

    type truth_table is array (0 to 15) of std_logic_vector(3 downto 0);

    constant xs3_to_BCD_LUT_out : truth_table := (
        "----", "----", "----", "0000",
        "0001", "0010", "0011", "0100",
        "0101", "0110", "0111", "1000",
        "1001", "----", "----", "----"
    );

begin

    a <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(0);
    b <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(1);
    c <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(2);
    d <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(3);

end architecture table_lookup;