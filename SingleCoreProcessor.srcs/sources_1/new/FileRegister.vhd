----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2017 08:18:52 AM
-- Design Name: 
-- Module Name: FileRegister - Behavioral
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

entity FileRegister is
    Port ( ReadData1 : out STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in STD_LOGIC_VECTOR (31 downto 0);
           ReadReg1 : in STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           WriteEnable : in STD_LOGIC);
end FileRegister;

architecture Behavior of FileRegister is

type registerFile is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
Signal registers: registerFile;

begin
    
    regFile : process(clk) is
        begin
        
        ReadData1(31 downto 0) <= registers(to_integer(unsigned(ReadReg1)));
        ReadData2(31 downto 0) <= registers(to_integer(unsigned(ReadReg2)));
        
            if (clk'event and clk = '1') then
                if (WriteEnable = '1' and ReadReg1 = WriteReg) then
                        registers(to_integer(unsigned(WriteReg))) <= WriteData;
                        ReadData1 <= WriteData;
                end if;
                    
                if (WriteEnable = '1' and ReadReg2 = WriteReg) then
                        registers(to_integer(unsigned(WriteReg))) <= WriteData;
                        ReadData2 <= WriteData;
                end if;
            end if;
    end process;


end Behavior;
