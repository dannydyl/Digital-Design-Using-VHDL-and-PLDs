library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_84_2_1 is
    port(
        d, c, b, a : in std_logic;
        p, q, r, s: out std_logic
    );
end entity bcd_to_84_2_1;

architecture mixed of bcd_to_84_2_1 is
begin
  p <= (not d and c and not b and a) or (not d and c and b and not a) or
       (not d and c and b and a) or (d and not c and not b and not a) or
       (d and not c and not b and a);
  
  q <= (d or c or b or a) and (d or not c or b or not a) and
       (d or not c or not b or a) and (d or not c or not b or not a) and
       (not d or c or b or a);
  
  with std_logic_vector'(d, c, b, a) select
  r <= '1' when "0001" | "0010" | "0101" | "0110" | "1001",
       '0' when others;

  s <= '1' when std_logic_vector'(d, c, b, a) = "0001" else
       '1' when std_logic_vector'(d, c, b, a) = "0011" else
       '1' when std_logic_vector'(d, c, b, a) = "0101" else
       '1' when std_logic_vector'(d, c, b, a) = "0111" else
       '1' when std_logic_vector'(d, c, b, a) = "1001" else
       '0';

end mixed;
