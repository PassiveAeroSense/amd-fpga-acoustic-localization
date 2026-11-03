`timescale 1ns/1ps
                                                                                        
module fx_sqrt(input clk,rst_n,start,input [63:0] value,output reg busy,done,output reg [31:0] root,output reg [63:0] remainder);
wire hd,hi,hr;wire [95:0] result;
r18_ip_sqrt_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(start&&!busy),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.value_r(value),.result(result));
always @(posedge clk)begin if(!rst_n)begin busy<=0;done<=0;root<=0;remainder<=0;end else begin
done<=0;if(start&&!busy)busy<=1;
if(hd&&busy)begin busy<=0;done<=1;root<=result[31:0];remainder<=result[95:32];end end end
endmodule
