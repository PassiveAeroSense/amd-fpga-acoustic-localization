`timescale 1ns/1ps
module tb_level_meter;
reg clk=0;always #5 clk=~clk;reg rst=0,av=0,gap=0;reg [383:0] samples=0;
wire [127:0] levels;integer k,n,amp;
audio_level_meter16 #(.LOG_N(4)) dut(clk,rst,av,gap,samples,levels);
task send;begin @(negedge clk);av=1;@(negedge clk);av=0;end endtask
task clear;begin @(negedge clk);gap=1;@(negedge clk);gap=0;end endtask
initial begin
#20;rst=1;
                                                                                 
for(n=0;n<16;n=n+1)begin
 for(k=0;k<16;k=k+1)begin amp=(1<<k)*320;if(amp>8388607)amp=8388607;samples[k*24+:24]=n%2?-amp:amp;end
 send;
 if(n<15&&levels!==0)$fatal(1,"early publication");
end
if(levels[7:0]!=1||levels[1*8+:8]!=2||levels[2*8+:8]!=4||levels[3*8+:8]!=6||levels[4*8+:8]!=8||levels[5*8+:8]!=10||levels[6*8+:8]!=12||levels[7*8+:8]!=14||levels[8*8+:8]!=16||levels[9*8+:8]!=18||levels[10*8+:8]!=19)$fatal(1,"fixed scale/gain mismatch");
for(k=11;k<16;k=k+1)if(levels[k*8+:8]!=20)$fatal(1,"upper channels missing");
                                                                                
samples={16{24'h7fffff}};repeat(30)@(negedge clk);
if(levels[7:0]!=1)$fatal(1,"invalid clock accumulated");
samples=0;for(n=0;n<16384;n=n+1)send;
if(levels!==0)$fatal(1,"stuck peak after silence");
                                                                       
samples={16{24'd262144}};send;samples=0;for(n=1;n<16;n=n+1)send;
for(k=0;k<16;k=k+1)if(levels[k*8+:8]!=12)$fatal(1,"impulse incorrectly latched");
                                                         
samples={16{24'h800000}};repeat(5)send;clear;
if(levels!==0||dut.count!=0)$fatal(1,"gap did not clear meter");
                                                                            
for(n=0;n<16;n=n+1)send;
for(k=0;k<16;k=k+1)if(levels[k*8+:8]!=20)$fatal(1,"negative full-scale overflow");
clear;samples={16{24'd5120}};for(n=0;n<16;n=n+1)send;
for(k=0;k<16;k=k+1)if(levels[k*8+:8]!=8)$fatal(1,"20 ADC codes still fills display");
                                                                           
samples={16{24'd1372160}};for(n=0;n<16384;n=n+1)send;
if(levels!==0)$fatal(1,"constant DC still displayed as sound");
$display("LEVEL METER PASS:all16,fixed scale,DC rejection,quiet decay,impulse averaging,valid gating,gap reset,signed extremes");$finish;
end
initial begin #1000000;$fatal(1,"timeout");end
endmodule
