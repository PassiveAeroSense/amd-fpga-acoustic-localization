`timescale 1ns/1ps
                                                                                                                          
                                                                               
                                                                               
                                                                                  
module joint15_capture(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 input start,input [6:0] frames_requested,input [15:0] read_addr,
 output signed [31:0] cov_re,cov_im,output reg [5:0] exponent,
 output reg [6:0] frame_count,output reg busy,done,invalid,
 output reg [31:0] capture_samples);
reg [12:0] wrptr,base;wire [383:0] word;
wire [11:0] req;wire [3:0] ch;wire signed [23:0] sample=word[ch*24+:24];
reg fs;wire fv,fb,fd,fi;wire [8:0] frequency;wire [3:0] channel;wire signed [31:0] fr,fiq;wire [31:0] peak;
wire local_reset=rst_n&&!gap;
wire [13:0] ring_sum={1'b0,base}+req;
wire [12:0] ring_read=ring_sum[12:0];
banked_sdp_ram #(.WIDTH(384),.DEPTH(8192)) audio_ring(clk,audio_valid&&!gap,wrptr,ring_read,audio_samples,word);
joint15_stft_frame fftframe(clk,local_reset,fs,req,ch,sample,fv,frequency,channel,fr,fiq,fb,fd,fi,peak);
(* ram_style="block" *)reg [63:0] spec[0:4255];
reg [12:0] sa,sb;reg [63:0] qa,qb;
wire [12:0] spa=fv?frequency*16+channel:sa;
always @(posedge clk)begin if(fv)spec[spa]<={fiq,fr};qa<=spec[spa];end
always @(posedge clk)qb<=spec[sb];
reg [15:0] ca,cwa;reg cwe;reg [63:0] cwd;wire [63:0] cq;
wire [15:0] cra=busy?ca:read_addr;
banked_sdp_ram #(.DEPTH(36176),.AW(16)) covariance_ram(clk,cwe,cwa,cra,cwd,cq);
assign cov_re=cq[31:0];assign cov_im=cq[63:32];
reg [4:0] state;integer f,i,j,triangle_index,highbit,needed;reg [5:0] next_exp,shift_old;
reg [31:0] elapsed,next_frame;reg [6:0] target;
reg signed [31:0] ar,ai,br,bi,oldr,oldi;
reg signed [63:0] p0,p1,p2,p3;reg signed [64:0] rr,ri,nr,ni;
integer b;
reg cov_start;wire cov_done,cov_idle,cov_ready;wire [64:0] cov_result;
r18_ip_covariance_hls covariance_compute(.ap_clk(clk),.ap_rst_n(local_reset),.ap_start(cov_start),.ap_done(cov_done),.ap_idle(cov_idle),.ap_ready(cov_ready),
.ar(ar),.ai(ai),.br(br),.bi(bi),.oldr(oldr),.oldi(oldi),.shift_old(shift_old),.next_exp(next_exp),.result(cov_result));
function [3:0] pair_i(input integer s);begin case(s)
0:pair_i=0;
1:pair_i=1;
2:pair_i=2;
3:pair_i=3;
4:pair_i=4;
5:pair_i=5;
6:pair_i=6;
7:pair_i=7;
8:pair_i=8;
9:pair_i=9;
10:pair_i=10;
11:pair_i=11;
12:pair_i=12;
13:pair_i=13;
14:pair_i=14;
15:pair_i=15;
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
44:pair_i=8;
45:pair_i=8;
46:pair_i=8;
47:pair_i=8;
48:pair_i=8;
49:pair_i=8;
50:pair_i=8;
51:pair_i=8;
52:pair_i=9;
53:pair_i=9;
54:pair_i=9;
55:pair_i=9;
56:pair_i=9;
57:pair_i=9;
58:pair_i=9;
59:pair_i=9;
60:pair_i=9;
61:pair_i=10;
62:pair_i=10;
63:pair_i=10;
64:pair_i=10;
65:pair_i=10;
66:pair_i=10;
67:pair_i=10;
68:pair_i=10;
69:pair_i=10;
70:pair_i=10;
71:pair_i=11;
72:pair_i=11;
73:pair_i=11;
74:pair_i=11;
75:pair_i=11;
76:pair_i=11;
77:pair_i=11;
78:pair_i=11;
79:pair_i=11;
80:pair_i=11;
81:pair_i=11;
82:pair_i=12;
83:pair_i=12;
84:pair_i=12;
85:pair_i=12;
86:pair_i=12;
87:pair_i=12;
88:pair_i=12;
89:pair_i=12;
90:pair_i=12;
91:pair_i=12;
92:pair_i=12;
93:pair_i=12;
94:pair_i=13;
95:pair_i=13;
96:pair_i=13;
97:pair_i=13;
98:pair_i=13;
99:pair_i=13;
100:pair_i=13;
101:pair_i=13;
102:pair_i=13;
103:pair_i=13;
104:pair_i=13;
105:pair_i=13;
106:pair_i=13;
107:pair_i=14;
108:pair_i=14;
109:pair_i=14;
110:pair_i=14;
111:pair_i=14;
112:pair_i=14;
113:pair_i=14;
114:pair_i=14;
115:pair_i=14;
116:pair_i=14;
117:pair_i=14;
118:pair_i=14;
119:pair_i=14;
120:pair_i=14;
121:pair_i=15;
122:pair_i=15;
123:pair_i=15;
124:pair_i=15;
125:pair_i=15;
126:pair_i=15;
127:pair_i=15;
128:pair_i=15;
129:pair_i=15;
130:pair_i=15;
131:pair_i=15;
132:pair_i=15;
133:pair_i=15;
134:pair_i=15;
135:pair_i=15;
default:pair_i=0;endcase end endfunction
function [3:0] pair_j(input integer s);begin case(s)
0:pair_j=0;
1:pair_j=1;
2:pair_j=2;
3:pair_j=3;
4:pair_j=4;
5:pair_j=5;
6:pair_j=6;
7:pair_j=7;
8:pair_j=8;
9:pair_j=9;
10:pair_j=10;
11:pair_j=11;
12:pair_j=12;
13:pair_j=13;
14:pair_j=14;
15:pair_j=15;
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
44:pair_j=0;
45:pair_j=1;
46:pair_j=2;
47:pair_j=3;
48:pair_j=4;
49:pair_j=5;
50:pair_j=6;
51:pair_j=7;
52:pair_j=0;
53:pair_j=1;
54:pair_j=2;
55:pair_j=3;
56:pair_j=4;
57:pair_j=5;
58:pair_j=6;
59:pair_j=7;
60:pair_j=8;
61:pair_j=0;
62:pair_j=1;
63:pair_j=2;
64:pair_j=3;
65:pair_j=4;
66:pair_j=5;
67:pair_j=6;
68:pair_j=7;
69:pair_j=8;
70:pair_j=9;
71:pair_j=0;
72:pair_j=1;
73:pair_j=2;
74:pair_j=3;
75:pair_j=4;
76:pair_j=5;
77:pair_j=6;
78:pair_j=7;
79:pair_j=8;
80:pair_j=9;
81:pair_j=10;
82:pair_j=0;
83:pair_j=1;
84:pair_j=2;
85:pair_j=3;
86:pair_j=4;
87:pair_j=5;
88:pair_j=6;
89:pair_j=7;
90:pair_j=8;
91:pair_j=9;
92:pair_j=10;
93:pair_j=11;
94:pair_j=0;
95:pair_j=1;
96:pair_j=2;
97:pair_j=3;
98:pair_j=4;
99:pair_j=5;
100:pair_j=6;
101:pair_j=7;
102:pair_j=8;
103:pair_j=9;
104:pair_j=10;
105:pair_j=11;
106:pair_j=12;
107:pair_j=0;
108:pair_j=1;
109:pair_j=2;
110:pair_j=3;
111:pair_j=4;
112:pair_j=5;
113:pair_j=6;
114:pair_j=7;
115:pair_j=8;
116:pair_j=9;
117:pair_j=10;
118:pair_j=11;
119:pair_j=12;
120:pair_j=13;
121:pair_j=0;
122:pair_j=1;
123:pair_j=2;
124:pair_j=3;
125:pair_j=4;
126:pair_j=5;
127:pair_j=6;
128:pair_j=7;
129:pair_j=8;
130:pair_j=9;
131:pair_j=10;
132:pair_j=11;
133:pair_j=12;
134:pair_j=13;
135:pair_j=14;
default:pair_j=0;endcase end endfunction

                                                                     
                                                                                
always @*begin highbit=0;for(b=0;b<32;b=b+1)if(peak[b])highbit=b;needed=2*highbit-21;if(needed<0)needed=0;end
function signed [31:0] sat(input signed [64:0] v);begin
if(v>2147483647)sat=32'sh7fffffff;else if(v< -65'sd2147483648)sat=32'sh80000000;else sat=v[31:0];end endfunction
always @(posedge clk)begin
if(!local_reset)begin wrptr<=0;base<=0;fs<=0;sa<=0;sb<=0;ca<=0;cwa<=0;cwe<=0;cwd<=0;exponent<=0;frame_count<=0;busy<=0;done<=0;invalid<=1;capture_samples<=0;
cov_start<=0;state<=0;f<=0;i<=0;j<=0;triangle_index<=0;next_exp<=0;shift_old<=0;elapsed<=0;next_frame<=4095;target<=18;
ar<=0;ai<=0;br<=0;bi<=0;oldr<=0;oldi<=0;p0<=0;p1<=0;p2<=0;p3<=0;rr<=0;ri<=0;nr<=0;ni<=0;end
else begin done<=0;fs<=0;cwe<=0;if(cov_start&&cov_ready)cov_start<=0;
if(audio_valid)begin wrptr<=wrptr+1;if(busy)begin elapsed<=elapsed+1;
if(elapsed==next_frame&&frame_count<target)begin
 if(state!=0||fb)begin invalid<=1;busy<=0;done<=1;end
 else begin base<=wrptr-13'd4095;fs<=1;next_frame<=next_frame+3072;end
end end end
if(start&&!busy)begin busy<=1;invalid<=0;frame_count<=0;exponent<=0;elapsed<=0;next_frame<=4095;state<=0;target<=frames_requested;
if(frames_requested==0||frames_requested>64)begin busy<=0;invalid<=1;done<=1;end end
else if(busy)case(state)
0:if(fd)begin
if(fi)begin busy<=0;invalid<=1;done<=1;end
else begin next_exp<=needed>exponent?needed:exponent;shift_old<=needed>exponent?needed-exponent:0;f<=0;i<=0;j<=0;triangle_index<=0;state<=1;end end
1:begin sa<=f*16+pair_i(triangle_index);sb<=f*16+pair_j(triangle_index);ca<=f*136+triangle_index;state<=2;end
2:state<=3;
3:begin ar<=qa[31:0];ai<=qa[63:32];br<=qb[31:0];bi<=qb[63:32];oldr<=frame_count==0?0:$signed(cq[31:0]);oldi<=frame_count==0?0:$signed(cq[63:32]);state<=4;end
4:begin cov_start<=1;state<=5;end
5:if(cov_done)begin cwa<=f*136+triangle_index;cwd<=cov_result[63:0];cwe<=1;
if(cov_result[64])invalid<=1;
state<=1;
if(triangle_index<135)triangle_index<=triangle_index+1;
else if(f<265)begin f<=f+1;triangle_index<=0;end
else state<=8;end
8:begin exponent<=next_exp;frame_count<=frame_count+1;
if(frame_count+1==target)begin busy<=0;done<=1;capture_samples<=4096+(target-1)*3072;end else state<=0;end
endcase
end
end
endmodule
