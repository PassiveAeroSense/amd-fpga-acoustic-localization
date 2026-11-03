`timescale 1ns/1ps
module tb_geometry;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg signed [31:0] ax,ay,az,bx,by,bz;
wire busy,done,invalid,valid;wire signed [31:0] x,y,z;wire [31:0] gap;
ray_intersection dut(clk,rst,start,ax,ay,az,bx,by,bz,busy,done,invalid,valid,x,y,z,gap);
real tx,ty,tz,da,db;integer i;
function real absolute(input real a);begin absolute=a<0?-a:a;end endfunction
task run(input real xx,yy,zz,input integer expected);begin
da=$sqrt((xx+0.5)*(xx+0.5)+yy*yy+zz*zz);db=$sqrt((xx-0.5)*(xx-0.5)+yy*yy+zz*zz);
@(negedge clk);ax=$rtoi((xx+0.5)/da*1073741824.0);ay=$rtoi(yy/da*1073741824.0);az=$rtoi(zz/da*1073741824.0);
bx=$rtoi((xx-0.5)/db*1073741824.0);by=$rtoi(yy/db*1073741824.0);bz=$rtoi(zz/db*1073741824.0);start=1;
@(negedge clk);start=0;wait(done);#1;
if(invalid||valid!=expected)$fatal(1,"geometry status xyz%f,%f,%f valid%0d",xx,yy,zz,valid);
if(valid&&(absolute(x-xx*1000)>4||absolute(y-yy*1000)>4||absolute(z-zz*1000)>4||gap>4))$fatal(1,"geometry error %0d %0d %0d gap%0d",x,y,z,gap);
end endtask
initial begin #30;rst=1;run(2.0,-2.0,3.0,1);run(-2.0,1.0,2.0,1);run(0.0,0.0,10.0,1);run(0.0,0.0,120.0,0);run(10.0,0.0,1.0,0);
$display("GEOMETRY accepted near rays and rejected poor parallax");$finish;end
initial begin #1000000;$fatal(1,"geometry timeout");end
endmodule

