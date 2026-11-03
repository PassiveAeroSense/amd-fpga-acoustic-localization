`timescale 1ns/1ps
                                                                                           
`include "r19_config.vh"
module acoustic_top #(parameter UI_FAULT_CYCLES=100000000,KEY_DEBOUNCE_CYCLES=666667)(input sys_clk,sys_rst_n,input [15:0] adc_db,adc2_db,
input adc_busy,adc_firstdata,adc2_busy,adc2_firstdata,
output adc_convst,adc_reset,adc_rd_n,adc_cs_n,adc2_cs_n,
output [15:0] rgb_tft,output hsync,vsync,tft_clk,tft_de,tft_bl,input key4_n);
wire ac,pc,lc,locked;
acoustic_clocks clocks(sys_clk,~sys_rst_n,ac,pc,lc,locked);
wire reset_async=sys_rst_n&&locked;
(* ASYNC_REG="TRUE" *)reg [2:0] ar,pr,lr;
always @(posedge ac or negedge reset_async)if(!reset_async)ar<=0;else ar<={ar[1:0],1'b1};
always @(posedge pc or negedge reset_async)if(!reset_async)pr<=0;else pr<={pr[1:0],1'b1};
always @(posedge lc or negedge reset_async)if(!reset_async)lr<=0;else lr<={lr[1:0],1'b1};
wire av,ag;wire [1:0] bad;wire [255:0] adc_samples;wire [31:0] sequence_number,timeouts,order_errors,deadlines;
wire [127:0] adc_error_kinds;
wire [31:0] aligned_frames;
wire [64:0] adc_trace;                                          
ad7606_dual_fast #(.PERIOD(2083),.PERIOD_FRAC_NUM(1),.PERIOD_FRAC_DEN(3),
 .HOLD_CONV_DURING_READ(1),.PRIME_READ(1),.CS_SETUP(200),.RD_LOW(40),.RD_HIGH(35),.BUSY_TIMEOUT(550),.RECOVERY_FRAMES(4800)) reader(ac,ar[2],{adc2_busy,adc_busy},{adc2_firstdata,adc_firstdata},adc_db,adc2_db,
adc_convst,adc_reset,adc_rd_n,{adc2_cs_n,adc_cs_n},av,adc_samples,bad,sequence_number,ag,timeouts,order_errors,deadlines,adc_error_kinds,adc_trace,aligned_frames);
wire repaired_valid,repaired_gap;wire [255:0] repaired_samples;wire [31:0] repaired_total;
                                                                       
                                                                           
                                                                             
                                                                         
adc_frame_repair #(.WINDOW_FRAMES(48000),.MAX_REPAIRS(240)) repair(ac,ar[2],av,bad,ag,adc_samples,repaired_valid,repaired_samples,repaired_gap,repaired_total);
wire rate_valid,rate_fault;wire [383:0] rate_samples;
audio_rate_bridge rates(ac,ar[2],repaired_valid,2'b00,repaired_gap,{128'd0,repaired_samples[127:0]},rate_valid,rate_samples,rate_fault);
                                                                               
wire [383:0] expanded_samples;genvar e;
generate for(e=0;e<16;e=e+1)begin assign expanded_samples[e*24+:24]={repaired_samples[e*16+:16],8'd0};end endgenerate
wire loc_valid,loc_busy,loc_fault;wire [383:0] loc_samples;
fir_resampler16 #(.L(1),.M(1),.TAPS(383),.COEFF_FILE("loc_bandpass48.mem")) localization_filter(
 ac,ar[2],repaired_valid,repaired_gap,expanded_samples,loc_valid,loc_samples,loc_busy,loc_fault);
reg [15:0] epoch;reg [31:0] error_count;
always @(posedge ac)if(!ar[2])begin epoch<=0;error_count<=0;end
else begin if(repaired_gap)epoch<=epoch+1;error_count<=timeouts+order_errors+deadlines;end
                                                                               
                                                                                
reg [31:0] secondary_fault_epoch;
always @(posedge ac)if(!ar[2])secondary_fault_epoch<=0;
else if(av&&bad[1])secondary_fault_epoch<=secondary_fault_epoch+1;
wire audio_valid,audio_ready,audio_overrun;wire [623:0] audio_packet;
wire [31:0] corrected_total=repaired_total+aligned_frames;
cdc_mailbox #(.WIDTH(624)) audio_cross(ac,ar[2],loc_valid,{secondary_fault_epoch,adc_error_kinds,corrected_total,error_count,epoch,loc_samples},audio_ready,audio_overrun,
pc,pr[2],audio_valid,audio_packet);
wire detector_sample_valid,detector_ready,detector_mailbox_overrun;wire [207:0] detector_packet;
cdc_mailbox #(.WIDTH(208)) detector_cross(ac,ar[2],rate_valid,{epoch,rate_samples[191:0]},detector_ready,detector_mailbox_overrun,
 pc,pr[2],detector_sample_valid,detector_packet);
(* ASYNC_REG="TRUE" *)reg [1:0] detector_fatal_sync;
reg detector_fatal_source;reg [15:0] detector_seen_epoch;
always @(posedge ac)if(!ar[2])detector_fatal_source<=0;else detector_fatal_source<=rate_fault||detector_mailbox_overrun;
always @(posedge pc)if(!pr[2])begin detector_fatal_sync<=0;detector_seen_epoch<=0;end
else begin detector_fatal_sync<={detector_fatal_sync[0],detector_fatal_source};
if(detector_sample_valid)detector_seen_epoch<=detector_packet[207:192];end
(* ASYNC_REG="TRUE" *)reg [1:0] fatal_sync;
reg fatal_source;
                                                                            
always @(posedge ac)if(!ar[2])fatal_source<=0;else fatal_source<=loc_fault||audio_overrun;
always @(posedge pc)if(!pr[2])fatal_sync<=0;else fatal_sync<={fatal_sync[0],fatal_source};
reg [15:0] seen_epoch;reg [31:0] silence;reg ever_audio;reg link_good;
wire dv,da,det,dinvalid,dover;
                                                                                       
wire gap=(audio_valid&&ever_audio&&audio_packet[399:384]!=seen_epoch)||silence==500000||fatal_sync[1];
wire detector_gap=gap||dover||detector_fatal_sync[1]||(detector_sample_valid&&detector_packet[207:192]!=detector_seen_epoch);
always @(posedge pc)if(!pr[2])begin seen_epoch<=0;silence<=0;ever_audio<=0;link_good<=0;end
else begin if(audio_valid)begin seen_epoch<=audio_packet[399:384];silence<=0;ever_audio<=1;link_good<=1;end
else if(silence<500001)silence<=silence+1;
if(gap)link_good<=0;end
wire signed [31:0] raw;wire signed [63:0] dsum;wire [4:0] dhist;wire [31:0] wn,we,fc;
wire [2:0] detector_diagnostic;wire monitor_valid;wire [63:0] monitor_energy;
r22_detector_frontend detection(pc,pr[2],detector_sample_valid,detector_gap,{192'd0,detector_packet[191:0]},dv,da,det,dinvalid,raw,dsum,dhist,wn,we,dover,fc,detector_diagnostic,monitor_valid,monitor_energy);
wire detected;wire [31:0] hits_a1,hits_a2,total_a1,total_a2;
reg [31:0] count_hits,count_total;
assign hits_a1=count_hits;assign total_a1=count_total;assign hits_a2=0;assign total_a2=0;
always @(posedge pc)if(!pr[2])begin count_hits<=0;count_total<=0;end
else if(dv&&!da&&!dinvalid)begin
 if(count_total!=32'hffffffff)count_total<=count_total+1;
 if(det&&count_hits!=32'hffffffff)count_hits<=count_hits+1;
end
wire calibrated=detector_diagnostic[1];wire detection_known;
wire [2:0] flight_phase=detection_known?(detected?3'd1:3'd0):3'd4;
live_detection_status alarm(pc,pr[2],link_good,detector_gap,dv&&!da,det,dinvalid,detected,detection_known);
reg [4:0] history;
reg [15:0] detector_restart_count,acquisition_restart_count;
reg overrun_last;
always @(posedge pc)if(!pr[2])begin history<=0;detector_restart_count<=0;acquisition_restart_count<=0;overrun_last<=0;end
else begin overrun_last<=dover;
if(dover&&!overrun_last&&detector_restart_count!=65535)detector_restart_count<=detector_restart_count+1;
if(gap&&acquisition_restart_count!=65535)acquisition_restart_count<=acquisition_restart_count+1;
if(detector_gap)history<=0;else if(dv)history<=dhist;
end
                                                                           
                                                                                     
wire [2:0] direction_ok;
wire [383:0] joint_samples=audio_packet[383:0];
wire ibg,imu,ifault;wire [2:0] iquality;wire [1:0] icoarse;
wire signed [31:0] ijx,ijy,ia1x,ia1y,ia2x,ia2y;
wire [31:0] ievidence,iprocessing,iwindows;wire [15:0] if0;wire [7:0] istage;
wire [7:0] stage=istage;
wire icandidate;wire signed [31:0] candidate_x,candidate_y,candidate_z;
joint15_localizer innovation(pc,pr[2],audio_valid,gap,joint_samples,1'b0,ibg,imu,iquality,
ijx,ijy,ia1x,ia1y,ia2x,ia2y,ievidence,if0,iprocessing,iwindows,istage,ifault,icoarse,icandidate,candidate_x,candidate_y,candidate_z);
                                                                        
                                                                           
                                                            
wire joint_clean=!gap;
assign direction_ok={iquality[2]&&joint_clean,iquality[1]&&joint_clean,(&iquality)&&joint_clean};
                                                                           
                                                                                  
wire candidate_usable=icandidate&&joint_clean&&!ifault;
wire midvalid,midav;wire [1:0] midmode;
wire [15:0] midage;wire [11:0] midaz;wire [9:0] midel;
wire signed [31:0] midux,miduy,midx,midy,midz;
xyz_estimate_tracker #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.VERTICAL_MM(`R19_VERTICAL_MM),.FAST_MODE(`R19_TRACK_MODE)) midpoint_tracker(pc,pr[2],imu,candidate_usable,(&iquality)&&joint_clean,
iprocessing/5000000,candidate_x,candidate_y,candidate_z,gap,midvalid,midmode,midage,
midx,midy,midz,midux,miduy,midaz,midel,midav);
wire use_midpoint=midvalid;
wire rdv=midvalid,rpv=midvalid,raz=midav;
wire [11:0] az=midaz;wire [9:0] el=midel;
wire signed [31:0] ux=midux,uy=miduy,px=midx,py=midy,pz=midz;
wire [15:0] age=midage;wire [1:0] track_mode=midmode;wire have_position=midvalid;
                                                                            
                                                                             
wire [127:0] levels;
audio_level_meter16 meters(pc,pr[2],audio_valid,gap,audio_packet[383:0],levels);
reg [26:0] uptime;
always @(posedge pc)if(!pr[2])uptime<=0;else if(uptime<100000000)uptime<=uptime+1;
                                                                         
                                                                            
                                                                           
                                                                               
reg [31:0] ui_outage_cycles;
always @(posedge pc)if(!pr[2]||link_good)ui_outage_cycles<=0;
else if(ui_outage_cycles<UI_FAULT_CYCLES)ui_outage_cycles<=ui_outage_cycles+1;
                                                                                       
                                                                                          
wire [2:0] status=detected?3'd3:!link_good&&ui_outage_cycles>=UI_FAULT_CYCLES?3'd4:!ever_audio?3'd0:3'd5;
wire display_direction=midvalid;
wire display_position=rpv;
wire [1:0] estimate_mode=track_mode;                                                            
wire [175:0] diagnostics={hits_a1,total_a1,hits_a2,total_a2,acquisition_restart_count,detector_restart_count,
8'd0,1'b0,gap,direction_ok,dinvalid,dover,link_good};
wire ui_ready,ui_overrun,ui_valid;wire [586:0] ui_packet;
                                                                            
                                                                          
reg [22:0] ui_refresh_counter;
always @(posedge pc)if(!pr[2])ui_refresh_counter<=0;
else ui_refresh_counter<=ui_refresh_counter==4999999?0:ui_refresh_counter+1;
wire send_ui=ui_refresh_counter==100&&ui_ready;
cdc_mailbox #(.WIDTH(587)) ui_cross(pc,pr[2],send_ui,
{diagnostics,audio_packet[463:432],estimate_mode,status,display_direction,raz,display_position,az,el,ux,uy,px,py,pz,age,stage,history,audio_packet[431:400],levels},
ui_ready,ui_overrun,lc,lr[2],ui_valid,ui_packet);
wire [10:0] lx,ly;wire [15:0] pixel,location_pixel,detection_pixel;
lcd_timing timing(lc,lr[2],pixel,lx,ly,rgb_tft,hsync,vsync,tft_de,tft_bl,tft_clk);
acoustic_dashboard #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.VERTICAL_MM(`R19_VERTICAL_MM),.BASELINE_MM(`R19_BASELINE_MM),.VARIANT_ID(`R19_VARIANT_ID)) location_display(lc,lr[2],lx,ly,
ui_packet[376:374],ui_packet[373],ui_packet[372],ui_packet[371],ui_packet[370:359],ui_packet[358:349],
ui_packet[348:317],ui_packet[316:285],ui_packet[284:253],ui_packet[252:221],ui_packet[220:189],
ui_packet[188:173],ui_packet[172:165],ui_packet[164:160],ui_packet[159:128],ui_packet[127:0],ui_packet[378:377],ui_packet[410:379],ui_packet[586:411],location_pixel);

wire detection_page,page_press;wire [7:0] read_column;wire [527:0] waveform;
wire [255:0] scope_dc;wire [63:0] scope_scales;wire [1:0] scope_good;
wire scope_display_valid,scope_alive;wire [31:0] scope_errors,scope_fixes,scope_frames;
r27_scope_frontend scope(ac,ar[2],lc,lr[2],av,ag,bad,adc_samples,error_count,corrected_total,
 lx==0&&ly==0,read_column,waveform,scope_dc,scope_scales,scope_good,scope_display_valid,
 scope_alive,scope_errors,scope_fixes,scope_frames);
wire det_ui_ready,det_ui_overrun,det_ui_valid;wire [5:0] det_ui_packet;
reg [19:0] det_refresh_count;
always @(posedge pc)if(!pr[2])det_refresh_count<=0;
else det_refresh_count<=det_refresh_count==999999?0:det_refresh_count+1;
cdc_mailbox #(.WIDTH(6)) det_ui_cross(pc,pr[2],det_refresh_count==100&&det_ui_ready,
 {calibrated,link_good,flight_phase,detected},det_ui_ready,det_ui_overrun,
 lc,lr[2],det_ui_valid,det_ui_packet);
r22_display detection_display(lc,lr[2],lx,ly,waveform,scope_dc,scope_scales,scope_good,
 scope_display_valid,scope_alive&&det_ui_packet[4],det_ui_packet[0],det_ui_packet[3:1],
 det_ui_packet[5],scope_errors,scope_fixes,read_column,detection_pixel);
r27_page_mux #(.DEBOUNCE_CYCLES(KEY_DEBOUNCE_CYCLES)) page_control(lc,lr[2],key4_n,
 lx==0&&ly==0,location_pixel,detection_pixel,pixel,detection_page,page_press);

endmodule
