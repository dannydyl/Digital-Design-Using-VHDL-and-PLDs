-------------------------------------------------------------------------------
--
-- Title       : xs3_to_BCD_case_vect
-- Design      : xe3_to_BCD_case_vect
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
-- Description : converts a 4-bit Excess-3 (XS-3) input (p, q, r, s) to its corresponding Binary-Coded Decimal (BCD) output (d, c, b, a) using a case statement for the mapping.
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

architecture xs3_bcd_case_vect of converter_xs3_bcd is
begin
    casey : process (pqrs) -- sensitivity list using vector
    begin
        case pqrs is 
            when "0011" => dcba <= "0000";
            when "0100" => dcba <= "0001";
            when "0101" => dcba <= "0010";
            when "0110" => dcba <= "0011";
            when "0111" => dcba <= "0100";
            when "1000" => dcba <= "0101";
            when "1001" => dcba <= "0110";
            when "1010" => dcba <= "0111";
            when "1011" => dcba <= "1000";
            when "1100" => dcba <= "1001";
            when others => dcba <= "----";

        end case;
    end process;

end architecture xs3_bcd_case_vect;