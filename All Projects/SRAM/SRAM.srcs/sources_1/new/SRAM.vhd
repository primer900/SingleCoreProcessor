----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2017 08:16:22 PM
-- Design Name: 
-- Module Name: SRAM - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAM is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           InputData : in STD_LOGIC_VECTOR (31 downto 0);
           WriteEnable : in STD_LOGIC;
           clk : in STD_LOGIC;
           OutputData : out STD_LOGIC_VECTOR (31 downto 0));
end SRAM;

architecture Behavior of SRAM is

type SRAMAddresses is array(0 to 255) of STD_LOGIC_VECTOR (31 downto 0);
Signal addresses: SRAMAddresses;

begin
    memoryUnit : process(clk) is
    begin
        OutputData(31 downto 0) <= addresses(to_integer(unsigned(Address)));
       
        if (clk'event and clk = '1') then
            if (WriteEnable = '1') then
                addresses(to_integer(unsigned(Address))) <= InputData;
            end if;
        end if;
    end process;

end Behavior;
