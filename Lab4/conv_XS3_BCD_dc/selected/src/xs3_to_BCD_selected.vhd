library ieee;
use ieee.std_logic_1164.all;

entity xs3_to_BCD_selected is
    port (
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end entity xs3_to_BCD_selected;

architecture selected of xs3_to_BCD_selected is
    signal temp : std_logic_vector(3 downto 0);
begin

    (d, c, b, a) <= temp;

    with std_logic_vector'(p, q, r, s) select
        temp <= "0000" when "0011",
                "0001" when "0100",
                "0010" when "0101",
                "0011" when "0110",
                "0100" when "0111",
                "0101" when "1000",
                "0110" when "1001",
                "0111" when "1010",
                "1000" when "1011",
                "1001" when "1100",
                "----" when others;

    -- with std_logic_vector'(p, q, r, s) select
    --     d <= '0' when "0011" | "0100" | "0101" | "0110" | "0111" | "1000" | "1001" | "1010",
    --          '1' when "1011" | "1100",
    --          '-' when others;

    -- with std_logic_vector'(p, q, r, s) select
    --     c <= '0' when "0011" | "0100" | "0101" | "0110" | "1011" | "1100",
    --          '1' when "0111" | "1000" | "1001" | "1010",
    --          '-' when others;
    
    -- with std_logic_vector'(p, q, r, s) select
    --     b <= '0' when "0011" | "0100" | "0111" | "1000" | "1011" | "1100",
    --          '1' when "0101" | "0110" | "1001" | "1010",
    --          '-' when others;

    -- with std_logic_vector'(p, q, r, s) select
    --     a <= '0' when "0011" | "0101" | "0111" | "1001" | "1011",
    --          '1' when "0100" | "0110" | "1000" | "1010" | "1100",
    --          '-' when others;


end architecture selected;