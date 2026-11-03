`timescale 1ns/1ps
                                                                                   
                                                                               
module reliable_results(input clk,rst_n,update,input [1:0] quality,
 input signed [31:0] ax,ay,bx,by,
 output reg result_valid,direction_valid,position_valid,azimuth_valid,
 output reg [11:0] azimuth,output reg [9:0] elevation,
 output reg signed [31:0] ux,uy,x_mm,y_mm,z_mm,output reg [31:0] error_value);
reg [4:0] state;reg [1:0] ok,which;
reg signed [31:0] xx[0:2],yy[0:2],zz[0:2];
reg as,rs;wire ab,ad,ai,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
direction_angles angles(clk,rst_n,as,xx[which],yy[which],ab,ad,ai,av,az,el,uz);
wire rb,rd,ri,rv;wire signed [31:0] rx,ry,rz;wire [31:0] rg;
ray_intersection rays(clk,rst_n,rs,xx[0],yy[0],zz[0],xx[1],yy[1],zz[1],rb,rd,ri,rv,rx,ry,rz,rg);
reg ss,ds;reg [63:0] radius2,numerator,denominator;reg negx,negy;
reg signed [63:0] squarex,squarey,squarez;
wire sb,sd,db,dd,dzero;wire [31:0] radius;wire [63:0] sr,dq,dr;
fx_sqrt normroot(clk,rst_n,ss,radius2,sb,sd,radius,sr);
fx_div normdiv(clk,rst_n,ds,numerator,denominator,db,dd,dzero,dq,dr);
always @(posedge clk)begin
if(!rst_n)begin state<=0;ok<=0;which<=0;as<=0;rs<=0;ss<=0;ds<=0;result_valid<=0;direction_valid<=0;position_valid<=0;azimuth_valid<=0;
azimuth<=0;elevation<=0;ux<=0;uy<=0;x_mm<=0;y_mm<=0;z_mm<=0;error_value<=0;
radius2<=0;numerator<=0;denominator<=1;negx<=0;negy<=0;squarex<=0;squarey<=0;squarez<=0;end
else begin as<=0;rs<=0;ss<=0;ds<=0;result_valid<=0;
case(state)
0:if(update)begin ok<=quality;xx[0]<=ax;yy[0]<=ay;xx[1]<=bx;yy[1]<=by;
which<=0;direction_valid<=0;position_valid<=0;azimuth_valid<=0;state<=quality==0?20:1;end
1:begin as<=1;state<=2;end
2:if(ad)begin zz[which]<=uz;if(ai)ok[which]<=0;
if(which==1)state<=3;else begin which<=1;state<=1;end end
3:if(ok==3)begin rs<=1;state<=4;end else state<=14;
4:if(rd)begin error_value<=rg;
if(rv&&!ri)begin x_mm<=rx;y_mm<=ry;z_mm<=rz;position_valid<=1;
squarex<=rx*rx;squarey<=ry*ry;squarez<=rz*rz;state<=5;end else state<=14;end
5:begin radius2<=squarex+squarey+squarez;state<=6;end
6:begin ss<=1;state<=7;end
7:if(sd)begin
if(radius==0)begin position_valid<=0;state<=14;end
else begin denominator<={32'd0,radius}+(sr!=0);negx<=x_mm<0;negy<=y_mm<0;
numerator<={32'd0,(x_mm<0?-$signed(x_mm):x_mm)}<<30;ds<=1;state<=8;end end
8:if(dd)begin
xx[2]<=negx?-$signed(dq[31:0]):$signed(dq[31:0]);
numerator<={32'd0,(y_mm<0?-$signed(y_mm):y_mm)}<<30;ds<=1;state<=9;end
9:if(dd)begin yy[2]<=negy?-$signed(dq[31:0]):$signed(dq[31:0]);state<=15;end
14:begin
xx[2]<=ok==3?($signed({xx[0][31],xx[0]})+$signed({xx[1][31],xx[1]}))>>>1:ok[0]?xx[0]:xx[1];
yy[2]<=ok==3?($signed({yy[0][31],yy[0]})+$signed({yy[1][31],yy[1]}))>>>1:ok[0]?yy[0]:yy[1];
state<=ok==0?20:15;end
15:begin which<=2;state<=16;end
16:begin as<=1;state<=17;end
17:if(ad)begin azimuth<=az;elevation<=el;ux<=xx[2];uy<=yy[2];direction_valid<=!ai;azimuth_valid<=!ai&&av;
if(ai)position_valid<=0;state<=20;end
20:begin result_valid<=1;state<=0;end
default:state<=0;
endcase end end
endmodule
