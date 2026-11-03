`timescale 1ns/1ps
`include "detector_config.vh"
`define DETECTOR_TEST_COUNT 143
module tb_v2_detector;
reg clk=0;always #5 clk=~clk;reg rst=0,load=0,start=0,valid=1,seq=0;reg [7:0] addr=0;reg signed [47:0] feature=0;
wire busy,done,invalid,hit;wire signed [31:0] score;wire signed [63:0] sum;wire [4:0] count;
drone_tree_detector dut(clk,rst,load,addr,feature,start,valid,seq,busy,done,invalid,hit,score,sum,count);
reg [47:0] features[0:`DETECTOR_TEST_COUNT*218-1];reg [31:0] expected[0:`DETECTOR_TEST_COUNT-1];
reg sequences[0:`DETECTOR_TEST_COUNT-1],hits[0:`DETECTOR_TEST_COUNT-1];integer i,j,f;
initial begin
$readmemh("v2_features.mem",features);$readmemh("v2_scores.mem",expected);
for(i=0;i<143;i=i+1)begin sequences[i]=i==0;hits[i]=0;end
#30;rst=1;f=$fopen("detector_out.txt","w");
for(i=0;i<`DETECTOR_TEST_COUNT;i=i+1)begin
for(j=0;j<218;j=j+1)begin @(negedge clk);load=1;addr=j;feature=features[i*218+j];end
@(negedge clk);load=0;seq=sequences[i];start=1;@(negedge clk);start=0;wait(done);#1;
if(invalid||score!==expected[i])$fatal(1,"detector mismatch sample %d score %d expected %d hit %d expected %d",i,score,$signed(expected[i]),hit,hits[i]);
if(count!=(i<2?i+1:3))$fatal(1,"history length");
if(hit!==(sum>$signed(`DETECTOR_THRESHOLD)*$signed({1'b0,count})))$fatal(1,"threshold mismatch");
$fwrite(f,"%0d %0d %0d %0d\n",score,hit,sum,count);
end
@(negedge clk);valid=0;start=1;@(negedge clk);start=0;#1;
if(!invalid||hit||count!=0)$fatal(1,"invalid frame did not clear detector history");
$fclose(f);$display("DETECTOR PASS %0d real feature windows and invalid frame clearing",`DETECTOR_TEST_COUNT);$finish;
end
initial begin #100000000;$fatal(1,"detector timeout");end
endmodule
