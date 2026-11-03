`timescale 1ns/1ps
                                                                                             
                                                                     
                                                                             
module srp_localizer #(parameter [6:0] CAPTURE_FRAMES=7'd32)(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 input recalibrate,output reg background_ready,update,output reg [2:0] direction_ok,
 output reg signed [31:0] jx,jy,a1x,a1y,a2x,a2y,output reg [31:0] evidence,
 output reg [15:0] f0,output reg [31:0] processing_cycles,windows,output [7:0] stage,
 output reg fault,output reg [1:0] coarse_ok);
wire rn=rst_n&&!gap&&!recalibrate;reg start;reg [15:0] addr;
wire signed [31:0] cr,ci;wire [5:0] expn;wire [6:0] frames;wire cb,cd,bad;wire [31:0] samples;
srp_capture capture(clk,rn,audio_valid,gap,audio_samples,start,CAPTURE_FRAMES,addr,cr,ci,expn,frames,cb,cd,bad,samples);
reg [7:0] state;assign stage=state;reg [31:0] ticks;
reg [39:0] trace[0:265];reg [39:0] trace_acc;
reg [31:0] weights[0:265];reg blocked[0:265];reg [8:0] chosen[0:11];
reg signed [31:0] scale[0:265];initial $readmemh("srp_phase_per_percent.mem",scale);
reg [7:0] pairmap[0:55];reg signed [3:0] dxmap[0:55],dymap[0:55];
initial begin $readmemh("srp_pairmap.mem",pairmap);$readmemh("srp_dx.mem",dxmap);$readmemh("srp_dy.mem",dymap);end
integer f,ch,slot,pair,ia,ib,best_f;reg [31:0] best_weight;
reg ds;reg [63:0] num,den;wire db,dd,dzero;wire [63:0] q,rem;
fx_div divide(clk,rn,ds,num,den,db,dd,dzero,q,rem);
reg signed [31:0] re,im;reg [31:0] pa,pb;reg [63:0] pp;reg signed [63:0] re2,im2;
reg cs,vm;reg signed [31:0] angle_in;wire cbusy,cdone;wire signed [31:0] angle,cosine,sine;wire [39:0] mag;
fx_cordic cordic(clk,rn,cs,vm,{{8{re[31]}},re},{{8{im[31]}},im},angle_in,cbusy,cdone,angle,cosine,sine,mag);
reg signed [31:0] obs_phase[0:671],obs_x[0:671],obs_y[0:671];reg obs_group[0:671];
reg [9:0] count0,count1;reg [8:0] ng0[0:1],ng1[0:1];reg [11:0] freqmask0,freqmask1;
integer oi,oi_end,base_index,array_id;reg fine;integer gx,gy,lo_x,hi_x,lo_y,hi_y,step,best_x,best_y;
reg signed [31:0] score,score0,score1,best_score,best_score0,best_score1;
reg signed [63:0] phase_product_x,phase_product_y,predicted,delta;
reg signed [31:0] dir_lut[0:200],out_x,out_y;initial $readmemh("srp_direction_q30.mem",dir_lut);
reg signed [31:0] phi_hold;reg group_hold;reg [9:0] support;
function [4:0] pop12(input [11:0] v);integer k;begin pop12=0;for(k=0;k<12;k=k+1)pop12=pop12+v[k];end endfunction
always @(posedge clk)begin
if(!rn)begin state<=0;start<=0;addr<=0;background_ready<=1;update<=0;direction_ok<=0;coarse_ok<=0;
jx<=0;jy<=0;a1x<=0;a1y<=0;a2x<=0;a2y<=0;evidence<=0;f0<=0;processing_cycles<=0;windows<=0;fault<=0;ticks<=0;
trace_acc<=0;f<=0;ch<=0;slot<=0;pair<=0;ia<=0;ib<=0;best_f<=0;best_weight<=0;ds<=0;num<=0;den<=1;
re<=0;im<=0;pa<=0;pb<=0;pp<=0;re2<=0;im2<=0;cs<=0;vm<=1;angle_in<=0;
count0<=0;count1<=0;ng0[0]<=0;ng0[1]<=0;ng1[0]<=0;ng1[1]<=0;freqmask0<=0;freqmask1<=0;
oi<=0;oi_end<=0;base_index<=0;array_id<=0;fine<=0;gx<=0;gy<=0;lo_x<=0;hi_x<=0;lo_y<=0;hi_y<=0;step<=10;best_x<=0;best_y<=0;
score<=0;score0<=0;score1<=0;best_score<=-2147483647;best_score0<=0;best_score1<=0;
phase_product_x<=0;phase_product_y<=0;predicted<=0;delta<=0;phi_hold<=0;group_hold<=0;support<=0;end
else begin start<=0;ds<=0;cs<=0;update<=0;ticks<=ticks+1;
case(state)
0:begin start<=1;ticks<=0;state<=1;end
1:if(cd)begin if(bad)begin fault<=1;direction_ok<=0;coarse_ok<=0;update<=1;state<=0;end
else begin fault<=0;direction_ok<=0;coarse_ok<=0;array_id<=0;f<=0;ch<=0;trace_acc<=0;state<=2;end end
2:begin addr<=f*72+ch;state<=3;end
3:state<=4;
4:begin trace_acc<=trace_acc+(cr>0?$unsigned(cr):0);if(ch==(array_id==0?7:15))state<=5;else begin ch<=ch+1;state<=2;end end
5:begin trace[f]<=trace_acc;blocked[f]<=0;weights[f]<=0;
if(f==265)begin f<=0;state<=6;end else begin f<=f+1;ch<=array_id==0?0:8;trace_acc<=0;state<=2;end end
6:begin num<={24'd0,trace[f]}<<16;den<=trace[f<6?0:f-6]+trace[f>259?265:f+6]+1;ds<=1;state<=7;end
7:if(dd)begin weights[f]<=f>=13&&f<=251&&q>40960?(q>1048575?1048575:q[31:0]):0;
if(f==265)begin slot<=0;f<=0;best_weight<=0;best_f<=0;state<=8;end else begin f<=f+1;state<=6;end end
8:begin if(!blocked[f]&&weights[f]>best_weight)begin best_weight<=weights[f];best_f<=f;end
if(f==265)state<=9;else f<=f+1;end
9:begin chosen[slot]<=best_f;blocked[best_f]<=1;if(best_f>0)blocked[best_f-1]<=1;if(best_f<265)blocked[best_f+1]<=1;
if(slot==11)begin slot<=0;if(array_id==0)begin count0<=0;ng0[0]<=0;ng0[1]<=0;freqmask0<=0;end else begin count1<=0;ng1[0]<=0;ng1[1]<=0;freqmask1<=0;end state<=10;end
else begin slot<=slot+1;f<=0;best_f<=0;best_weight<=0;state<=8;end end
10:begin f<=chosen[slot];pair<=array_id==0?0:28;state<=11;end
11:begin ia<=pairmap[pair][7:4];ib<=pairmap[pair][3:0];addr<=f*72+16+pair;state<=12;end
12:state<=13;
13:begin re<=cr;im<=ci;addr<=f*72+ia;state<=14;end
14:state<=15;
15:begin pa<=cr>0?cr:0;addr<=f*72+ib;state<=16;end
16:state<=17;
17:begin pb<=cr>0?cr:0;state<=18;end
18:begin pp<=pa*pb;re2<=re*re;im2<=im*im;state<=19;end
19:if(weights[f]==0||pa==0||pb==0||({1'b0,re2}+{1'b0,im2})<({1'b0,pp}>>1))state<=22;
else begin vm<=1;cs<=1;state<=20;end
20:if(cdone)begin
if(pair<28)begin obs_phase[count0]<=angle;obs_x[count0]<=scale[f]*dxmap[pair];obs_y[count0]<=scale[f]*dymap[pair];obs_group[count0]<=slot[0];count0<=count0+1;ng0[slot[0]]<=ng0[slot[0]]+1;freqmask0[slot]<=1;end
else begin obs_phase[336+count1]<=angle;obs_x[336+count1]<=scale[f]*dxmap[pair];obs_y[336+count1]<=scale[f]*dymap[pair];obs_group[336+count1]<=slot[0];count1<=count1+1;ng1[slot[0]]<=ng1[slot[0]]+1;freqmask1[slot]<=1;end
state<=22;end
22:if(pair==(array_id==0?27:55))begin if(slot==11)begin state<=24;end else begin slot<=slot+1;state<=10;end end
else begin pair<=pair+1;state<=11;end
24:begin fine<=0;lo_x<=-100;hi_x<=100;lo_y<=-100;hi_y<=100;gx<=-100;gy<=-100;step<=10;best_score<=-2147483647;
base_index<=array_id==0?0:336;oi_end<=array_id==0?count0:336+count1;support<=array_id==0?count0:count1;
state<=25;end
25:if(gx*gx+gy*gy>10000||support<24)state<=33;
else begin score<=0;score0<=0;score1<=0;oi<=base_index;state<=26;end
26:begin phase_product_x<=$signed(obs_x[oi])*$signed(gx);phase_product_y<=$signed(obs_y[oi])*$signed(gy);phi_hold<=obs_phase[oi];group_hold<=obs_group[oi];state<=27;end
27:begin predicted<=phase_product_x+phase_product_y;state<=28;end
28:begin delta<=$signed(phi_hold)-predicted;state<=29;end
29:if(delta>64'sd1686629713)delta<=delta-64'sd3373259426;
else if(delta< -64'sd1686629713)delta<=delta+64'sd3373259426;
else begin angle_in<=delta[31:0];vm<=0;cs<=1;state<=30;end
30:if(cdone)begin score<=score+($signed(cosine)>>>16);
if(group_hold)score1<=score1+($signed(cosine)>>>16);else score0<=score0+($signed(cosine)>>>16);
if(oi+1==oi_end)state<=32;else begin oi<=oi+1;state<=26;end end
32:begin if(score>best_score)begin best_score<=score;best_score0<=score0;best_score1<=score1;best_x<=gx;best_y<=gy;end state<=33;end
33:if(gy<hi_y)begin gy<=gy+step;state<=25;end
else if(gx<hi_x)begin gx<=gx+step;gy<=lo_y;state<=25;end
else if(!fine&&support>=24)begin fine<=1;lo_x<=best_x-10;hi_x<=best_x+10;lo_y<=best_y-10;hi_y<=best_y+10;
gx<=best_x-10;gy<=best_y-10;step<=1;best_score<=-2147483647;state<=25;end
else state<=34;
34:begin out_x<=dir_lut[best_x+100];out_y<=dir_lut[best_y+100];state<=36;end
36:begin
if(array_id==0)begin a1x<=out_x;a1y<=out_y;
direction_ok[1]<=count0>=24&&pop12(freqmask0)>=3&&ng0[0]>=8&&ng0[1]>=8&&best_score>$signed({1'b0,count0})*12288&&best_score0>$signed({1'b0,ng0[0]})*10650&&best_score1>$signed({1'b0,ng0[1]})*10650;
array_id<=1;f<=0;ch<=8;trace_acc<=0;state<=2;end
else begin a2x<=out_x;a2y<=out_y;
direction_ok[2]<=count1>=24&&pop12(freqmask1)>=3&&ng1[0]>=8&&ng1[1]>=8&&best_score>$signed({1'b0,count1})*12288&&best_score0>$signed({1'b0,ng1[0]})*10650&&best_score1>$signed({1'b0,ng1[1]})*10650;
state<=35;end end
35:begin jx<=($signed({a1x[31],a1x})+$signed({a2x[31],a2x}))>>>1;jy<=($signed({a1y[31],a1y})+$signed({a2y[31],a2y}))>>>1;
direction_ok[0]<=direction_ok[1]&&direction_ok[2];coarse_ok<=direction_ok[2:1];evidence<=count0+count1;processing_cycles<=ticks;windows<=windows+1;update<=1;state<=0;end
default:state<=0;
endcase end end
endmodule
