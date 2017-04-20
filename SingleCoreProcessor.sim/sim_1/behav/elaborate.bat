@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto db385abb88024b60968bb703becdf528 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip -L xpm --snapshot TEST_THIRTYTWOBIT_ADDER_behav xil_defaultlib.TEST_THIRTYTWOBIT_ADDER -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
