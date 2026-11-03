`timescale 1ns/1ps
module tb_audio_detector;
reg clk=0;always #5 clk=~clk;reg rst=0,av=0,gap=0;reg [383:0] samples=0;
wire valid,array_id,detected,invalid,overrun;wire signed [31:0] score;wire signed [63:0] sum;wire [4:0] history;
wire [31:0] number,end_sample,cycles;
detector_audio_frontend dut(clk,rst,av,gap,samples,valid,array_id,detected,invalid,score,sum,history,number,end_sample,overrun,cycles,);
reg [23:0] data[0:278399];integer i,c,fd,fb,n=0;
always @(posedge clk)begin
if(valid)begin
if(invalid||overrun)$fatal(1,"audio detector fault");
if(number!=n/2||array_id!=n%2||history!=n/2+1||end_sample!=15000+(n/2)*2400)$fatal(1,"window timing/index mismatch");
$fwrite(fd,"%0d %0d %0d %0d %0d\n",number,array_id,score,sum,detected);n=n+1;
end
if(dut.bl)$fwrite(fb,"%0d %0d %0d %0d\n",dut.frame_number,dut.arr,dut.band,dut.db);
end
initial begin $readmemh("frontend_audio.mem",data);fd=$fopen("audio_detector_out.txt","w");fb=$fopen("audio_bands_out.txt","w");#30;rst=1;
for(i=0;i<17400;i=i+1)begin @(negedge clk);av=1;for(c=0;c<16;c=c+1)samples[c*24+:24]=data[i*16+c];
@(negedge clk);av=0;repeat(2998)@(negedge clk);end
wait(n==4);@(negedge clk);gap=1;@(negedge clk);gap=0;#1;if(!invalid||detected)$fatal(1,"gap did not invalidate output");
$fclose(fd);$fclose(fb);$display("AUDIO DETECTOR PASS two windows16ch, timestamps, gap reset");$finish;end
initial begin #600000000;$fatal(1,"audio detector timeout");end
endmodule
