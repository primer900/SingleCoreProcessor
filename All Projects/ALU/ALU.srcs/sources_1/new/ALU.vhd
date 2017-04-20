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
    clk: in STD_LOGIC
    );
end ALU;
architecture Behavioral of ALU is

component Arithmetic32 is
    Port ( 
        A: in STD_LOGIC_VECTOR(31 downto 0);
        B: in STD_LOGIC_VECTOR(31 downto 0);
        AInvert : in STD_LOGIC;
        BInvert : in STD_LOGIC;
        Operation: in STD_LOGIC_VECTOR(1 downto 0);
        Func: in STD_LOGIC_VECTOR(5 downto 0);
        CarryOut: out STD_LOGIC;
        Result: Out STD_LOGIC_VECTOR(31 downto 0);
        clk: in STD_LOGIC
    );
end component;
component Shifter is
    Port(
    DI : in STD_LOGIC_VECTOR(31 downto 0);  
    SEL : in STD_LOGIC_VECTOR(1 downto 0);
    DIR: in STD_LOGIC; 
    SO : out STD_LOGIC_VECTOR(31 downto 0);
    clk: in STD_LOGIC); -- out vector
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

--signal clk: STD_LOGIC;
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
           Overflow,
           arithmetic32_result,
           clk
        );
    shift: Shifter 
        Port map(
            A,
            "00",--what should shamt be?
            Func(1), --is this correct? 00 hex and 02 hex
            shifter_result,
            clk
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
        if (clk'event and clk = '1') then
            case (Func (1 downto 0)) is
                when("00") =>
                    Result <= shifter_result;
                    if(shifter_result = "00000000000000000000000000000000") then
                        Zeroflag <= '1';
                    else
                        Zeroflag <= '0';
                    end if;
                when others =>
                    Result <= arithmetic32_result;
                    if(arithmetic32_result = "00000000000000000000000000000000") then
                        Zeroflag <= '1';
                    else
                        Zeroflag <= '0';
                    end if;
            end case;
        end if; 
    end process;

end Behavioral;
