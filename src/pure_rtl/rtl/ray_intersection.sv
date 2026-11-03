`timescale 1ns/1ps
                                                                  
                                                                           
                                                                           
module ray_intersection(input clk,rst_n,start,input signed [31:0] ax,ay,az,bx,by,bz,
output reg busy,done,invalid,position_valid,
output reg signed [31:0] x_mm,y_mm,z_mm,output reg [31:0] gap_mm);
reg signed [31:0] u[0:2],v[0:2],p[0:2],q[0:2];
reg signed [63:0] m0,m1,m2,dot,dx,dy;reg signed [31:0] d;reg [31:0] denom,s,t;
reg signed [63:0] ns,nt;reg [63:0] num,den,gap2;reg ds,ss;wire db,dd,dz,sb,sd;
wire [63:0] quotient,remainder,srem;wire [31:0] root;reg [4:0] state;integer i;
fx_div div(clk,rst_n,ds,num,den,db,dd,dz,quotient,remainder);
fx_sqrt sq(clk,rst_n,ss,gap2,sb,sd,root,srem);
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;invalid<=0;position_valid<=0;x_mm<=0;y_mm<=0;z_mm<=0;gap_mm<=0;
m0<=0;m1<=0;m2<=0;dot<=0;dx<=0;dy<=0;d<=0;denom<=0;s<=0;t<=0;ns<=0;nt<=0;num<=0;den<=1;gap2<=0;ds<=0;ss<=0;state<=0;i<=0;end
else begin done<=0;ds<=0;ss<=0;
if(start&&!busy)begin busy<=1;invalid<=0;position_valid<=0;u[0]<=ax;u[1]<=ay;u[2]<=az;v[0]<=bx;v[1]<=by;v[2]<=bz;state<=0;end
else if(busy)case(state)
0:begin m0<=u[0]*v[0];m1<=u[1]*v[1];m2<=u[2]*v[2];state<=1;end
1:begin dot<=m0+m1+m2;state<=2;end
2:begin d<=dot>>>30;state<=3;end
3:begin m0<=d*d;m1<=d*v[0];m2<=d*u[0];state<=4;end
4:begin denom<=64'd1073741824-(m0>>>30);ns<=($signed(u[0])-(m1>>>30))*64'sd1000;nt<=((m2>>>30)-$signed(v[0]))*64'sd1000;state<=5;end
5:if(denom<2941036||denom>1073741824||ns<=0||nt<=0)begin busy<=0;done<=1;end
else begin num<=ns;den<=denom;ds<=1;state<=6;end
6:if(dd)begin if(dz||quotient>120000)begin busy<=0;done<=1;end
else begin s<=quotient;num<=nt;ds<=1;state<=7;end end
7:if(dd)begin if(dz||quotient>120000)begin busy<=0;done<=1;end
else begin t<=quotient;i<=0;gap2<=0;state<=8;end end
8:begin m0<=$signed({1'b0,s})*u[i];m1<=$signed({1'b0,t})*v[i];state<=9;end
9:begin p[i]<=(m0>>>30)-(i==0?500:0);q[i]<=(m1>>>30)+(i==0?500:0);state<=10;end
10:begin dx<=$signed(p[i])-$signed(q[i]);state<=11;end
11:begin m2<=dx*dx;state<=12;end
12:begin gap2<=gap2+m2;if(i==2)state<=13;else begin i<=i+1;state<=8;end end
13:begin ss<=1;state<=14;end
14:if(sd)begin gap_mm<=root;x_mm<=($signed(p[0])+$signed(q[0]))>>>1;y_mm<=($signed(p[1])+$signed(q[1]))>>>1;z_mm<=($signed(p[2])+$signed(q[2]))>>>1;
position_valid<=root<=500&&p[2]>=0&&q[2]>=0;busy<=0;done<=1;end
endcase
end
end
endmodule
