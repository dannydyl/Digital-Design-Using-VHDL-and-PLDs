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


library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity data_selector is
  port(
    al, bl, a2, b2, gn, an : in std_logic;
    yl, y2 : out std_logic
  );
end data_selector;

architecture structural of data_selector is
  signal s1, s2 : std_logic;
begin
  u1: entity control port map (gn => gn, an => an, c0 => s1, c1 => s2);
  u2: entity route port map (a => al, ae => s1, b => bl, be => s2, y => yl);
  u3: entity route port map (a => a2, ae => s1, b => b2, be => s2, y => y2);
end structural;
