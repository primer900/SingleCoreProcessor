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



 Entity control_tb Is
  end control_tb;


 Architecture behavior of control_tb Is
   Component control
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
   End Component;
   
 Signal opcode: STD_LOGIC_VECTOR(5 downto 0);
  Signal Rd : STD_LOGIC;
  Signal J : STD_LOGIC;
  Signal B : STD_LOGIC; 
  Signal MR : STD_LOGIC;
  Signal MtoR : STD_LOGIC;
  Signal MW : STD_LOGIC;
  Signal ALUsrc : STD_LOGIC;
  Signal RW : STD_LOGIC;
  Signal ALUop : STD_LOGIC_VECTOR(1 downto 0);
  
  begin
   uut:  control PORT MAP (
    opcode => opcode,
    Rd => Rd,
    J => J,
    B => B,
    MR => MR,
    MtoR => MtoR,
    MW => MW,
    ALUsrc => ALUsrc,
    RW => RW,
    ALUop => ALUop
   
     );
     
   process
    
 begin
      -- Test for R format instructions
      opcode <= "000000";    
      wait for 50 ns;
      

      -- Test for addi
      opcode <= "001000";
      wait for 50 ns;
      

      -- Test for ori
      opcode <= "001101";
      wait for 50 ns;

     
      -- Test for LUI
       opcode <= "001111";      
       wait for 50 ns;
      
      -- Test for JAL
      opcode <= "000011";
       wait for 50 ns;
      
     -- Test for lw
      opcode <= "100011";
      wait for 50 ns;
     
      --Test for sw
      opcode <= "101011";
      wait for 50 ns;
     
     -- Test for beq
      opcode <= "000100";
      wait for 50 ns;
       
         
   end process;
  end behavior;
