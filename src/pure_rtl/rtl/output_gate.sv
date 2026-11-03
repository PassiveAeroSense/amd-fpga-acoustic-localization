`timescale 1ns/1ps
                                                                  
                                                                                      
module output_gate #(parameter EVIDENCE_Q24=774706,F0_LOW=279,F0_HIGH=323,SPLIT_TENTHS=200)(
 input clk,rst_n,update,calibrated,input_ok,sequence_contiguous,
 input [31:0] evidence_q24,input [15:0] fundamental_hz,split_tenths,
 input geometric_position_ok,
 output reg activity,persistent,direction_valid,position_valid,
 output reg [2:0] status);
reg [7:0] history;reg [3:0] windows;reg act;reg [7:0] next_hist;integer i,count;
always @*begin
act=evidence_q24>EVIDENCE_Q24&&fundamental_hz>=F0_LOW&&fundamental_hz<=F0_HIGH&&split_tenths<=SPLIT_TENTHS;
next_hist={history[6:0],act};count=0;for(i=0;i<8;i=i+1)count=count+next_hist[i];
end
always @(posedge clk)begin
if(!rst_n)begin history<=0;windows<=0;activity<=0;persistent<=0;direction_valid<=0;position_valid<=0;status<=0;end
else if(update)begin
activity<=0;persistent<=0;direction_valid<=0;position_valid<=0;
if(!calibrated||!input_ok||!sequence_contiguous)begin history<=0;windows<=0;status<=!input_ok||!sequence_contiguous?5:0;end
else begin
history<=next_hist;if(windows<8)windows<=windows+1;
activity<=act;persistent<=windows>=7&&count>=6;
if(act&&windows>=7&&count>=6&&split_tenths<=SPLIT_TENTHS)begin direction_valid<=1;position_valid<=geometric_position_ok;status<=geometric_position_ok?4:3;end
else status<=act?2:1;
end
end
end
endmodule
