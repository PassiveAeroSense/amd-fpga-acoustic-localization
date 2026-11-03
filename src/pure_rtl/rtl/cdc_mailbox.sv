`timescale 1ns/1ps
                                                                              
                                                                             
                                                                                   
module cdc_mailbox #(parameter WIDTH=384)(input src_clk,src_rst_n,src_valid,
input [WIDTH-1:0] src_data,output src_ready,output reg overrun,
input dst_clk,dst_rst_n,output reg dst_valid,output reg [WIDTH-1:0] dst_data);
reg [WIDTH-1:0] payload;reg request,ack;
(* ASYNC_REG="TRUE" *)reg [1:0] ack_sync,request_sync;
assign src_ready=request==ack_sync[1];
always @(posedge src_clk or negedge src_rst_n)begin
if(!src_rst_n)begin request<=0;payload<=0;ack_sync<=0;overrun<=0;end
else begin ack_sync<={ack_sync[0],ack};
if(src_valid)begin if(src_ready)begin payload<=src_data;request<=~request;end else overrun<=1;end end end
always @(posedge dst_clk or negedge dst_rst_n)begin
if(!dst_rst_n)begin ack<=0;request_sync<=0;end
else begin request_sync<={request_sync[0],request};
if(request_sync[1]!=ack)ack<=request_sync[1];end end
                                                                           
                                                                             
always @(posedge dst_clk)begin
if(!dst_rst_n)begin dst_valid<=0;dst_data<=0;end
else begin dst_valid<=0;
if(request_sync[1]!=ack)begin dst_data<=payload;dst_valid<=1;end end end
endmodule
