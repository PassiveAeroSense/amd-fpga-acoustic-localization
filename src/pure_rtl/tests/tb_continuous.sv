`timescale 1ns/1ps
module tb_continuous;
reg clk=0;always #5 clk=~clk;reg rst=0,update=0;reg [1:0] available=3,quality=0;
wire rv,dv,pv,av,coarse,held;wire [11:0] az;wire [9:0] el;wire signed [31:0] ux,uy,x,y,z;wire [31:0] err;
continuous_results dut(clk,rst,update,1'b1,available,quality,
32'sd611821186,-32'sd489456949,32'sd412435659,-32'sd549914212,
rv,dv,pv,av,az,el,ux,uy,x,y,z,err,coarse,held);
task submit;begin @(negedge clk);update=1;@(negedge clk);update=0;end endtask
initial begin #30;rst=1;submit;wait(rv);#1;
if(!pv||!dv||!coarse||held||x!=2000||y!=-2000||z!=3000||az!=3150)$fatal(1,"coarse output lost or wrong %d %d %d %d",x,y,z,az);
available=0;submit;repeat(5)@(negedge clk);
if(!held||!pv||!dv||rv||x!=2000||y!=-2000||z!=3000)$fatal(1,"missing observation did not hold previous position honestly");
available=1;submit;wait(rv);#1;if(!pv||!coarse||held)$fatal(1,"single-array fallback did not recover");
@(negedge clk);rst=0;@(posedge clk);#1;if(pv||dv)$fatal(1,"fault/reset retained stale position");
$display("CONTINUOUS coarse output, missing-window hold, single-array recovery and reset PASS");$finish;end
initial begin #100000000;$fatal(1,"continuous timeout");end
endmodule
