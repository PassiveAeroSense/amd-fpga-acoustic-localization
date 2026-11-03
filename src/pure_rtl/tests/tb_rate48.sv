`timescale 1ns/1ps
module tb_rate48;
reg clk=0;always #5 clk=~clk;reg rst=0,valid=0;reg [255:0] samples=0;
wire dv,df,lv,lb,lf;wire [383:0] detector,localized,expanded;
genvar c;generate for(c=0;c<16;c=c+1)begin assign expanded[c*24+:24]={samples[c*16+:16],8'd0};end endgenerate
audio_rate_bridge det(clk,rst,valid,2'b00,1'b0,samples,dv,detector,df);
fir_resampler16 #(.L(1),.M(1),.TAPS(383),.COEFF_FILE("loc_bandpass48.mem")) loc(clk,rst,valid,1'b0,expanded,lv,localized,lb,lf);
reg [23:0] data[0:4799];integer n,j,fd,fl,nd=0,nl=0,span;
always @(posedge clk)begin
if(dv)begin $fwrite(fd,"%0d\n",$signed(detector[23:0]));nd=nd+1;
for(integer k=1;k<8;k=k+1)if(detector[k*24+:24]!==detector[23:0])$fatal(1,"detector phase mismatch");
if(detector[383:192]!==192'd0)$fatal(1,"unused detector ADC2 lanes not zero");end
if(lv)begin $fwrite(fl,"%0d\n",$signed(localized[23:0]));nl=nl+1;
for(integer k=1;k<16;k=k+1)if(localized[k*24+:24]!==localized[23:0])$fatal(1,"localization phase mismatch");end
end
initial begin
$readmemh("rate48_test_input.mem",data);fd=$fopen("rate48_det_out.txt","w");fl=$fopen("rate48_loc_out.txt","w");
#30;rst=1;
for(n=0;n<4800;n=n+1)begin
@(negedge clk);valid=1;for(j=0;j<16;j=j+1)samples[j*16+:16]=data[n][23:8];
span=n%3==2?2084:2083;
@(negedge clk);valid=0;repeat(span-2)@(negedge clk);
end
repeat(3000)@(negedge clk);if(df||lf)$fatal(1,"48k filter overrun");
if(nd!=1372||nl!=4418)$fatal(1,"sample rates wrong detector%0d localization%0d",nd,nl);
$fclose(fd);$fclose(fl);$display("RATE48 PASS 48k localization383tap bandpass and48->15k detector,all16 lanes, no overrun");$finish;
end
initial begin #120000000;$fatal(1,"48k rate timeout");end
endmodule
