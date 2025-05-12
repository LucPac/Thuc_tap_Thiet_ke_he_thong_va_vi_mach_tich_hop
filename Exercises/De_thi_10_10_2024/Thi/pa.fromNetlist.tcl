
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Thi -dir "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/De_thi_10_10_2024/Thi/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/De_thi_10_10_2024/Thi/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Exercises/De_thi_10_10_2024/Thi} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
