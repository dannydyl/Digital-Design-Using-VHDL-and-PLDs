library ieee;
use ieee.std_logic_1164.all;

entity control is
    port(
        gn, an : in std_logic;
        c0, c1 : out std_logic
    );
end control;

architecture csop of control is
begin
    c0 <= not gn and not an;
    c1 <= not gn and an;
end csop;
