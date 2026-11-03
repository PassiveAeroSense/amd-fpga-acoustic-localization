`timescale 1ns/1ps
module tb_live_detection;
reg clk=0;always #5 clk=~clk;reg rst=0,link=1,gap=0,rv=0,pos=0,inv=0;
wire active,known;
live_detection_status #(.TIMEOUT_CYCLES(20)) dut(clk,rst,link,gap,rv,pos,inv,active,known);
task result(input bit p,input bit i);begin @(negedge clk);rv=1;pos=p;inv=i;@(negedge clk);rv=0;end endtask
initial begin
 repeat(3)@(negedge clk);rst=1;
 result(0,0);if(active||!known)$fatal(1,"negative");
 result(1,0);if(!active||!known)$fatal(1,"positive");
 result(0,0);if(active||!known)$fatal(1,"negative must clear immediately");
 result(1,1);if(active||known)$fatal(1,"invalid positive");
 result(1,0);gap=1;#1;if(active||known)$fatal(1,"gap");@(negedge clk);gap=0;
 result(1,0);link=0;#1;if(active)$fatal(1,"lost acquisition");@(negedge clk);link=1;
 result(1,0);repeat(22)@(negedge clk);if(active||known)$fatal(1,"stale result");
 $display("LIVE_DETECTION_PASS positive negative invalid gap outage expiry");$finish;
end
endmodule
