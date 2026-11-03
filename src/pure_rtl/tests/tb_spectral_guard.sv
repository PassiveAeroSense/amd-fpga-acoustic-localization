`timescale 1ns/1ps
module tb_spectral_guard;
reg clk=0;always #5 clk=~clk;reg rst=0,gap=0,ev=0,ea=0,q=0,qa=0;reg [63:0] energy=0;
wire done,allow;wire [1:0] cal;
spectral_event_guard dut(clk,rst,gap,ev,ea,energy,q,qa,done,allow,cal);
task frame(input [63:0] value);begin @(negedge clk);energy=value;ev=1;@(negedge clk);ev=0;end endtask
task check(input expected);begin @(negedge clk);q=1;@(negedge clk);q=0;wait(done);#1;if(allow!==expected)$fatal(1,"event guard expected%0d got%0d",expected,allow);@(negedge clk);end endtask
integer k;
initial begin #30;rst=1;
for(k=0;k<32;k=k+1)frame(100);check(0);if(!cal[0])$fatal(1,"calibration failed");
for(k=0;k<10;k=k+1)frame(120);check(0);
for(k=0;k<4;k=k+1)frame(10000);check(0);
for(k=0;k<10;k=k+1)frame(1000);check(1);
gap=1;@(negedge clk);gap=0;check(0);if(!cal[0])$fatal(1,"gap erased learned floor");
for(k=0;k<10;k=k+1)frame(1000);check(1);
qa=1;check(0);
$display("SPECTRAL GUARD PASS: quiet,impulse,steady source,gap,recovery,array isolation");$finish;end
initial begin #30000;$fatal(1,"guard timeout");end
endmodule
