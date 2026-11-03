`timescale 1ns/1ps
module tb_rate;
reg clk=0;always #5 clk=~clk;reg rst=0,valid=0;reg [255:0] samples=0;wire outvalid,fault;wire [383:0] audio;
audio_rate_bridge dut(clk,rst,valid,2'b00,1'b0,samples,outvalid,audio,fault);
reg [23:0] data[0:2399];integer i,j,c,fd,n=0;
always @(posedge clk)if(outvalid)begin $fwrite(fd,"%0d\n",$signed(audio[23:0]));n=n+1;
for(c=1;c<16;c=c+1)if(audio[c*24+:24]!==audio[23:0])$fatal(1,"rate channel misalignment");end
initial begin $readmemh("rate_test_input.mem",data);fd=$fopen("rate_out.txt","w");#30;rst=1;
for(i=0;i<2400;i=i+1)begin @(negedge clk);valid=1;for(j=0;j<16;j=j+1)samples[j*16+:16]=data[i][23:8];
@(negedge clk);valid=0;repeat(4998)@(negedge clk);end
repeat(5000)@(negedge clk);if(fault)$fatal(1,"resampler overrun");$fclose(fd);$display("RATE GENERATED %0d synchronized16ch outputs",n);$finish;end
initial begin #140000000;$fatal(1,"rate timeout");end
endmodule
