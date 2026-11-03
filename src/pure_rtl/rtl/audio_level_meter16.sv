`timescale 1ns/1ps
                                                                                
                                                                           
                                                                     
                                                                                 
module audio_level_meter16 #(parameter LOG_N=12)(
 input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 output reg [127:0] levels);
reg [LOG_N-1:0] count;
reg [LOG_N+24:0] sums[0:15];
reg signed [31:0] dc[0:15];                                                         
reg signed [32:0] error_q16,next_dc;
reg signed [24:0] value;reg [24:0] magnitude;
reg [LOG_N+24:0] total;
integer ch;
function [7:0] height(input [24:0] mean_q8);
begin
 if(mean_q8<24'd256)height=0;
 else if(mean_q8<24'd512)height=1;
 else if(mean_q8<24'd768)height=2;
 else if(mean_q8<24'd1024)height=3;
 else if(mean_q8<24'd1536)height=4;
 else if(mean_q8<24'd2048)height=5;
 else if(mean_q8<24'd3072)height=6;
 else if(mean_q8<24'd4096)height=7;
 else if(mean_q8<24'd6144)height=8;
 else if(mean_q8<24'd8192)height=9;
 else if(mean_q8<24'd12288)height=10;
 else if(mean_q8<24'd16384)height=11;
 else if(mean_q8<24'd24576)height=12;
 else if(mean_q8<24'd32768)height=13;
 else if(mean_q8<24'd49152)height=14;
 else if(mean_q8<24'd65536)height=15;
 else if(mean_q8<24'd98304)height=16;
 else if(mean_q8<24'd131072)height=17;
 else if(mean_q8<24'd262144)height=18;
 else if(mean_q8<24'd524288)height=19;
 else height=20;
end endfunction
always @(posedge clk)begin
 if(!rst_n||gap)begin count<=0;levels<=0;for(ch=0;ch<16;ch=ch+1)begin sums[ch]<=0;dc[ch]<=0;end end
 else if(audio_valid)begin
  count<=count+1'b1;
  for(ch=0;ch<16;ch=ch+1)begin
   error_q16=$signed({audio_samples[ch*24+:24],8'd0})-$signed({dc[ch][31],dc[ch]});
   next_dc=$signed({dc[ch][31],dc[ch]})+(error_q16>>>10);dc[ch]<=next_dc[31:0];
   value=error_q16>>>8;magnitude=value<0?-value:value;
   total=sums[ch]+magnitude;
   if(&count)begin levels[ch*8+:8]<=height(total>>LOG_N);sums[ch]<=0;end
   else sums[ch]<=total;
  end
 end
end
endmodule
