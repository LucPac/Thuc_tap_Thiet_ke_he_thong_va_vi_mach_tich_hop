
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Bai_tap_3 -dir "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Bai_tap_3/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Bai_tap_3/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Bai_tap_3} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
