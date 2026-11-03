`timescale 1ns/1ps
module tb_hemisphere;
`include "hemisphere_count.vh"
reg clk=0;always #5 clk=~clk;reg rst=0,start=0,prior=0;reg [1:0] mask=3,quality=3;
reg signed [31:0] ax,ay,bx,by,px,py,pz;wire busy,done,invalid,range_weak;
wire signed [31:0] x,y,z;wire [31:0] error_value,cycles;
hemisphere_fit dut(clk,rst,start,mask,quality,ax,ay,bx,by,prior,px,py,pz,busy,done,invalid,range_weak,x,y,z,error_value,cycles);
reg [31:0] vectors[0:CASES*10-1];integer i,f;reg signed [63:0] radius2;
initial begin $readmemh("hemisphere_vectors.mem",vectors);#30;rst=1;f=$fopen("hemisphere_out.txt","w");
for(i=0;i<CASES;i=i+1)begin
@(negedge clk);ax=vectors[i*10];ay=vectors[i*10+1];bx=vectors[i*10+2];by=vectors[i*10+3];
mask=vectors[i*10+4];quality=vectors[i*10+5];prior=vectors[i*10+6];px=vectors[i*10+7];py=vectors[i*10+8];pz=vectors[i*10+9];
start=1;@(negedge clk);start=0;wait(done);#1;
radius2=$signed(x)*$signed(x)+$signed(y)*$signed(y)+$signed(z)*$signed(z);
if(invalid||z<0||radius2>100000000||(^x===1'bx))$fatal(1,"invalid bounded fit scene%0d",i);
$fwrite(f,"%0d %0d %0d %0d %0d %0d %0d\n",i,x,y,z,error_value,range_weak,cycles);
$display("BOUNDED scene=%0d xyz=%0d,%0d,%0d cycles=%0d",i,x,y,z,cycles);
end
@(negedge clk);mask=0;start=1;@(negedge clk);start=0;#1;if(!invalid)$fatal(1,"no observations must not fabricate first position");
$fclose(f);$display("HEMISPHERE bounded geometry generated; independent oracle required");$finish;
end
initial begin #500000000;$fatal(1,"hemisphere timeout");end
endmodule
