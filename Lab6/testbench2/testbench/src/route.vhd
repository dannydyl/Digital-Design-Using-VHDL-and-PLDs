library ieee;
use ieee.std_logic_1164.all;

entity route is
    port(
        a : in std_logic;
        ae : in std_logic;
        b : in std_logic;
        be : in std_logic;
        y : out std_logic
    );
end route;

architecture bool of route is
begin
    y <= not ((a and ae) or (b and be));
end bool;
