`timescale 1ns/1ps
`include "r19_config.vh"
module tb_r24_control;
reg clk=0;always #10 clk=~clk;reg rst=0,up=0,can=1,high_conf=1,gap=0;
reg signed [31:0] ix=0,iy=0,iz=1000;
wire [2:0] v;wire signed [31:0] x[0:2],y[0:2],z[0:2];
genvar k;generate for(k=0;k<3;k=k+1)begin:g
wire [1:0] mode;wire [15:0] age;wire signed [31:0] ux,uy;wire [11:0] az;wire [9:0] el;wire av;
xyz_estimate_tracker #(.HORIZONTAL_MM(`R19_HORIZONTAL_MM),.VERTICAL_MM(`R19_VERTICAL_MM),.FAST_MODE(k)) dut(clk,rst,up,can,high_conf,16'd0,ix,iy,iz,gap,v[k],mode,age,x[k],y[k],z[k],ux,uy,az,el,av);
end endgenerate
task fix(input integer a,b,c);begin @(negedge clk);ix=a;iy=b;iz=c;up=1;@(negedge clk);up=0;repeat(1600)@(negedge clk);end endtask
initial begin
 repeat(5)@(negedge clk);rst=1;fix(0,0,1000);if(v!=7)$fatal(1,"first fix");
 fix(5000,0,3000);if(x[0]!=0||x[1]!=0||x[2]!=5000)$fatal(1,"one-result response");
 fix(5000,0,3000);if(x[0]!=0||x[1]!=5000)$fatal(1,"balanced two confirmations");
 fix(5000,0,3000);if(x[0]!=5000)$fatal(1,"precision three confirmations");
 fix(`R19_HORIZONTAL_MM,0,`R19_VERTICAL_MM);fix(`R19_HORIZONTAL_MM,0,`R19_VERTICAL_MM);fix(`R19_HORIZONTAL_MM,0,`R19_VERTICAL_MM);
 if(x[0]!=`R19_HORIZONTAL_MM||x[1]!=`R19_HORIZONTAL_MM||x[2]!=`R19_HORIZONTAL_MM||z[0]!=`R19_VERTICAL_MM||z[1]!=`R19_VERTICAL_MM||z[2]!=`R19_VERTICAL_MM)$fatal(1,"configured domain boundary");
 fix(`R19_HORIZONTAL_MM+1,0,`R19_VERTICAL_MM);fix(`R19_HORIZONTAL_MM+1,0,`R19_VERTICAL_MM);fix(`R19_HORIZONTAL_MM+1,0,`R19_VERTICAL_MM);if(x[2]!=`R19_HORIZONTAL_MM)$fatal(1,"horizontal bound");
 fix(0,0,`R19_VERTICAL_MM+1);if(z[2]!=`R19_VERTICAL_MM)$fatal(1,"vertical bound");
 gap=1;fix(0,0,1000);if(x[2]!=`R19_HORIZONTAL_MM)$fatal(1,"gap hold");
 $display("R24_CONTROL_PASS three profiles and configured H%0d Z%0d bounds",`R19_HORIZONTAL_MM,`R19_VERTICAL_MM);$finish;
end
initial begin #2000000;$fatal(1,"timeout");end
endmodule
