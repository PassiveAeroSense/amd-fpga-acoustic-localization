`timescale 1ns/1ps
module tb_dual_search;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:19151];
srp_localizer #(.CAPTURE_FRAMES(8)) dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
initial begin $readmemh("r9_dual_measured_cov.mem",covariance);
force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
#30;rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;
wait(up);#1;
$display("DUAL MEASURED RESULT a1=%0d,%0d a2=%0d,%0d quality=%0d cycles=%0d",ax,ay,bx,by,ok,ticks);
if(ok!=7||ax<579295421||ax>623295421||ay<-129374182||ay>-85374182||bx<-301172874||bx>-257172874||by<-150849018||by>-106849018)$fatal(1,"independent-array measured phase search mismatch");
$display("DUAL SEARCH PASS: independently selected peaks, real rewired covariance, both directions");$finish;
end
initial begin #500000000;$fatal(1,"dual search timeout");end
endmodule
