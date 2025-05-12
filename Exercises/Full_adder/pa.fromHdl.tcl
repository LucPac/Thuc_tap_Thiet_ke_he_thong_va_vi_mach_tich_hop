
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Full_adder -dir "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Full_adder/planAhead_run_4" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Full_adder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Full_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Full_adder_4bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Full_adder_4bit $srcset
add_files [list {Full_adder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
