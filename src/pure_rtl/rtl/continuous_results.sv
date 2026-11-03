`timescale 1ns/1ps
                                                                            
                                                                                    
module continuous_results(input clk,rst_n,update,drone_detected,
 input [1:0] available,quality,input signed [31:0] ax,ay,bx,by,
 output reg result_valid,output reg direction_valid,position_valid,azimuth_valid,
 output reg [11:0] azimuth,output reg [9:0] elevation,
 output reg signed [31:0] ux,uy,x_mm,y_mm,z_mm,
 output reg [31:0] error_value,output reg coarse,holding);
reg fs,ss,ds,as;wire fb,fd,fi,weak_range;wire signed [31:0] fx,fy,fz;wire [31:0] err,fc;
hemisphere_fit fit(clk,rst_n,fs,available,quality,ax,ay,bx,by,
drone_detected&&position_valid,x_mm,y_mm,z_mm,fb,fd,fi,weak_range,fx,fy,fz,err,fc);
reg [3:0] state;reg [63:0] rad,num,den;reg signed [63:0] p0,p1,p2;reg negative,axis;
reg signed [31:0] pending_x,pending_y,pending_z,pending_ux,pending_uy;
reg pending_coarse;reg [31:0] pending_error;
wire sb,sd,db,dd,dzero,ab,ad,ai,av;wire [31:0] root;wire [63:0] rem,srem,q;
wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
fx_sqrt sq(clk,rst_n,ss,rad,sb,sd,root,srem);
fx_div div(clk,rst_n,ds,num,den,db,dd,dzero,q,rem);
direction_angles angles(clk,rst_n,as,pending_ux,pending_uy,ab,ad,ai,av,az,el,uz);
wire signed [31:0] coordinate=axis?pending_y:pending_x;
always @(posedge clk)begin
if(!rst_n)begin result_valid<=0;direction_valid<=0;position_valid<=0;azimuth_valid<=0;azimuth<=0;elevation<=0;
ux<=0;uy<=0;x_mm<=0;y_mm<=0;z_mm<=0;error_value<=0;coarse<=1;holding<=0;
fs<=0;ss<=0;ds<=0;as<=0;state<=0;rad<=0;num<=0;den<=1;p0<=0;p1<=0;p2<=0;negative<=0;axis<=0;
pending_x<=0;pending_y<=0;pending_z<=0;pending_ux<=0;pending_uy<=0;pending_coarse<=1;pending_error<=0;end
else begin result_valid<=0;fs<=0;ss<=0;ds<=0;as<=0;
case(state)
0:if(update)begin if(available==0)holding<=position_valid;else begin fs<=1;state<=1;end end
1:if(fd)begin if(fi)begin holding<=position_valid;state<=0;end else begin
pending_x<=fx;pending_y<=fy;pending_z<=fz;pending_coarse<=weak_range;pending_error<=err;
p0<=fx*fx;p1<=fy*fy;p2<=fz*fz;state<=2;end end
2:begin rad<=p0+p1+p2;ss<=1;state<=3;end
3:if(sd)begin den<=root+(srem!=0);axis<=0;state<=4;end
4:begin num<=(coordinate<0?-$signed({{32{coordinate[31]}},coordinate}):{32'd0,coordinate})<<30;
negative<=coordinate<0;ds<=1;state<=5;end
5:if(dd)begin if(axis)pending_uy<=negative?-$signed(q[31:0]):$signed(q[31:0]);else pending_ux<=negative?-$signed(q[31:0]):$signed(q[31:0]);
if(axis)state<=6;else begin axis<=1;state<=4;end end
6:begin as<=1;state<=7;end
7:if(ad)begin azimuth<=az;elevation<=el;azimuth_valid<=av&&!ai;
x_mm<=pending_x;y_mm<=pending_y;z_mm<=pending_z;ux<=pending_ux;uy<=pending_uy;coarse<=pending_coarse;error_value<=pending_error;
position_valid<=1;direction_valid<=!ai;holding<=0;result_valid<=1;state<=0;end
endcase end end
endmodule
