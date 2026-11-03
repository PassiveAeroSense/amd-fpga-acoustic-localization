`timescale 1ns/1ps
module tb_r19_control;
reg clk=0;always #10 clk=~clk;reg rst=0,up=0,can=1,high_conf=1,gap=0;
reg signed [31:0] ix=0,iy=0,iz=1000;
wire v0,v1;wire [1:0] m0,m1;wire [15:0] a0,a1;wire signed [31:0] x0,y0,z0,x1,y1,z1,u0,w0,u1,w1;wire [11:0] az0,az1;wire [9:0] el0,el1;wire av0,av1;
xyz_estimate_tracker #(.HORIZONTAL_MM(20000),.VERTICAL_MM(20000),.FAST_MODE(0)) slow(clk,rst,up,can,high_conf,16'd0,ix,iy,iz,gap,v0,m0,a0,x0,y0,z0,u0,w0,az0,el0,av0);
xyz_estimate_tracker #(.HORIZONTAL_MM(20000),.VERTICAL_MM(20000),.FAST_MODE(1)) fast(clk,rst,up,can,high_conf,16'd0,ix,iy,iz,gap,v1,m1,a1,x1,y1,z1,u1,w1,az1,el1,av1);
reg rv=0,pos=0,invalid=0;wire alarm;wire [27:0] remain;wire [31:0] ha,hb,ta,tb;
detection_event_hold #(.HOLD_CYCLES(8)) latch(clk,rst,rv,1'b0,pos,invalid,alarm,remain,ha,hb,ta,tb);
task candidate(input signed [31:0] x,y,z);begin
 @(negedge clk);ix=x;iy=y;iz=z;up=1;@(negedge clk);up=0;repeat(1500)@(negedge clk);
end endtask
initial begin
 repeat(5)@(negedge clk);rst=1;repeat(5)@(negedge clk);
 candidate(0,0,1000);if(!v0||!v1||z0!=1000||z1!=1000)$fatal(1,"initial candidate");
 candidate(5000,0,3000);if(x1!=5000||x0!=0)$fatal(1,"fast high_conf change should update on first result; precision should confirm");
 candidate(5000,0,3000);if(x0!=0)$fatal(1,"precision second result");
 candidate(5000,0,3000);if(x0!=5000)$fatal(1,"precision third result");
 candidate(19000,6000,20000);candidate(19000,6000,20000);candidate(19000,6000,20000);
 if(x0!=19000||y0!=6000||z0!=20000||z1!=20000)$fatal(1,"valid cylinder corner outside old sphere rejected");
 candidate(19000,9000,20000);candidate(19000,9000,20000);candidate(19000,9000,20000);
 if(y0!=6000||y1!=6000)$fatal(1,"horizontal circle bound failed");
 candidate(19000,6000,20001);if(z0!=20000||z1!=20000)$fatal(1,"vertical bound failed");
 gap=1;candidate(-5000,0,1000);if(x1!=19000)$fatal(1,"gap moved position");gap=0;
 rv=1;pos=1;invalid=1;@(negedge clk);rv=0;repeat(10)@(negedge clk);if(alarm)$fatal(1,"invalid detection latched");
 rv=1;pos=1;invalid=0;@(negedge clk);rv=0;pos=0;repeat(1000)@(negedge clk);
 if(!alarm||ha!=1||ta!=1)$fatal(1,"first detection did not persist beyond legacy hold interval");
 rst=0;repeat(3)@(negedge clk);if(alarm)$fatal(1,"reset did not clear detection latch");
 $display("R19 CONTROL PASS: first high_conf fast update, precision confirmation, cylindrical bounds, acquisition gap hold, permanent first-real-detection latch and reset");$finish;
end
initial begin #2000000;$fatal(1,"R19 control timeout");end
endmodule
