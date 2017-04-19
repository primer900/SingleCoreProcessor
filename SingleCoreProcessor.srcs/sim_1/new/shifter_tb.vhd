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

 Entity shifter_tb Is
  end shifter_tb;


 Architecture behavior of shifter_tb Is
   Component shifter
   Port(
       DI : in STD_LOGIC_VECTOR(31 downto 0);  
       SEL : in STD_LOGIC_VECTOR(1 downto 0);
       DIR: in STD_LOGIC; 
       SO : out STD_LOGIC_VECTOR(31 downto 0));
   End Component;
   
  Signal DI: STD_LOGIC_VECTOR(31 downto 0);
  Signal SEL: STD_LOGIC_VECTOR(1 downto 0);
  Signal DIR: STD_LOGIC;
  Signal SO: STD_LOGIC_VECTOR(31 downto 0);
  
  begin
   uut:  shifter PORT MAP (
    DI => DI,
    SEL => SEL,
    DIR => DIR,
    SO => SO
   );
     
   process
    
 begin
       --left
        DI<="11111111111111111111111111111111";
        SEL<="00";
        DIR<="0";
        --SO should be 11111111111111111111111111111111
        wait for 50 ns;

        DI<="11111111111111111111111111111111";
        SEL<="01";
        DIR<="0";
        --SO should be 11111111111111111111111111111110
        wait for 50 ns;    
        
        DI<="11111111111111111111111111111111";
        SEL<="10";
        DIR<="0";
        --SO should be 11111111111111111111111111111100
        wait for 50 ns;
        
        DI<="11111111111111111111111111111111";
        SEL<="11";
        DIR<="0";
        --SO should be 11111111111111111111111111111000
        wait for 50 ns;
        
        --right
        DI<="11111111111111111111111111111111";
        SEL<="00";
        DIR<="1";
        --SO should be 11111111111111111111111111111111
        wait for 50 ns;

        DI<="11111111111111111111111111111111";
        SEL<="01";
        DIR<="1";
        --SO should be 01111111111111111111111111111110
        wait for 50 ns;    
        
        DI<="11111111111111111111111111111111";
        SEL<="10";
        DIR<="1";
        --SO should be 00111111111111111111111111111100
        wait for 50 ns;
        
        DI<="11111111111111111111111111111111";
        SEL<="11";
        DIR<="1";
        --SO should be 00011111111111111111111111111000
        wait for 50 ns;
         
   end process;
  end behavior;
