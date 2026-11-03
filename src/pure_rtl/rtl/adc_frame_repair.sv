`timescale 1ns/1ps
                                                                           
                                                                             
                                                                            
module adc_frame_repair #(parameter WINDOW_FRAMES=50000,MAX_REPAIRS=250)(
input clk,rst_n,input_valid,input [1:0] input_bad,input input_gap,
input [255:0] input_samples,output reg output_valid,output reg [255:0] output_samples,
output reg output_gap,output reg [31:0] repaired_total);
reg [255:0] q0,q1,previous;reg bad0,bad1,have_previous;
reg [1:0] fill;reg [31:0] window_count,repairs;
integer c;reg signed [17:0] v,term;
reg [2:0] phase;reg third;
reg signed [16:0] base[0:15],endpoint[0:15],numerator[0:15];
reg negative[0:15];reg [16:0] magnitude[0:15],half[0:15];
reg [33:0] product[0:15];
                                                       
                                                                          
always @(posedge clk)begin
if(!rst_n)begin q0<=0;q1<=0;previous<=0;bad0<=1;bad1<=1;have_previous<=0;fill<=0;
phase<=0;third<=0;window_count<=0;repairs<=0;output_valid<=0;output_samples<=0;output_gap<=0;repaired_total<=0;
for(c=0;c<16;c=c+1)begin base[c]<=0;endpoint[c]<=0;numerator[c]<=0;negative[c]<=0;magnitude[c]<=0;half[c]<=0;product[c]<=0;end end
else begin output_valid<=0;output_gap<=0;
if(input_valid)begin
 if(window_count==WINDOW_FRAMES-1)begin window_count<=0;repairs<=0;end else window_count<=window_count+1;
end
if(input_gap||(input_valid&&phase!=0))begin phase<=0;fill<=0;have_previous<=0;output_gap<=1;end
else if(phase!=0)begin
case(phase)
1:begin for(c=0;c<16;c=c+1)numerator[c]<=third?endpoint[c]-base[c]:endpoint[c]+base[c];phase<=2;end
2:begin for(c=0;c<16;c=c+1)begin negative[c]<=numerator[c][16];magnitude[c]<=numerator[c][16]?-numerator[c]:numerator[c];end phase<=3;end
3:begin for(c=0;c<16;c=c+1)begin product[c]<=magnitude[c]*17'd43691;half[c]<=magnitude[c]>>1;end phase<=4;end
4:begin
for(c=0;c<16;c=c+1)begin
term=third?$signed({1'b0,product[c][33:17]}):$signed({1'b0,half[c]});
if(negative[c])term=-term;
v=third?$signed(base[c])+term:term;
output_samples[c*16+:16]<=v[15:0];previous[c*16+:16]<=v[15:0];end
output_valid<=1;repaired_total<=repaired_total+1;phase<=0;end
endcase
end
else if(input_valid)begin
 q0<=q1;q1<=input_samples;bad0<=bad1;bad1<=|input_bad;
 if(fill<2)fill<=fill+1;
 else if(!bad0)begin output_valid<=1;output_samples<=q0;previous<=q0;have_previous<=1;end
 else if(have_previous&&(!bad1||input_bad==0)&&repairs<MAX_REPAIRS)begin
 third<=bad1;phase<=1;
 repairs<=window_count==WINDOW_FRAMES-1?1:repairs+1;
 for(c=0;c<16;c=c+1)begin
 base[c]<=$signed(previous[c*16+:16]);
 endpoint[c]<=bad1?$signed(input_samples[c*16+:16]):$signed(q1[c*16+:16]);end
 end else begin fill<=0;have_previous<=0;output_gap<=1;end
end end end
endmodule
