`timescale 1ns/1ps
module tb_a1_search;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:19151];
srp_localizer #(.CAPTURE_FRAMES(8)) dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
integer n;
initial begin $readmemh("r7_a1_measured_cov.mem",covariance);
force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
#30;rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;
wait(up);#1;
$display("A1 MEASURED RESULT ux=%0d uy=%0d quality=%0d cycles=%0d",ax,ay,ok,ticks);
                                                                         
                                                                         
if(ok!=2||ax<450000000||ax>580000000||ay<0||ay>110000000)$fatal(1,"measured A1 direction rejected/incorrect");
@(negedge clk);rst=0;for(n=0;n<19152;n=n+1)covariance[n]=0;
repeat(4)@(negedge clk);rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;
wait(up);#1;if(ok!=0)$fatal(1,"zero signal manufactured a direction");
$display("A1 SEARCH PASS measured covariance, independent direction, zero-signal rejection");$finish;
end
initial begin #500000000;$fatal(1,"A1 search timeout");end
endmodule
