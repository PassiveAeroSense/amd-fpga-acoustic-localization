`timescale 1ns/1ps
                                                                              
                                                                                 
                                                                                 
                                                                         
module light_localizer(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 input recalibrate,output reg background_ready,update,output reg [2:0] direction_ok,
 output reg signed [31:0] jx,jy,a1x,a1y,a2x,a2y,
 output reg [31:0] evidence,output reg [15:0] f0,output reg [31:0] processing_cycles,windows,
 output [7:0] stage,output reg fault,output reg [1:0] coarse_ok);
wire reset_local=rst_n&&!gap&&!recalibrate;
reg start;reg [6:0] requested;reg [15:0] addr;
wire signed [31:0] cr,ci;wire [5:0] expn;wire [6:0] frames;
wire cb,cd,invalid;wire [31:0] sample_count;
light_pair_capture capture(clk,reset_local,audio_valid,gap,audio_samples,start,requested,addr,cr,ci,expn,frames,cb,cd,invalid,sample_count);
reg [7:0] state;assign stage=state;
reg [31:0] ticks;reg background_pass;reg [5:0] bg_exp;
                                                                                   
(* ram_style="block" *)reg [39:0] bg[0:265],trace[0:265];
reg [39:0] trace_acc;
(* ram_style="distributed" *)reg [7:0] weights[0:265];
reg [31:0] slopes[0:265];reg [2:0] harmonics[0:265];
initial begin $readmemh("light_phase_scale.mem",slopes);$readmemh("light_harmonic.mem",harmonics);end
reg [8:0] f;reg [4:0] slot;
reg [39:0] sig_p,bg_p,left_p,right_p;
reg [63:0] num,den;reg ds;wire db,dd,dzero;wire [63:0] quotient,remainder;
fx_div divide(clk,reset_local,ds,num,den,db,dd,dzero,quotient,remainder);
reg [7:0] excess;
reg [4:0] pair;reg [3:0] ia,ib;reg [31:0] pa,pb;
reg signed [31:0] re,im;reg signed [63:0] re2,im2;reg [63:0] pp;
reg cs;wire cbusy,cdone;wire signed [31:0] angle,cosine,sine;wire [39:0] mag;
wire signed [39:0] cvx={{8{re[31]}},re},cvy={{8{im[31]}},im};
fx_cordic phase(clk,reset_local,cs,1'b1,cvx,cvy,32'sd0,cbusy,cdone,angle,cosine,sine,mag);
reg signed [63:0] product;reg signed [31:0] observation;
                                                                                
(* ram_style="block" *)reg [31:0] observations[0:4255];
reg [12:0] oa;reg [31:0] oq;always @(posedge clk)oq<=observations[oa];
reg [3:0] axis;reg pass;reg signed [63:0] sums[0:11];reg [31:0] totals[0:11],original[0:3];
reg [4:0] hm[0:11];reg [3:0] pm[0:11];reg signed [31:0] mean[0:11];
reg signed [31:0] value,diff;reg [7:0] weight;reg [2:0] harmonic;reg accepted;
reg [11:0] valid_axis;reg sign_result;reg [31:0] total_evidence;
wire [3:0] subset_axis=harmonic[0]?axis+8:axis+4;
reg check_start,check_array;reg [1:0] split_agree;wire check_busy,check_done,check_invalid,check_agree;
wire signed [31:0] check_x0=mean[check_array?6:4]<<<10,check_y0=mean[check_array?7:5]<<<10;
wire signed [31:0] check_x1=mean[check_array?10:8]<<<10,check_y1=mean[check_array?11:9]<<<10;
direction_consistency split_check(clk,reset_local,check_start,check_x0,check_y0,check_x1,check_y1,
check_busy,check_done,check_invalid,check_agree);
integer n;
function [3:0] pi(input [4:0] p);begin case(p[2:0])
0:pi=0;1:pi=1;2:pi=5;3:pi=6;4:pi=3;5:pi=4;6:pi=7;default:pi=6;endcase
if(p>=8)pi=pi+8;end endfunction
function [3:0] pj(input [4:0] p);begin case(p[2:0])
0:pj=1;1:pj=2;2:pj=4;3:pj=5;4:pj=2;5:pj=3;6:pj=0;default:pj=7;endcase
if(p>=8)pj=pj+8;end endfunction
function [2:0] bits5(input [4:0] h);begin bits5={2'b0,h[0]}+h[1]+h[2]+h[3]+h[4];end endfunction
always @(posedge clk)begin
if(!reset_local)begin
state<=0;start<=0;requested<=64;addr<=0;background_ready<=0;update<=0;direction_ok<=0;coarse_ok<=0;
jx<=0;jy<=0;a1x<=0;a1y<=0;a2x<=0;a2y<=0;evidence<=0;f0<=300;processing_cycles<=0;windows<=0;fault<=0;
ticks<=0;background_pass<=1;bg_exp<=0;trace_acc<=0;f<=0;slot<=0;sig_p<=0;bg_p<=0;left_p<=0;right_p<=0;
num<=0;den<=1;ds<=0;excess<=0;pair<=0;ia<=0;ib<=0;pa<=0;pb<=0;re<=0;im<=0;re2<=0;im2<=0;pp<=0;
cs<=0;product<=0;observation<=0;oa<=0;axis<=0;pass<=0;value<=0;diff<=0;weight<=0;harmonic<=0;accepted<=0;
valid_axis<=0;sign_result<=0;total_evidence<=0;check_start<=0;check_array<=0;split_agree<=0;
for(n=0;n<12;n=n+1)begin sums[n]<=0;totals[n]<=0;hm[n]<=0;pm[n]<=0;mean[n]<=0;end
for(n=0;n<4;n=n+1)original[n]<=0;
end else begin start<=0;ds<=0;cs<=0;check_start<=0;update<=0;ticks<=ticks+1;
case(state)
0:begin requested<=background_ready?8:64;background_pass<=!background_ready;start<=1;ticks<=0;state<=1;end
1:if(cd)begin
 if(invalid)begin fault<=1;direction_ok<=0;coarse_ok<=0;update<=1;state<=0;end
 else begin f<=0;slot<=0;trace_acc<=0;state<=2;fault<=0;end end
2:begin addr<=f*32+slot;state<=3;end
3:state<=4;
4:begin trace_acc<=trace_acc+(cr>0?$unsigned(cr):0);
 if(slot==15)state<=5;else begin slot<=slot+1;state<=2;end end
5:begin if(background_pass)bg[f]<=trace_acc;else trace[f]<=trace_acc;
 if(f==265)begin
  if(background_pass)begin bg_exp<=expn;background_ready<=1;state<=0;end
  else begin f<=0;total_evidence<=0;state<=6;end
 end else begin f<=f+1;slot<=0;trace_acc<=0;state<=2;end end
                                                                                
6:begin sig_p<=trace[f];bg_p<=bg[f];left_p<=trace[f<6?0:f-6];right_p<=trace[f>259?265:f+6];state<=7;end
                                                                             
                                                                    
7:begin weights[f]<=harmonics[f]!=0&&sig_p!=0?8:0;
 if(harmonics[f]==0||sig_p==0||sig_p<=left_p+(left_p>>1)||sig_p<=right_p+(right_p>>1))state<=11;
 else begin
  num<=bg_exp>expn?{24'd0,bg_p}:({24'd0,bg_p}>>(expn-bg_exp));
  den<=bg_exp>expn?({21'd0,sig_p,3'b0}>>(bg_exp-expn)):{21'd0,sig_p,3'b0};state<=8;
 end end
8:begin num<=num<<8;ds<=1;state<=9;end
9:if(dd)begin
 if(dzero||quotient>=230)state<=11;
 else begin excess<=255-quotient[7:0];state<=10;end end
10:begin weights[f]<=excess;total_evidence<=total_evidence+excess;state<=11;end
11:if(f==265)begin f<=0;pair<=0;state<=12;end else begin f<=f+1;state<=6;end
12:begin ia<=pi(pair);ib<=pj(pair);addr<=f*32+16+pair;state<=13;end
13:state<=14;
14:begin re<=cr;im<=ci;addr<=f*32+ia;state<=15;end
15:state<=16;
16:begin pa<=cr>0?$unsigned(cr):0;addr<=f*32+ib;state<=17;end
17:state<=18;
18:begin pb<=cr>0?$unsigned(cr):0;state<=19;end
19:begin re2<=re*re;im2<=im*im;pp<=pa*pb;state<=20;end
20:begin
 if(weights[f]==0||pa==0||pb==0||({1'b0,re2}+{1'b0,im2})<({1'b0,pp}>>1))begin observation<=0;accepted<=0;state<=24;end
 else begin cs<=1;state<=21;end end
21:if(cdone)begin product<=$signed(angle)*$signed(slopes[f]);state<=22;end
22:begin observation<=product>>>33;state<=23;end
23:begin accepted<=observation<=1153434&&observation>=-1153434;state<=24;end
24:begin observations[f*16+pair]<={accepted,observation[30:0]};
 if(pair==15)begin pair<=0;if(f==265)begin f<=0;pass<=0;state<=26;end else begin f<=f+1;state<=12;end end
 else begin pair<=pair+1;state<=12;end end
26:begin for(n=0;n<12;n=n+1)begin sums[n]<=0;totals[n]<=0;hm[n]<=0;pm[n]<=0;end
 f<=0;pair<=0;state<=27;end
27:begin oa<=f*16+pair;axis<=pair[3:2];weight<=weights[f];harmonic<=harmonics[f];state<=28;end
28:state<=29;
29:begin value<={{1{oq[30]}},oq[30:0]};accepted<=oq[31]&&weight!=0;state<=30;end
30:begin diff<=value-mean[axis];product<=$signed(value)*$signed({1'b0,weight});state<=31;end
31:begin if(accepted&&(!pass||(diff<=157286&&diff>=-157286)))begin
 sums[axis]<=sums[axis]+product;totals[axis]<=totals[axis]+weight;
 if(harmonic!=0)hm[axis][harmonic-1]<=1;pm[axis][pair[1:0]]<=1;
 if(pass)begin sums[subset_axis]<=sums[subset_axis]+product;totals[subset_axis]<=totals[subset_axis]+weight;
 if(harmonic!=0)hm[subset_axis][harmonic-1]<=1;pm[subset_axis][pair[1:0]]<=1;end end
 if(pair==15)begin pair<=0;if(f==265)begin axis<=0;valid_axis<=0;state<=32;end else begin f<=f+1;state<=27;end end
 else begin pair<=pair+1;state<=27;end end
32:begin num<=sums[axis]<0?-sums[axis]:sums[axis];den<=totals[axis];sign_result<=sums[axis]<0;ds<=1;state<=33;end
33:if(dd)begin mean[axis]<=sign_result?-$signed(quotient[31:0]):$signed(quotient[31:0]);
 if(!pass)original[axis]<=totals[axis];
 valid_axis[axis]<=!dzero&&bits5(hm[axis])>=(axis<4?2:1)&&bits5({1'b0,pm[axis]})>=2&&
 (!pass||axis>=4||({1'b0,totals[axis]}<<1)>={1'b0,original[axis[1:0]]});
 if(axis==(pass?11:3))begin if(pass)begin check_array<=0;state<=35;end else begin pass<=1;state<=26;end end
 else begin axis<=axis+1;state<=32;end end
34:begin a1x<=mean[0]<<<10;a1y<=mean[1]<<<10;a2x<=mean[2]<<<10;a2y<=mean[3]<<<10;
 jx<=($signed(mean[0])+$signed(mean[2]))<<<9;jy<=($signed(mean[1])+$signed(mean[3]))<<<9;
 direction_ok<={(&valid_axis[3:2])&&split_agree[1],(&valid_axis[1:0])&&split_agree[0],
 (&valid_axis[3:0])&&(&split_agree)};
 coarse_ok<={totals[2]!=0&&totals[3]!=0,totals[0]!=0&&totals[1]!=0};
 evidence<=total_evidence;processing_cycles<=ticks;windows<=windows+1;update<=1;state<=0;end
35:begin check_start<=1;state<=36;end
36:if(check_done)begin
 split_agree[check_array]<=check_agree&&!check_invalid&&
 (check_array?(valid_axis[6]&&valid_axis[7]&&valid_axis[10]&&valid_axis[11]):
 (valid_axis[4]&&valid_axis[5]&&valid_axis[8]&&valid_axis[9]));
 if(check_array)state<=34;else begin check_array<=1;state<=35;end end
default:state<=0;
endcase end end
endmodule
