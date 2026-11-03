`timescale 1ns/1ps
module tb_stft;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;wire [11:0] addr;wire [3:0] channel;reg signed [23:0] sample;
reg [7:0] pa=0;wire [63:0] pv;wire busy,done,invalid;wire [31:0] cycles;
reg [23:0] audio[0:278399];integer j,f;
detector_stft_frame dut(clk,rst,start,addr,channel,sample,pa,pv,busy,done,invalid,cycles);
always @(posedge clk)sample<=audio[addr*16+channel];
initial begin $readmemh("frontend_audio.mem",audio);#30;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;wait(done);#1;
if(invalid)$fatal(1,"STFT invalid");f=$fopen("stft_out.txt","w");
for(j=0;j<194;j=j+1)begin @(negedge clk);pa=j;@(posedge clk);#1;$fwrite(f,"%0d\n",pv);end
$fclose(f);$display("STFT GENERATED16channels194bands cycles=%0d",cycles);$finish;end
initial begin #80000000;$fatal(1,"STFT timeout");end
endmodule
