--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use STD.textio.all;
use IEEE.std_logic_textio.all;

library UNISIM;
use UNISIM.VComponents.all;

Entity tutorial_tb Is
end tutorial_tb;

Architecture behavior of tutorial_tb Is
	Component RegisterFile
	port (
       	ReadData1 : out STD_LOGIC_VECTOR(31 downto 0);
        ReadData2 : out STD_LOGIC_VECTOR(31 downto 0);
        WriteData : in STD_LOGIC_VECTOR(31 downto 0);
        ReadReg1 : in STD_LOGIC_VECTOR(4 downto 0);
        ReadReg2 : in STD_LOGIC_VECTOR(4 downto 0);
        WriteReg : in STD_LOGIC_VECTOR(4 downto 0);
        clk : in STD_LOGIC;
        WriteEnable : in STD_LOGIC
		);	
	End Component;
	
	
	Signal Write : STD_LOGIC_VECTOR(31 downto 0) := X"00000000";
	Signal Read : STD_LOGIC_VECTOR(31 downto 0) := X"00000000";
    Signal Read2 : STD_LOGIC_VECTOR(31 downto 0) := X"00000000";
    Signal ReadReg_1 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    Signal ReadReg_2 : STD_LOGIC_VECTOR(4 downto 0) := "00000";
    Signal WriteReg_1 : STD_LOGIC_VECTOR(4 downto 0) := "00001";
    Signal clk_Signal : STD_LOGIC;
    Signal WriteEnable_Signal : STD_LOGIC;

begin

	uut:  RegisterFile PORT MAP (
            ReadData1 => Read, --output
            ReadData2 => Read2, --output
			WriteData => Write, --input
			ReadReg1 => ReadReg_1, --input
			ReadReg2 => ReadReg_2, --input
			WriteReg => WriteReg_1, --input
			clk => clk_Signal, --input
			WriteEnable => WriteEnable_Signal --input
		 );
		 
	process
        --variable read_out : STD_LOGIC_VECTOR(31 downto 0); --define variables to assign to signals
        --variable read_out2 : STD_LOGIC_VECTOR(31 downto 0);
	begin
	      --read_out := X"00000000";
	      --read_out2 := X"00000000";
	               	  
		  Write <= X"11111111"; --Set inputs here for testing
		  ReadReg_1 <= "00001";
		  ReadReg_2 <= "00001";
		  WriteReg_1 <= "00001";
		  clk_Signal <= '1';
          WriteEnable_Signal <= '1';
          
		  wait for 40 ns;


		  clk_Signal <= '0';
		  WriteEnable_Signal <= '0';
		  
		  wait for 40 ns;
		  Write <= X"00000011"; --Set inputs here for testing
          ReadReg_1 <= "00011";
          ReadReg_2 <= "00011";
          WriteReg_1 <= "00011";
          clk_Signal <= '1';
          WriteEnable_Signal <= '1';
          
          wait for 40 ns;

          clk_Signal <= '0';
          WriteEnable_Signal <= '0';
          
          wait for 40 ns;

          Write <= X"00000101"; --Set inputs here for testing
          ReadReg_1 <= "00101";
          ReadReg_2 <= "00101";
          WriteReg_1 <= "00101";
          clk_Signal <= '1';
          WriteEnable_Signal <= '1';
          
          wait for 40 ns;

          clk_Signal <= '0';
          WriteEnable_Signal <= '0';
          
          wait for 40 ns;

          Write <= X"00000000"; --Set inputs here for testing
          ReadReg_1 <= "00001";
          ReadReg_2 <= "00101";
          WriteReg_1 <= "00000";
          clk_Signal <= '1';
          WriteEnable_Signal <= '0';
          
          wait for 40 ns;

          clk_Signal <= '0';
          WriteEnable_Signal <= '0';
          
          wait for 40 ns;

	end process;
end behavior;
