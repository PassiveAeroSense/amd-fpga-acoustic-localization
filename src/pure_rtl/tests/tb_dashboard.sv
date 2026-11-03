`timescale 1ns/1ps
`include "r19_config.vh"
module tb_dashboard;
reg clk=0;always #5 clk=~clk;reg rst=0;wire [10:0] x,y;reg [2:0] status=3;reg dv=1,pv=1;
reg [1:0] mode=0;
reg [15:0] age_value=4;
wire [15:0] pixel,rgb;wire hs,vs,de,bl,pclk;integer count,f,scene;
lcd_timing raster(clk,rst,pixel,x,y,rgb,hs,vs,de,bl,pclk);
acoustic_dashboard #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.BASELINE_MM(`R19_BASELINE_MM),.VARIANT_ID(`R19_VARIANT_ID)) dut(clk,rst,x,y,status,dv,1'b1,pv,12'd3150,10'd467,32'sd536870912,-32'sd536870912,
32'sd2000,-32'sd2000,32'sd3000,age_value,8'd25,5'd3,32'd0,128'h02040a0612090511040806070a090302,mode,32'd48,{32'd1,32'd106,32'd34,32'd106,16'd0,16'd0,16'd1},pixel);
initial begin #30;rst=1;
for(scene=0;scene<9;scene=scene+1)begin
status=scene==8?6:scene==1?5:scene==2?4:scene==3?2:3;dv=scene==0||scene==1||(scene>=4&&scene<=6);pv=dv;
mode=scene==4?1:scene==5?2:scene==6?3:0;
age_value=scene==5?20:scene==6?60:4;
case(scene)0:f=$fopen("lcd_detected.hex","w");1:f=$fopen("lcd_background.hex","w");2:f=$fopen("lcd_fault.hex","w");3:f=$fopen("lcd_initializing.hex","w");
4:f=$fopen("lcd_coarse.hex","w");5:f=$fopen("lcd_held.hex","w");6:f=$fopen("lcd_last.hex","w");7:f=$fopen("lcd_waiting.hex","w");8:f=$fopen("lcd_recovery.hex","w");endcase
                                                                              
@(negedge clk);rst=0;repeat(3)@(negedge clk);rst=1;count=0;
while(count<384000)begin @(posedge clk);#1;
if(de)begin if(^rgb===1'bx)$fatal(1,"LCD unknown active pixel %0d",count);
$fwrite(f,"%04x\n",rgb);count=count+1;end end
$fclose(f);end
$display("LCD nine status rasters generated");$finish;end
initial begin #60000000;$fatal(1,"LCD timeout");end
endmodule
