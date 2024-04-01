-------------------------------------------------------------------------------
--
-- Title       : xs3_to_BCD_loop
-- Design      : xe3_to_BCD_loop
-- Author      : Dongyun Lee
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : \\Mac\Home\Documents\Aldec_Codes\test\test\src\test.vhd
-- Generated   : Sun Feb 25 18:09:46 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : converts a 4-bit Excess-3 (XS-3) input (p, q, r, s) to its corresponding Binary-Coded Decimal (BCD) output (d, c, b, a) using looping.
--               using vectors instead of scalars.
--                  no don't cares
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity converter_xs3_bcd is
    port ( pqrs : in  std_logic_vector(3 downto 0);
           dcba : out  std_logic_vector(3 downto 0)
    );
end entity converter_xs3_bcd;

architecture xs3_bcd_loop of converter_xs3_bcd is
begin
    comp: process (pqrs)

    variable bcd_var : std_logic_vector(3 downto 0);
    begin
        bcd_var := "0000";  -- default value

        for i in 0 to 9 loop
            if unsigned(pqrs) = to_unsigned(i + 3, 4) then -- if i + 3 = pqrs then assgin to bcd_var
                bcd_var := std_logic_vector(to_unsigned(i, 4));
                exit; 
            end if;
        end loop;

        dcba <= bcd_var;
    end process;

end architecture xs3_bcd_loop;