`timescale 1ns/1ps
module tb_r3_integration;
reg clk=0;always #10 clk=~clk;reg rst=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
force dut.av=1;force dut.ag=0;force dut.bad=2'b10;
repeat(4)@(negedge dut.ac);
if(dut.repair.bad1)$fatal(1,"ADC2 error poisoned primary frame history");
force dut.bad=2'b01;repeat(2)@(negedge dut.ac);
if(!dut.repair.bad1)$fatal(1,"ADC1 error bypassed primary guard");
release dut.av;release dut.ag;release dut.bad;
force dut.audio_valid=0;force dut.silence=0;force dut.fatal_sync=0;force dut.link_good=1;force dut.ever_audio=1;
force dut.dv=0;force dut.dinvalid=0;force dut.da=1;force dut.det=1;force dut.dhist=1;force dut.dover=0;
force dut.mfault=0;force dut.rdv=1;force dut.rpv=1;force dut.have_position=1;force dut.age=10;
#1;if(!dut.display_direction||!dut.display_position||dut.detected)$fatal(1,"negative detection hid valid source");
force dut.rpv=0;force dut.have_position=0;
#1;if(!dut.display_direction||dut.display_position)$fatal(1,"direction still requires XYZ");
force dut.rpv=1;force dut.have_position=1;
@(negedge dut.pc);force dut.dv=1;@(negedge dut.pc);force dut.dv=0;
#1;if(!dut.detected||dut.detection_remaining!=200000000||dut.status!=3)$fatal(1,"single positive four-second policy failed");
force dut.dover=1;repeat(3)@(negedge dut.pc);
#1;if(dut.gap||!dut.detector_gap||!dut.localizer.rn||!dut.display_direction||dut.status!=3)$fatal(1,"detector failure reset/hid localization or event");
force dut.dover=0;force dut.fatal_sync=1;force dut.link_good=0;repeat(3)@(negedge dut.pc);
#1;if(dut.status!=3||!dut.detected||!dut.display_direction)$fatal(1,"acquisition loss must retain alarm and tracked last-known source");
force dut.fatal_sync=0;force dut.link_good=1;force dut.det=0;force dut.dv=1;@(negedge dut.pc);force dut.dv=0;
#1;if(dut.status!=3)$fatal(1,"negative cancelled hold");
@(negedge dut.pc);dut.alarm.remaining=1;@(negedge dut.pc);
#1;if(dut.detected||dut.status!=5||!dut.display_direction||!dut.display_position)$fatal(1,"expiry hid independent location");
$display("R3 INTEGRATION PASS: detector-only reset, acquisition invalidation, one-hit 4s hold, independent direction and XYZ");$finish;
end
initial begin #1000000;$fatal(1,"integration timeout");end
endmodule
