`timescale 1ns/1ps
module tb_features;
reg clk=0;always #5 clk=~clk;reg rst=0,load=0,start=0;reg [6:0] addr=0;reg [7:0] rd=0;reg signed [47:0] db=0;
wire signed [47:0] feature;wire busy,done,invalid;
detector_features dut(clk,rst,load,addr,db,start,rd,feature,busy,done,invalid);
reg [47:0] bands[0:96];integer i,f;
initial begin $readmemh("feature_test_bands.mem",bands);#30;rst=1;
for(i=0;i<97;i=i+1)begin @(negedge clk);load=1;addr=i;db=bands[i];end
@(negedge clk);load=0;start=1;@(negedge clk);start=0;wait(done);#1;if(invalid)$fatal(1,"features overflow");
f=$fopen("features_out.txt","w");for(i=0;i<218;i=i+1)begin @(negedge clk);rd=i;@(posedge clk);#1;$fwrite(f,"%0d\n",feature);end
$fclose(f);$display("FEATURES GENERATED");$finish;end
endmodule
