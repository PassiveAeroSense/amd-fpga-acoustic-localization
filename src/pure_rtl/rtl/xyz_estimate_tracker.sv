`timescale 1ns/1ps
                                                                      
                                                                            
                                                                          
module xyz_estimate_tracker #(parameter TENTH_CYCLES=5000000,STALE_TENTHS=120,HORIZONTAL_MM=10000,VERTICAL_MM=10000,FAST_MODE=0)(
 input clk,rst_n,update,candidate_valid,confident,input [15:0] measurement_age,
 input signed [31:0] in_x,in_y,in_z,input acquisition_gap,
 output reg valid,output reg [1:0] mode,output reg [15:0] age,
 output reg signed [31:0] x,y,z,ux,uy,
 output reg [11:0] azimuth,output reg [9:0] elevation,output reg azimuth_valid);
reg [31:0] tick;reg [15:0] elapsed;
reg [1:0] pending_count;reg signed [31:0] pending_x,pending_y,pending_z;
reg signed [31:0] fx,fy,fz,tu,tv;reg [3:0] state;reg accepted_confidence;
reg [63:0] rad,num,den;reg signed [63:0] sx,sy,sz;
reg ss,ds,as,negx,negy;reg [15:0] accepted_age;
wire sb,sd,db,dd,dzero,ab,ad,ai,av;wire [31:0] root;wire [63:0] remainder,dq,dr;
wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
fx_sqrt norm(clk,rst_n,ss,rad,sb,sd,root,remainder);
fx_div divide(clk,rst_n,ds,num,den,db,dd,dzero,dq,dr);
direction_angles angles(clk,rst_n,as,tu,tv,ab,ad,ai,av,az,el,uz);
function [31:0] absdiff(input signed [31:0] a,b);reg signed [32:0] d;begin
d=$signed({a[31],a})-$signed({b[31],b});absdiff=d<0?-d:d;end endfunction
wire [31:0] allowance=500+((elapsed<40?elapsed:40)*30);
wire near_old=absdiff(in_x,x)<=allowance&&absdiff(in_y,y)<=allowance&&absdiff(in_z,z)<=allowance;
wire near_pending=absdiff(in_x,pending_x)<=600&&absdiff(in_y,pending_y)<=600&&absdiff(in_z,pending_z)<=600;
wire signed [63:0] check_x2=$signed(in_x)*$signed(in_x),check_y2=$signed(in_y)*$signed(in_y);
wire in_range=in_z>=0&&in_z<=VERTICAL_MM&&(check_x2+check_y2<=HORIZONTAL_MM*64'd1*HORIZONTAL_MM)&&(in_x!=0||in_y!=0||in_z!=0);
wire usable=candidate_valid&&in_range&&!acquisition_gap;
wire accept=update&&usable&&state==0&&(!valid||(FAST_MODE==2&&confident)||near_old||(pending_count>=(FAST_MODE==0?2:1)&&near_pending));
function signed [31:0] blend(input signed [31:0] a,b,input strong_match);
reg signed [35:0] sum;begin
sum=strong_match?$signed({{2{a[31]}},a})+$signed({{2{b[31]}},b}):
 $signed({{2{a[31]}},a})*34'sd3+$signed({{2{b[31]}},b});
if(FAST_MODE==2&&strong_match)begin sum=$signed({{2{a[31]}},a})+$signed({{2{b[31]}},b})*34'sd3;blend=sum>>>2;end
else if(FAST_MODE==1&&strong_match)begin sum=$signed({{2{a[31]}},a})*34'sd3+$signed({{2{b[31]}},b})*34'sd5;blend=sum>>>3;end
else blend=strong_match?sum>>>1:sum>>>2;end endfunction
always @(posedge clk)begin
if(!rst_n)begin
valid<=0;mode<=3;age<=65535;x<=0;y<=0;z<=0;ux<=0;uy<=0;azimuth<=0;elevation<=0;azimuth_valid<=0;
tick<=0;elapsed<=0;pending_count<=0;pending_x<=0;pending_y<=0;pending_z<=0;fx<=0;fy<=0;fz<=0;tu<=0;tv<=0;state<=0;
rad<=0;num<=0;den<=1;sx<=0;sy<=0;sz<=0;ss<=0;ds<=0;as<=0;negx<=0;negy<=0;accepted_age<=0;accepted_confidence<=0;
end else begin ss<=0;ds<=0;as<=0;
if(tick==TENTH_CYCLES-1)begin tick<=0;if(age<65535)age<=age+1;if(elapsed<65535)elapsed<=elapsed+1;end else tick<=tick+1;
if(valid&&acquisition_gap)mode<=age>=STALE_TENTHS?3:2;
if(valid&&age>=STALE_TENTHS)mode<=3;
if(update&&state==0)begin
if(!usable)begin pending_count<=0;if(valid)mode<=age>=STALE_TENTHS?3:2;end
else if(!accept)begin pending_x<=in_x;pending_y<=in_y;pending_z<=in_z;
pending_count<=near_pending&&pending_count!=0?(pending_count<3?pending_count+1:3):1;
if(valid)mode<=age>=STALE_TENTHS?3:2;end end
if(accept)begin
fx<=valid&&near_old?blend(x,in_x,confident):in_x;
fy<=valid&&near_old?blend(y,in_y,confident):in_y;
fz<=valid&&near_old?blend(z,in_z,confident):in_z;
accepted_age<=measurement_age;accepted_confidence<=confident;pending_count<=0;state<=1;
end else case(state)
1:begin sx<=fx*fx;sy<=fy*fy;sz<=fz*fz;state<=2;end
2:begin rad<=sx+sy+sz;state<=3;end
3:begin ss<=1;state<=4;end
4:if(sd)begin if(root==0)state<=0;else begin den<={32'd0,root}+(remainder!=0);negx<=fx<0;negy<=fy<0;
num<={32'd0,(fx<0?-$signed(fx):fx)}<<30;ds<=1;state<=5;end end
5:if(dd)begin tu<=negx?-$signed(dq[31:0]):$signed(dq[31:0]);
num<={32'd0,(fy<0?-$signed(fy):fy)}<<30;ds<=1;state<=6;end
6:if(dd)begin tv<=negy?-$signed(dq[31:0]):$signed(dq[31:0]);as<=1;state<=7;end
7:if(ad)begin
x<=fx;y<=fy;z<=fz;ux<=tu;uy<=tv;azimuth<=az;elevation<=el;azimuth_valid<=!ai&&av;
valid<=1;mode<=accepted_confidence&&!ai?1:0;age<=accepted_age;elapsed<=0;tick<=0;state<=0;end
endcase end end
endmodule
