@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 8c40160a154a47d088a400d65a0fed3f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SRAM_tb_behav xil_defaultlib.SRAM_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
