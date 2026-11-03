`timescale 1ns/1ps
module tb_cs_margin;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0,first=0;reg [15:0] d1=0,d2=0;
wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;wire [255:0] samples;wire [31:0] seq,tc,oc,dc;wire [127:0] kinds;
wire delayed_cs;assign #300 delayed_cs=cs[1];integer index1=0,index2=0,count=0,j;
ad7606_dual_fast #(.STARTUP(10)) dut(clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,);
always @(posedge conv)begin #40;busy=3;#4110;busy=0;end
always @(negedge cs[0])index1=0;
always @(negedge delayed_cs)index2=0;
always @(negedge rd)begin #50;
if(!cs[0])begin d1=100+(index1%8);first[0]=index1%8==0;index1=index1+1;end
if(!delayed_cs)begin d2=200+(index2%8);first[1]=index2%8==0;index2=index2+1;end end
always @(posedge clk)if(valid)begin
if(bad||tc||oc||dc)$fatal(1,"CS propagation skew broke read");
for(j=0;j<8;j=j+1)if(samples[j*16+:16]!=100+j||samples[128+j*16+:16]!=200+j)$fatal(1,"skew changed channel order");
count=count+1;if(count==20)begin $display("CS MARGIN PASS 300ns CS delay,50ns RD delay,20frames all16channels");$finish;end end
initial begin #30;rst=1;#2000000;$fatal(1,"margin timeout");end
endmodule
