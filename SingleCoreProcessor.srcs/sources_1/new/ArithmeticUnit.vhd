----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2017 08:27:26 PM
-- Design Name: 
-- Module Name: ArithmeticUnit - Behavioral
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
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticUnit is
    port(
    ALUop: in std_logic_vector(1 downto 0);
    Func: in std_logic_vector(5 downto 0);
    A, B: in std_logic_vector(31 downto 0);
    Result: inout std_logic_vector(31 downto 0);
    Zero: out std_logic;
    Overflow: out std_logic;
    CarryOut: out std_logic
    );
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is
    
begin
    --Zero <= unsigned(Result) & "00000000000000000000000000000000"; --zero is true if Result is 0

    
    findALUctl: process (ALUop, A, B)
    begin   
        if Result = 0 then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
        
        case(ALUop) is
            when "10" => 
                case(func) is
                    when "100000" => Result <= (A + B);
                    when "100010" => Result <= (A - B);
                    when "100100" => Result <= (A & B);
                    when "100101" => Result <= (A or B); 
                    when "000000" => Result <= (A sll 1);
                    when "000010" => Result <= (A srl 0);
                end case;
        end case;
    --reevaluate if these change
--        case (ALUctl)         
--            0: Result <= A & B;         
--            1: Result <= A | B;         
--            2: Result <= A + B;          
--            6: Result <= A - B;          
--            7: Result <= A < B ? 1 : 0;          
--            12: Result <= ~(A | B); // result is nor         
--            default: Result <= 0;      
--        endcase    
    end process;

end Behavioral;

