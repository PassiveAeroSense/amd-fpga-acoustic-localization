`timescale 1ns/1ps
module tb_stft16_schedule;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;
wire [11:0] addr;wire [3:0] ch,och;reg signed [23:0] sample=0;
wire valid,busy,done,invalid;wire [8:0] fi;wire signed [31:0] re,im;wire [31:0] peak;
integer ticks=0,count=0,outfile;reg [15:0] visited=0;
joint15_stft_frame dut(clk,rst,start,addr,ch,sample,valid,fi,och,re,im,busy,done,invalid,peak);
always @(posedge clk)begin sample<=($signed({1'b0,addr[7:0]})-128)*(ch+1)*256;
if(busy)ticks<=ticks+1;
if(valid)begin visited[och]<=1;count<=count+1;$fdisplay(outfile,"%0d %0d %0d %0d",och,fi,re,im);end end
initial begin outfile=$fopen("stft48_out.txt","w");#30;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;
wait(done);@(negedge clk);
if(invalid||visited!=16'hffff||count!=4256)$fatal(1,"not all16 spectra present");
                                                                        
if(ticks+36176*10+32>=3200000)$fatal(1,"16ch frame misses 50MHz/48kHz/hop3072 deadline");
$fclose(outfile);$display("STFT16 PASS all4256 outputs; FFT cycles%0d total budget%0d vs3200000",ticks,ticks+36176*10+32);$finish;end
initial begin #60000000;$fatal(1,"STFT16 timeout");end
endmodule
