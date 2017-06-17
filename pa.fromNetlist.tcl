
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Final_Project -dir "/csehome/hm525/Final_Project/planAhead_run_2" -part xc3s50antqg144-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/csehome/hm525/Final_Project/MIPS.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/csehome/hm525/Final_Project} }
set_property target_constrs_file "MIPS.ucf" [current_fileset -constrset]
add_files [list {MIPS.ucf}] -fileset [get_property constrset [current_run]]
link_design
