`timescale 1ns/1ps
                                                                                        
module fx_cordic(input clk,rst_n,start,input vector_mode,input signed [39:0] vx,vy,input signed [31:0] angle,output reg busy,done,output reg signed [31:0] out_angle,cosine,sine,output reg [39:0] magnitude);
wire hd,hi,hr;wire [135:0] result;
r18_ip_cordic_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(start&&!busy),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),.mode(vector_mode),.vx(vx),.vy(vy),.angle(angle),.result(result));
always @(posedge clk)begin if(!rst_n)begin busy<=0;done<=0;out_angle<=0;cosine<=0;sine<=0;magnitude<=0;end else begin
done<=0;if(start&&!busy)busy<=1;
if(hd&&busy)begin busy<=0;done<=1;out_angle<=result[31:0];cosine<=result[63:32];sine<=result[95:64];magnitude<=result[135:96];end end end
endmodule
