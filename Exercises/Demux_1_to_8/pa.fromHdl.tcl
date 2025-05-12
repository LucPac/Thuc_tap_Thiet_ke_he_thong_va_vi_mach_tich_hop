
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Demux_1_to_8 -dir "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Demux_1_to_8/planAhead_run_3" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "demux1_to_8.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Demux_1_to_8.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top demux1_to_8 $srcset
add_files [list {demux1_to_8.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
