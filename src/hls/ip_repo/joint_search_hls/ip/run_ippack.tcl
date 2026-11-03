






source -notrace "C:/Xilinx/Vitis/2024.2/common/scripts/ipxhls.tcl"
set ip_dir "D:/xiaobao/2026/fpga_board_work/r19_pending_export_20261031_024704/core/solution1/impl/ip"
set data_file "D:/xiaobao/2026/fpga_board_work/r19_pending_export_20261031_024704/core/solution1/solution1_data.json"
set ip_types "vitis sysgen"
if { [catch {::ipx::utils::package_hls_ip $ip_dir $data_file $ip_types } res] } {
  puts "Caught error:\n$::errorInfo"
  error $res
}
