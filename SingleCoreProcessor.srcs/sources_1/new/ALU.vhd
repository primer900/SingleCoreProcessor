----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2017 07:51:06 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
Port (
    A: in STD_LOGIC_VECTOR(31 downto 0);
    B: in STD_LOGIC_VECTOR(31 downto 0);
    ALUOp: in STD_LOGIC_VECTOR(1 downto 0);
    Func: in STD_LOGIC_VECTOR(5 downto 0);
    Result: out STD_LOGIC_VECTOR(31 downto 0);
    Overflow: out STD_LOGIC;
    Zeroflag: out STD_LOGIC;
    CarryOut: out STD_LOGIC
    );
end ALU;


architecture Behavioral of ALU is

component Arithmetic32 is
    Port ( 
        arithmetic_A: in STD_LOGIC_VECTOR(31 downto 0);
        arithmetic_B: in STD_LOGIC_VECTOR(31 downto 0);
        arithmetic_AInvert : in STD_LOGIC;
        arithmetic_BInvert : in STD_LOGIC;
        arithmetic_Operation: in STD_LOGIC_VECTOR(1 downto 0);
        arithmetic_Func: in STD_LOGIC_VECTOR (5 downto 0);
        arithmetic_CarryOut: out STD_LOGIC;
        arithmetic_Result: Out STD_LOGIC_VECTOR
    );
end component;
component Shifter is
    Port(
        shifter_DI : in STD_LOGIC_VECTOR(31 downto 0);  
        shifter_SEL : in STD_LOGIC_VECTOR(1 downto 0);
        shifter_DIR: in STD_LOGIC; 
        shifter_SO : out STD_LOGIC_VECTOR(31 downto 0)); -- out vector
end component;
component control Is
 port (
   opcode : in STD_LOGIC_VECTOR(5 downto 0);
    Rd : out STD_LOGIC;
    J : out STD_LOGIC;
    B : out STD_LOGIC;
    MR : out STD_LOGIC;
    MtoR : out STD_LOGIC;
    MW : out STD_LOGIC;
    ALUsrc : out STD_LOGIC;
    RW : out STD_LOGIC;
    ALUop : out STD_LOGIC_VECTOR(1 downto 0)
  );
 end component;

signal clk: STD_LOGIC;
signal rd: STD_LOGIC;
signal j: STD_LOGIC;
signal branch: STD_LOGIC;
signal mr: STD_LOGIC;
signal MtoR: STD_LOGIC;
signal MW: STD_LOGIC;
signal ALUsrc: STD_LOGIC;
signal RW: STD_LOGIC;
signal ALUOpCode: STD_LOGIC_VECTOR(1 downto 0);

signal arithmetic32_result: STD_LOGIC_VECTOR(31 downto 0);
signal shifter_result: STD_LOGIC_VECTOR(31 downto 0);

begin
    arithmetic: Arithmetic32 
        port map(
           A,
           B,
           '0', --todo: what should ainvert be?
           '0', --todo: what should binvert be?
           ALUOpCode,
           Func,
           CarryOut,
           arithmetic32_result
        );
    shift: Shifter 
        Port map(
            A,
            "00",--what should shamt be?
            Func(1), --is this correct? 00 hex and 02 hex
            shifter_result
        );
    ctrl: Control
        port map (
            Func,
            rd,
            j,
            branch,
            mr,
            MtoR,
            MW,
            ALUsrc,
            RW,
            ALUOpCode
          );

    process (clk) is
    begin
        case (Func (1 downto 0)) is
            when("00") =>
                Result <= shifter_result;
            when others =>
                Result <= arithmetic32_result;
        end case;    
    end process;

end Behavioral;
