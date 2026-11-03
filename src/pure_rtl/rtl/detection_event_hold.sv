`timescale 1ns/1ps
                                                                                       
                                                                                    
module detection_event_hold #(parameter HOLD_CYCLES=200000000)(
input clk,rst_n,result_valid,array_id,positive,invalid,
output active,output reg [27:0] remaining,
output reg [31:0] hits_a1,hits_a2,total_a1,total_a2);
assign active=remaining!=0;
always @(posedge clk)begin
if(!rst_n)begin remaining<=0;hits_a1<=0;hits_a2<=0;total_a1<=0;total_a2<=0;end
else begin
                                                                       
if(result_valid&&!invalid)begin
if(array_id)begin if(total_a2!=32'hffffffff)total_a2<=total_a2+1;end
else begin if(total_a1!=32'hffffffff)total_a1<=total_a1+1;end
if(positive)begin remaining<=28'hfffffff;
if(array_id)begin if(hits_a2!=32'hffffffff)hits_a2<=hits_a2+1;end
else begin if(hits_a1!=32'hffffffff)hits_a1<=hits_a1+1;end
end end end end
endmodule
