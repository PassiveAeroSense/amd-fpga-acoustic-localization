`timescale 1ns/1ps
                                                                    
                                                                          
module direction_angles(input clk,rst_n,start,input signed [31:0] ux,uy,
output reg busy,done,invalid,azimuth_valid,
output reg [11:0] azimuth_tenths,output reg [9:0] elevation_tenths,
output reg signed [31:0] uz);
reg [3:0] state;reg signed [31:0] x,y,az,el;reg [63:0] xy2;
reg sqstart,cstart;reg [63:0] rad;wire sqb,sqd;wire [31:0] root;wire [63:0] rem;
fx_sqrt square_root(clk,rst_n,sqstart,rad,sqb,sqd,root,rem);
reg signed [39:0] cx,cy;wire cb,cd;wire signed [31:0] ca,cc,cs;wire [39:0] mag;
fx_cordic cord(clk,rst_n,cstart,1'b1,cx,cy,32'sd0,cb,cd,ca,cc,cs,mag);
wire signed [63:0] xx=$signed(ux)*$signed(ux),yy=$signed(uy)*$signed(uy);
                                                               
wire signed [63:0] az_scaled=$signed(az)*64'sd600789792;
wire signed [63:0] el_scaled=$signed(el)*64'sd600789792;
wire signed [63:0] az_t=(az_scaled+64'sd281474976710656)>>>49;
wire signed [63:0] el_t=(el_scaled+64'sd281474976710656)>>>49;
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;invalid<=0;azimuth_valid<=0;azimuth_tenths<=0;elevation_tenths<=0;uz<=0;state<=0;
x<=0;y<=0;az<=0;el<=0;xy2<=0;rad<=0;sqstart<=0;cstart<=0;cx<=0;cy<=0;end
else begin done<=0;sqstart<=0;cstart<=0;
if(start&&!busy)begin busy<=1;invalid<=0;x<=ux;y<=uy;xy2<=$unsigned(xx)+$unsigned(yy);state<=0;end
else if(busy)case(state)
0:if(xy2>64'd1152921504606846976)begin invalid<=1;azimuth_valid<=0;busy<=0;done<=1;end
else begin rad<=64'd1152921504606846976-xy2;sqstart<=1;state<=1;azimuth_valid<=xy2>64'd1048576;end
1:if(sqd)begin uz<=root;cx<=x;cy<=y;cstart<=1;state<=2;end
2:if(cd)begin az<=ca;rad<=xy2;sqstart<=1;state<=3;end
3:if(sqd)begin cx<=$signed({8'b0,root});cy<=uz;cstart<=1;state<=4;end
4:if(cd)begin el<=ca;state<=5;end
5:begin azimuth_tenths<=azimuth_valid?(az_t<0?az_t+3600:(az_t>=3600?az_t-3600:az_t)):0;
elevation_tenths<=el_t<0?0:(el_t>900?900:el_t);busy<=0;done<=1;end
endcase
end
end
endmodule
