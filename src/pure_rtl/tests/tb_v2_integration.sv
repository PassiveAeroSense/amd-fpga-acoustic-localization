`timescale 1ns/1ps
module tb_v2_integration;
reg clk=0;always #10 clk=~clk;reg rst=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
force dut.gap=1;repeat(2)@(negedge dut.pc);force dut.gap=0;force dut.dover=0;force dut.link_good=1;
force dut.dv=0;force dut.dinvalid=0;force dut.da=0;force dut.det=1;force dut.dhist=3;
force dut.mfault=1;force dut.rdv=0;force dut.rpv=0;
@(negedge dut.pc);force dut.dv=1;@(negedge dut.pc);force dut.dv=0;
#1;if(dut.detected!=0)$fatal(1,"single spike produced alarm");
@(negedge dut.pc);force dut.dv=1;@(negedge dut.pc);force dut.dv=0;
#1;if(dut.status!=3)$fatal(1,"two positives did not trigger independently of localization");
@(negedge dut.pc);dut.detection_ttl[0]=2;force dut.det=0;repeat(4)@(negedge dut.pc);
#1;if(dut.detected!=0)$fatal(1,"alarm did not expire");
force dut.mfault=0;force dut.rdv=1;force dut.rpv=0;force dut.have_position=1;force dut.age=0;
#1;if(dut.status!=5||!dut.display_direction||dut.display_position)$fatal(1,"source direction must show independently of drone identity");
force dut.gap=1;@(negedge dut.pc);#1;if(dut.detected!=0||dut.history!=0)$fatal(1,"gap did not clear detection");
force dut.link_good=0;#1;if(dut.display_direction)$fatal(1,"bad link displayed stale direction");
$display("V2 INTEGRATION PASS: two-hit event, TTL, independent source direction, gap clearing");$finish;
end
initial begin #1000000;$fatal(1,"integration timeout");end
endmodule
