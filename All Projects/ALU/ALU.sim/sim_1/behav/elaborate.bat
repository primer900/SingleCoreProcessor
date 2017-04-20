@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 6306262e2397480bb4d8cfe4c7c2eb10 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ALU_tb_behav xil_defaultlib.ALU_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
