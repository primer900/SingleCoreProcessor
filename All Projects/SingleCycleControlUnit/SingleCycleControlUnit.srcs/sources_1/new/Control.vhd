
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity control Is
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
 end control;


Architecture behavior of control Is


begin
 
         
         process (opcode) is
         
         begin 
         
         case opcode is 
         
         -- R-type
         when "000000" =>
            Rd <= '1';
            J <= '0';
            ALUsrc <= '0';
            MtoR <= '0';
            MW <= '0';
            RW <= '1';
            MR <= '0';
            B <= '0';
            ALUop(1) <= '1';
            ALUop(0) <= '0';
         
         
         -- lw
            when "100011" =>
                Rd <= '0';
                J <= '0';
                ALUsrc <= '1';
                MtoR <= '0';
                MW <= '0';
                RW <= '1';
                MR <= '1';
                B <= '0';
                ALUop(1) <= '0';
                ALUop(0) <= '0';
              
              -- sw
              when "101011" =>        
                       Rd <= 'X';
                       J <= '0';
                       ALUsrc <= '1';
                       MtoR <= 'X';
                       MW <= '1';
                       RW <= '0';
                       MR <= '0';
                       B <= '0';
                       ALUop(1) <= '0';
                       ALUop(0) <= '0';
                   
                   -- beq
                   when "000100" =>    
                              Rd <= 'X';
                              J <= '0';
                              ALUsrc <= '0';
                              MtoR <= '0';
                              MW <= '0';
                              RW <= '0';
                              MR <= '0';
                              B <= '1';
                              ALUop(1) <= '0';
                              ALUop(0) <= '1';
                   
                   -- jal           
                   when "000011" =>
                       Rd <= '1';
                       J <= '1';
                       ALUsrc <= 'X';
                       MtoR <= '1';
                       MW <= '0';
                       RW <= '1';
                       MR <= '0';
                       B <= 'X';
                       ALUop(1) <= 'X';
                       ALUop(0) <= 'X';             
                   
                   -- addi
                   when "001000" =>
                    Rd <= '1';
                    J <= '0';
                    ALUsrc <= '1';
                    MtoR <= '0';
                    MW <= '0';
                    RW <= '1';
                    MR <= '0';
                    B <= '0';
                    ALUop(1) <= '0';
                    ALUop(0) <= '0';
                   
                     -- ori
                       when "001101" =>
                        Rd <= '1';
                         J <= '0';
                         ALUsrc <= '1';
                         MtoR <= '0';
                         MW <= '0';
                         RW <= '1';
                         MR <= '0';
                         B <= '0';
                         ALUop(1) <= '0';
                         ALUop(0) <= '0';
                   
                   
                     -- lui
                        when "001111" =>
                         Rd <= '1';
                         J <= '0';
                         ALUsrc <= '1';
                         MtoR <= '0';
                         MW <= '0';
                         RW <= '1';
                         MR <= '0';
                         B <= '0';
                         ALUop(1) <= 'X';
                         ALUop(0) <= 'X';
                   
                   
                      -- default             
                     when others =>
                        Rd <= '0';
                        J <= '0';
                        ALUsrc <= '0';
                        MtoR <= '0';
                        MW <= '0';
                        RW <= '0';
                        MR <= '0';
                        B <= '0';
                        ALUop(1) <= '0';
                        ALUop(0) <= '0';
         
          
         end case;
         
         end process;
         
 end behavior;









