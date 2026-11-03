cd [file dirname [file normalize [info script]]]
set_param general.maxThreads 4
create_project -in_memory -part xc7a200tfbg484-2

set_property ip_repo_paths [list [file normalize hls_ip_repo]] [current_project]
update_ip_catalog
foreach core {fft4096_hls fir_loc_hls fir_det_hls sqrt_hls divide_hls cordic_hls power_db_hls covariance_hls detector_hls joint_search_hls} {
 create_ip -name $core -vendor drone.self -library compute -version 1.0 -module_name r18_ip_$core
 set_property GENERATE_SYNTH_CHECKPOINT false [get_files -all r18_ip_${core}.xci]
 generate_target all [get_ips r18_ip_$core]
}
set sources {}
foreach f [glob *.sv] {if {![string match "tb_*" [file tail $f]]} {lappend sources $f}}
add_files $sources
add_files [glob *.mem]
add_files [glob *.vh]
set_property top acoustic_top [current_fileset]
add_files -fileset constrs_1 {board_pins.xdc adc_pins.xdc board_timing.xdc}
update_compile_order -fileset sources_1
synth_design -top acoustic_top -part xc7a200tfbg484-2
report_utilization -file board_synth_utilization.rpt
report_utilization -hierarchical -hierarchical_depth 3 -file board_hierarchy.rpt
report_timing_summary -file board_synth_timing.rpt

opt_design
place_design
phys_opt_design
route_design
report_timing_summary -file board_routed_timing.rpt
report_bus_skew -file board_bus_skew.rpt
report_cdc -file board_cdc.rpt
report_drc -file board_drc.rpt
report_utilization -file board_routed_utilization.rpt
report_utilization -hierarchical -hierarchical_depth 5 -file board_routed_hierarchy.rpt
set setup [get_property SLACK [get_timing_paths -delay_type max -max_paths 1]]
set hold [get_property SLACK [get_timing_paths -delay_type min -max_paths 1]]
if {$setup<0 || $hold<0} {error "Timing failed: setup=$setup hold=$hold; no accepted bitstream"}
if {[llength [get_cells -hier -quiet -filter {IS_BLACKBOX == 1}]] != 0} {error "Unresolved black box"}
set debugcells [get_cells -hier -quiet -regexp {.*(audio_ila|adc_ila|dbg_hub|debug_audio_tap).*}]
if {[llength $debugcells]!=0} {error "Debug core or readback buffer remains"}
set out [open no_debug_audit.txt w]
puts $out "DEBUG_CORE_COUNT 0"
puts $out "SETUP_SLACK_NS $setup"
puts $out "HOLD_SLACK_NS $hold"
close $out
puts "NO_DEBUG_NETLIST_AUDIT_PASS"
write_checkpoint -force tingkong_routed.dcp
write_bitstream -force -bin_file acoustic_top.bit
puts "BOARD_BUILD_TIMING_PASS"
exit
