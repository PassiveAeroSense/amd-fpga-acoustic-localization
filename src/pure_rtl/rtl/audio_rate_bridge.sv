`timescale 1ns/1ps
                                                                       
                                                                             
module audio_rate_bridge(input clk,rst_n,adc_valid,input [1:0] adc_bad,
input sequence_gap,input [255:0] adc_samples,
output audio_valid,output [383:0] audio_samples,output fault);
wire [383:0] expanded;genvar ch;
generate for(ch=0;ch<16;ch=ch+1)begin assign expanded[ch*24+:24]={adc_samples[ch*16+:16],8'd0};end endgenerate
wire b2,o2;
wire gap=sequence_gap||(adc_valid&&|adc_bad);
fir_resampler16 #(.L(5),.M(16),.TAPS(2047),.COEFF_FILE("resamp_48k_15k.mem")) second(clk,rst_n,adc_valid&&adc_bad==0,gap,expanded,audio_valid,audio_samples,b2,o2);
assign fault=o2;
endmodule
