`timescale 1ns/1ps
                                                                               
                                                                               
module music_stft_frame(input clk,rst_n,start,
 output reg [10:0] sample_addr,output reg [3:0] sample_channel,input signed [23:0] sample_value,
 output reg spectrum_valid,output reg [8:0] frequency_index,output reg [3:0] spectrum_channel,
 output reg signed [31:0] spectrum_re,spectrum_im,
 output reg busy,done,invalid,output reg [31:0] peak_component);
reg signed [31:0] hann[0:2047];initial $readmemh("hann.mem",hann);
reg lf,sf;reg [10:0] la,ra;reg signed [31:0] din;wire signed [31:0] re,im;wire fb,fd,fo;
fft2048 fft(clk,rst_n,lf,la,din,32'sd0,sf,ra,re,im,fb,fd,fo);
reg [4:0] state;integer idx,bin;reg signed [47:0] sum;reg signed [31:0] mean,centered,window;reg signed [63:0] product;
wire [31:0] ar=re<0?-$signed(re):re,ai=im<0?-$signed(im):im;
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;invalid<=0;peak_component<=0;spectrum_valid<=0;frequency_index<=0;spectrum_channel<=0;spectrum_re<=0;spectrum_im<=0;
sample_addr<=0;sample_channel<=0;lf<=0;sf<=0;la<=0;ra<=0;din<=0;state<=0;idx<=0;bin<=35;sum<=0;mean<=0;centered<=0;window<=0;product<=0;end
else begin done<=0;lf<=0;sf<=0;spectrum_valid<=0;
if(start&&!busy)begin busy<=1;invalid<=0;peak_component<=0;sample_channel<=0;idx<=0;sum<=0;state<=0;end
else if(busy)case(state)
0:begin sample_addr<=idx;state<=1;end
1:state<=2;
2:begin sum<=sum+sample_value;if(idx==2047)state<=3;else begin idx<=idx+1;state<=0;end end
3:begin mean<=sum>>>11;idx<=0;state<=4;end
4:begin sample_addr<=idx;window<=hann[idx];state<=5;end
5:state<=6;
6:begin centered<=$signed(sample_value)-mean;state<=7;end
7:begin product<=centered*window;state<=8;end
8:begin la<=idx;din<=product>>>24;lf<=1;if(idx==2047)state<=9;else begin idx<=idx+1;state<=4;end end
9:begin sf<=1;state<=10;end
10:if(fd)begin if(fo)invalid<=1;bin<=35;state<=11;end
11:begin ra<=bin;state<=12;end
12:state<=13;
13:begin spectrum_re<=re;spectrum_im<=im;frequency_index<=bin-35;spectrum_channel<=sample_channel;spectrum_valid<=1;
if(ar>peak_component&&ar>=ai)peak_component<=ar;else if(ai>peak_component)peak_component<=ai;
if(bin==300)state<=14;else begin bin<=bin+1;state<=11;end end
14:if(sample_channel==15)begin busy<=0;done<=1;end else begin sample_channel<=sample_channel+1;idx<=0;sum<=0;state<=0;end
endcase
end
end
endmodule
