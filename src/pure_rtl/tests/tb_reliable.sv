`timescale 1ns/1ps
module tb_reliable;
reg clk=0;always #5 clk=~clk;reg rst=0,update=0;reg [1:0] q=3;
reg signed [31:0] ax=641675804,ay=-385005482,bx=438353264,by=-438353264;
wire rv,dv,pv,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] ux,uy,x,y,z;wire [31:0] err;
reliable_results dut(clk,rst,update,q,ax,ay,bx,by,rv,dv,pv,av,az,el,ux,uy,x,y,z,err);
task go;begin @(negedge clk);update=1;@(negedge clk);update=0;wait(rv);#1;end endtask
initial begin #30;rst=1;go();
if(!dv||!pv||x<1900||x>2100||y< -1600||y> -1400||z<2900||z>3100)$fatal(1,"triangulation %d %d %d dv%0d pv%0d",x,y,z,dv,pv);
q=1;go();if(!dv||pv)$fatal(1,"single array invented range");
q=3;bx=ax;by=ay;go();if(!dv||pv)$fatal(1,"parallel rays invented range");
q=0;go();if(dv||pv)$fatal(1,"invalid window held stale result");
$display("RELIABLE GEOMETRY PASS: near, one-array, parallel, missing");$finish;end
initial begin #1000000;$fatal(1,"timeout");end
endmodule
