@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto a6c14a7da4a64aa3b9f88fd3af190637 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tutorial_tb_behav xil_defaultlib.tutorial_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
