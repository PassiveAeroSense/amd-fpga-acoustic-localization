`timescale 1ns/1ps
                                                                            
                                                                                
                                                                              
                                                                                
module hemisphere_fit(input clk,rst_n,start,input [1:0] available,quality,
 input signed [31:0] ax,ay,bx,by,input prior_valid,
 input signed [31:0] prior_x,prior_y,prior_z,
 output reg busy,done,invalid,range_weak,
 output reg signed [31:0] x_mm,y_mm,z_mm,output reg [31:0] fit_error,cycles);
reg [6:0] state;reg [1:0] mask,qual;reg prev;
reg signed [31:0] obs[0:5],previous[0:2],delta[0:2];
reg array_id,normalize,refine;reg [1:0] axis;
reg signed [31:0] gx,gy,gz,cx,cy,cz,px,py,pz,bestx,besty,bestz;
reg signed [63:0] p0,p1,p2;reg [63:0] radius2,prior_cost;
reg [31:0] accum,best,best_residual,distance;reg signed [31:0] difference;
reg ds,ss,negative;reg [63:0] num,den,rad;wire db,dd,dzero,sb,sd;
wire [63:0] quotient,remainder,srem;wire [31:0] root;
fx_div divider(clk,rst_n,ds,num,den,db,dd,dzero,quotient,remainder);
fx_sqrt square_root(clk,rst_n,ss,rad,sb,sd,root,srem);
wire signed [31:0] ux0=obs[array_id?3:0],uy0=obs[array_id?4:1];
wire [31:0] score=accum+(prev?(prior_cost>>15):0);
integer n;
function [63:0] magnitude(input signed [31:0] value);begin
 magnitude=value<0?-$signed({{32{value[31]}},value}):{32'd0,value};end endfunction
always @(posedge clk)begin
if(!rst_n)begin
busy<=0;done<=0;invalid<=1;range_weak<=1;x_mm<=0;y_mm<=0;z_mm<=0;fit_error<=0;cycles<=0;
state<=0;mask<=0;qual<=0;prev<=0;array_id<=0;normalize<=0;refine<=0;axis<=0;
gx<=0;gy<=0;gz<=0;cx<=0;cy<=0;cz<=0;px<=0;py<=0;pz<=0;bestx<=0;besty<=0;bestz<=0;
p0<=0;p1<=0;p2<=0;radius2<=0;prior_cost<=0;accum<=0;best<=32'hffffffff;best_residual<=0;distance<=1;difference<=0;
ds<=0;ss<=0;negative<=0;num<=0;den<=1;rad<=0;
for(n=0;n<6;n=n+1)obs[n]<=0;
for(n=0;n<3;n=n+1)begin previous[n]<=0;delta[n]<=0;end
end else begin done<=0;ds<=0;ss<=0;
if(start&&!busy)begin
busy<=available!=0;invalid<=available==0;done<=available==0;cycles<=0;mask<=available;qual<=quality;prev<=prior_valid;
obs[0]<=ax>>>10;obs[1]<=ay>>>10;obs[3]<=bx>>>10;obs[4]<=by>>>10;
previous[0]<=prior_x;previous[1]<=prior_y;previous[2]<=prior_z;
array_id<=0;state<=0;refine<=0;best<=32'hffffffff;
end else if(busy)begin cycles<=cycles+1;
case(state)
0:begin p0<=ux0*ux0;p1<=uy0*uy0;state<=1;end
1:begin normalize<=(p0+p1)>64'd1099511627776;
rad<=(p0+p1)>64'd1099511627776 ? (p0+p1):64'd1099511627776-(p0+p1);ss<=1;state<=2;end
2:if(sd)begin
 if(normalize)begin distance<=root;axis<=0;state<=3;end
 else begin obs[array_id?5:2]<=root;state<=5;end end
3:begin num<=magnitude(obs[(array_id?3:0)+axis])<<20;den<=distance;
negative<=obs[(array_id?3:0)+axis]<0;ds<=1;state<=4;end
4:if(dd)begin obs[(array_id?3:0)+axis]<=negative?-$signed(quotient[31:0]):$signed(quotient[31:0]);
 if(axis==1)begin obs[array_id?5:2]<=0;state<=5;end else begin axis<=1;state<=3;end end
5:if(!array_id)begin array_id<=1;state<=0;end
else begin gx<=-10;gy<=-10;gz<=0;state<=10;end
10:begin px<=refine?cx+gx*250:gx*1000;py<=refine?cy+gy*250:gy*1000;pz<=refine?cz+gz*250:gz*1000;state<=11;end
11:begin p0<=px*px;p1<=py*py;p2<=pz*pz;state<=12;end
12:begin radius2<=p0+p1+p2;
 if(pz<0||p0+p1+p2>100000000||p0+p1+p2<10000)state<=30;
 else begin delta[0]<=px-previous[0];delta[1]<=py-previous[1];delta[2]<=pz-previous[2];state<=13;end end
13:begin p0<=delta[0]*delta[0];p1<=delta[1]*delta[1];p2<=delta[2]*delta[2];state<=14;end
14:begin prior_cost<=p0+p1+p2;accum<=0;array_id<=0;state<=15;end
15:begin
 if(!mask[array_id])begin if(array_id)state<=27;else array_id<=1;end
 else begin delta[0]<=px+(array_id?-500:500);delta[1]<=py;delta[2]<=pz;state<=16;end end
16:begin p0<=delta[0]*delta[0];p1<=delta[1]*delta[1];p2<=delta[2]*delta[2];state<=17;end
17:begin rad<=p0+p1+p2;ss<=1;state<=18;end
18:if(sd)begin if(root==0)state<=30;else begin distance<=root;axis<=0;state<=19;end end
19:begin num<=magnitude(delta[axis])<<20;den<=distance;negative<=delta[axis]<0;ds<=1;state<=20;end
20:if(dd)begin difference<=(negative?-$signed(quotient[31:0]):$signed(quotient[31:0]))-obs[(array_id?3:0)+axis];state<=21;end
21:begin p0<=difference*difference;state<=22;end
22:begin accum<=accum+(p0>>20);
 if(axis==2)begin if(array_id)state<=27;else begin array_id<=1;state<=15;end end
 else begin axis<=axis+1;state<=19;end end
27:begin if(score<best)begin best<=score;best_residual<=accum;bestx<=px;besty<=py;bestz<=pz;end state<=30;end
30:begin
 if(gz<(refine?4:10))begin gz<=gz+1;state<=10;end
 else if(gy<(refine?4:10))begin gy<=gy+1;gz<=refine?-4:0;state<=10;end
 else if(gx<(refine?4:10))begin gx<=gx+1;gy<=refine?-4:-10;gz<=refine?-4:0;state<=10;end
 else if(!refine)begin refine<=1;cx<=bestx;cy<=besty;cz<=bestz;gx<=-4;gy<=-4;gz<=-4;state<=10;end
 else state<=31;end
31:begin p0<=bestx*bestx;p1<=besty*besty;p2<=bestz*bestz;state<=32;end
32:begin x_mm<=bestx;y_mm<=besty;z_mm<=bestz;fit_error<=best_residual;
range_weak<=mask!=3||qual!=3||best_residual>20971||(p0+p1+p2)>=95000000;
invalid<=best==32'hffffffff;busy<=0;done<=1;end
default:begin invalid<=1;busy<=0;done<=1;end
endcase end end end
endmodule
