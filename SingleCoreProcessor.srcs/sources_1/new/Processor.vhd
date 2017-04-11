----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2017 10:45:31 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( Instruction : in STD_LOGIC_VECTOR (31 downto 0);
        clk : in STD_LOGIC;
        WriteEnable : in STD_LOGIC
        );
end Processor;

architecture Structure of Processor is

component SRAM --Define the SRAM component to be used
    port (
        Address : in STD_LOGIC_VECTOR (7 downto 0);
        InputData : in STD_LOGIC_VECTOR (31 downto 0);
        WriteEnable : in STD_LOGIC;
        clk : in STD_LOGIC;
        OutputData : out STD_LOGIC_VECTOR (31 downto 0)
    );
    
end component;

component FileRegister --Define the FileRegister component to be used
    port(
        ReadData1 : out STD_LOGIC_VECTOR(31 downto 0);
        ReadData2 : out STD_LOGIC_VECTOR(31 downto 0);
        WriteData : in STD_LOGIC_VECTOR(31 downto 0);
        ReadReg1: in STD_LOGIC_VECTOR(4 downto 0);
        ReadReg2: in STD_LOGIC_VECTOR(4 downto 0);
        WriteReg: in STD_LOGIC_VECTOR(4 downto 0);
        clk: in std_logic;
        WriteEnable: in std_logic
    );
end component;

Signal OutputDataSignal: STD_LOGIC_VECTOR(31 downto 0); --These signals are currently dummy values
Signal ReadData1Signal : STD_LOGIC_VECTOR(31 downto 0);
Signal ReadData2Signal: STD_LOGIC_VECTOR(31 downto 0);
Signal WriteDataSignal: STD_LOGIC_VECTOR(31 downto 0);
Signal ReadReg1Signal: STD_LOGIC_VECTOR(4 downto 0);
Signal ReadReg2Signal: STD_LOGIC_VECTOR(4 downto 0);
Signal WriteRegSignal: STD_LOGIC_VECTOR(4 downto 0);

begin

    SRAM_Portion: SRAM port map(
                        Instruction(31 downto 24), 
                        Instruction, 
                        WriteEnable, 
                        clk, 
                        OutputDataSignal);
    FileRegister_Portion: FileRegister port map(
                        ReadData1Signal,
                        ReadData2Signal,
                        WriteDataSignal,
                        ReadReg1Signal,
                        ReadReg2Signal,
                        WriteRegSignal,
                        clk,
                        WriteEnable);

end Structure;