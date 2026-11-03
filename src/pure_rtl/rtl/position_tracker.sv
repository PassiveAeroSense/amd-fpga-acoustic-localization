`timescale 1ns/1ps
                                                                                  
                                                                          
module position_tracker #(parameter TENTH_CYCLES=5000000,HOLD_TENTHS=120)(
 input clk,rst_n,update,good,input [15:0] measurement_age,
 input signed [31:0] in_x,in_y,in_z,input [11:0] in_az,input [9:0] in_el,
 input acquisition_gap,
 output reg valid,output reg [1:0] mode,output reg [15:0] age,
 output reg signed [31:0] x,y,z,ux,uy,
 output reg [11:0] azimuth,output reg [9:0] elevation,output reg azimuth_valid);
reg [31:0] tick;reg [15:0] elapsed;
reg [1:0] pending_count;reg signed [31:0] pending_x,pending_y,pending_z;
reg signed [31:0] fx,fy,fz;reg [3:0] state;
reg [63:0] rad,num,den;reg signed [63:0] sx,sy,sz;
reg ss,ds,as;wire sb,sd,db,dd,dzero,ab,ad,ai,av;
wire [31:0] root;wire [63:0] remainder,dq,dr;wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
reg signed [31:0] tu,tv;reg negx,negy;reg [15:0] accepted_age;
fx_sqrt norm(clk,rst_n,ss,rad,sb,sd,root,remainder);
fx_div divide(clk,rst_n,ds,num,den,db,dd,dzero,dq,dr);
direction_angles angles(clk,rst_n,as,tu,tv,ab,ad,ai,av,az,el,uz);
function [31:0] absdiff(input signed [31:0] a,b);reg signed [32:0] d;begin d=$signed({a[31],a})-$signed({b[31],b});absdiff=d<0?-d:d;end endfunction
wire [12:0] da=in_az>azimuth?in_az-azimuth:azimuth-in_az;
wire [12:0] wrap_da=da>1800?3600-da:da;
wire [31:0] allowance=500+((elapsed<40?elapsed:40)*30);
wire near_old=absdiff(in_x,x)<=allowance&&absdiff(in_y,y)<=allowance&&absdiff(in_z,z)<=allowance&&
 (wrap_da<=350||(in_el>=750&&elevation>=750))&&absdiff({22'd0,in_el},{22'd0,elevation})<=250;
wire near_pending=absdiff(in_x,pending_x)<=600&&absdiff(in_y,pending_y)<=600&&absdiff(in_z,pending_z)<=600;
wire accept=update&&good&&state==0&&((valid&&near_old)||
 (pending_count>0&&near_pending&&pending_count>=(valid?2:1)));
always @(posedge clk)begin
if(!rst_n)begin valid<=0;mode<=3;age<=65535;x<=0;y<=0;z<=0;ux<=0;uy<=0;azimuth<=0;elevation<=0;azimuth_valid<=0;
tick<=0;elapsed<=0;pending_count<=0;pending_x<=0;pending_y<=0;pending_z<=0;fx<=0;fy<=0;fz<=0;state<=0;
rad<=0;num<=0;den<=1;sx<=0;sy<=0;sz<=0;ss<=0;ds<=0;as<=0;tu<=0;tv<=0;negx<=0;negy<=0;accepted_age<=0;end
else begin ss<=0;ds<=0;as<=0;
if(tick==TENTH_CYCLES-1)begin tick<=0;if(age<65535)age<=age+1;if(elapsed<65535)elapsed<=elapsed+1;end else tick<=tick+1;
if(valid&&(acquisition_gap||(update&&!good)))mode<=2;
if(valid&&age>=HOLD_TENTHS)begin valid<=0;mode<=3;pending_count<=0;end
if(update&&state==0)begin
if(!good)begin pending_count<=0;if(valid)mode<=2;end
else if(!accept)begin pending_x<=in_x;pending_y<=in_y;pending_z<=in_z;
pending_count<=near_pending&&pending_count!=0?(pending_count<3?pending_count+1:3):1;if(valid)mode<=2;end
end
if(accept)begin
                                                                      
fx<=valid&&near_old?($signed({x[31],x})+$signed({in_x[31],in_x}))>>>1:in_x;
fy<=valid&&near_old?($signed({y[31],y})+$signed({in_y[31],in_y}))>>>1:in_y;
fz<=valid&&near_old?($signed({z[31],z})+$signed({in_z[31],in_z}))>>>1:in_z;
accepted_age<=measurement_age;pending_count<=0;state<=1;end
else case(state)
1:begin sx<=fx*fx;sy<=fy*fy;sz<=fz*fz;state<=2;end
2:begin rad<=sx+sy+sz;state<=3;end
3:begin ss<=1;state<=4;end
4:if(sd)begin if(root==0)state<=0;else begin den<={32'd0,root}+(remainder!=0);negx<=fx<0;negy<=fy<0;
num<={32'd0,(fx<0?-$signed(fx):fx)}<<30;ds<=1;state<=5;end end
5:if(dd)begin tu<=negx?-$signed(dq[31:0]):$signed(dq[31:0]);
num<={32'd0,(fy<0?-$signed(fy):fy)}<<30;ds<=1;state<=6;end
6:if(dd)begin tv<=negy?-$signed(dq[31:0]):$signed(dq[31:0]);as<=1;state<=7;end
7:if(ad)begin if(!ai)begin x<=fx;y<=fy;z<=fz;ux<=tu;uy<=tv;azimuth<=az;elevation<=el;azimuth_valid<=av;
valid<=1;mode<=1;age<=accepted_age;elapsed<=0;tick<=0;end state<=0;end
endcase end end
endmodule
