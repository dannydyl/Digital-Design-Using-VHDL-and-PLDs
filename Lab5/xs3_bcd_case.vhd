-------------------------------------------------------------------------------
--
-- Title       : xs3_to_BCD_case
-- Design      : xe3_to_BCD_case
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
--
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity converter_xs3_to_BCD is
    port ( p,q,r,s : in  std_logic;
           d,c,b,a : out  std_logic
    );
end entity converter_xs3_to_BCD;

architecture xs3_bcd_case of converter_xs3_to_BCD is
    signal temp : std_logic_vector(3 downto 0);

begin
    (d,c,b,a) <= temp;
    casey : process (p,q,r,s)   -- sensitivity list
    begin
        case std_logic_vector'(p,q,r,s) is --input vector
            when "0011" => temp <= "0000";
            when "0100" => temp <= "0001";
            when "0101" => temp <= "0010";
            when "0110" => temp <= "0011";
            when "0111" => temp <= "0100";
            when "1000" => temp <= "0101";
            when "1001" => temp <= "0110";
            when "1010" => temp <= "0111";
            when "1011" => temp <= "1000";
            when "1100" => temp <= "1001";
            when others => temp <= "----";

        end case;
    end process;

end architecture xs3_bcd_case;