`timescale 1ns/1ps
`include "r19_config.vh"
module tb_r27_status_isolation;
reg clk=0;always #15 clk=~clk;reg rst=0;wire [10:0] x,y;
wire [15:0] pixels[0:1];wire [15:0] rgb;wire hs,vs,de,bl,pc;
genvar k;generate for(k=0;k<2;k=k+1)begin:cases
acoustic_dashboard #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.BASELINE_MM(`R19_BASELINE_MM),.VARIANT_ID(`R19_VARIANT_ID)) dut(
clk,rst,x,y,k==0?3'd3:3'd5,1'b1,1'b1,1'b1,12'd3150,10'd467,32'sd536870912,-32'sd536870912,
32'sd2000,-32'sd2000,32'sd3000,16'd4,8'd25,5'd3,32'h12,128'd0,2'd0,32'h34,{175'd0,1'b1},pixels[k]);
end endgenerate
lcd_timing raster(clk,rst,pixels[0],x,y,rgb,hs,vs,de,bl,pc);
integer count=0;
initial begin #100;rst=1;while(count<384000)begin @(posedge clk);#1;
 if(de)begin if(pixels[0]!==pixels[1]||^pixels[0]===1'bx)$fatal(1,"Detection state altered localization page pixel %0d",count);count=count+1;end
end
$display("R27_STATUS_ISOLATION_PASS every active pixel identical for positive and negative detection on localization page");$finish;end
initial begin #40000000;$fatal(1,"isolation timeout");end
endmodule
