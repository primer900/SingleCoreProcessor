-- 32-bit adder
-- Structural description of a 32-bit adder. This device
-- adds two 32-bit numbers together using thirty-two 1-bit full adders
-- described above.

-- This is just to make a reference to some common things needed.
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- entity declaration;
-- This describes the black-box view of the component we are
-- designing. The inputs and outputs are again described
-- inside port(). It takes two 4-bit values as input (a and b)
-- and produces a 4-bit output, z, and a carry out bit, cout.
entity thirtytwobit_adder is
  port( 
    a, b : in	STD_LOGIC_VECTOR(31 downto 0);
    z    : out    STD_LOGIC_VECTOR(31 downto 0);
    cout : out STD_LOGIC;
    clk: in STD_LOGIC);
end thirtytwobit_adder;

-- architecture description;
-- Although we have already described the inputs and outputs,
-- we must now describe the functionality of the adder (i.e., 
-- how we produce the desired outputs from the given inputs).
architecture MY_STRUCTURE of thirtytwobit_adder is

-- We are going to need thirty-two 1-bit adders, so include the
-- design that we have already studied in full_adder.vhd.
component FULL_ADDER
  port( 
    x, y, cin	: in STD_LOGIC;
    sum, cout	: out STD_LOGIC
  );
end component;

-- Now declare/"create" the signals which are going to be necessary
-- to pass the outputs of one adder to the inputs of the next
-- in the sequence.
signal c: STD_LOGIC_VECTOR(31 downto 0);

begin

    process (clk) is
    begin
        if (clk'event and clk = '1') then
            c(0) <= '0'; -- carry in of the first full adder is set to zero logic permanently;
        end if;
    end process;
    
    adder30to0: for I in 0 to 30 generate
        as: FULL_ADDER port map(a(I), b(I), c(I), z(I), c(I + 1));
        end generate adder30to0;
    finalBit: FULL_ADDER port map(a(31), b(31), c(31), z(31), cout);
    
    
    
END MY_STRUCTURE;