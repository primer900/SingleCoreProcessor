----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2017 07:51:06 PM
-- Design Name: 
-- Module Name: Arithmetic32 - Behavioral
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

entity Arithmetic32 is
    Port ( 
        A: in STD_LOGIC_VECTOR(31 downto 0);
        B: in STD_LOGIC_VECTOR(31 downto 0);
        AInvert : in STD_LOGIC;
        BInvert : in STD_LOGIC;
        Operation: in STD_LOGIC_VECTOR(1 downto 0);
        Func: in STD_LOGIC_VECTOR(5 downto 0);
        CarryOut: out STD_LOGIC;
        Result: Out STD_LOGIC_VECTOR(31 downto 0);
        clk: In STD_LOGIC
    );
end Arithmetic32;

architecture Behavioral of Arithmetic32 is

component bit0to30 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           ainvert : in STD_LOGIC;
           binvert : in STD_LOGIC;
           operation0 : in STD_LOGIC;
           operation1 : in STD_LOGIC;
           func: in STD_LOGIC_VECTOR(5 downto 0);
           less : in STD_LOGIC;
           result : out STD_LOGIC;
           cout: out STD_LOGIC);
end component;
component bit31 is
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
           overflow : out STD_LOGIC);
end component;

signal i : integer := 0;
signal cout: STD_LOGIC_VECTOR(31 downto 0);
signal set: STD_LOGIC;
signal invert: STD_LOGIC;

begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if(Func="100000") then
                invert <= '1';
            else
                invert <= '0';
            end if;
        end if;
    end process;
    
    a0: bit0to30 
        port map(
            A(0),
            B(0), 
            invert,
            AInvert, --todo: when does A get inverted? 
            invert, 
            Operation(0), 
            Operation(1),
            Func, 
            set, 
            Result(0), 
            cout(0)
        );
    stage: for I in 1 to 30 generate
             as: bit0to30 
             port map(
                A(I), 
                B(I), 
                cout(I-1),
                AInvert, 
                BInvert, 
                Operation(0), 
                Operation(1),
                Func, 
                '0',
                Result(I),
                cout(I));
         end generate stage;
    a31: bit31 
        port map(
            a(31), 
            b(31), 
            cout(30),
            AInvert, 
            BInvert, 
            Operation(0), 
            Operation(1),
            Func,
            '0', --TODO: what should LEss be set to ?
            Result(31),
            Set,
            CarryOut);

end Behavioral;
