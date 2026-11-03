`timescale 1ns/1ps
module tb_hls_detector;
reg clk=0;always #5 clk=~clk;reg rst=0,load=0,start=0,arr=0,valid=1,newseq=0;
reg [6:0] addr=0;reg signed [47:0] db=0;wire busy,done,ra,invalid,hit;wire signed [31:0] score;wire signed [63:0] sum;wire [4:0] count;
dual_detector_backend dut(clk,rst,load,addr,db,start,arr,valid,newseq,busy,done,ra,invalid,hit,score,sum,count);
reg [47:0] features[0:143*218-1];reg signed [31:0] expected[0:142];reg signed [63:0] expected_sum;
integer i,j,hits=0;
initial begin
$readmemh("v2_features.mem",features);$readmemh("v2_scores.mem",expected);#30;rst=1;expected_sum=0;
for(i=0;i<143;i=i+1)begin
for(j=0;j<97;j=j+1)begin @(negedge clk);load=1;addr=j;db=features[i*218+j];end
@(negedge clk);load=0;start=1;newseq=i==0;@(negedge clk);start=0;wait(done);#1;
expected_sum=expected_sum+$signed(expected[i]);if(i>=3)expected_sum=expected_sum-$signed(expected[i-3]);
if(invalid||ra||score!==expected[i])$fatal(1,"HLS feature/tree mismatch window%0d got%0d expected%0d",i,score,expected[i]);
if(sum!==expected_sum||count!==(i<2?i+1:3))$fatal(1,"HLS history mismatch");
if(hit!==(expected_sum>64'sd50331648*(i<2?i+1:3)))$fatal(1,"HLS decision mismatch");if(hit)hits=hits+1;
end
@(negedge clk);valid=0;start=1;@(negedge clk);start=0;wait(done);#1;
if(!invalid||hit||count!=0)$fatal(1,"HLS invalid did not clear history");
$display("HLS DETECTOR PASS:143 recorded raw-band windows vs frozen R16 feature/tree scores and rolling decisions;positive windows%0d",hits);$finish;
end
initial begin #100000000;$fatal(1,"HLS detector timeout");end
endmodule
