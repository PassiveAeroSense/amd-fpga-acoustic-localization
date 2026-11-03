`timescale 1ns/1ps
module tb_r22_scope;
reg clk=0;always #15 clk=~clk;reg rst=0,sv=0,det=0;reg [255:0] samples=0;
wire [10:0] x,y;wire [7:0] column;wire [527:0] waveform;wire [255:0] dc,pp;wire [63:0] scales;wire [159:0] clip;
wire [1:0] good;wire valid,ready;wire [31:0] captures;wire [15:0] pixel,rgb;wire hs,vs,de,bl,pclk;
scope_capture capture(clk,rst,sv,samples,2'b00,x==0&&y==0,column,waveform,dc,pp,scales,clip,good,valid,ready,captures);
r22_display display(clk,rst,x,y,waveform,dc,scales,good,valid,1'b1,det,det?3'd2:3'd0,1'b1,32'h12,32'h34,column,pixel);
lcd_timing raster(clk,rst,pixel,x,y,rgb,hs,vs,de,bl,pclk);
integer phase=0,sample_no=0,ch,f,count,scene;real a;
always @(negedge clk)if(rst)begin
sv=0;phase=phase+48000;
if(phase>=33333333)begin
phase=phase-33333333;sample_no=sample_no+1;sv=1;
for(ch=0;ch<16;ch=ch+1)begin a=6.28318530718*(300+ch*100)*sample_no/48000.0;
samples[ch*16+:16]=$rtoi((ch-7)*500+(400+ch*70)*$sin(a)+180*$sin(a*2.3));end
end end
initial begin #100;rst=1;wait(captures>=2&&valid);
for(scene=0;scene<2;scene=scene+1)begin
det=scene;wait(x==0&&y==0);@(negedge clk);
wait(x==0&&y==0);f=scene==0?$fopen("r22_not_detected.hex","w"):$fopen("r22_detected.hex","w");count=0;
while(count<384000)begin @(posedge clk);#1;if(de)begin
if(^rgb===1'bx)$fatal(1,"unknown raster pixel");$fwrite(f,"%04x\n",rgb);count=count+1;end end
$fclose(f);
end
if(good!=3||captures<4)$fatal(1,"scope not live");
for(ch=0;ch<16;ch=ch+1)if(pp[ch*16+:16]==0)$fatal(1,"missing waveform channel%0d",ch);
$display("R22_SCOPE_PASS 48k raw16 channels, live double-buffering, two full LCD rasters, no unknown pixels captures%0d",captures);$finish;
end
initial begin #180000000;$fatal(1,"scope timeout");end
endmodule
