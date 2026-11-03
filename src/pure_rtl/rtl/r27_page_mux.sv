`timescale 1ns/1ps
                                                                              
module r27_page_mux #(parameter DEBOUNCE_CYCLES=666667)(
 input clk,rst_n,key4_n,frame_start,input [15:0] location_pixel,detection_pixel,
 output [15:0] pixel,output reg detection_page,output reg press_pulse);
localparam CW=DEBOUNCE_CYCLES<2?1:$clog2(DEBOUNCE_CYCLES);
(* ASYNC_REG="TRUE" *) reg [1:0] key_sync;
reg candidate_key,armed,requested_page;reg [CW-1:0] stable_count;
always @(posedge clk)begin
 if(!rst_n)key_sync<=2'b11;else key_sync<={key_sync[0],key4_n};
end
always @(posedge clk)begin
 if(!rst_n)begin candidate_key<=1;armed<=0;requested_page<=0;
  stable_count<=0;detection_page<=0;press_pulse<=0;end
 else begin
  press_pulse<=0;
  if(key_sync[1]!=candidate_key)begin candidate_key<=key_sync[1];stable_count<=0;end
  else if(stable_count<DEBOUNCE_CYCLES-1)stable_count<=stable_count+1;
  else if(candidate_key)armed<=1;
  else if(armed)begin armed<=0;requested_page<=~requested_page;press_pulse<=1;end
  if(frame_start)detection_page<=requested_page;
 end
end
assign pixel=detection_page?detection_pixel:location_pixel;
endmodule
