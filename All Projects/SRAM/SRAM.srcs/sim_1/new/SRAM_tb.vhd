----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2017 08:21:19 PM
-- Design Name: 
-- Module Name: SRAM_tb - Behavioral
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

entity SRAM_tb is
end SRAM_tb;

architecture Behavioral of SRAM_tb is
    Component SRAM
       port (
        Address : in STD_LOGIC_VECTOR (7 downto 0);
        InputData : in STD_LOGIC_VECTOR (31 downto 0);
        WriteEnable : in STD_LOGIC;
        clk : in STD_LOGIC;
        OutputData : out STD_LOGIC_VECTOR (31 downto 0)
       );
    end Component;

    Signal AddressSignal : STD_LOGIC_VECTOR (7 downto 0) := X"00";
    Signal InputDataSignal : STD_LOGIC_VECTOR (31 downto 0) := X"00000000";
    Signal WriteEnableSignal : STD_LOGIC;
    Signal clkSignal : STD_LOGIC;
    Signal OutputDataSignal : STD_LOGIC_VECTOR (31 downto 0) := X"00000000";

begin

    uut : SRAM PORT MAP(
        Address => AddressSignal, --input
        InputData => InputDataSignal, --input
        WriteEnable => WriteEnableSignal, --input
        clk => clkSignal, --input
        OutputData => OutputDataSignal --output
    );
    
    process
    begin
    
        --Set inputs for testing
        AddressSignal <= X"00";
        InputDataSignal <= X"00000111";
        WriteEnableSignal <= '1';
        clkSignal <= '1';
        
        wait for 40 ns;
        
        WriteEnableSignal <= '0';
        clkSignal <= '0';
        AddressSignal <= X"00";
        
        wait for 40 ns;

        AddressSignal <= X"01";
        InputDataSignal <= X"00000001";
        WriteEnableSignal <= '1';
        clkSignal <= '1';
        
        wait for 40 ns;

        WriteEnableSignal <= '0';
        clkSignal <= '0';
        AddressSignal <= X"01";
        
        wait for 40 ns;

        AddressSignal <= X"11";
        InputDataSignal <= X"00000011";
        WriteEnableSignal <= '1';
        clkSignal <= '1';
        
        wait for 40 ns;
        
        WriteEnableSignal <= '0';
        clkSignal <= '0';
        AddressSignal <= X"11";
        
        wait for 40 ns;

--        WriteEnableSignal <= '1';
--        clkSignal <= '1';
--        --AddressSignal <= "00001111";

--        wait for 40 ns;
        
--        WriteEnableSignal <= '1';
--        clkSignal <= '1';
--        for I in 0 to 255 loop --For loop way to simulate populating memory with preloaded data
--            AddressSignal <= std_logic_vector(to_unsigned(I, AddressSignal'Length));
--            InputDataSignal <= X"00000111";
--        end loop;

--        wait for 40 ns;
        
--        WriteEnableSignal <= '0';
--        clkSignal <= '0';
--        AddressSignal <= "00001111";
        
--        wait for 40 ns;
        
--        WriteEnableSignal <= '1';
--        clkSignal <= '1';
                
        wait for 40 ns;
    end process;


end Behavioral;
