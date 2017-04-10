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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithmeticUnit is
    port(
    ALUctl: in std_logic_vector(31 downto 0);
    A, B: in std_logic_vector(31 downto 0);
    reg: out std_logic_vector(31 downto 0);
    Zero: out std_logic;
    )
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is

begin
    Zero <= (ALUOut == 0); //zero is true if ALUOut is 0
    findALUctl: process (ALUctl, A, B)
    begin   //reevaluate if these change
--        case (ALUctl)         
--            0: ALUOut <= A & B;         
--            1: ALUOut <= A | B;         
--            2: ALUOut <= A + B;          
--            6: ALUOut <= A - B;          
--            7: ALUOut <= A < B ? 1 : 0;          
--            12: ALUOut <= ~(A | B); // result is nor         
--            default: ALUOut <= 0;      
--        endcase    
    end process;

end Behavioral;

