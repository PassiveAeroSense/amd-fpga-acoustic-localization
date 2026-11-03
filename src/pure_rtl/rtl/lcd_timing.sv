`timescale 1ns/1ps
                                                                              
                                                                               
module lcd_timing(input clk,rst_n,input [15:0] pixel,
output [10:0] x,y,output [15:0] rgb,output hsync,vsync,de,backlight,pixel_clk);
reg [10:0] h,v;
always @(posedge clk)if(!rst_n)begin h<=0;v<=0;end
else if(h==1089)begin h<=0;if(v==534)v<=0;else v<=v+1;end else h<=h+1;
wire request=h>=78&&h<878&&v>=33&&v<513;
assign x=request?h-78:11'd1023;assign y=request?v-33:11'd1023;
assign de=h>=80&&h<880&&v>=33&&v<513;
assign hsync=h<34;assign vsync=v<10;assign rgb=de?pixel:16'd0;
assign backlight=rst_n;assign pixel_clk=clk;
endmodule
