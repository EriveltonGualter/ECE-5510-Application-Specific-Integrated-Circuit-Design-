
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name parity -dir "C:/Users/EriveltonDell/Documents/Western Michigan University/ECE 5510/Programs/parity/planAhead_run_2" -part xc6slx16csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "parity_vhdl.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {parity_vhdl.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top parity_vhdl $srcset
add_files [list {parity_vhdl.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-2
