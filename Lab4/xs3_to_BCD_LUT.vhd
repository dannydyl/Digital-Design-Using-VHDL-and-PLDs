library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xs3_to_BCD_LUT is
    port( p, q, r, s : in std_logic;
        d, c, b, a : out std_logic);
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

    d <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(0);
    c <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(1);
    b <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(2);
    a <= xs3_to_BCD_LUT_out(to_integer(unsigned'(p, q, r, s)))(3);

end architecture table_lookup;