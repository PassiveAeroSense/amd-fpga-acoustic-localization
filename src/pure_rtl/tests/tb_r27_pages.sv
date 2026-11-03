`timescale 1ns/1ps
`include "r19_config.vh"
module tb_r27_pages;
reg clk=0;always #15 clk=~clk;reg rst=0,key=1,sv=0,det=0;
reg [255:0] samples=0;wire [10:0] x,y;wire [7:0] column;
wire [527:0] waveform;wire [255:0] dc,pp;wire [63:0] scales;wire [159:0] clip;
wire [1:0] good;wire valid,ready;wire [31:0] captures;
wire [15:0] lp,dp,pixel,rgb;wire hs,vs,de,bl,pclk,page,press;
scope_capture capture(clk,rst,sv,samples,2'b00,x==0&&y==0,column,waveform,dc,pp,scales,clip,good,valid,ready,captures);
acoustic_dashboard #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.VERTICAL_MM(`R19_VERTICAL_MM),.BASELINE_MM(`R19_BASELINE_MM),.VARIANT_ID(`R19_VARIANT_ID)) loc(
clk,rst,x,y,det?3'd3:3'd5,1'b1,1'b1,1'b1,12'd3150,10'd467,32'sd536870912,-32'sd536870912,
32'sd2000,-32'sd2000,32'sd3000,16'd4,8'd25,5'd3,32'h12,128'h02040a0612090511040806070a090302,
2'd0,32'h34,{175'd0,1'b1},lp);
r22_display display(clk,rst,x,y,waveform,dc,scales,good,valid,1'b1,det,det?3'd2:3'd0,1'b1,32'h12,32'h34,column,dp);
r27_page_mux #(.DEBOUNCE_CYCLES(8)) page_control(clk,rst,key,x==0&&y==0,lp,dp,pixel,page,press);
lcd_timing raster(clk,rst,pixel,x,y,rgb,hs,vs,de,bl,pclk);
integer phase=0,sample_no=0,ch,f,count,scene,begin_captures;real a;
always @(negedge clk)if(rst)begin
sv=0;phase=phase+48000;
if(phase>=33333333)begin phase=phase-33333333;sample_no=sample_no+1;sv=1;
for(ch=0;ch<16;ch=ch+1)begin a=6.28318530718*(300+ch*100)*sample_no/48000.0;
 samples[ch*16+:16]=$rtoi((ch-7)*500+(400+ch*70)*$sin(a)+180*$sin(a*2.3));end
end end
task click_key;begin @(negedge clk);key=0;repeat(20)@(negedge clk);key=1;repeat(20)@(negedge clk);end endtask
initial begin #100;rst=1;wait(captures>=2&&valid);begin_captures=captures;
for(scene=0;scene<4;scene=scene+1)begin
 if(scene==1||scene==3)click_key();
 det=scene==1;
 wait(x==0&&y==0);@(negedge clk);wait(x==0&&y==0);@(negedge clk);
 if(page!=(scene==1||scene==2))$fatal(1,"wrong page scene%0d",scene);
 case(scene)0:f=$fopen("r27_location.hex","w");1:f=$fopen("r27_detected.hex","w");
 2:f=$fopen("r27_not_detected.hex","w");3:f=$fopen("r27_return_location.hex","w");endcase
 count=0;while(count<384000)begin @(posedge clk);#1;if(de)begin
  if(^rgb===1'bx)$fatal(1,"unknown raster pixel scene%0d",scene);
  $fwrite(f,"%04x\n",rgb);count=count+1;
 end end
 $fclose(f);
end
if(good!=3||captures<begin_captures+4)$fatal(1,"waveforms stopped across pages");
for(ch=0;ch<16;ch=ch+1)if(pp[ch*16+:16]==0)$fatal(1,"missing waveform channel%0d",ch);
$display("R27_PAGES_PASS four real LCD rasters, KEY4 roundtrip, raw16 live across pages, no unknown pixels");$finish;
end
initial begin #300000000;$fatal(1,"pages timeout");end
endmodule
