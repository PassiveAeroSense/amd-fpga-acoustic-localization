`timescale 1ns/1ps
module tb_light_capture;
reg clk=0;always #5 clk=~clk;reg rst=0,av=0,start=0,gap=0;reg [383:0] samples=0;reg [15:0] addr=0;
wire signed [31:0] re,im;wire [5:0] exponent;wire [6:0] frames;wire busy,done,invalid;wire [31:0] captured;
light_pair_capture dut(clk,rst,av,gap,samples,start,7'd8,addr,re,im,exponent,frames,busy,done,invalid,captured);
reg [23:0] audio[0:278399];integer i,c,f;
integer capture_cycles=0;
always @(posedge clk)if(busy)capture_cycles<=capture_cycles+1;
initial begin $readmemh("frontend_audio.mem",audio);#30;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;
for(i=0;i<5632;i=i+1)begin @(negedge clk);av=1;for(c=0;c<16;c=c+1)samples[c*24+:24]=audio[i*16+c];
@(negedge clk);av=0;repeat(3332)@(negedge clk);end
wait(done);#1;if(invalid||frames!=8||captured!=5632)$fatal(1,"capture failed frames=%d invalid=%d",frames,invalid);
$display("CAPTURE_CYCLES=%0d",capture_cycles);
f=$fopen("light_capture_out.txt","w");$fwrite(f,"%0d %0d\n",exponent,frames);
for(i=0;i<8512;i=i+1)begin @(negedge clk);addr=i;@(posedge clk);#1;$fwrite(f,"%0d %0d\n",re,im);end
$fclose(f);$display("LIGHT CAPTURE GENERATED266frequencies16ch exponent=%d",exponent);$finish;end
initial begin #300000000;$fatal(1,"light capture timeout");end
endmodule
