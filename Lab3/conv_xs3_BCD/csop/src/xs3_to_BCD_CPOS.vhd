library IEEE;
use IEEE.std_logic_1164.all;

entity converter_xs3_bcd_cpos is
    port(
        p, q, r, s : in std_logic;
        d, c, b, a : out std_logic
    );
end converter_xs3_bcd_cpos;

-- CPOS

architecture CPOS of converter_xs3_bcd_cpos is
begin
-- CPOS

    -- Output d
    d <= (p or q or not r or not s) and (p or not q or r or s) and (p or not q or r or not s) and
         (p or not q or not r or s) and (p or not q or not r or not s) and (not p or q or r or s) and
         (not p or q or r or not s) and (not p or q or not r or s);

    -- Output c
    c <= (p or q or not r or not s) and (p or not q or r or s) and (p or not q or r or not s) and
         (p or not q or not r or s) and (not p or q or not r or not s) and (not p or q or not r or not s) and
         (not p or not q or r or s);

    -- Output b
    b <= (p or q or not r or not s) and (p or not q or r or s) and (p or not q or not r or not s) and
         (not p or q or r or s) and (not p or q or not r or not s) and (not p or not q or r or s);

    -- Output a
    a <= (p or q or not r or not s) and (p or not q or r or not s) and (p or not q or not r or not s) and 
         (not p or q or r or not s) and (not p or q or not r or not s);
         
end cpos;
