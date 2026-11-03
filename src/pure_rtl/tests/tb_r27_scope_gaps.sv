`timescale 1ns/1ps
module tb_r27_scope_gaps;
reg clk=0;always #15 clk=~clk;reg rst=0,sv=0,fs=0;reg [255:0] samples=0;reg [1:0] bad=0;reg [7:0] col=0;
wire [527:0] wave;wire [255:0] dc,pp;wire [63:0] scales;wire [159:0] clips;wire [1:0] good;
wire valid,ready;wire [31:0] frames;integer n,ch;
scope_capture dut(clk,rst,sv,samples,bad,fs,col,wave,dc,pp,scales,clips,good,valid,ready,frames);
task readcol(input [7:0] c);begin @(negedge clk);col=c;repeat(3)@(negedge clk);end endtask
task publish;begin @(negedge clk);fs=1;@(negedge clk);fs=0;repeat(3)@(negedge clk);end endtask
task fill(input integer phase);begin
 for(n=0;n<512;n=n+1)begin @(negedge clk);sv=1;bad=phase==0?(n==21?3:2):0;
 for(ch=0;ch<16;ch=ch+1)samples[ch*16+:16]=bad[ch/8]?16'h7fff:16'(n+ch*100);
 @(negedge clk);sv=0;end
 wait(ready);@(negedge clk);
end endtask
initial begin #100;rst=1;fill(0);publish();
 if(!valid||good!=1)$fatal(1,"per-array validity lost");
 readcol(9);for(ch=0;ch<16;ch=ch+1)if(wave[ch*33+32]!=(ch<8))$fatal(1,"bad array drawn as valid");
 readcol(10);for(ch=0;ch<16;ch=ch+1)if(wave[ch*33+32])$fatal(1,"single bad sample was not a gap");
 fill(1);readcol(10);if(wave[32])$fatal(1,"display bank changed before frame boundary");
 publish();readcol(10);if(good!=3)$fatal(1,"scope failed to recover");
 for(ch=0;ch<16;ch=ch+1)if(!wave[ch*33+32]||pp[ch*16+:16]!=511)$fatal(1,"recovered lane mismatch");
 $display("R27_SCOPE_GAPS_PASS raw per-ADC faults and single-sample gaps, tear-free bank swap, all16 recovery");$finish;
end
initial begin #2000000;$fatal(1,"scope gap test timeout");end
endmodule
