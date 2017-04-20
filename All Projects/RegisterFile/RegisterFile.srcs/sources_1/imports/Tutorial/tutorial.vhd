--------------------------------------------
-- Module Name: tutorial
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity tutorial Is
port (
--		ReadData1 : out std_logic_vector(31 downto 0);
--		ReadData2: out std_logic_vector(31 downto 0);
--		WriteData: in std_logic_vector(31 downto 0);
--		ReadReg1: in std_logic_vector(4 downto 0);
--		ReadReg2: in std_logic_vector(4 downto 0);
--		WriteReg: in std_logic_vector(4 downto 0);
--		clk: in std_logic;
--		WriteEnable: in std_logic;
		swt : in STD_LOGIC_VECTOR(15 downto 0);
		led : out STD_LOGIC_VECTOR(15 downto 0)
	);
end tutorial;

Architecture behavior of tutorial Is

--type registerFile is array(31 to 0) of std_logic_vector(31 to 0);
--Signal registers: registerFile; 
--Signal led_int : STD_LOGIC_VECTOR(15 downto 0) := X"0000";

begin
--    regFile: process(clk)
--    begin
--        --Read Data from Respective Registers
--        if rising_edge(clk) then
--            ReadData1 <= registers(to_integer(unsigned(ReadReg1)));
--            ReadData2 <= registers(to_integer(unsigned(ReadReg2)));
            
--            --Write to Write Register
--            if WriteEnable = '1' then
--                registers(to_integer(unsigned(WriteReg))) <= WriteData;
--                if ReadReg1 = WriteReg then
--                    ReadData1 <= WriteData;
--                end if;
                
--                if ReadReg2 = WriteReg then
--                    ReadData2 <= WriteData;
--                end if;
--            end if;       
--        end if;
        
            led <= led_int;
            
            led_int(0) <= not(swt(0));
            led_int(1) <= swt(1) and not(swt(2));
            led_int(3) <= swt(2) and swt(3);
            led_int(2) <= led_int(1) or led_int(3);
    
            led_int(15 downto 4) <= swt(15 downto 4);
    --end process;

end behavior;

