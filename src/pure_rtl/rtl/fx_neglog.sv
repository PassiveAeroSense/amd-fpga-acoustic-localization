`timescale 1ns/1ps
                                                                       
                                                                      
module fx_neglog(input clk,rst_n,start,input [32:0] x,
output reg busy,done,output reg [31:0] result);
                                                                          
(* rom_style="distributed" *)reg [23:0] lut[0:4095];initial $readmemh("ln_mantissa_4096.mem",lut);
reg [31:0] xx;reg [4:0] lead;reg [31:0] normalized;reg [12:0] idx;
reg [18:0] frac;reg [31:0] l0,l1;reg [63:0] product;reg [2:0] state;
integer k;reg [4:0] highest;
always @*begin highest=0;for(k=0;k<32;k=k+1)if(xx[k])highest=k;end
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;result<=0;state<=0;xx<=0;lead<=0;normalized<=0;idx<=0;frac<=0;l0<=0;l1<=0;product<=0;end
else begin done<=0;
if(start&&!busy)begin
if(x>=33'd4294967296)begin result<=0;done<=1;end
else begin xx<=x<43?32'd43:x[31:0];busy<=1;state<=0;end
end else if(busy)case(state)
0:begin lead<=highest;normalized<=xx<<(31-highest);state<=1;end
1:begin idx<={1'b0,normalized[30:19]};frac<=normalized[18:0];state<=2;end
2:begin l0<=lut[idx];l1<=idx==4095?32'd11629080:lut[idx+1];state<=3;end
3:begin product<=(l1-l0)*frac;state<=4;end
4:begin result<=(32-lead)*32'd11629080-l0-(product>>19);busy<=0;done<=1;end
endcase
end
end
endmodule
