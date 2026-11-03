`timescale 1ns/1ps
module tb_meter_replay;
reg clk=0;always #5 clk=~clk;reg rst=0,av=0,gap=0;reg [383:0] samples=0;
wire [127:0] levels;reg [383:0] recorded[0:12287];reg [127:0] expected[0:2];integer blockno,n;
audio_level_meter16 dut(clk,rst,av,gap,samples,levels);
initial begin
$readmemh("r14_meter_replay.mem",recorded);$readmemh("r14_meter_expected.mem",expected);
#20;rst=1;
for(blockno=0;blockno<3;blockno=blockno+1)begin
 @(negedge clk);av=0;gap=1;@(negedge clk);gap=0;
 samples=recorded[blockno*4096];av=1;repeat(16384)@(negedge clk);
 for(n=0;n<4096;n=n+1)begin samples=recorded[blockno*4096+n];av=1;@(negedge clk);end
 av=0;if(levels!==expected[blockno])$fatal(1,"real quiet block%0d level mismatch got%h expected%h",blockno,levels,expected[blockno]);
 $display("METER REPLAY block%0d levels=%h",blockno,levels);
end
samples=0;av=1;repeat(16384)@(negedge clk);av=0;
if(levels!==0)$fatal(1,"quiet zero did not clear in one window");
$display("METER REPLAY PASS:three real quiet16ch captures,4096-sample scale,subsequent silence decay");$finish;
end
initial begin #1000000;$fatal(1,"timeout");end
endmodule
