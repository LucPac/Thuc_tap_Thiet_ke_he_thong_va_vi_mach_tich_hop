
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Full_adder -dir "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Full_adder/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Full_adder/Full_adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Dropbox/University/Nam 3/2024_2025_HK1/TT Thiet ke he thong va vi mach tich hop/Full_adder} }
set_property target_constrs_file "Full_adder.ucf" [current_fileset -constrset]
add_files [list {Full_adder.ucf}] -fileset [get_property constrset [current_run]]
link_design
