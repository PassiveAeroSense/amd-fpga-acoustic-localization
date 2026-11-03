`timescale 1ns/1ps
module tb_consistency;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg signed [31:0] ax=1073741824,ay=0,bx=0,by=0;
wire busy,done,invalid,agree;
direction_consistency dut(clk,rst,start,ax,ay,bx,by,busy,done,invalid,agree);
task run(input real degrees,input integer expected);real a;begin
a=degrees*3.141592653589793/180;
@(negedge clk);bx=$rtoi($cos(a)*1073741824.0);by=$rtoi($sin(a)*1073741824.0);start=1;
@(negedge clk);start=0;wait(done);#1;if(invalid||agree!=expected)$fatal(1,"20deg policy mismatch angle%f",degrees);end endtask
initial begin #30;rst=1;run(0,1);run(19.99,1);run(20.01,0);run(90,0);
@(negedge clk);bx=1073741824;by=1073741824;start=1;@(negedge clk);start=0;wait(done);#1;if(!invalid)$fatal(1,"invalid unit vector accepted");
$display("CONSISTENCY20deg boundary and invalid input PASS");$finish;end
initial begin #100000;$fatal(1,"consistency timeout");end
endmodule
