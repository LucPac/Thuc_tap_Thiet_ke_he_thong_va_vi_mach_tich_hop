
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Den_giao_thong -dir "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Den_giao_thong/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "den_giao_thong.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {add3.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {TM1638.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {HexBcd.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {dieukhien.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ClockDiv.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {chia_xung.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {den_giao_thong.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top den_giao_thong $srcset
add_files [list {den_giao_thong.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
