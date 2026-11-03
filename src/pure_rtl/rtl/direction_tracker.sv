`timescale 1ns/1ps
                                                                           
                                                                           
module direction_tracker #(parameter TENTH_CYCLES=5000000,HOLD_TENTHS=120)(
 input clk,rst_n,update,good,input [15:0] measurement_age,
 input signed [31:0] in_ux,in_uy,input acquisition_gap,
 output reg valid,output reg [1:0] mode,output reg [15:0] age,
 output reg signed [31:0] ux,uy,output reg [11:0] azimuth,
 output reg [9:0] elevation,output reg azimuth_valid);
reg [31:0] tick;reg pending;reg signed [31:0] pending_x,pending_y,tx,ty;
reg start;wire busy,done,invalid,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
reg [1:0] state;reg [15:0] accepted_age;
direction_angles angles(clk,rst_n,start,tx,ty,busy,done,invalid,av,az,el,uz);
function [32:0] distance(input signed [31:0] a,b);reg signed [32:0] d;begin
d=$signed({a[31],a})-$signed({b[31],b});distance=d<0?-d:d;end endfunction
wire near_old=distance(in_ux,ux)<=536870912&&distance(in_uy,uy)<=536870912;
wire near_pending=distance(in_ux,pending_x)<=268435456&&distance(in_uy,pending_y)<=268435456;
always @(posedge clk)begin
if(!rst_n)begin valid<=0;mode<=3;age<=65535;tick<=0;pending<=0;pending_x<=0;pending_y<=0;
tx<=0;ty<=0;ux<=0;uy<=0;azimuth<=0;elevation<=0;azimuth_valid<=0;state<=0;start<=0;accepted_age<=0;end
else begin start<=0;
if(tick==TENTH_CYCLES-1)begin tick<=0;if(age!=65535)age<=age+1;end else tick<=tick+1;
if(valid&&age>=HOLD_TENTHS)begin valid<=0;mode<=3;pending<=0;end
if(acquisition_gap)begin pending<=0;if(valid)mode<=2;end
case(state)
0:if(update)begin
 if(!good)begin pending<=0;if(valid)mode<=2;end
 else if(!valid||near_old||(pending&&near_pending))begin
  tx<=valid&&near_old?($signed({ux[31],ux})+$signed({in_ux[31],in_ux}))>>>1:in_ux;
  ty<=valid&&near_old?($signed({uy[31],uy})+$signed({in_uy[31],in_uy}))>>>1:in_uy;
  accepted_age<=measurement_age;pending<=0;state<=1;
 end else begin pending<=1;pending_x<=in_ux;pending_y<=in_uy;mode<=2;end
end
1:begin start<=1;state<=2;end
2:if(done)begin if(!invalid)begin valid<=1;mode<=1;age<=accepted_age;tick<=0;
ux<=tx;uy<=ty;azimuth<=az;elevation<=el;azimuth_valid<=av;end state<=0;end
endcase end end
endmodule
