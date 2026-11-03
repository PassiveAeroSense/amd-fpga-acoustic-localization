`timescale 1ns/1ps
module tb_dual_integration;
reg clk=0;always #10 clk=~clk;reg rst=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
force dut.audio_packet={32'd20,592'd0};force dut.stage=0;force dut.gap=0;
force dut.search_quality=7;@(negedge dut.pc);@(negedge dut.pc);force dut.stage=30;
#1;if(dut.direction_ok!=7)$fatal(1,"clean dual window rejected");
force dut.audio_packet={32'd21,592'd0};#1;
if(dut.direction_ok!=2)$fatal(1,"ADC2 fault accepted in joint geometry or poisoned A1");
force dut.stage=0;@(negedge dut.pc);@(negedge dut.pc);force dut.stage=30;
#1;if(dut.direction_ok!=7)$fatal(1,"new clean window did not recover");
force dut.search_quality=4;#1;if(dut.direction_ok!=0)$fatal(1,"A2-only reference falsely labeled A1");
force dut.audio_packet={32'd21,208'd0,{16{24'h123456}}};#1;
if(dut.localization_samples[287:264]!=0||dut.localization_samples[383:360]!=24'h123456||dut.localization_samples[263:240]!=24'h123456)$fatal(1,"AI11 mask damaged active neighboring inputs");
force dut.a1dv=1;force dut.a1age=5;force dut.a1az=12'd100;force dut.a1el=10'd600;
force dut.midvalid=0;#1;
if(!dut.display_direction||dut.display_position||dut.az!=100||dut.el!=600)$fatal(1,"primary fallback hidden");
force dut.midvalid=1;force dut.midage=5;force dut.midaz=12'd0;force dut.midel=10'd900;force dut.midx=0;force dut.midy=0;force dut.midz=1000;
#1;if(!dut.display_position||dut.az!=0||dut.el!=900||dut.pz!=1000)$fatal(1,"midpoint track not selected");
force dut.midage=50;force dut.midmode=2;#1;
if(!dut.display_position||dut.track_mode!=2||dut.age!=50)$fatal(1,"missed observation lost held midpoint");
force dut.midage=120;#1;
if(dut.display_position||dut.az!=100||!dut.display_direction)$fatal(1,"expired midpoint did not fall back to primary");
$display("DUAL INTEGRATION PASS: error propagation, clean-window recovery, corrected bad input, separate coordinate origins, held midpoint and primary fallback");$finish;
end
initial begin #1000000;$fatal(1,"dual integration timeout");end
endmodule
