`timescale 1ns/1ps
module tb_hover_consensus;
reg clk=0;always #5 clk=~clk;reg rst=0,up=0,v=1,c=1,gap=0;reg signed [31:0] x=0,y=0,z=1000;
wire ou,ov;wire signed [31:0] ox,oy,oz;
hover_consensus dut(clk,rst,up,v,c,gap,x,y,z,ou,ov,ox,oy,oz);
task fix(input integer a,b,d);begin @(negedge clk);x=a;y=b;z=d;up=1;@(negedge clk);up=0;end endtask
initial begin
 repeat(3)@(negedge clk);rst=1;
 fix(0,0,1000);if(ou)$fatal(1,"first measurement must not confirm");
 fix(100,-100,1100);if(ou)$fatal(1,"second must not confirm");
 fix(-50,50,950);if(!ou||!ov||ox!=0||oy!=0||oz!=1000)$fatal(1,"median");
 fix(12000,0,12000);if(ou)$fatal(1,"outlier");
 gap=1;@(negedge clk);gap=0;
 fix(10000,1000,12000);c=0;fix(10000,1000,12000);c=1;fix(10000,1000,12000);if(ou)$fatal(1,"invalid history");
 fix(10100,900,12100);fix(9900,1100,11900);if(!ou||ox!=10000||oy!=1000||oz!=12000)$fatal(1,"far median");
 $display("HOVER_CONSENSUS_PASS near far median invalid gap outlier");$finish;
end
endmodule
