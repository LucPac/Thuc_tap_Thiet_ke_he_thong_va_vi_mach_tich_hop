
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Dem_len_tu_0_den_so_K__cho_truoc -dir "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Dem_len_tu_0_den_so_K__cho_truoc/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "dem_den_k.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {dem_den_k.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top dem_den_k $srcset
add_files [list {dem_den_k.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
