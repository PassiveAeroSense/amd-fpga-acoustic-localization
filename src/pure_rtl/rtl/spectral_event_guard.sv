`timescale 1ns/1ps
                                                                          
                                                                           
                                                                  
module spectral_event_guard(input clk,rst_n,gap,energy_valid,energy_array,
 input [63:0] energy,input query,query_array,
 output reg done,allow,output [1:0] calibrated);
reg [63:0] history[0:19],floor_power[0:1];reg [68:0] calibration_sum[0:1];
reg [5:0] calibration_count[0:1];reg [3:0] pointer[0:1],filled[0:1];
reg [1:0] state;reg selected;reg [3:0] k,count_above;reg [67:0] total;
reg [63:0] peak;wire [63:0] current=history[(selected?10:0)+k];
assign calibrated={calibration_count[1]==32,calibration_count[0]==32};
integer a;
always @(posedge clk)begin
if(!rst_n)begin done<=0;allow<=0;state<=0;selected<=0;k<=0;count_above<=0;total<=0;peak<=0;
for(a=0;a<2;a=a+1)begin floor_power[a]<=1;calibration_sum[a]<=0;calibration_count[a]<=0;pointer[a]<=0;filled[a]<=0;end end
else begin done<=0;
if(gap)begin state<=0;allow<=0;pointer[0]<=0;pointer[1]<=0;filled[0]<=0;filled[1]<=0;end
else begin
if(energy_valid)begin
history[(energy_array?10:0)+pointer[energy_array]]<=energy;
pointer[energy_array]<=pointer[energy_array]==9?0:pointer[energy_array]+1;
if(filled[energy_array]<10)filled[energy_array]<=filled[energy_array]+1;
if(calibration_count[energy_array]<32)begin
calibration_sum[energy_array]<=calibration_sum[energy_array]+energy;
calibration_count[energy_array]<=calibration_count[energy_array]+1;
if(calibration_count[energy_array]==31)floor_power[energy_array]<=
(calibration_sum[energy_array]+energy)>>5==0?1:(calibration_sum[energy_array]+energy)>>5;
end end
case(state)
0:if(query)begin selected<=query_array;allow<=0;
if(!calibrated[query_array]||filled[query_array]<10)done<=1;
else begin k<=0;total<=0;peak<=0;state<=1;end end
1:begin total<=total+current;if(current>peak)peak<=current;
if(k==9)begin k<=0;count_above<=0;state<=2;end else k<=k+1;end
2:begin if(current>=(peak>>3)&&{4'd0,current}>({4'd0,floor_power[selected]}<<1))count_above<=count_above+1;
if(k==9)state<=3;else k<=k+1;end
3:begin allow<=count_above>=8&&total>({4'd0,floor_power[selected]}*68'd40);done<=1;state<=0;end
endcase end end end
endmodule
