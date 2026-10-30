
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name lab_1 -dir "/home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/planAhead_run_2" -part xc3s200ft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1/half_adder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/manos/Documents/GitHub/Digital_Design_Circuits/lab_1} }
set_property target_constrs_file "half_adder.ucf" [current_fileset -constrset]
add_files [list {half_adder.ucf}] -fileset [get_property constrset [current_run]]
link_design
