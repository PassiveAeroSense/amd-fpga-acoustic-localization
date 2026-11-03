open_project -reset core
set_top joint_search_hls
add_files src/detector.cpp -cflags "-Isrc -std=c++14"
add_files src/joint_search.cpp -cflags "-Isrc -std=c++14"
add_files src/kernels.cpp -cflags "-Isrc -std=c++14"
add_files -tb grid_10000.mem
add_files -tb grid_15000.mem
add_files -tb grid_20000.mem
add_files -tb position_check_0.mem
add_files -tb position_check_1.mem
add_files -tb test_search.cpp -cflags "-Isrc -std=c++14"
open_solution -reset solution1 -flow_target vivado
set_part xc7a200tfbg484-2
create_clock -period 20
config_rtl -reset_level low -reset control
csim_design -O
csynth_design
cosim_design -rtl verilog -tool xsim
export_design -format ip_catalog -rtl verilog -vendor drone.self -library compute -version 1.0
exit