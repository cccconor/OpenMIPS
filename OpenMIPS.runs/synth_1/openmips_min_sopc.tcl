# 
# Synthesis run script generated by Vivado
# 

set_param simulator.modelsimInstallPath D:/modeltech64_10.4/win64
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35ticpg236-1L

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.cache/wt [current_project]
set_property parent.project_path C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/defines.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/id.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/div.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/ex.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/ctrl.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/hilo_reg.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/ex_mem.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/regfile.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/pc_reg.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/mem_wb.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/mem.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/if_id.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/id_ex.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/regfile_display.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/clk_div.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/inst_rom.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/openmips.v
  C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/sources_1/new/openmips_min_sopc.v
}
read_xdc C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/constrs_1/new/openmips_display.xdc
set_property used_in_implementation false [get_files C:/Users/LMX/Desktop/MyProject/OpenMIPS/OpenMIPS.srcs/constrs_1/new/openmips_display.xdc]

synth_design -top openmips_min_sopc -part xc7a35ticpg236-1L
write_checkpoint -noxdef openmips_min_sopc.dcp
catch { report_utilization -file openmips_min_sopc_utilization_synth.rpt -pb openmips_min_sopc_utilization_synth.pb }
