`timescale 1ns/1ps
                                                                                                        
                                                                               
                                                                               
                                                                                  
module light_pair_capture(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 input start,input [6:0] frames_requested,input [15:0] read_addr,
 output signed [31:0] cov_re,cov_im,output reg [5:0] exponent,
 output reg [6:0] frame_count,output reg busy,done,invalid,
 output reg [31:0] capture_samples);
reg [11:0] wrptr,base;wire [383:0] word;
wire [10:0] req;wire [3:0] ch;wire signed [23:0] sample=word[ch*24+:24];
reg fs;wire fv,fb,fd,fi;wire [8:0] frequency;wire [3:0] channel;wire signed [31:0] fr,fiq;wire [31:0] peak;
wire local_reset=rst_n&&!gap;
wire [12:0] ring_sum={1'b0,base}+req;
wire [11:0] ring_read=ring_sum>=3072?ring_sum-3072:ring_sum;
banked_sdp_ram #(.WIDTH(384),.DEPTH(3072)) audio_ring(clk,audio_valid&&!gap,wrptr,ring_read,audio_samples,word);
music_stft_frame fftframe(clk,local_reset,fs,req,ch,sample,fv,frequency,channel,fr,fiq,fb,fd,fi,peak);
(* ram_style="block" *)reg [63:0] spec[0:4255];
reg [12:0] sa,sb;reg [63:0] qa,qb;
wire [12:0] spa=fv?frequency*16+channel:sa;
always @(posedge clk)begin if(fv)spec[spa]<={fiq,fr};qa<=spec[spa];end
always @(posedge clk)qb<=spec[sb];
reg [15:0] ca,cwa;reg cwe;reg [63:0] cwd;wire [63:0] cq;
wire [15:0] cra=busy?ca:read_addr;
banked_sdp_ram #(.DEPTH(8512),.AW(16)) covariance_ram(clk,cwe,cwa,cra,cwd,cq);
assign cov_re=cq[31:0];assign cov_im=cq[63:32];
reg [4:0] state;integer f,i,j,triangle_index,highbit,needed;reg [5:0] next_exp,shift_old;
reg [31:0] elapsed,next_frame;reg [6:0] target;
reg signed [31:0] ar,ai,br,bi,oldr,oldi;
reg signed [63:0] p0,p1,p2,p3;reg signed [64:0] rr,ri,nr,ni;
integer b;
function [3:0] pair_i(input integer s);integer p;begin
if(s<16)pair_i=s;else begin p=(s-16)%8;case(p)
0:pair_i=0;1:pair_i=1;2:pair_i=5;3:pair_i=6;
4:pair_i=3;5:pair_i=4;6:pair_i=7;default:pair_i=6;endcase
if(s>=24)pair_i=pair_i+8;end end endfunction
function [3:0] pair_j(input integer s);integer p;begin
if(s<16)pair_j=s;else begin p=(s-16)%8;case(p)
0:pair_j=1;1:pair_j=2;2:pair_j=4;3:pair_j=5;
4:pair_j=2;5:pair_j=3;6:pair_j=0;default:pair_j=7;endcase
if(s>=24)pair_j=pair_j+8;end end endfunction

                                                                     
                                                                                
always @*begin highbit=0;for(b=0;b<32;b=b+1)if(peak[b])highbit=b;needed=2*highbit-21;if(needed<0)needed=0;end
function signed [31:0] sat(input signed [64:0] v);begin
if(v>2147483647)sat=32'sh7fffffff;else if(v< -65'sd2147483648)sat=32'sh80000000;else sat=v[31:0];end endfunction
always @(posedge clk)begin
if(!local_reset)begin wrptr<=0;base<=0;fs<=0;sa<=0;sb<=0;ca<=0;cwa<=0;cwe<=0;cwd<=0;exponent<=0;frame_count<=0;busy<=0;done<=0;invalid<=1;capture_samples<=0;
state<=0;f<=0;i<=0;j<=0;triangle_index<=0;next_exp<=0;shift_old<=0;elapsed<=0;next_frame<=2047;target<=18;
ar<=0;ai<=0;br<=0;bi<=0;oldr<=0;oldi<=0;p0<=0;p1<=0;p2<=0;p3<=0;rr<=0;ri<=0;nr<=0;ni<=0;end
else begin done<=0;fs<=0;cwe<=0;
if(audio_valid)begin wrptr<=wrptr==3071?0:wrptr+1;if(busy)begin elapsed<=elapsed+1;
if(elapsed==next_frame&&frame_count<target)begin
 if(state!=0||fb)begin invalid<=1;busy<=0;done<=1;end
 else begin base<=wrptr>=2047?wrptr-12'd2047:wrptr+12'd1025;fs<=1;next_frame<=next_frame+512;end
end end end
if(start&&!busy)begin busy<=1;invalid<=0;frame_count<=0;exponent<=0;elapsed<=0;next_frame<=2047;state<=0;target<=frames_requested;
if(frames_requested==0||frames_requested>64)begin busy<=0;invalid<=1;done<=1;end end
else if(busy)case(state)
0:if(fd)begin
if(fi)begin busy<=0;invalid<=1;done<=1;end
else begin next_exp<=needed>exponent?needed:exponent;shift_old<=needed>exponent?needed-exponent:0;f<=0;i<=0;j<=0;triangle_index<=0;state<=1;end end
1:begin sa<=f*16+pair_i(triangle_index);sb<=f*16+pair_j(triangle_index);ca<=f*32+triangle_index;state<=2;end
2:state<=3;
3:begin ar<=qa[31:0];ai<=qa[63:32];br<=qb[31:0];bi<=qb[63:32];oldr<=frame_count==0?0:$signed(cq[31:0]);oldi<=frame_count==0?0:$signed(cq[63:32]);state<=4;end
4:begin p0<=ar*br;p1<=ai*bi;p2<=ai*br;p3<=ar*bi;state<=5;end
5:begin rr<=$signed(p0)+$signed(p1);ri<=$signed(p2)-$signed(p3);state<=6;end
6:begin nr<=($signed(oldr)>>>shift_old)+(rr>>>next_exp);ni<=($signed(oldi)>>>shift_old)+(ri>>>next_exp);state<=7;end
7:begin cwa<=f*32+triangle_index;cwd<={sat(ni),sat(nr)};cwe<=1;
if(nr>2147483647||nr< -65'sd2147483648||ni>2147483647||ni< -65'sd2147483648)invalid<=1;
state<=1;
if(triangle_index<31)triangle_index<=triangle_index+1;
else if(f<265)begin f<=f+1;triangle_index<=0;end
else state<=8;end
8:begin exponent<=next_exp;frame_count<=frame_count+1;
if(frame_count+1==target)begin busy<=0;done<=1;capture_samples<=2048+(target-1)*512;end else state<=0;end
endcase
end
end
endmodule
