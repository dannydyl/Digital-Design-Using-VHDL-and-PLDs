library IEEE;
use IEEE.std_logic_1164.all;

entity converter_xs3_bcd_selected is
    port(
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end converter_xs3_bcd_selected;



architecture CSOP of converter_xs3_bcd_selected is
begin
-- CSOP

    process(p, q, r, s)
    begin
        if (p = '1' and q = '0' and r = '1' and s = '1') or
            (p = '1' and q = '1' and r = '0' and s = '0') then
            d <= '1';
        elsif
            (p = '0' and q = '1' and r = '1' and s = '1') or
            (p = '1' and q = '0' and r = '0' and s = '0') or
            (p = '1' and q = '0' and r = '0' and s = '1') or
            (p = '1' and q = '0' and r = '1' and s = '0') then
            c <= '1';
        elsif
            (p = '0' and q = '1' and r = '0' and s = '1') or
            (p = '0' and q = '1' and r = '1' and s = '0') or
            (p = '1' and q = '0' and r = '0' and s = '1') or
            (p = '1' and q = '0' and r = '1' and s = '1') then
            b <= '1';
        elsif
            (p = '0' and q = '1' and r = '0' and s = '0') or
            (p = '0' and q = '1' and r = '1' and s = '0') or
            (p = '1' and q = '0' and r = '0' and s = '0') or
            (p = '1' and q = '0' and r = '1' and s = '0') or
            (p = '1' and q = '1' and r = '0' and s = '0') then
            a <= '1';
        else
            d <= 'Z';
            c <= 'Z';
            b <= 'Z';
            a <= 'Z';
        end if;

    end process;
         
end csop;
