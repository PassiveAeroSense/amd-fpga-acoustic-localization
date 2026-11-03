`timescale 1ns/1ps
module tb_near_geometry;
reg clk=0;always #5 clk=~clk;reg rst=0,update=0;
reg signed [31:0] ax,ay,bx,by;
wire rv,dv,pv,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] ux,uy,x,y,z;wire [31:0] err;
reliable_results dut(clk,rst,update,2'b11,ax,ay,bx,by,rv,dv,pv,av,az,el,ux,uy,x,y,z,err);
task go;begin @(negedge clk);update=1;@(negedge clk);update=0;wait(rv);#1;end endtask
initial begin #30;rst=1;
ax=893407201;ay=0;bx=480191942;by=0;go(); if(!dv||!pv||el<448||el>452||az<0||az>2)$fatal(1,"near geometry case 0 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=830917969;ay=304137085;bx=334077355;by=456358154;go(); if(!dv||!pv||el<448||el>452||az<298||az>302)$fatal(1,"near geometry case 30 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=647490682;ay=560743379;bx=0;by=702929026;go(); if(!dv||!pv||el<448||el>452||az<598||az>602)$fatal(1,"near geometry case 60 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=357913941;ay=715827883;bx=-357913941;by=715827883;go(); if(!dv||!pv||el<448||el>452||az<898||az>902)$fatal(1,"near geometry case 90 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=0;ay=702929026;bx=-647490682;by=560743379;go(); if(!dv||!pv||el<448||el>452||az<1198||az>1202)$fatal(1,"near geometry case 120 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=-334077355;ay=456358154;bx=-830917969;by=304137085;go(); if(!dv||!pv||el<448||el>452||az<1498||az>1502)$fatal(1,"near geometry case 150 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
ax=-480191942;ay=0;bx=-893407201;by=0;go(); if(!dv||!pv||el<448||el>452||az<1798||az>1802)$fatal(1,"near geometry case 180 az=%d el=%d xyz %d %d %d",az,el,x,y,z);
$display("NEAR GEOMETRY PASS: 1m high,45deg elevation, azimuth0..180, midpoint angle error <=0.2deg");$finish;end
initial begin #1000000;$fatal(1,"timeout");end
endmodule
