`timescale 1ns/1ps
module tb_repair;
reg clk=0;always #5 clk=~clk;reg rst=0,iv=0,ig=0;reg [1:0] bad=0;reg [255:0] data=0;
wire ov,og;wire [255:0] out;wire [31:0] fixed_count;
integer n,c,outputs=0,gaps=0;reg verify=1;
adc_frame_repair #(.WINDOW_FRAMES(100),.MAX_REPAIRS(3)) dut(clk,rst,iv,bad,ig,data,ov,out,og,fixed_count);
always @(posedge clk)begin #1;if(og)gaps=gaps+1;
if(ov)begin
if(verify)for(c=0;c<16;c=c+1)if($signed(out[c*16+:16])!==16'(outputs*60+c*6-300))$fatal(1,"repair or lane alignment failed");
outputs=outputs+1;end end
task sample(input integer k,input bit corrupt);
begin @(negedge clk);iv=1;bad=corrupt?1:0;
for(integer j=0;j<16;j=j+1)data[j*16+:16]=corrupt?16'h7fff:16'(k*60+j*6-300);
@(negedge clk);iv=0;repeat(4)@(negedge clk);end endtask
initial begin #20;rst=1;
                                                                            
for(n=0;n<14;n=n+1)sample(n,n==3||n==7||n==8);
if(fixed_count!=3||gaps!=0||outputs!=12)$fatal(1,"short gap counts");
verify=0;sample(14,1);sample(15,0);sample(16,0);
if(gaps==0||fixed_count!=3)$fatal(1,"repair budget not enforced");
@(negedge clk);rst=0;repeat(2)@(negedge clk);rst=1;gaps=0;
for(n=0;n<10;n=n+1)sample(n,n>=3&&n<=5);
if(gaps==0)$fatal(1,"three frame outage hidden");
@(negedge clk);ig=1;@(negedge clk);ig=0;if(!og&&dut.have_previous)$fatal(1,"timing gap not propagated");
$display("BOUNDED REPAIR interpolation16ch,2-frame limit,budget,hard-gap PASS");$finish;end
endmodule
