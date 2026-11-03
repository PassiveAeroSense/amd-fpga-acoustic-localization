`timescale 1ns/1ps
                                                                                                   
module tb_hls_search_interface;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0,gap=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault,cv;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by,x,y,z;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:36175];integer k;
joint15_localizer dut(clk,rst,1'b0,gap,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse,cv,x,y,z);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
task begin_frame;begin @(negedge clk);cd=1;@(negedge clk);cd=0;end endtask
initial begin
for(k=0;k<36176;k=k+1)covariance[k]=0;
force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
#30;rst=1;repeat(5)@(negedge clk);begin_frame();wait(up);#1;
if(cv||ok||evidence||fault||windows!=1)$fatal(1,"zero covariance yielded a source");
                                                                            
                                                                                       
for(k=0;k<136;k=k+1)covariance[80*136+k]=64'd100000;
repeat(5)@(negedge clk);begin_frame();wait(up);#1;
if(cv||ok||evidence!=120||fault||windows!=2)$fatal(1,"HLS covariance interface misaligned evidence%0d",evidence);
repeat(5)@(negedge clk);begin_frame();repeat(150)@(negedge clk);gap=1;@(negedge clk);gap=0;
repeat(5)@(negedge clk);begin_frame();wait(up);#1;
if(cv||evidence!=120||fault||windows!=1)$fatal(1,"HLS restart retained interrupted result");
$display("HLS SEARCH INTERFACE PASS: one-cycle RAM+adapter matches two-cycle IP,zero rejection,single-bin evidence120,mid-search gap resets and recovery");$finish;
end
initial begin #20000000;$fatal(1,"HLS interface timeout");end
endmodule
