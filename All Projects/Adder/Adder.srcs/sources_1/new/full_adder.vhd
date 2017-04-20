-- 1-bit full adder
-- Declare the 1-bit full adder with the inputs and outputs
-- shown inside the port(). This adds two bits together (x,y)
-- with a carry in (cin) and outputs the sum (sum) and a 
-- carry out (cout).

library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration;
entity full_adder is
  port(
    x, y, cin: in std_logic;
    sum, cout: out std_logic);
end full_adder;

-- architecture description;
architecture my_dataflow of full_adder is

begin
    --process (clk) is
    process (x, y, cin)
    begin
        --if (clk'event and clk = '1') then
            -- just two concurrent statements here!
            sum <= (x xor y) xor cin;
            cout <= (x and y) or (x and cin) or (y and cin);
        --end if;
    end process;

end my_dataflow;
