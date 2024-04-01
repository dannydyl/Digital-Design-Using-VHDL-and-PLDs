-------------------------------------------------------------------------------
--
-- Title       : xs3_to_BCD_if_vect
-- Design      : xe3_to_BCD_if_vect
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
-- Description : converts a 4-bit Excess-3 (XS-3) input (p, q, r, s) to its corresponding Binary-Coded Decimal (BCD) output (d, c, b, a) using if statement.
--               using vectors instead of scalars.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity converter_xs3_bcd is
    port ( pqrs : in  std_logic_vector(3 downto 0);
           dcba : out  std_logic_vector(3 downto 0)
    );
end entity converter_xs3_bcd;

architecture xs3_bcd_case_if_vect of converter_xs3_bcd is
begin
    casey : process (pqrs) -- process sensitivity list
    begin
        dcba <= "----"; -- default value as don't care

        if pqrs = "0011" then
            dcba <= "0000";
        elsif pqrs = "0100" then
            dcba <= "0001";
        elsif pqrs = "0101" then
            dcba <= "0010";
        elsif pqrs = "0110" then
            dcba <= "0011";
        elsif pqrs = "0111" then
            dcba <= "0100";
        elsif pqrs = "1000" then
            dcba <= "0101";
        elsif pqrs = "1001" then
            dcba <= "0110";
        elsif pqrs = "1010" then
            dcba <= "0111";
        elsif pqrs = "1011" then
            dcba <= "1000";
        elsif pqrs = "1100" then
            dcba <= "1001";
        end if;
    end process;

end architecture xs3_bcd_case_if_vect;