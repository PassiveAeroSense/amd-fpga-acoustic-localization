`timescale 1ns/1ps
module tb_bcd;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg [16:0] value=0;wire busy,done;wire [23:0] digits;
integer i,k,actual;
binary_bcd dut(clk,rst,start,value,busy,done,digits);
initial begin #30;rst=1;for(i=0;i<131072;i=i+1)begin
@(negedge clk);value=i;start=1;@(negedge clk);start=0;wait(done);#1;actual=0;
for(k=5;k>=0;k=k-1)begin if(digits[k*4+:4]>9)$fatal(1,"invalid BCD digit");actual=actual*10+digits[k*4+:4];end
if(actual!=i)$fatal(1,"BCD mismatch %0d %0d",i,actual);end
$display("BCD exhaustive131072 values PASS");$finish;end
initial begin #50000000;$fatal(1,"BCD timeout");end
endmodule
