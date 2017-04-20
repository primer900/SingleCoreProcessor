----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2017 10:32:19 AM
-- Design Name: 
-- Module Name: Control_tb - Behavioral
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
 use IEEE.STD_LOGIC_ARITH.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
 use IEEE.std_logic_textio.all;

library UNISIM;
 use UNISIM.VComponents.all;

 Entity ALU_tb Is
  end ALU_tb;

 Architecture behavior of ALU_tb Is
   Component ALU
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
   End Component;
  
  Signal A: STD_LOGIC_VECTOR(31 downto 0);                                          
  Signal B: STD_LOGIC_VECTOR(31 downto 0);
  Signal ALUOp: STD_LOGIC_VECTOR(1 downto 0);
  Signal Func: STD_LOGIC_VECTOR(5 downto 0);
  Signal Result: STD_LOGIC_VECTOR(31 downto 0);
  Signal Overflow: STD_LOGIC;
  Signal Zeroflag: STD_LOGIC;
  Signal clk: STD_LOGIC;
  
  begin
   uut:  ALU PORT MAP (
    A => A,
    B => B,
    ALUOp => ALUOp,
    Func => Func,
    Result => Result,
    Overflow => Overflow,
    Zeroflag => Zeroflag,
    clk => clk
     );
     
   process (clk)
    
 begin
    if (clk'event and clk = '1') then
      --TODO: add testing for ALU
    end if;
         
   end process;
  end behavior;
