`timescale 1ns/1ps
                                                                                        
module fx_div(input clk,rst_n,start,input [63:0] numerator,denominator,output reg busy,done,output reg zero_divisor,output reg [63:0] quotient,remainder);
wire hd,hi,hr;wire [128:0] result;
r18_ip_divide_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(start&&!busy),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.num(numerator),.den(denominator),.result(result));
always @(posedge clk)begin if(!rst_n)begin busy<=0;done<=0;quotient<=0;remainder<=0;zero_divisor<=0;end else begin
done<=0;if(start&&!busy)busy<=1;
if(hd&&busy)begin busy<=0;done<=1;quotient<=result[63:0];remainder<=result[127:64];zero_divisor<=result[128];end end end
endmodule
