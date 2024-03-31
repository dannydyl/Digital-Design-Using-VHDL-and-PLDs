library ieee;
use ieee.std_logic_1164.all;

entity xs3_to_BCD_conditional is
    port (
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end entity xs3_to_BCD_conditional;

architecture conditional of xs3_to_BCD_conditional is
begin
    d <= '1' when p = '1' and q = '0' and r = '1' and s = '1' else 
            '1' when p = '1' and q = '1' and r = '0' and s = '0' else
            '-' when (p = '0' and q = '0' and r = '0' and s = '0') or
                    (p = '0' and q = '0' and r = '0' and s = '1') or
                    (p = '0' and q = '0' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '0' and s = '1') or
                    (p = '1' and q = '1' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '1' and s = '1') else
            '0';

    c <= '1' when p = '0' and q = '1' and r = '1' and s = '1' else
            '1' when p = '1' and q = '0' and r = '0' and s = '0' else
            '1' when p = '1' and q = '0' and r = '0' and s = '1' else
            '1' when p = '1' and q = '0' and r = '1' and s = '0' else
            '-' when (p = '0' and q = '0' and r = '0' and s = '0') or
                    (p = '0' and q = '0' and r = '0' and s = '1') or
                    (p = '0' and q = '0' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '0' and s = '1') or
                    (p = '1' and q = '1' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '1' and s = '1') else
            '0';

    b <= '1' when p = '0' and q = '1' and r = '0' and s = '1' else
            '1' when p = '0' and q = '1' and r = '1' and s = '0' else
            '1' when p = '1' and q = '0' and r = '0' and s = '1' else
            '1' when p = '1' and q = '0' and r = '1' and s = '0' else
            '-' when (p = '0' and q = '0' and r = '0' and s = '0') or
                    (p = '0' and q = '0' and r = '0' and s = '1') or
                    (p = '0' and q = '0' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '0' and s = '1') or
                    (p = '1' and q = '1' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '1' and s = '1') else
            '0';

    a <= '1' when p = '0' and q = '1' and r = '0' and s = '0' else
            '1' when p = '0' and q = '1' and r = '1' and s = '0' else
            '1' when p = '1' and q = '0' and r = '0' and s = '0' else
            '1' when p = '1' and q = '0' and r = '1' and s = '0' else
            '1' when p = '1' and q = '1' and r = '0' and s = '0' else
            '-' when (p = '0' and q = '0' and r = '0' and s = '0') or
                    (p = '0' and q = '0' and r = '0' and s = '1') or
                    (p = '0' and q = '0' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '0' and s = '1') or
                    (p = '1' and q = '1' and r = '1' and s = '0') or
                    (p = '1' and q = '1' and r = '1' and s = '1') else
            '0';
end architecture conditional;