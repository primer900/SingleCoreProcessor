----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2017 07:51:06 PM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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
 use ieee.std_logic_1164.all;  
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifter is
Port(
    DI : in STD_LOGIC_VECTOR(31 downto 0);  
    SEL : in STD_LOGIC_VECTOR(1 downto 0);
    DIR: in STD_LOGIC; 
    SO : out STD_LOGIC_VECTOR(31 downto 0);
    clk: in STD_LOGIC); -- out vector
end Shifter;

architecture Behavioral of Shifter is

begin
    process (DI, SEL, DIR) is
    begin
        if (clk'event and clk = '1') then
            case(DIR) is
                when '0' => --shift left
                    case (SEL) is
                        when "00" => SO <= DI;
                        when "01" => SO <= DI(30 downto 0) &"0";
                        when "10" => SO <= DI(29 downto 0) & "00";
                        when others => SO <= DI(28 downto 0) & "000";
                    end case;
                when others => --shift right
                    case (SEL) is
                        when "00" => SO <= DI;
                        when "01" => SO <= "0" & DI(31 downto 1);
                        when "10" => SO <= "00" & DI(31 downto 2);
                        when others => SO <= "000" & DI(31 downto 3);
                    end case;
            end case;
        end if;
    end process;

end Behavioral;
