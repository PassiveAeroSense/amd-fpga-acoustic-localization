`timescale 1ns/1ps
module tb_backend;
reg clk=0;always #5 clk=~clk;reg rst=0,load=0,start=0,array_id=0,valid=1,newseq=0;reg [6:0] addr=0;reg signed [47:0] db=0;
wire busy,done,ra,invalid,hit;wire signed [31:0] score;wire signed [63:0] sum;wire [4:0] count;
dual_detector_backend dut(clk,rst,load,addr,db,start,array_id,valid,newseq,busy,done,ra,invalid,hit,score,sum,count);
reg [47:0] bands[0:96];reg signed [31:0] first_score;integer i,j;
initial begin $readmemh("feature_test_bands.mem",bands);#30;rst=1;
for(j=0;j<8;j=j+1)begin
for(i=0;i<97;i=i+1)begin @(negedge clk);load=1;addr=i;db=bands[i];end
@(negedge clk);load=0;start=1;array_id=j%2;newseq=j<2;@(negedge clk);start=0;wait(done);#1;
if(invalid||ra!=j%2||count!=j/2+1)$fatal(1,"dual detector output/history mismatch");
if(j==0)first_score=score;else if(score!=first_score)$fatal(1,"shared feature result changed");
end
@(negedge clk);valid=0;array_id=0;newseq=0;start=1;@(negedge clk);start=0;wait(done);#1;
if(!invalid||hit||count!=0)$fatal(1,"invalid frame not forwarded");
$display("BACKEND PASS feature-tree handoff, separate A1/A2 histories and invalid-frame clearing");$finish;
end
initial begin #10000000;$fatal(1,"backend timeout");end
endmodule
