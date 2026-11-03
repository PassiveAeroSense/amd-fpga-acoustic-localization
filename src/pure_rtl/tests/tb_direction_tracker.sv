`timescale 1ns/1ps
module tb_direction_tracker;
reg clk=0;always #10 clk=~clk;
reg rst=0,update=0,good=1,gap=0;reg signed [31:0] ix=0,iy=0;
wire valid,av;wire [1:0] mode;wire [15:0] age;wire signed [31:0] ux,uy;wire [11:0] az;wire [9:0] el;
direction_tracker #(.TENTH_CYCLES(10000),.HOLD_TENTHS(12)) dut(clk,rst,update,good,16'd1,ix,iy,gap,valid,mode,age,ux,uy,az,el,av);
task sample(input signed [31:0] x,y,input g);
begin @(negedge clk);ix=x;iy=y;good=g;update=1;@(negedge clk);update=0;repeat(200)@(negedge clk);end endtask
initial begin
#50;rst=1;sample(0,0,1);
if(!valid||el<899||av)$fatal(1,"first overhead direction not immediately shown");
sample(0,0,0);if(!valid||mode!=2)$fatal(1,"miss cleared held direction");
@(negedge clk);gap=1;@(negedge clk);gap=0;
if(!valid)$fatal(1,"gap cleared held direction");
sample(900000000,0,1);if(ux!=0)$fatal(1,"unconfirmed jump accepted");
sample(900000000,0,1);if(!valid||ux!=900000000||!av)$fatal(1,"confirmed new direction rejected");
sample(800000000,0,1);if(ux!=850000000)$fatal(1,"smooth update wrong");
repeat(130000)@(negedge clk);if(valid)$fatal(1,"stale direction did not expire");
$display("DIRECTION TRACKER PASS first lock,miss/gap hold,jump confirmation,smoothing,expiry");$finish;
end
initial begin #5000000;$fatal(1,"timeout");end
endmodule
