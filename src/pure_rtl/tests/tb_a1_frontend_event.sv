`timescale 1ns/1ps
                                                                             
                                                                              
module tb_a1_frontend_event;
reg clk=0;always #5 clk=~clk;reg rst=0,fd=0;
wire rv,ra,hit,inv,over;wire signed [31:0] raw;wire signed [63:0] sum;
wire [4:0] hist;wire [31:0] wn,we,cycles;wire [2:0] diag;
integer k,events=0;
detector_audio_frontend dut(clk,rst,1'b0,1'b0,384'd0,rv,ra,hit,inv,raw,sum,hist,wn,we,over,cycles,diag);
always @(posedge clk)if(rv)begin events<=events+1;if(ra)$fatal(1,"A2 detection emitted");end
initial begin
force dut.fd=fd;force dut.fi=0;force dut.pv=64'd1000000;
#30;rst=1;
for(k=0;k<10;k=k+1)begin
@(negedge clk);fd=1;@(negedge clk);fd=0;
wait(dut.state!=0);wait(dut.state==0);end
repeat(3000)@(negedge clk);
if(events!=1||over||dut.arr!=0)$fatal(1,"A1-only window count/schedule failed events%0d",events);
$display("A1 FRONTEND PASS: ten STFT frames -> exactly one A1 classification, no A2 inference");$finish;
end
initial begin #10000000;$fatal(1,"frontend timeout");end
endmodule
