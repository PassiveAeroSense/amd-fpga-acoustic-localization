`timescale 1ns/1ps
module tb_position_tracker;
reg clk=0;always #5 clk=~clk;reg rst=0,up=0,good=1,gap=0;
reg signed [31:0] ix=1000,iy=0,iz=1000;reg [11:0] iaz=0;reg [9:0] iel=450;
wire valid,av;wire [1:0] mode;wire [15:0] age;wire signed [31:0] x,y,z,ux,uy;wire [11:0] az;wire [9:0] el;
position_tracker #(.TENTH_CYCLES(1000),.HOLD_TENTHS(120)) dut(clk,rst,up,good,16'd30,ix,iy,iz,iaz,iel,gap,valid,mode,age,x,y,z,ux,uy,az,el,av);
task obs;begin @(negedge clk);up=1;@(negedge clk);up=0;repeat(400)@(negedge clk);end endtask
initial begin #30;rst=1;obs();if(valid)$fatal(1,"single initial outlier locked");obs();if(!valid||x!=1000)$fatal(1,"consistent lock failed");
gap=1;repeat(5)@(negedge clk);gap=0;if(!valid||mode!=2||x!=1000)$fatal(1,"gap erased last known position");
good=0;obs();if(!valid||x!=1000)$fatal(1,"missing observation erased track");
good=1;ix=-1000;iaz=1800;obs();if(x!=1000)$fatal(1,"one opposite outlier moved track");obs();if(x!=1000)$fatal(1,"two opposite outliers moved track");obs();if(x!= -1000||az<1790||az>1810)$fatal(1,"confirmed relocation not accepted");
ix=-900;obs();if(x!= -950)$fatal(1,"small motion not smoothed");
repeat(121000)@(negedge clk);if(valid||mode!=3)$fatal(1,"expired location still live");
$display("TRACKER PASS: confirmation,gap hold,jump rejection,reacquisition,smoothing,expiry");$finish;end
initial begin #3000000;$fatal(1,"tracker timeout");end
endmodule
