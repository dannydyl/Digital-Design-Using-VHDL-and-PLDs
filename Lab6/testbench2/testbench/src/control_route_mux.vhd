-------------------------------------------------------------------------------
--
-- Title       : control_route_mux
-- Design      : 
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : \\Mac\Home\Documents\Aldec_Codes\test\test\src\test.vhd
-- Generated   : 2024-03-04  15:00:00
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : using structual style
-------------------------------------------------------------------------------
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
    a1, b1, a2, b2, gn, an : in std_logic;
    y1, y2 : out std_logic
  );				   
  	attribute loc : string;
	attribute loc of gn : signal is "P3";
	attribute loc of an : signal is "P4";
	attribute loc of a2 : signal is "P14";
	attribute loc of a1 : signal is "P15";
	attribute loc of b2 : signal is "P16";
	attribute loc of b1 : signal is "P17";
	attribute loc of y2 : signal is "P43";
	attribute loc of y1 : signal is "P42";
end data_selector;

architecture structural of data_selector is
  signal s1, s2 : std_logic;
begin
  u1: entity control port map (gn => gn, an => an, c0 => s1, c1 => s2);
  u2: entity route port map (a => a1, ae => s1, b => b1, be => s2, y => y1);
  u3: entity route port map (a => a2, ae => s1, b => b2, be => s2, y => y2);
end structural;
