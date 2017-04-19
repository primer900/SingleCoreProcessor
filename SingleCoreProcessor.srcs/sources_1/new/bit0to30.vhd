----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2017 07:51:06 PM
-- Design Name: 
-- Module Name: bit0to30 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
sum <= (x xor y) xor cin;
cout <= (x and y) or (x and cin) or (y and cin);
entity bit0to30 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           ainvert : in STD_LOGIC;
           binvert : in STD_LOGIC;
           operation0 : in STD_LOGIC;
           operation1 : in STD_LOGIC;
           less : in STD_LOGIC;
           result : out STD_LOGIC;
           cout: out STD_LOGIC);
end bit0to30;

architecture Behavioral of bit0to30 is

signal aToUse: std_logic;
signal bToUse: std_logic;

begin
    arithmeticUnit: process (a, b, cin, ainvert, binvert, operation0, operation1, less)
    begin
        if(ainvert = '0') then 
            aToUse <= a;
        else 
            aToUse <= not(a);
        end if;
        
        if(ainvert = '0') then 
            bToUse <= b;
        else 
            bToUse <= not(b);
        end if;
        
        case(operation0) is
            when '0' => 
                case(operation1) is
                    when '0' => 
                        result <= (aToUse and bToUse);
                        cout <= '0';
                    when '1' => 
                        result <= (aToUse or bToUse);
                        cout <= '0';
                end case;
            when '1' =>
                case(operation1) is
                    when '0' => 
                        result <= (aToUse xor bToUse) xor cin;
                        cout <= (aToUse and bToUse) or (aToUse and cin) or (bToUse and cin);
                    when '1' => 
                        bToUse <= not(bToUse);
                        result <= (aToUse xor bToUse) xor cin;
                        cout <= (aToUse and bToUse) or (aToUse and cin) or (bToUse and cin);
                 end case;
        end case;
    end process;

end Behavioral;
