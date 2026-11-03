`timescale 1ns/1ps
module tb_numeric;
reg clk=0;always #5 clk=~clk;reg rst=0;
reg ds=0,qs=0,cs=0,mode=0;reg [63:0] num=0,den=1,rad=0;
wire db,dd,dz,qb,qd,cb,cd;wire [63:0] quot,rem,srem;wire [31:0] root;
reg signed [39:0] x=0,y=0;reg signed [31:0] ang=0;
wire signed [31:0] oa,co,si;wire [39:0] mag;
fx_div d(clk,rst,ds,num,den,db,dd,dz,quot,rem);
fx_sqrt q(clk,rst,qs,rad,qb,qd,root,srem);
fx_cordic c(clk,rst,cs,mode,x,y,ang,cb,cd,oa,co,si,mag);
integer i;real a,err,expected;reg [63:0] test_num,test_den;
task divide(input [63:0] a,b);begin
 @(negedge clk);num=a;den=b;ds=1;@(negedge clk);ds=0;wait(dd);#1;
 if(b==0)begin if(!dz)$fatal(1,"zero divisor flag");end
 else if(quot!=a/b||rem!=a%b)$fatal(1,"divider mismatch");end endtask
task square(input [63:0] a);reg [63:0] r2;reg [64:0] next2;begin
 @(negedge clk);rad=a;qs=1;@(negedge clk);qs=0;wait(qd);#1;
 r2={32'd0,root}*{32'd0,root};next2=({33'd0,root}+65'd1)*({33'd0,root}+65'd1);
 if(r2>a||next2<={1'b0,a}||srem!=a-r2)$fatal(1,"sqrt mismatch");end endtask
initial begin
 #30;rst=1;
 divide(64'hffffffffffffffff,64'h100000001);divide(0,1);divide(123,0);divide(64'h8000000000000001,7);
 square(0);square(1);square(64'hffffffffffffffff);square(64'h8000000000000000);
 for(i=0;i<40;i=i+1)begin test_num={$random,$random};test_den={$random,$random};divide(test_num,test_den);square(test_num);end
 $display("PASS integer divider and sqrt including edge cases");
 for(i=-180;i<=180;i=i+9)begin
 a=i*3.141592653589793/180;
 @(negedge clk);ang=$rtoi(a*536870912.0);mode=0;cs=1;@(negedge clk);cs=0;wait(cd);#1;
 err=co/1073741824.0-$cos(a);if(err>2e-7||err< -2e-7)$fatal(1,"cos error %f",err);
 err=si/1073741824.0-$sin(a);if(err>2e-7||err< -2e-7)$fatal(1,"sin error %f",err);
 @(negedge clk);x=$rtoi($cos(a)*1000000000);y=$rtoi($sin(a)*1000000000);mode=1;cs=1;
 @(negedge clk);cs=0;wait(cd);#1;
 err=oa/536870912.0-a;if(err>3.14159)err=err-6.283185307179586;if(err< -3.14159)err=err+6.283185307179586;
 if(err>2e-7||err< -2e-7)$fatal(1,"atan2 error %f",err);
 if(mag<999999900||mag>1000000100)$fatal(1,"magnitude error %d",mag);
 end
 $display("PASS CORDIC sin/cos/atan2/magnitude all quadrants");$finish;
end
initial begin #2000000;$fatal(1,"numeric timeout");end
endmodule
