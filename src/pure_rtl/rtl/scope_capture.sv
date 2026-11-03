`timescale 1ns/1ps
                                                                           
                                                                       
                                                                                 
module scope_capture(input clk,rst_n,sample_valid,input [255:0] samples,input [1:0] bad,
 input frame_sync,input [7:0] read_column,
 output [527:0] waveform,output reg [255:0] dc_values,pp_values,
 output reg [63:0] scales,output reg [159:0] clipping,
 output reg [1:0] displayed_good,output reg display_valid,frame_ready,
 output reg [31:0] completed_frames);
reg write_bank,display_bank,acquiring;reg [8:0] sample_index;reg [7:0] pair_index;
reg signed [15:0] first[0:15];reg [1:0] first_good;
reg signed [25:0] sums[0:15];reg signed [15:0] low[0:15],high[0:15];reg [9:0] clips[0:15],good_count[0:1];
reg [255:0] pending_dc,pending_pp;reg [63:0] pending_scales;reg [159:0] pending_clips;reg [1:0] pending_good;
wire pair_write=sample_valid&&acquiring&&sample_index[0];
genvar g;
generate for(g=0;g<16;g=g+1)begin:channel_memory
 (* ram_style="block" *)reg [32:0] mem[0:511];reg [32:0] q;
 wire signed [15:0] v=samples[g*16+:16];
 wire signed [15:0] mn=v<first[g]?v:first[g],mx=v>first[g]?v:first[g];
 always @(posedge clk)begin
 if(pair_write)mem[{write_bank,pair_index}]<={first_good[g/8]&&!bad[g/8],mx,mn};
 q<=mem[{display_bank,read_column}];end
 assign waveform[g*33+:33]=q;
end endgenerate
reg [3:0] state;integer ch,k;reg ds,negative;reg [63:0] num,den;
wire db,dd,dz;wire [63:0] quotient,remainder;
fx_div divide(clk,rst_n,ds,num,den,db,dd,dz,quotient,remainder);
reg signed [16:0] mean_value,above,below;reg [16:0] peak;reg [3:0] scale;
integer i;reg signed [15:0] v;
always @(posedge clk)begin
if(!rst_n)begin
write_bank<=0;display_bank<=1;acquiring<=1;sample_index<=0;pair_index<=0;first_good<=0;
dc_values<=0;pp_values<=0;scales<=0;clipping<=0;displayed_good<=0;display_valid<=0;frame_ready<=0;completed_frames<=0;
pending_dc<=0;pending_pp<=0;pending_scales<=0;pending_clips<=0;pending_good<=0;
state<=0;ch<=0;ds<=0;negative<=0;num<=0;den<=1;mean_value<=0;above<=0;below<=0;peak<=0;scale<=0;
good_count[0]<=0;good_count[1]<=0;
for(i=0;i<16;i=i+1)begin sums[i]<=0;low[i]<=16'sh7fff;high[i]<=16'sh8000;clips[i]<=0;first[i]<=0;end
end else begin ds<=0;
if(sample_valid&&acquiring)begin
for(i=0;i<2;i=i+1)if(!bad[i])good_count[i]<=good_count[i]+1;
for(i=0;i<16;i=i+1)begin
v=$signed(samples[i*16+:16]);
if(!sample_index[0])first[i]<=v;
if(!bad[i/8])begin sums[i]<=sums[i]+v;
if(v<low[i])low[i]<=v;if(v>high[i])high[i]<=v;
if(v>=32700||v<=-32700)clips[i]<=clips[i]+1;end end
if(!sample_index[0])first_good<=~bad;else pair_index<=pair_index+1;
if(sample_index==511)begin acquiring<=0;ch<=0;state<=1;end else sample_index<=sample_index+1;
end
case(state)
1:begin negative<=sums[ch]<0;num<=sums[ch]<0?-$signed(sums[ch]):sums[ch];den<=good_count[ch/8];ds<=1;state<=2;end
2:if(dd)begin mean_value<=dz?0:negative?-$signed(quotient[16:0]):$signed(quotient[16:0]);state<=3;end
3:begin above<=$signed(high[ch])-mean_value;below<=mean_value-$signed(low[ch]);state<=4;end
4:begin peak<=good_count[ch/8]==0?0:above>below?above:below;scale<=0;state<=5;end
5:if((peak>>scale)>18&&scale<12)scale<=scale+1;else state<=6;
6:begin pending_dc[ch*16+:16]<=mean_value[15:0];pending_pp[ch*16+:16]<=good_count[ch/8]==0?0:$signed(high[ch])-$signed(low[ch]);
pending_scales[ch*4+:4]<=scale;pending_clips[ch*10+:10]<=clips[ch];
if(ch==15)begin pending_good<={good_count[1]!=0,good_count[0]!=0};frame_ready<=1;state<=0;completed_frames<=completed_frames+1;end
else begin ch<=ch+1;state<=1;end end
endcase
if(frame_sync&&frame_ready)begin
display_bank<=write_bank;write_bank<=~write_bank;dc_values<=pending_dc;pp_values<=pending_pp;scales<=pending_scales;clipping<=pending_clips;
displayed_good<=pending_good;display_valid<=1;frame_ready<=0;acquiring<=1;sample_index<=0;pair_index<=0;
good_count[0]<=0;good_count[1]<=0;
for(i=0;i<16;i=i+1)begin sums[i]<=0;low[i]<=16'sh7fff;high[i]<=16'sh8000;clips[i]<=0;end
end
end end
endmodule
