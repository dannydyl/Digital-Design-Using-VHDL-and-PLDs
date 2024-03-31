library IEEE;
use IEEE.std_logic_1164.all;

entity converter_xs3_bcd_conditional is
    port(
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end converter_xs3_bcd_conditional;

-- CSOP

architecture Conditional of converter_xs3_bcd_conditional is    
begin

    -- Conditional signal assignments

    d <= 'Z' when (p = '0' and q = '0' and r = '0' and s = '0') or
                  (p = '0' and q = '0' and r = '0' and s = '1') or
                  (p = '0' and q = '0' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '0' and s = '1') or
                  (p = '1' and q = '1' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '1' and s = '1') else
         '1' when (p = '1' and q = '0' and r = '1' and s = '1') or
                 (p = '1' and q = '1' and r = '0' and s = '0') else
         '0';

    -- Output c
    c <= 'Z' when (p = '0' and q = '0' and r = '0' and s = '0') or
                  (p = '0' and q = '0' and r = '0' and s = '1') or
                  (p = '0' and q = '0' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '0' and s = '1') or
                  (p = '1' and q = '1' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '1' and s = '1') else
         '1' when (p = '0' and q = '1' and r = '1' and s = '1') or
                 (p = '1' and q = '0' and r = '0' and s = '0') or
                 (p = '1' and q = '0' and r = '0' and s = '1') or
                 (p = '1' and q = '0' and r = '1' and s = '0') else
         '0';

    -- Output b
    b <= 'Z' when (p = '0' and q = '0' and r = '0' and s = '0') or
                  (p = '0' and q = '0' and r = '0' and s = '1') or
                  (p = '0' and q = '0' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '0' and s = '1') or
                  (p = '1' and q = '1' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '1' and s = '1') else
         '1' when (p = '0' and q = '1' and r = '0' and s = '1') or
                 (p = '0' and q = '1' and r = '1' and s = '0') or
                 (p = '1' and q = '0' and r = '0' and s = '1') or
                 (p = '1' and q = '0' and r = '1' and s = '1') else
         '0';

    -- Output a
    a <= 'Z' when (p = '0' and q = '0' and r = '0' and s = '0') or
                  (p = '0' and q = '0' and r = '0' and s = '1') or
                  (p = '0' and q = '0' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '0' and s = '1') or
                  (p = '1' and q = '1' and r = '1' and s = '0') or
                  (p = '1' and q = '1' and r = '1' and s = '1') else
         '1' when (p = '0' and q = '1' and r = '0' and s = '0') or
                 (p = '0' and q = '1' and r = '1' and s = '0') or
                 (p = '1' and q = '0' and r = '0' and s = '0') or
                 (p = '1' and q = '0' and r = '1' and s = '0') or
                 (p = '1' and q = '1' and r = '0' and s = '0') else
         '0';

         
end conditional;
