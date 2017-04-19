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

Entity bit0to30_tb Is
end bit0to30_tb;

Architecture behavior of bit0to30_tb Is
    Component bit0to30
    Port ( 
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        cin : in STD_LOGIC;
        ainvert : in STD_LOGIC;
        binvert : in STD_LOGIC;
        operation0 : in STD_LOGIC;
        operation1 : in STD_LOGIC;
        func: in STD_LOGIC_VECTOR(5 downto '0');
        less : in STD_LOGIC;
        result : out STD_LOGIC;
        cout: out STD_LOGIC
    );
    End Component;
   
    Signal a: STD_LOGIC;
    Signal b : STD_LOGIC;
    Signal cin : STD_LOGIC;
    Signal ainvert : STD_LOGIC; 
    Signal binvert : STD_LOGIC;
    Signal operation0 : STD_LOGIC;
    Signal operation1 : STD_LOGIC;
    Signal func : STD_LOGIC;
    Signal less : STD_LOGIC;
    Signal result : STD_LOGIC;
    Signal cout: STD_LOGIC;
  
    begin
    uut:  bit0to30 PORT MAP (
        a <= a,
        b <= b,
        cin<=cin,
        ainvert<=ainvert,
        binvert<=binvert,
        operation0<=operation0,
        operation1<=operation1,
        func<=func,
        less<=less,
        result<=result,
        cout<=cout
     );
     
    --test ADD
     process
     begin
         --test a&b
         func<="100000";
         ainvert<='0';
         binvert<='0';
         cin<='0';
             -- Test for '0' - '0'
             a<='0';
             b<='0';
             --result should be '0'  
             --cout should be '0'
             wait for 50 ns;
             
             -- Test for '1' - '0'
             a<='1';
             b<='0';
             --result should be '1'
             --cout should be '0'
             wait for 50 ns;
                         
             -- Test for '0' - '1'
             a<='0';
             b<='1';
             --result should be '1'
             --cout should be '1'
             wait for 50 ns;
                                     
             -- Test for '1' - '1'
             a<='1';
             b<='1';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;
         
         --test a'-b
             ainvert<='1';
             binvert<='0';
             cin<='0';
             -- Test for '0'' - '0'
             a<='0';
             b<='0';
             --result should be '1'  
             --cout should be '0'
             wait for 50 ns;
             
             -- Test for '1'' - '0'
             a<='1';
             b<='0';
             --result should be '0'
             --cout should be '0' 
             wait for 50 ns;
                         
             -- Test for '0'' - '1'
             a<='0';
             b<='1';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;
                                     
             -- Test for '1'' - '1'
             a<='1';
             b<='1';
             --result should be '1'
             --cout should be '1'
             wait for 50 ns;
         
         --test a-b'
             ainvert<='0';
             binvert<='1';
             cin<='0';
             
             -- Test for '0' - '0''
             a<='0';
             b<='0';
             --result should be '1'  
             --cout should be '1'
             wait for 50 ns;
             
             -- Test for '1' - '0''
             a<='1';
             b<='0';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;
                         
             -- Test for '0' - '1''
             a<='0';
             b<='1';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;
                                     
             -- Test for '1' - '1''
             a<='1';
             b<='1';
             --result should be '1'
             --cout should be '0'
             wait for 50 ns;
         
         --test a+b+cin
             ainvert<='0';
             binvert<='0';
             cin<='1';
             -- Test for '0' - '0' - '1'
             a<='0';
             b<='0';
             --result should be '1'
             --cout should be '1'
             wait for 50 ns;
             
             -- Test for '1' - '0' - '1'
             a<='1';
             b<='0';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;
                         
             -- Test for '0' - '1' - '1'
             a<='0';
             b<='1';
             --result should be '0'
             --cout should be '1'
             wait for 50 ns;
                                     
             -- Test for '1' - '1' - '1'
             a<='1';
             b<='1';
             --result should be '1'
             --cout should be '1'
             wait for 50 ns;
         
         --test a'-b-cin
             ainvert<='1';
             binvert<='0';
             cin<='1';
             -- Test for '0'' - '0' - '1'
             a<='0';
             b<='0';
             --result should be '0'  
             --cout should be '0'
             wait for 50 ns;
             
             -- Test for '1'' - '0' - '1'
             a<='1';
             b<='0';
             --result should be '0'
             --cout should be '1'
             wait for 50 ns;
                         
             -- Test for '0'' - '1' - '1'
             a<='0';
             b<='1';
             --result should be '1'
             --cout should be '1'
             wait for 50 ns;
                                     
             -- Test for '1'' - '1' - '1'
             a<='1';
             b<='1';
             --result should be '0'
             --cout should be '1'
             wait for 50 ns;
         
         --test a+b'
             ainvert<='0';
             binvert<='1';
             cin<='1';
             -- Test for '0' - '0'' - '1'
             a<='0';
             b<='0';
             --result should be '0'  
             --cout should be '1'
             wait for 50 ns;
             
             -- Test for '1' - '0'' - '1'
             a<='1';
             b<='0';
             --result should be '0'
             --cout should be '1'
             wait for 50 ns;
                         
             -- Test for '0' - '1'' - '1'
             a<='0';
             b<='1';
             --result should be '0'
             --cout should be '1'
             wait for 50 ns;
                                     
             -- Test for '1' - '1'' - '1'
             a<='1';
             b<='1';
             --result should be '0'
             --cout should be '0'
             wait for 50 ns;  
    
    --test SUB
          --test a-b
          func<="100010";
          ainvert<='0';
          binvert<='0';
          cin<='0';
              -- Test for '0' - '0'
              a<='0';
              b<='0';
              --result should be '0'  
              --cout should be '0'
              wait for 50 ns;
              
              -- Test for '1' - '0'
              a<='1';
              b<='0';
              --result should be '1'
              --cout should be '0'
              wait for 50 ns;
                          
              -- Test for '0' - '1'
              a<='0';
              b<='1';
              --result should be '1'
              --cout should be '1'
              wait for 50 ns;
                                      
              -- Test for '1' - '1'
              a<='1';
              b<='1';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns;
          
          --test a'-b
              ainvert<='1';
              binvert<='0';
              cin<='0';
              -- Test for '0'' - '0'
              a<='0';
              b<='0';
              --result should be '1'  
              --cout should be '0'
              wait for 50 ns;
              
              -- Test for '1'' - '0'
              a<='1';
              b<='0';
              --result should be '0'
              --cout should be '0' 
              wait for 50 ns;
                          
              -- Test for '0'' - '1'
              a<='0';
              b<='1';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns;
                                      
              -- Test for '1'' - '1'
              a<='1';
              b<='1';
              --result should be '1'
              --cout should be '1'
              wait for 50 ns;
          
          --test a-b'
              ainvert<='0';
              binvert<='1';
              cin<='0';
              
              -- Test for '0' - '0''
              a<='0';
              b<='0';
              --result should be '1'  
              --cout should be '1'
              wait for 50 ns;
              
              -- Test for '1' - '0''
              a<='1';
              b<='0';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns;
                          
              -- Test for '0' - '1''
              a<='0';
              b<='1';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns;
                                      
              -- Test for '1' - '1''
              a<='1';
              b<='1';
              --result should be '1'
              --cout should be '0'
              wait for 50 ns;
          
          --test a+b+cin
              ainvert<='0';
              binvert<='0';
              cin<='1';
              -- Test for '0' - '0' - '1'
              a<='0';
              b<='0';
              --result should be '1'
              --cout should be '1'
              wait for 50 ns;
              
              -- Test for '1' - '0' - '1'
              a<='1';
              b<='0';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns;
                          
              -- Test for '0' - '1' - '1'
              a<='0';
              b<='1';
              --result should be '0'
              --cout should be '1'
              wait for 50 ns;
                                      
              -- Test for '1' - '1' - '1'
              a<='1';
              b<='1';
              --result should be '1'
              --cout should be '1'
              wait for 50 ns;
          
          --test a'-b-cin
              ainvert<='1';
              binvert<='0';
              cin<='1';
              -- Test for '0'' - '0' - '1'
              a<='0';
              b<='0';
              --result should be '0'  
              --cout should be '0'
              wait for 50 ns;
              
              -- Test for '1'' - '0' - '1'
              a<='1';
              b<='0';
              --result should be '0'
              --cout should be '1'
              wait for 50 ns;
                          
              -- Test for '0'' - '1' - '1'
              a<='0';
              b<='1';
              --result should be '1'
              --cout should be '1'
              wait for 50 ns;
                                      
              -- Test for '1'' - '1' - '1'
              a<='1';
              b<='1';
              --result should be '0'
              --cout should be '1'
              wait for 50 ns;
          
          --test a+b'
              ainvert<='0';
              binvert<='1';
              cin<='1';
              -- Test for '0' - '0'' - '1'
              a<='0';
              b<='0';
              --result should be '0'  
              --cout should be '1'
              wait for 50 ns;
              
              -- Test for '1' - '0'' - '1'
              a<='1';
              b<='0';
              --result should be '0'
              --cout should be '1'
              wait for 50 ns;
                          
              -- Test for '0' - '1'' - '1'
              a<='0';
              b<='1';
              --result should be '0'
              --cout should be '1'
              wait for 50 ns;
                                      
              -- Test for '1' - '1'' - '1'
              a<='1';
              b<='1';
              --result should be '0'
              --cout should be '0'
              wait for 50 ns; 
           --end process SUB
    
    --test AND
        --test a&b
        func<="100100";
        ainvert<='0';
        binvert<='0';
        cin<='0';
            -- Test for '0' - '0'
            a<='0';
            b<='0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1' - '0'
            a<='1';
            b<='0';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1'
            a<='0';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'
            a<='1';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
        
        --test a'-b
            ainvert<='1';
            binvert<='0';
            cin<='0';
            -- Test for '0'' - '0'
            a<='0';
            b<='0';
            --result should be '1'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0' 
            wait for 50 ns;
                        
            -- Test for '0'' - '1'
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1'
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a-b'
            ainvert<='0';
            binvert<='1';
            cin<='0';
            
            -- Test for '0' - '0''
            a<='0';
            b<='0';
            --result should be '1'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0''
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1''
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1' - '1''
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
        
        --test a+b+cin
            ainvert<='0';
            binvert<='0';
            cin<='1';
            -- Test for '0' - '0' - '1'
            a<='0';
            b<='0';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0' - '1'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1' - '1'
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1' - '1'
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a'-b-cin
            ainvert<='1';
            binvert<='0';
            cin<='1';
            -- Test for '0'' - '0' - '1'
            a<='0';
            b<='0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0' - '1'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0'' - '1' - '1'
            a<='0';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1' - '1'
            a<='1';
            b<='1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
        
        --test a+b'
            ainvert<='0';
            binvert<='1';
            cin<='1';
            -- Test for '0' - '0'' - '1'
            a<='0';
            b<='0';
            --result should be '0'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0'' - '1'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0' - '1'' - '1'
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'' - '1'
            a<='1';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
    
    --test OR
        --test a&b
        func<="100101";
        ainvert<='0';
        binvert<='0';
        cin<='0';
            -- Test for '0' - '0'
            a<='0';
            b<='0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1' - '0'
            a<='1';
            b<='0';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1'
            a<='0';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'
            a<='1';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
        
        --test a'-b
            ainvert<='1';
            binvert<='0';
            cin<='0';
            -- Test for '0'' - '0'
            a<='0';
            b<='0';
            --result should be '1'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0' 
            wait for 50 ns;
                        
            -- Test for '0'' - '1'
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1'
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a-b'
            ainvert<='0';
            binvert<='1';
            cin<='0';
            
            -- Test for '0' - '0''
            a<='0';
            b<='0';
            --result should be '1'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0''
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1''
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1' - '1''
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
        
        --test a+b+cin
            ainvert<='0';
            binvert<='0';
            cin<='1';
            -- Test for '0' - '0' - '1'
            a<='0';
            b<='0';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0' - '1'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1' - '1'
            a<='0';
            b<='1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1' - '1'
            a<='1';
            b<='1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a'-b-cin
            ainvert<='1';
            binvert<='0';
            cin<='1';
            -- Test for '0'' - '0' - '1'
            a<='0';
            b<='0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0' - '1'
            a<='1';
            b<='0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0'' - '1' - '1'
            a <= '0';
            b <= '1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1' - '1'
            a <= '1';
            b <= '1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
        
        --test a+b'
            ainvert <= '0';
            binvert <= '1';
            cin <= '1';
            -- Test for '0' - '0'' - '1'
            a <= '0';
            b <= '0';
            --result should be '0'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0'' - '1'
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0' - '1'' - '1'
            a <= '0';
            b <= '1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'' - '1'
            a <= '1';
            b <= '1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns; 
    --end process OR
    
    --test S:T
        --test a&b
        func <= "101010";
        ainvert <= '0';
        binvert <= '0';
        cin <= '0';
            -- Test for '0' - '0'
            a <= '0';
            b <= '0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1' - '0'
            a <= '1';
            b <= '0';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1'
            a <= '0';
            b <= '1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'
            a <= '1';
            b <= '1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
        
        --test a'-b
            ainvert <= '1';
            binvert <= '0';
            cin <= '0';
            -- Test for '0'' - '0'
            a <= '0';
            b <= '0';
            --result should be '1'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0'
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '0' 
            wait for 50 ns;
                        
            -- Test for '0'' - '1'
            a <= '0';
            b <= '1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1'
            a <= '1';
            b <= '1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a-b'
            ainvert <= '0';
            binvert <= '1';
            cin <= '0';
            
            -- Test for '0' - '0''
            a <= '0';
            b <= '0';
            --result should be '1'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0''
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1''
            a <= '0';
            b <= '1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                                    
            -- Test for '1' - '1''
            a <= '1';
            b <= '1';
            --result should be '1'
            --cout should be '0'
            wait for 50 ns;
        
        --test a+b+cin
            ainvert <= '0';
            binvert <= '0';
            cin <= '1';
            -- Test for '0' - '0' - '1'
            a <= '0';
            b <= '0';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0' - '1'
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;
                        
            -- Test for '0' - '1' - '1'
            a <= '0';
            b <= '1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1' - '1'
            a <= '1';
            b <= '1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
        
        --test a'-b-cin
            ainvert <= '1';
            binvert <= '0';
            cin <= '1';
            -- Test for '0'' - '0' - '1'
            a <= '0';
            b <= '0';
            --result should be '0'  
            --cout should be '0'
            wait for 50 ns;
            
            -- Test for '1'' - '0' - '1'
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0'' - '1' - '1'
            a <= '0';
            b <= '1';
            --result should be '1'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1'' - '1' - '1'
            a <= '1';
            b <= '1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
        
        --test a+b'
            ainvert <= '0';
            binvert <= '1';
            cin <= '1';
            -- Test for '0' - '0'' - '1'
            a <= '0';
            b <= '0';
            --result should be '0'  
            --cout should be '1'
            wait for 50 ns;
            
            -- Test for '1' - '0'' - '1'
            a <= '1';
            b <= '0';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                        
            -- Test for '0' - '1'' - '1'
            a <= '0';
            b <= '1';
            --result should be '0'
            --cout should be '1'
            wait for 50 ns;
                                    
            -- Test for '1' - '1'' - '1'
            a <= '1';
            b <= '1';
            --result should be '0'
            --cout should be '0'
            wait for 50 ns;  
    end process;
end behavior;
