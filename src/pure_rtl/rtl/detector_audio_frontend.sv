`timescale 1ns/1ps
                                                                       
                                                                             
                                                                             
                                                                       
                                                                              
module detector_audio_frontend(input clk,rst_n,audio_valid,gap,
 input [383:0] audio_samples,
 output reg result_valid,output reg result_array,output reg detected,invalid,
 output reg signed [31:0] raw_score,output reg signed [63:0] causal_sum,
 output reg [4:0] history_count,output reg [31:0] window_number,
 output reg [31:0] window_end_sample,output reg overrun,
 output [31:0] fft_frame_cycles,output [2:0] diagnostic);
`include "detector_frontend_config.vh"
`include "detector_config.vh"
reg [12:0] wrptr,frame_base;reg [31:0] count,next_frame,frame_number;
wire [11:0] req;wire [3:0] channel;wire [383:0] read_word;
wire signed [23:0] sample=read_word[channel*24+:24];
reg fs;reg [7:0] pa;wire [63:0] pv;wire fb,fd,fi;
wire local_reset=rst_n&&!gap;
wire [13:0] ring_sum={1'b0,frame_base}+req;
wire [12:0] ring_read=ring_sum>=5120?ring_sum-5120:ring_sum;
banked_sdp_ram #(.WIDTH(384),.DEPTH(5120)) audio_ring(clk,audio_valid&&!gap,wrptr,ring_read,audio_samples,read_word);
detector_stft_frame frame(clk,local_reset,fs,req,channel,sample,pa,pv,fb,fd,fi,fft_frame_cycles);
                                                         
reg [63:0] old_power[0:1939],rolling[0:193];
reg [3:0] slot,filled;reg [7:0] idx;reg [4:0] state;
reg [63:0] old_q,sum_q,frame_q,linear_power;reg [95:0] scaled_power;
reg arr;reg [63:0] frame_energy;
reg guard_start;wire guard_done,guard_allow;wire [1:0] noise_calibrated;
assign diagnostic={noise_calibrated,guard_allow};
wire guard_energy_valid=state==3&&idx==96;
spectral_event_guard guard(clk,rst_n,gap,guard_energy_valid,idx>=97,frame_energy+frame_q,
guard_start,arr,guard_done,guard_allow,noise_calibrated);
reg log_start;wire log_busy,log_done;wire signed [47:0] log_db;
power_to_db logcore(clk,local_reset,log_start,linear_power,-16'sd50,log_busy,log_done,log_db);
reg bl,bs,newseq;reg [6:0] band;reg signed [47:0] db;
wire bb,bd,ba,bi,bhit;wire signed [31:0] bscore;wire signed [63:0] bsum;wire [4:0] bcount;
dual_detector_backend backend(clk,local_reset,bl,band,db,bs,arr,1'b1,newseq,bb,bd,ba,bi,bhit,bscore,bsum,bcount);
always @(posedge clk)begin
if(!local_reset)begin wrptr<=0;frame_base<=0;count<=0;next_frame<=4095;frame_number<=0;fs<=0;pa<=0;slot<=0;filled<=0;idx<=0;state<=0;
frame_energy<=0;guard_start<=0;old_q<=0;sum_q<=0;frame_q<=0;linear_power<=0;scaled_power<=0;log_start<=0;bl<=0;bs<=0;arr<=0;newseq<=1;band<=0;db<=0;
result_valid<=0;result_array<=0;detected<=0;invalid<=1;raw_score<=0;causal_sum<=0;history_count<=0;window_number<=0;window_end_sample<=0;overrun<=0;end
else begin guard_start<=0;result_valid<=0;fs<=0;bl<=0;bs<=0;log_start<=0;
if(audio_valid)begin
 wrptr<=wrptr==5119?0:wrptr+1;count<=count+1;
 if(count==next_frame)begin
 next_frame<=next_frame+1200;
 if(fb||state!=0)begin overrun<=1;invalid<=1;detected<=0;end
 else begin frame_base<=wrptr>=4095?wrptr-13'd4095:wrptr+13'd1025;fs<=1;end
 end
end
case(state)
0:if(fd)begin
 if(fi||overrun)begin invalid<=1;detected<=0;overrun<=1;end
 else begin frame_energy<=0;idx<=0;pa<=0;state<=1;end end
1:begin old_q<=filled==10?old_power[slot*194+idx]:64'd0;
sum_q<=filled==0?64'd0:rolling[idx];state<=2;end
2:begin frame_q<=pv;state<=3;end
3:begin frame_energy<=idx==96||idx==193?0:frame_energy+frame_q;old_power[slot*194+idx]<=frame_q;rolling[idx]<=sum_q+frame_q-old_q;
 if(idx==193)begin
 slot<=slot==9?0:slot+1;if(filled<10)filled<=filled+1;
 if(frame_number>=9&&frame_number[0])begin idx<=0;arr<=0;band<=0;newseq<=frame_number==9;state<=10;end
 else begin frame_number<=frame_number+1;state<=0;end
 end else begin idx<=idx+1;pa<=idx+1;state<=1;end end
4:begin sum_q<=rolling[idx];state<=5;end
5:begin scaled_power<=sum_q*`DETECTOR_POWER_FACTOR_Q30;state<=6;end
6:begin linear_power<=scaled_power>>30;log_start<=1;state<=7;end
7:if(log_done)begin db<=log_db;band<=arr?idx-97:idx;bl<=1;state<=8;end
8:if(idx==96||idx==193)begin bs<=1;state<=9;end else begin idx<=idx+1;state<=4;end
9:if(bd)begin
 result_valid<=1;result_array<=ba;detected<=bhit&&guard_allow&&bscore>`DETECTOR_THRESHOLD&&bcount==3;invalid<=bi;raw_score<=bscore;causal_sum<=bsum;history_count<=bcount;
 window_number<=(frame_number-9)>>1;window_end_sample<=((frame_number-9)>>1)*2400+15000;
 frame_number<=frame_number+1;state<=0;end
10:begin guard_start<=1;state<=11;end
11:if(guard_done)state<=4;
endcase
end
end
endmodule
