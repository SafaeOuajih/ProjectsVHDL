############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project test_tp_3a_se
set_top my_module
add_files Q1/tb_modules/Analyzer.cpp
add_files Q1/tb_modules/Analyzer.h
add_files Q1/tb_modules/Generator.cpp
add_files Q1/tb_modules/Generator.h
add_files Q1/my_module.cpp
add_files Q1/my_module.h
add_files -tb Q1/top_module.cpp
open_solution "solution1"
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
#source "./test_tp_3a_se/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool modelsim
export_design -rtl vhdl -format ip_catalog
