
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name gio_phut_giay -dir "C:/Users/DELL/THANHDAT/TK HE THONG VA VI MACH TICH HOP/gio_phut_giay/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "topmodule.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {phut.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {gio.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {giay.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {multiplexer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {clock_generate.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {CLOCK.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top topmodule $srcset
add_files [list {topmodule.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
