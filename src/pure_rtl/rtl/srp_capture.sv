`timescale 1ns/1ps
                                                                                                        
                                                                               
                                                                               
                                                                                  
module srp_capture(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
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
banked_sdp_ram #(.DEPTH(19152),.AW(16)) covariance_ram(clk,cwe,cwa,cra,cwd,cq);
assign cov_re=cq[31:0];assign cov_im=cq[63:32];
reg [4:0] state;integer f,i,j,triangle_index,highbit,needed;reg [5:0] next_exp,shift_old;
reg [31:0] elapsed,next_frame;reg [6:0] target;
reg signed [31:0] ar,ai,br,bi,oldr,oldi;
reg signed [63:0] p0,p1,p2,p3;reg signed [64:0] rr,ri,nr,ni;
integer b;
function [3:0] pair_i(input integer s);begin if(s<16)pair_i=s;else case(s)
16:pair_i=1;
17:pair_i=2;
18:pair_i=2;
19:pair_i=3;
20:pair_i=3;
21:pair_i=3;
22:pair_i=4;
23:pair_i=4;
24:pair_i=4;
25:pair_i=4;
26:pair_i=5;
27:pair_i=5;
28:pair_i=5;
29:pair_i=5;
30:pair_i=5;
31:pair_i=6;
32:pair_i=6;
33:pair_i=6;
34:pair_i=6;
35:pair_i=6;
36:pair_i=6;
37:pair_i=7;
38:pair_i=7;
39:pair_i=7;
40:pair_i=7;
41:pair_i=7;
42:pair_i=7;
43:pair_i=7;
44:pair_i=9;
45:pair_i=10;
46:pair_i=10;
47:pair_i=11;
48:pair_i=11;
49:pair_i=11;
50:pair_i=12;
51:pair_i=12;
52:pair_i=12;
53:pair_i=12;
54:pair_i=13;
55:pair_i=13;
56:pair_i=13;
57:pair_i=13;
58:pair_i=13;
59:pair_i=14;
60:pair_i=14;
61:pair_i=14;
62:pair_i=14;
63:pair_i=14;
64:pair_i=14;
65:pair_i=15;
66:pair_i=15;
67:pair_i=15;
68:pair_i=15;
69:pair_i=15;
70:pair_i=15;
71:pair_i=15;
default:pair_i=0;endcase end endfunction
function [3:0] pair_j(input integer s);begin if(s<16)pair_j=s;else case(s)
16:pair_j=0;
17:pair_j=0;
18:pair_j=1;
19:pair_j=0;
20:pair_j=1;
21:pair_j=2;
22:pair_j=0;
23:pair_j=1;
24:pair_j=2;
25:pair_j=3;
26:pair_j=0;
27:pair_j=1;
28:pair_j=2;
29:pair_j=3;
30:pair_j=4;
31:pair_j=0;
32:pair_j=1;
33:pair_j=2;
34:pair_j=3;
35:pair_j=4;
36:pair_j=5;
37:pair_j=0;
38:pair_j=1;
39:pair_j=2;
40:pair_j=3;
41:pair_j=4;
42:pair_j=5;
43:pair_j=6;
44:pair_j=8;
45:pair_j=8;
46:pair_j=9;
47:pair_j=8;
48:pair_j=9;
49:pair_j=10;
50:pair_j=8;
51:pair_j=9;
52:pair_j=10;
53:pair_j=11;
54:pair_j=8;
55:pair_j=9;
56:pair_j=10;
57:pair_j=11;
58:pair_j=12;
59:pair_j=8;
60:pair_j=9;
61:pair_j=10;
62:pair_j=11;
63:pair_j=12;
64:pair_j=13;
65:pair_j=8;
66:pair_j=9;
67:pair_j=10;
68:pair_j=11;
69:pair_j=12;
70:pair_j=13;
71:pair_j=14;
default:pair_j=0;endcase end endfunction

                                                                     
                                                                                
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
1:begin sa<=f*16+pair_i(triangle_index);sb<=f*16+pair_j(triangle_index);ca<=f*72+triangle_index;state<=2;end
2:state<=3;
3:begin ar<=qa[31:0];ai<=qa[63:32];br<=qb[31:0];bi<=qb[63:32];oldr<=frame_count==0?0:$signed(cq[31:0]);oldi<=frame_count==0?0:$signed(cq[63:32]);state<=4;end
4:begin p0<=ar*br;p1<=ai*bi;p2<=ai*br;p3<=ar*bi;state<=5;end
5:begin rr<=$signed(p0)+$signed(p1);ri<=$signed(p2)-$signed(p3);state<=6;end
6:begin nr<=($signed(oldr)>>>shift_old)+(rr>>>next_exp);ni<=($signed(oldi)>>>shift_old)+(ri>>>next_exp);state<=7;end
7:begin cwa<=f*72+triangle_index;cwd<={sat(ni),sat(nr)};cwe<=1;
if(nr>2147483647||nr< -65'sd2147483648||ni>2147483647||ni< -65'sd2147483648)invalid<=1;
state<=1;
if(triangle_index<71)triangle_index<=triangle_index+1;
else if(f<265)begin f<=f+1;triangle_index<=0;end
else state<=8;end
8:begin exponent<=next_exp;frame_count<=frame_count+1;
if(frame_count+1==target)begin busy<=0;done<=1;capture_samples<=2048+(target-1)*512;end else state<=0;end
endcase
end
end
endmodule
