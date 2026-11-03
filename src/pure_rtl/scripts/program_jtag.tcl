open_hw_manager
connect_hw_server
set targets [get_hw_targets -quiet]
if {[llength $targets]!=1} {error "Expected one powered JTAG target"}
current_hw_target [lindex $targets 0]
open_hw_target
set dev [get_hw_devices -filter {PART =~ xc7a200t*}]
if {[llength $dev]!=1} {error "Expected one XC7A200T"}
set_property PROBES.FILE {} $dev
set_property FULL_PROBES.FILE {} $dev
set_property PROGRAM.FILE [file normalize acoustic_top.bit] $dev
program_hw_devices $dev
refresh_hw_device $dev
puts "R28_SRAM_PROGRAMMED"
close_hw_manager
exit
