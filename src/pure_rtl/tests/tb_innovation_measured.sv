`timescale 1ns/1ps
module tb_innovation_measured;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:31919];reg [63:0] cv;
joint15_localizer dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse,,,,);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
integer n;
initial begin $readmemh("innovation_measured.mem",covariance);
force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
#30;rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;
wait(up);#1;
$display("JOINT15 RESULT xyz %0d %0d %0d support %0d score %0d cycles %0d",dut.best_x,dut.best_y,dut.best_z,evidence,dut.best_score,ticks);
if(ok!=7||evidence<1000||dut.best_x<50||dut.best_x>350||dut.best_y< -300||dut.best_y>20||dut.best_z<750||dut.best_z>1150)$fatal(1,"15ch spherical search failed");
for(n=0;n<105;n=n+1)if(dut.pairmap[n][7:4]>=15||dut.pairmap[n][3:0]>=15)$fatal(1,"CH16 entered pairmap");
$display("MEASURED INNOVATION PASS complete105-pair covariance frontend and whole grid");$finish;
end
initial begin #1800000000;$fatal(1,"joint search timeout");end
endmodule
