# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.cache/wt} [current_project]
set_property parent.project_path {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {c:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/bit31.vhd}
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/bit0to30.vhd}
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/Shifter.vhd}
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/Arithmetic32.vhd}
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/Control.vhd}
  {C:/Users/britt.ahlgrim/Desktop/marquette/years/2016-2017/semester 2/Computer Hardware/gitRepo/ALU/ALU.srcs/sources_1/new/ALU.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/britt.ahlgrim/Downloads/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/britt.ahlgrim/Downloads/Basys3_Master.xdc]


synth_design -top ALU -part xc7a35tcpg236-1


write_checkpoint -force -noxdef ALU.dcp

catch { report_utilization -file ALU_utilization_synth.rpt -pb ALU_utilization_synth.pb }
