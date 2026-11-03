`timescale 1ns/1ps
module tb_event_hold;
reg clk=0;always #5 clk=~clk;reg rst=0,valid=0,arr=0,positive=0,invalid=0;
wire active;wire [27:0] remaining;wire [31:0] h1,h2,t1,t2;
detection_event_hold #(.HOLD_CYCLES(20)) dut(clk,rst,valid,arr,positive,invalid,active,remaining,h1,h2,t1,t2);
task tick;begin @(posedge clk);#1;end endtask
task decision(input a,p,b);begin @(negedge clk);arr=a;positive=p;invalid=b;valid=1;tick();@(negedge clk);valid=0;end endtask
initial begin tick();rst=1;decision(0,1,0);
if(!active||remaining!=20||h1!=1||t1!=1)$fatal(1,"single A1 hit not immediately held");
repeat(4)tick();decision(0,0,0);if(!active||remaining>=20)$fatal(1,"negative cleared or extended hold");
repeat(4)tick();decision(1,1,1);if(!active||remaining>=16||h2!=0||t2!=0)$fatal(1,"invalid extended hold/count");
decision(1,1,0);if(remaining!=20||h2!=1||t2!=1)$fatal(1,"A2 positive did not reload full hold");
repeat(19)tick();if(!active||remaining!=1)$fatal(1,"incorrect hold length before expiry");
tick();if(active||remaining!=0)$fatal(1,"hold failed to expire exactly");
decision(1,1,0);if(!active||remaining!=20)$fatal(1,"new isolated hit failed");
@(negedge clk);rst=0;tick();if(active||h1||h2||t1||t2)$fatal(1,"reset failed");
$display("EVENT HOLD PASS: one-window OR, exact four-second cycle model, extension, negative/invalid, counters");$finish;end
endmodule
