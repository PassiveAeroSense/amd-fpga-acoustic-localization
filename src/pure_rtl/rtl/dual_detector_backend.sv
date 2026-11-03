`timescale 1ns/1ps
                                                                                        

module dual_detector_backend(input clk,rst_n,load,input [6:0] band_addr,input signed [47:0] band_db,
 input start,array_id,input_valid,new_sequence,output reg busy,done,result_array,invalid,detected,
 output reg signed [31:0] raw_score,output reg signed [63:0] causal_sum,output reg [4:0] history_count);
reg signed [47:0] bands[0:96];reg signed [47:0] q;wire [6:0] addr;wire ce,hd,hi,hr;wire [103:0] result;
reg launch,selected,frame_valid,newseq;
always @(posedge clk)begin if(load&&!busy&&band_addr<97)bands[band_addr]<=band_db;q<=bands[addr];end
r18_ip_detector_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(launch),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),
 .bands_address0(addr),.bands_ce0(ce),.bands_q0(q),.valid(frame_valid),.new_sequence(newseq),.array_id(selected),.result(result));
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;result_array<=0;invalid<=0;detected<=0;raw_score<=0;causal_sum<=0;history_count<=0;launch<=0;selected<=0;frame_valid<=0;newseq<=0;end
else begin done<=0;if(launch&&hr)launch<=0;
if(start&&!busy)begin busy<=1;launch<=1;selected<=array_id;frame_valid<=input_valid;newseq<=new_sequence;end
if(hd&&busy)begin busy<=0;done<=1;raw_score<=result[31:0];causal_sum<=result[95:32];history_count<=result[100:96];detected<=result[101];invalid<=result[102];result_array<=result[103];end
end end
endmodule
