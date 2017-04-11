----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2017 07:48:56 AM
-- Design Name: 
-- Module Name: SRAM - Structural
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

entity SRAM is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           InputData : in STD_LOGIC_VECTOR (31 downto 0);
           WriteEnable : in STD_LOGIC;
           clk : in STD_LOGIC;
           OutputData : out STD_LOGIC_VECTOR (31 downto 0));
end SRAM;

architecture Structural of SRAM is

begin


end Structural;
