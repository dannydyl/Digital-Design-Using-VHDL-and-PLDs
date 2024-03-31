library IEEE;
use IEEE.std_logic_1164.all;

entity converter_xs3_bcd is
    port(
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end converter_xs3_bcd;

-- CSOP

architecture CSOP of converter_xs3_bcd is
begin
-- CSOP

    -- Output d
    d <= (p and not q and r and s) or (p and q and not r and not s);

    -- Output c
    c <= (not p and q and r and s ) or (p and not q and not r and not s) or
         (p and not q and not r and s) or (p and not q and r and not s);

    -- Output b
    b <= (not p and q and not r and s) or (not p and q and r and not s) or
         (p and not q and not r and s) or (p and not q and r and not s);

    -- Output a
    a <= (not p and q and not r and not s) or (not p and q and r and not s) or
         (p and not q and not r and not s) or (p and not q and r and not s) or
         (p and q and not r and not s);
         
end csop;
