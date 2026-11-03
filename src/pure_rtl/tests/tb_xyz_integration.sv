`timescale 1ns/1ps
module tb_xyz_integration;
reg clk=0;always #10 clk=~clk;reg rst=0;reg [623:0] packet=0;integer k;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
for(k=0;k<16;k=k+1)packet[k*24+:24]=k*257+123;packet[623:592]=20;
force dut.audio_packet=packet;force dut.detector_packet={16'd0,packet[191:0]};force dut.audio_valid=1;force dut.gap=0;
force dut.istage=0;force dut.iquality=7;
force dut.icandidate=1;force dut.ifault=0;force dut.imu=0;
repeat(2)@(negedge dut.pc);force dut.istage=1;
#1;if(dut.direction_ok!=7||dut.joint_samples!==packet[383:0])$fatal(1,"clean data/all16 mapping");
if(dut.detection.audio_samples[383:192]!=0||dut.detection.audio_samples[191:0]!==packet[191:0])$fatal(1,"A2 entered detector");
packet[623:592]=21;repeat(2)@(negedge dut.pc);force dut.istage=30;
if(!dut.joint_clean||!dut.candidate_usable||dut.direction_ok!=7)$fatal(1,"repaired ADC2 raw error vetoed joint window");
force dut.gap=1;repeat(2)@(negedge dut.pc);
if(dut.joint_clean||dut.candidate_usable||dut.direction_ok!=0)$fatal(1,"hard acquisition gap accepted");
force dut.gap=0;
force dut.istage=0;repeat(2)@(negedge dut.pc);force dut.istage=1;repeat(2)@(negedge dut.pc);force dut.istage=30;
packet[623:592]=22;repeat(2)@(negedge dut.pc);
if(!dut.joint_clean||!dut.candidate_usable)$fatal(1,"post-capture error incorrectly discarded complete covariance");
force dut.iquality=0;force dut.detected=0;force dut.iprocessing=32'd5000000;
force dut.candidate_x=-32'sd1000;force dut.candidate_y=32'sd200;force dut.candidate_z=32'sd1500;
force dut.imu=1;@(negedge dut.pc);force dut.imu=0;wait(dut.midvalid);@(negedge dut.pc);
if(!dut.display_position||dut.px!=-1000||dut.py!=200||dut.pz!=1500||dut.track_mode!=0)$fatal(1,"weak clean candidate hidden or relabeled strong");
force dut.gap=1;repeat(2)@(negedge dut.pc);
if(!dut.display_position||dut.track_mode!=2)$fatal(1,"acquisition gap erased XYZ");
force dut.gap=0;force dut.midpoint_tracker.age=16'd500;repeat(2)@(negedge dut.pc);
if(!dut.display_position||dut.px!=-1000||dut.track_mode!=3)$fatal(1,"historical XYZ disappeared");
$display("XYZ INTEGRATION PASS: all16 mapping,A1 detector,raw ADC2 errors do not veto repaired window,hard gap rejected,direct low-confidence XYZ,persistent history");$finish;
end
initial begin #1000000;$fatal(1,"R13 integration timeout");end
endmodule
