`timescale 1ns/1ps
                                                                               
                                                                             
                                                                             
                                                                   
module detector_stft_frame(input clk,rst_n,start,
 output reg [11:0] sample_addr,output reg [3:0] sample_channel,
 input signed [23:0] sample_value,input [7:0] power_addr,
 output reg [63:0] power_value,output reg busy,done,invalid,
 output reg [31:0] cycles);
reg signed [31:0] hann[0:4095];reg [7:0] bandmap[0:2048];
initial begin $readmemh("detector_hann4096.mem",hann);$readmemh("detector_bandmap.mem",bandmap);end
reg [63:0] powers[0:193];
reg load_fft,start_fft;reg [11:0] fft_addr,fft_read;reg signed [31:0] fft_input;
wire signed [31:0] fr,fi;wire fft_busy,fft_done,fft_over;
fft2048 #(.LOG_N(12),.TW_RE_FILE("fft4096_tw_re.mem"),.TW_IM_FILE("fft4096_tw_im.mem")) fft(
clk,rst_n,load_fft,fft_addr,fft_input,32'sd0,start_fft,fft_read,fr,fi,fft_busy,fft_done,fft_over);
reg [4:0] state;integer idx,bin;reg [7:0] dest;
reg signed [47:0] total;reg signed [31:0] mean,centered,window;
reg signed [63:0] wp,square_re,square_im;
wire [64:0] spectral_power=($unsigned(square_re)+{1'b0,$unsigned(square_im)})>>8;
always @(posedge clk)begin
power_value<=powers[power_addr];
if(!rst_n)begin busy<=0;done<=0;invalid<=0;cycles<=0;sample_addr<=0;sample_channel<=0;load_fft<=0;start_fft<=0;
fft_addr<=0;fft_read<=0;fft_input<=0;state<=0;idx<=0;bin<=0;dest<=0;total<=0;mean<=0;centered<=0;window<=0;wp<=0;square_re<=0;square_im<=0;end
else begin done<=0;load_fft<=0;start_fft<=0;
if(start&&!busy)begin busy<=1;invalid<=0;cycles<=0;idx<=0;sample_channel<=0;total<=0;state<=0;end
else if(busy)begin cycles<=cycles+1;case(state)
0:begin powers[idx]<=0;if(idx==193)begin idx<=0;state<=1;end else idx<=idx+1;end
1:begin sample_addr<=idx;state<=2;end
2:state<=3;
3:begin total<=total+sample_value;if(idx==4095)state<=4;else begin idx<=idx+1;state<=1;end end
4:begin mean<=total>>>12;idx<=0;state<=5;end
5:begin sample_addr<=idx;window<=hann[idx];state<=6;end
6:state<=7;
7:begin centered<=$signed(sample_value)-mean;state<=8;end
8:begin wp<=centered*window;state<=9;end
9:begin fft_addr<=idx;fft_input<=wp>>>24;load_fft<=1;
if(idx==4095)state<=10;else begin idx<=idx+1;state<=5;end end
10:begin start_fft<=1;state<=11;end
11:if(fft_done)begin if(fft_over)invalid<=1;bin<=0;state<=12;end
12:if(bandmap[bin]==255)begin if(bin==1215)state<=17;else bin<=bin+1;end
else begin fft_read<=bin;dest<=(sample_channel<8?0:97)+bandmap[bin];state<=13;end
13:state<=14;
14:begin square_re<=fr*fr;square_im<=fi*fi;state<=15;end
15:begin powers[dest]<=powers[dest]+spectral_power[63:0];state<=16;end
16:if(bin==1215)state<=17;else begin bin<=bin+1;state<=12;end
17:if(sample_channel==7)begin busy<=0;done<=1;end
else begin sample_channel<=sample_channel+1;idx<=0;total<=0;state<=1;end
endcase end
end
end
endmodule
