`timescale 1ns/1ps
                                                                                        

module fir_resampler16 #(parameter L=1,M=4,TAPS=161,COEFF_FILE="unused.mem")(
 input clk,rst_n,input_valid,gap,input [383:0] input_samples,
 output reg output_valid,output reg [383:0] output_samples,output reg busy,overrun);
wire hd,hi,hr;wire [384:0] result;wire rn=rst_n&&!gap;reg [383:0] held_samples;reg launch;
generate if(L==1&&M==1&&TAPS==383)begin
 r18_ip_fir_loc_hls core(.ap_clk(clk),.ap_rst_n(rn),.ap_start(launch),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.samples(held_samples),.result(result));
end else if(L==5&&M==16&&TAPS==2047)begin
 r18_ip_fir_det_hls core(.ap_clk(clk),.ap_rst_n(rn),.ap_start(launch),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.samples(held_samples),.result(result));
end else begin initial $error("unsupported R18 FIR configuration");end endgenerate
always @(posedge clk)begin
if(!rst_n)begin output_valid<=0;output_samples<=0;busy<=0;overrun<=0;launch<=0;held_samples<=0;end
else begin output_valid<=0;if(launch&&hr)launch<=0;
if(gap)begin busy<=0;launch<=0;end
else begin
if(input_valid)begin if(busy)overrun<=1;else begin held_samples<=input_samples;launch<=1;busy<=1;end end
if(hd&&busy)begin busy<=0;output_valid<=result[384];output_samples<=result[383:0];end
end end end
endmodule
