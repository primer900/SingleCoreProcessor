@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 6be62bf2c3f04a9f90e78233a8712f6a -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot control_tb_behav xil_defaultlib.control_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
