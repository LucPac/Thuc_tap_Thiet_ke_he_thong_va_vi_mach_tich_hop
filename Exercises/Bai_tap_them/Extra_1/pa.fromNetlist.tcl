
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Extra_1 -dir "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Extra_1/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Extra_1/Extra_1.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/Extra_1} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Extra_1.ucf" [current_fileset -constrset]
add_files [list {Extra_1.ucf}] -fileset [get_property constrset [current_run]]
link_design
