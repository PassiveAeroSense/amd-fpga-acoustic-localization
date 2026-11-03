`timescale 1ns/1ps
module tb_joint16_positions;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:36175];integer scene,k,tx,ty,tz;reg signed [63:0] ex,ey,ez;
joint15_localizer dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse,,,,);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
initial begin force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
for(scene=0;scene<3;scene=scene+1)begin
rst=0;cd=0;repeat(5)@(negedge clk);
if(scene==0)begin $readmemh("position_check_0.mem",covariance);tx=0;ty=0;tz=1000;end
else if(scene==1)begin $readmemh("position_check_1.mem",covariance);tx=600;ty=-400;tz=1500;end
else for(k=0;k<36176;k=k+1)covariance[k]=0;
rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;wait(up);#1;
if(scene<2)begin
ex=dut.candidate_x-tx;ey=dut.candidate_y-ty;ez=dut.candidate_z-tz;
if(ok!=7||evidence!=1440||ex*ex+ey*ey+ez*ez>10000)$fatal(1,"ideal position >100mm error");
$display("POSITION scene%0d target(%0d,%0d,%0d) result(%0d,%0d,%0d) cycles%0d",scene,tx,ty,tz,dut.candidate_x,dut.candidate_y,dut.candidate_z,ticks);
end else if(ok!=0||evidence!=0)$fatal(1,"zero covariance fabricated a position");
end
$display("JOINT16 POSITIONS PASS: two independent synthetic positions and zero-signal rejection");$finish;
end
initial begin #1600000000;$fatal(1,"position checks timeout");end
endmodule
