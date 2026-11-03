`timescale 1ns/1ps
module live_detection_status #(parameter TIMEOUT_CYCLES=25000000)(
 input clk,rst_n,link_good,gap,result_valid,positive,invalid,
 output active,output known);
reg hit,valid;reg [31:0] age;
assign known=valid&&link_good&&!gap&&age<TIMEOUT_CYCLES;
assign active=known&&hit;
always @(posedge clk)begin
 if(!rst_n)begin hit<=0;valid<=0;age<=TIMEOUT_CYCLES;end
 else if(!link_good||gap)begin hit<=0;valid<=0;age<=TIMEOUT_CYCLES;end
 else if(result_valid)begin hit<=positive&&!invalid;valid<=!invalid;age<=0;end
 else if(age<TIMEOUT_CYCLES)age<=age+1;
end
endmodule
