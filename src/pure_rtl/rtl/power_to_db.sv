`timescale 1ns/1ps
                                                                                        
module power_to_db(input clk,rst_n,start,input [63:0] value,input signed [15:0] power_exponent,output reg busy,done,output reg signed [47:0] db_q32);
wire hd,hi,hr;wire [47:0] result;
r18_ip_power_db_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(start&&!busy),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.value_r(value),.exponent(power_exponent),.result(result));
always @(posedge clk)begin if(!rst_n)begin busy<=0;done<=0;db_q32<=0;end else begin
done<=0;if(start&&!busy)busy<=1;
if(hd&&busy)begin busy<=0;done<=1;db_q32<=result;end end end
endmodule
