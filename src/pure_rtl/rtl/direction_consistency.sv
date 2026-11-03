`timescale 1ns/1ps
                                                                                
module direction_consistency(input clk,rst_n,start,input signed [31:0] ax,ay,bx,by,
output reg busy,done,invalid,agree);
reg [3:0] state;reg ss;reg [63:0] rad;wire sb,sd;wire [31:0] root;wire [63:0] rem;
reg signed [31:0] x0,y0,x1,y1,z0,z1;reg [63:0] r0,r1;
reg signed [63:0] p0,p1,p2;reg signed [65:0] dot;
fx_sqrt sq(clk,rst_n,ss,rad,sb,sd,root,rem);
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;invalid<=0;agree<=0;state<=0;ss<=0;rad<=0;x0<=0;y0<=0;x1<=0;y1<=0;z0<=0;z1<=0;r0<=0;r1<=0;p0<=0;p1<=0;p2<=0;dot<=0;end
else begin done<=0;ss<=0;
if(start&&!busy)begin busy<=1;invalid<=0;agree<=0;x0<=ax;y0<=ay;x1<=bx;y1<=by;
r0<=$signed(ax)*$signed(ax)+$signed(ay)*$signed(ay);r1<=$signed(bx)*$signed(bx)+$signed(by)*$signed(by);state<=0;end
else if(busy)case(state)
0:if(r0>64'h1000000000000000||r1>64'h1000000000000000)begin invalid<=1;busy<=0;done<=1;end
else begin rad<=64'h1000000000000000-r0;ss<=1;state<=1;end
1:if(sd)begin z0<=root;rad<=64'h1000000000000000-r1;ss<=1;state<=2;end
2:if(sd)begin z1<=root;state<=3;end
3:begin p0<=x0*x1;p1<=y0*y1;p2<=z0*z1;state<=4;end
4:begin dot<=$signed({{2{p0[63]}},p0})+$signed({{2{p1[63]}},p1})+$signed({{2{p2[63]}},p2});state<=5;end
5:begin agree<=dot>=66'sd1083391830224440832;busy<=0;done<=1;end
endcase
end
end
endmodule
