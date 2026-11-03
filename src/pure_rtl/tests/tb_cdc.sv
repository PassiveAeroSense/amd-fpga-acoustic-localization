`timescale 1ns/1ps
module tb_cdc;
reg sc=0,dc=0;always #5 sc=~sc;always #7 dc=~dc;reg rst=0,send=0;reg [63:0] data=0;
wire ready,over,valid;wire [63:0] received;integer n=0,i;
cdc_mailbox #(.WIDTH(64)) dut(sc,rst,send,data,ready,over,dc,rst,valid,received);
always @(posedge dc)if(valid)begin if(received!={32'hA55AA55A,32'(n)})$fatal(1,"CDC changed payload or order");n=n+1;end
initial begin #40;rst=1;
for(i=0;i<100;i=i+1)begin wait(ready);@(negedge sc);data={32'hA55AA55A,32'(i)};send=1;@(negedge sc);send=0;repeat(20)@(negedge sc);end
wait(n==100);if(over)$fatal(1,"unexpected overrun");$display("CDC 100 coherent packets, independent clocks");$finish;end
initial begin #100000;$fatal(1,"CDC timeout");end
endmodule
