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
	
	attribute loc : string;
	attribute loc of pqrs : signal is "P3, P4, P5, P6";
	attribute loc of dcba : signal is "P27, P26, P25, P24";

end entity converter_xs3_bcd;

architecture xs3_bcd_loop of converter_xs3_bcd is
begin
    comp: process (pqrs)

    variable bcd_value : std_logic_vector(3 downto 0);
    begin
        bcd_value := "0000";  -- Initialize to zero in BCD

        for i in 3 to 12 loop  

            if unsigned(pqrs) = i then
				bcd_value := std_logic_vector(to_unsigned(to_integer(unsigned(pqrs)) - 3, 4));


                exit;
            end if;
            
        end loop;

        dcba <= bcd_value;
    end process;

end architecture xs3_bcd_loop;