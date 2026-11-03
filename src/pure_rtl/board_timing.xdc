
set_false_path -from [get_ports sys_rst_n]

set sync_first [get_cells -hier -regexp {.*(ack_sync_reg|request_sync_reg|fatal_sync_reg|detector_fatal_sync_reg)\[0\]}]
set_false_path -to $sync_first
set payload_from [get_cells -hier -regexp {.*(audio_cross|detector_cross|ui_cross|scope_cross|det_ui_cross)/payload_reg\[[0-9]+\]}]
set payload_to [get_cells -hier -regexp {.*(audio_cross|detector_cross|ui_cross|scope_cross|det_ui_cross)/dst_data_reg\[[0-9]+\]}]
set_max_delay -datapath_only 20 -from $payload_from -to $payload_to

create_generated_clock -name lcd_forward -source [get_pins clocks/bl/O] -divide_by 1 [get_ports tft_clk]
set_output_delay -clock lcd_forward -max 3.0 [get_ports {rgb_tft[*] hsync vsync tft_de}]
set_output_delay -clock lcd_forward -min -1.0 [get_ports {rgb_tft[*] hsync vsync tft_de}]
set_max_delay -datapath_only 10 -from [get_cells -hier -regexp {reader/(convst_reg|adc_reset_reg|rd_n_reg|cs_n_reg.*)}] -to [get_ports {adc_convst adc_reset adc_rd_n adc_cs_n adc2_cs_n}]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_false_path -from [get_ports key4_n] -to [get_cells -hier -regexp {.*page_control/key_sync_reg\[0\]}]
