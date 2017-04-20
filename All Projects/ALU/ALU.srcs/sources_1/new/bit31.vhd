----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2017 07:51:06 PM
-- Design Name: 
-- Module Name: bit31 - Behavioral
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

entity bit31 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           ainvert : in STD_LOGIC;
           binvert : in STD_LOGIC;
           operation0 : in STD_LOGIC;
           operation1 : in STD_LOGIC;
           func: in STD_LOGIC_VECTOR(5 downto 0);
           less : in STD_LOGIC;
           Result : out STD_LOGIC;
           Set: out STD_LOGIC;
           overflow : out STD_LOGIC;
           clk: in STD_LOGIC);
end bit31;

architecture Behavioral of bit31 is

signal aToUse: std_logic;
signal bToUse: std_logic;
signal cinToUse: std_logic;
signal resultToUse: std_logic;

begin
    arithmeticUnit: process (clk)
    begin
        if (clk'event and clk = '1') then
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
            
            case(func) is
                when "100000" => --add
                    resultToUse <= (aToUse xor bToUse) xor cin;
                    overflow <= (aToUse and bToUse) or (aToUse and cin) or (bToUse and cin);
                when "100010" => --subtract
                    cinToUse <= not(cin);
                    bToUse <= not(bToUse);
                    resultToUse <= (aToUse xor bToUse) xor cinToUse;
                    overflow <= (aToUse and bToUse) or (aToUse and cinToUse) or (bToUse and cinToUse);
                when "100100" => --and
                    resultToUse <= (aToUse and bToUse);
                    overflow <= '0';
                when "100101" => --or
                    resultToUse <= (aToUse or bToUse);
                    overflow <= '0';
                when "101010" => --slt
                    cinToUse <= not(cin);
                    bToUse <= not(bToUse);
                    resultToUse <= (aToUse xor bToUse) xor cinToUse;
                    overflow <= (aToUse and bToUse) or (aToUse and cinToUse) or (bToUse and cinToUse);
                    set <= not(resultToUse);
                when others => --set to 0
                    resultToUse <= '0';
                    overflow <= '0';
            end case;
            result <= resultToUse;
        end if;
    end process;

end Behavioral;
