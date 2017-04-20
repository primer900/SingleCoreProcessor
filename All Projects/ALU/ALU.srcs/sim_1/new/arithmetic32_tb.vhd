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

 Entity arithmetic32_tb Is
  end arithmetic32_tb;

 Architecture behavior of arithmetic32_tb Is
   Component arithmetic32
   Port ( 
          A: in STD_LOGIC_VECTOR(31 downto 0);
          B: in STD_LOGIC_VECTOR(31 downto 0);
          AInvert : in STD_LOGIC;
          BInvert : in STD_LOGIC;
          Operation: in STD_LOGIC_VECTOR(1 downto 0);
          Func: in STD_LOGIC_VECTOR(5 downto 0);
          CarryOut: out STD_LOGIC;
          Result: Out STD_LOGIC_VECTOR(31 downto 0)
      );
   End Component;
  
  Signal A: STD_LOGIC_VECTOR(31 downto 0);                                          
  Signal B: STD_LOGIC_VECTOR(31 downto 0);
  Signal AInvert: STD_LOGIC;
  Signal BInvert: STD_LOGIC;
  Signal Operation: STD_LOGIC_VECTOR(1 downto 0);
  Signal Func: STD_LOGIC_VECTOR(5 downto 0);
  Signal CarryOut: STD_LOGIC;
  Signal Result: STD_LOGIC_VECTOR(31 downto 0);
  
  begin
   uut:  arithmetic32 PORT MAP (
      A => A,
      B => B,
      AInvert => AInvert,
      BInvert => BInvert,
      Operation => Operation,
      Func => Func,
      CarryOut => CarryOut,
      Result => Result
       );
     
   process
    
 begin
      --TODO: add testing for ALU
         
   end process;
  end behavior;
