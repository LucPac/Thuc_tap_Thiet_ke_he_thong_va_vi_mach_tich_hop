
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name bt2 -dir "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/bt2/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Led_4_Mode.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {clock_generate.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mux_4_to_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mux4to1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mode_4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mode_3.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mode_2.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Mode_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Demux_1_to_4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {clock_1hz2hz4hz8hz.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Led_4_Mode.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Led_4_Mode $srcset
add_files [list {Led_4_Mode.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
