`timescale 1ns/1ps
                                                                                
                                                                                
                                                                                     
module localization_results(input clk,rst_n,update,background_ready,input [2:0] direction_ok,
input signed [31:0] jx,jy,a1x,a1y,a2x,a2y,input [31:0] evidence,input [15:0] f0,
output reg result_valid,output direction_valid,position_valid,
output reg azimuth_valid,output reg [11:0] azimuth,output reg [9:0] elevation,
output reg signed [31:0] ux,uy,x_mm,y_mm,z_mm,output reg [31:0] gap_mm);
reg [3:0] state;reg as,rs,gs;reg [1:0] which;reg [2:0] ok;
reg signed [31:0] xx[0:2],yy[0:2],zz[0:2];
wire ab,ad,ai,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
reg [31:0] ev;reg [15:0] fundamental;reg geometry_good,angular_good;
direction_angles angles(clk,rst_n,as,xx[which],yy[which],ab,ad,ai,av,az,el,uz);
wire rb,rd,ri,rvalid;wire signed [31:0] rx,ry,rz;wire [31:0] rg;
ray_intersection rays(clk,rst_n,rs,xx[1],yy[1],zz[1],xx[2],yy[2],zz[2],rb,rd,ri,rvalid,rx,ry,rz,rg);
wire activity,persistent;wire [2:0] status;
reg consistency_start;wire consistency_busy,consistency_done,consistency_invalid,consistency_agree;
direction_consistency interarray(clk,rst_n,consistency_start,xx[1],yy[1],xx[2],yy[2],
consistency_busy,consistency_done,consistency_invalid,consistency_agree);
output_gate #(.EVIDENCE_Q24(0)) gate(clk,rst_n,gs,background_ready,1'b1,1'b1,ev,fundamental,
angular_good?16'd0:16'd201,geometry_good,activity,persistent,direction_valid,position_valid,status);
always @(posedge clk)begin
if(!rst_n)begin result_valid<=0;azimuth_valid<=0;azimuth<=0;elevation<=0;ux<=0;uy<=0;x_mm<=0;y_mm<=0;z_mm<=0;gap_mm<=0;
state<=0;as<=0;rs<=0;gs<=0;consistency_start<=0;which<=0;ok<=0;ev<=0;fundamental<=0;geometry_good<=0;angular_good<=0;end
else begin as<=0;rs<=0;gs<=0;consistency_start<=0;result_valid<=0;
case(state)
0:if(update)begin xx[0]<=jx;yy[0]<=jy;xx[1]<=a1x;yy[1]<=a1y;xx[2]<=a2x;yy[2]<=a2y;
ok<=direction_ok;ev<=evidence;fundamental<=f0;which<=0;geometry_good<=0;angular_good<=direction_ok[0];state<=1;end
1:begin as<=1;state<=2;end
2:if(ad)begin zz[which]<=uz;if(ai)ok[which]<=0;
if(which==0)begin azimuth<=az;elevation<=el;azimuth_valid<=av;ux<=xx[0];uy<=yy[0];angular_good<=ok[0]&&!ai;end
if(which==2)state<=3;else begin which<=which+1;state<=1;end end
3:begin rs<=1;state<=4;end
4:if(rd)begin x_mm<=rx;y_mm<=ry;z_mm<=rz;gap_mm<=rg;geometry_good<=rvalid&&!ri&&ok[1]&&ok[2];state<=8;end
8:begin consistency_start<=1;state<=9;end
9:if(consistency_done)begin angular_good<=angular_good&&ok[1]&&ok[2]&&
 (geometry_good||(!consistency_invalid&&consistency_agree));state<=5;end
5:begin gs<=1;state<=6;end
6:state<=7;
7:begin result_valid<=1;state<=0;end
endcase
end
end
endmodule
