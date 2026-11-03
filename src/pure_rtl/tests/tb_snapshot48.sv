`timescale 1ns/1ps
                                                                           
                                                                             
module tb_snapshot48;
reg clk=0;always #10 clk=~clk;reg rst=0,start=0,valid=0;reg [383:0] data=0;
wire signed [31:0] cr,ci;wire [5:0] expn;wire [6:0] frames;wire busy,done,invalid;wire [31:0] captured;
integer input_id=0,last_written=-1,frame_start=0,started=0,reads=0,ch,span;reg fs_last=0;
joint15_capture dut(clk,rst,valid,1'b0,data,start,7'd3,16'd0,cr,ci,expn,frames,busy,done,invalid,captured);
function signed [23:0] pattern(input integer n,c);begin pattern=((n*17+c*1009)%12001-6000)*256;end endfunction
always @(posedge clk)begin
if(valid)last_written=input_id-1;
if(dut.fs&&!fs_last)begin frame_start=last_written-4095;started=started+1;end
fs_last=dut.fs;
if(dut.fftframe.busy&&(dut.fftframe.state==2||dut.fftframe.state==6))begin
if(dut.sample!==pattern(frame_start+dut.req,dut.ch))$fatal(1,"ring overwrite/misalignment frame%0d ch%0d addr%0d got%0d expected%0d",started,dut.ch,dut.req,dut.sample,pattern(frame_start+dut.req,dut.ch));
reads=reads+1;end
end
initial begin
#40;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;
while(!done)begin
@(negedge clk);valid=1;for(ch=0;ch<16;ch=ch+1)data[ch*24+:24]=pattern(input_id,ch);
input_id=input_id+1;span=input_id%3==0?1041:1042;
@(negedge clk);valid=0;repeat(span-2)@(negedge clk);
end
end
initial begin wait(done);#1;
if(invalid||frames!=3||captured!=10240||started!=3||reads!=3*16*4096*2)$fatal(1,"48k snapshot cadence/capture status frames%0d samples%0d reads%0d",frames,captured,reads);
$display("SNAPSHOT48 PASS real48k input with16x4096 FFTs,no overwritten snapshot,3frames/10240samples,all16 channels");$finish;end
initial begin #400000000;$fatal(1,"snapshot48 timeout");end
endmodule
