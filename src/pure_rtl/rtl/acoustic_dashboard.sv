`timescale 1ns/1ps
                                                                           
module acoustic_dashboard #(parameter HORIZONTAL_MM=11000,VERTICAL_MM=10000,BASELINE_MM=1000,VARIANT_ID=1)(
input clk,rst_n,input [10:0] x,y,input [2:0] status,input direction_valid,azimuth_valid,position_valid,
input [11:0] azimuth,input [9:0] elevation,input signed [31:0] ux,uy,
input signed [31:0] px_mm,py_mm,pz_mm,input [15:0] age_tenths,input [7:0] compute_stage,input [4:0] history,
input [31:0] errors,input [127:0] levels,input [1:0] estimate_mode,input [31:0] repaired_frames,input [175:0] diagnostics,output [15:0] pixel);
`include "r20_lcd_text.vh"
localparam BG=16'h08a3,PANEL=16'h1106,PANEL2=16'h1167,GRID=16'h226b,INK=16'he79e,MUTED=16'h8516,ACCENT=16'h4f19,AMBER=16'hfdec;
reg [2:0] sf;reg [1:0] mf;reg pv,dv,av,link;reg signed [31:0] px,py,pz;reg [127:0] lev;reg [31:0] err,fix;
reg [11:0] az;reg [9:0] el;
always @(posedge clk)if(!rst_n)begin sf<=0;mf<=0;pv<=0;dv<=0;av<=0;px<=0;py<=0;pz<=0;lev<=0;err<=0;fix<=0;az<=0;el<=0;link<=0;end
else if(x==0&&y==0)begin sf<=status;mf<=estimate_mode;pv<=position_valid;dv<=direction_valid;av<=azimuth_valid;px<=px_mm;py<=py_mm;pz<=pz_mm;lev<=levels;err<=errors;fix<=repaired_frames;az<=azimuth;el<=elevation;link<=diagnostics[0];end
function [7:0] digit(input [31:0] n,input integer pos);reg [31:0] q;begin case(pos)0:q=n;1:q=n/10;2:q=n/100;default:q=n/1000;endcase digit=48+q%10;end endfunction
function [7:0] hexchar(input [3:0] v);begin hexchar=v<10?48+v:55+v;end endfunction
                                                                     
wire [31:0] horizontal,range_mm;wire [2:0] range_index;
wire signed [10:0] dx,dy,bx,by;wire [7:0] baseline_px;wire overhead,map_ready;
reg map_pending;
always @(posedge clk)if(!rst_n)map_pending<=0;else if(x==0&&y==0)map_pending<=1;else if(map_ready)map_pending<=0;
radar_view_transform #(.HORIZONTAL_MM(HORIZONTAL_MM),.BASELINE_MM(BASELINE_MM)) view_map(
 .clk(clk),.rst_n(rst_n),.frame_tick(x==0&&y==0),.valid(position_valid),
 .fresh(diagnostics[0]&&estimate_mode!=3),.px_mm(px_mm),.py_mm(py_mm),.pz_mm(pz_mm),
 .horizontal(horizontal),.range_mm(range_mm),.range_index(range_index),
 .dx(dx),.dy(dy),.bx(bx),.by(by),.baseline_px(baseline_px),.overhead(overhead),.ready(map_ready));
function [39:0] ring_text(input [2:0] ri,input [2:0] circle);begin case({ri,circle})
6'd1:ring_text=" 0.4m";
6'd2:ring_text=" 0.8m";
6'd3:ring_text=" 1.2m";
6'd4:ring_text=" 1.6m";
6'd5:ring_text=" 2.0m";
6'd9:ring_text="   1m";
6'd10:ring_text="   2m";
6'd11:ring_text="   3m";
6'd12:ring_text="   4m";
6'd13:ring_text="   5m";
6'd17:ring_text="   2m";
6'd18:ring_text="   4m";
6'd19:ring_text="   6m";
6'd20:ring_text="   8m";
6'd21:ring_text="  10m";
6'd25:ring_text="   3m";
6'd26:ring_text="   6m";
6'd27:ring_text="   9m";
6'd28:ring_text="  12m";
6'd29:ring_text="  15m";
6'd33:ring_text="   4m";
6'd34:ring_text="   8m";
6'd35:ring_text="  12m";
6'd36:ring_text="  16m";
6'd37:ring_text="  20m";
default:ring_text=" -- m";endcase end endfunction
reg [39:0] ring_label;
reg start,negative,good;reg [16:0] value;reg [1:0] axis,cs;wire cb,cd;wire [23:0] bcd;
reg [47:0] xt,yt,zt;reg [39:0] ht,at;reg [31:0] et;
wire signed [31:0] coord=axis==0?px:axis==1?py:axis==2?pz:$signed(horizontal);
wire [31:0] mag=coord<0?-coord:coord;
wire [47:0] formatted=pv&&good?{negative?8'd45:8'd43,hexchar(bcd[19:16]),hexchar(bcd[15:12]),8'd46,hexchar(bcd[11:8]),hexchar(bcd[7:4])}:"---.--";
binary_bcd decimal_converter(clk,rst_n,start,value,cb,cd,bcd);
always @(posedge clk)if(!rst_n)begin start<=0;negative<=0;good<=0;value<=0;axis<=0;cs<=0;xt<="---.--";yt<="---.--";zt<="---.--";ht<="--.--";at<="---.-";et<="--.-";end
else begin start<=0;
if(x==0&&y==0)begin axis<=0;cs<=1;at<=direction_valid&&azimuth_valid?{digit(azimuth,3),digit(azimuth,2),digit(azimuth,1),8'd46,digit(azimuth,0)}:"---.-";et<=direction_valid?{digit(elevation,2),digit(elevation,1),8'd46,digit(elevation,0)}:"--.-";end
else case(cs)
1:if(!map_pending)begin value<=mag[16:0];negative<=coord<0;good<=mag<=99999;start<=1;cs<=2;end
2:if(cd)begin case(axis)0:xt<=formatted;1:yt<=formatted;2:zt<=formatted;3:ht<=formatted[39:0];endcase if(axis==3)cs<=0;else begin axis<=axis+1;cs<=1;end end
endcase end
reg [15:0] color,ink;reg on,cn,bigcn;reg [7:0] ch,tid;integer ox,oy,scale,k,idx,bar,height,ex,ey,tx,ty,bex,bey,bdx,bdy;
reg [255:0] msg;reg [10:0] gx,gy;reg [1:0] gs;reg [7:0] gc,gt;reg gon,gcn,gbig;reg [15:0] gb,gi;
wire signed [11:0] rx=$signed({1'b0,x})-12'sd221,ry=$signed({1'b0,y})-12'sd270;
wire [24:0] r2=rx*rx+ry*ry;
wire signed [24:0] crossval=rx*(-dy)-ry*dx,projection=rx*dx+ry*(-dy);
wire [24:0] crossabs=crossval<0?-crossval:crossval;
wire [24:0] point_r2=dx*dx+dy*dy;
wire [10:0] absdx=dx<0?-dx:dx,absdy=dy<0?-dy:dy;
wire [10:0] line_width=((absdx>absdy?absdx:absdy)>>1)+1;
always @*begin
ring_label=0;color=BG;ink=INK;on=0;cn=0;bigcn=0;ch=32;tid=0;ox=0;oy=0;scale=1;k=0;idx=0;bar=0;height=0;msg=0;
bex=221+bx;bey=270-by;bdx=$signed({1'b0,x})-bex;if(bdx<0)bdx=-bdx;bdy=$signed({1'b0,y})-bey;if(bdy<0)bdy=-bdy;ex=221+dx;ey=270-dy;tx=ex+14;if(tx>380)tx=380;ty=ey-24;if(ty<125)ty=125;if(ty>380)ty=380;
if(x>=20&&x<780&&(y==58||y==432))color=GRID;

if((x>=20&&x<432&&y>=82&&y<420)||(x>=448&&x<780&&y>=82&&y<188)||(x>=448&&x<780&&y>=306&&y<420))color=PANEL;
if(y>=201&&y<292&&((x>=448&&x<554)||(x>=561&&x<667)||(x>=674&&x<780)))color=PANEL;
if(x==614&&y>=100&&y<170)color=GRID;if(x==602&&y>=340&&y<400)color=GRID;
if(x>=80&&x<=370&&y>=130&&y<=410)begin
 if((r2>=650&&r2<=702)||(r2>=2652&&r2<=2756)||(r2>=6006&&r2<=6162)||(r2>=10712&&r2<=10920)||(r2>=16770&&r2<=17030))color=GRID;
 if((x==221||y==270||rx==ry||rx==-ry)&&r2<=19044)color=GRID;
 if(pv&&crossabs<=line_width&&projection>=0&&r2<=point_r2)color=mf==3?MUTED:ACCENT;
 if(pv&&x>=ex-4&&x<=ex+4&&y>=ey-4&&y<=ey+4)color=mf==3?MUTED:AMBER;
 if((x>=221-baseline_px-2&&x<=221-baseline_px+1&&y>=268&&y<=272)||(x>=221+baseline_px-1&&x<=221+baseline_px+2&&y>=268&&y<=272))color=INK;
end
                                                                        
if(pv&&dv&&av&&!overhead&&bdx+bdy<=6)color=mf==3?MUTED:ACCENT;
                                          
if(x>=20&&x<188&&y>=16&&y<40)begin on=1;cn=1;bigcn=1;tid=0;ox=20;oy=16;ink=INK;end
if(x>=235&&x<283&&y>=25&&y<41)begin on=1;cn=1;bigcn=0;tid=15;ox=235;oy=25;ink=MUTED;end
if(x>=295&&x<359&&y>=26&&y<42)begin on=1;ox=295;oy=26;k=(x-295)/8;msg="/ 48 kHz                        ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=36&&x<100&&y>=96&&y<112)begin on=1;cn=1;bigcn=0;tid=1;ox=36;oy=96;ink=INK;end
if(x>=467&&x<515&&y>=99&&y<115)begin on=1;cn=1;bigcn=0;tid=2;ox=467;oy=99;ink=MUTED;end
if(x>=634&&x<682&&y>=99&&y<115)begin on=1;cn=1;bigcn=0;tid=3;ox=634;oy=99;ink=MUTED;end
if(x>=462&&x<502&&y>=214&&y<230)begin on=1;ox=462;oy=214;k=(x-462)/8;msg="X / m                           ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=575&&x<615&&y>=214&&y<230)begin on=1;ox=575;oy=214;k=(x-575)/8;msg="Y / m                           ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=688&&x<728&&y>=214&&y<230)begin on=1;ox=688;oy=214;k=(x-688)/8;msg="Z / m                           ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=465&&x<529&&y>=321&&y<337)begin on=1;cn=1;bigcn=0;tid=8;ox=465;oy=321;ink=MUTED;end
if(x>=20&&x<36&&y>=445&&y<461)begin on=1;ox=20;oy=445;k=(x-20)/8;msg="16                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=40&&x<88&&y>=444&&y<460)begin on=1;cn=1;bigcn=0;tid=19;ox=40;oy=444;ink=MUTED;end
if(x>=106&&x<122&&y>=443&&y<459)begin on=1;ox=106;oy=443;k=(x-106)/8;msg="A1                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=346&&x<362&&y>=443&&y<459)begin on=1;ox=346;oy=443;k=(x-346)/8;msg="A2                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=209&&x<225&&y>=111&&y<127)begin on=1;ox=209;oy=111;k=(x-209)/8;msg="+Y                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=364&&x<380&&y>=263&&y<279)begin on=1;ox=364;oy=263;k=(x-364)/8;msg="+X                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=66&&x<82&&y>=263&&y<279)begin on=1;ox=66;oy=263;k=(x-66)/8;msg="-X                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=242&&x<258&&y>=402&&y<418)begin on=1;ox=242;oy=402;k=(x-242)/8;msg="-Y                              ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=34&&x<66&&y>=397&&y<413)begin on=1;cn=1;bigcn=0;tid=16;ox=34;oy=397;ink=MUTED;end
if(x>=302&&x<366&&y>=398&&y<414)begin on=1;cn=1;bigcn=0;tid=18;ox=302;oy=398;ink=MUTED;end
if(x>=20&&x<276&&y>=63&&y<79)begin on=1;ox=20;oy=63;k=(x-20)/8;msg="TINGKONG H11/Z10 B2m            ";
case(k)10:ch=48+(HORIZONTAL_MM/10000);11:ch=48+((HORIZONTAL_MM/1000)%10);14:ch=48+(VERTICAL_MM/10000);15:ch=48+((VERTICAL_MM/1000)%10);18:ch=48+BASELINE_MM/1000;default:ch=msg[255-k*8-:8];endcase ink=MUTED;end
if(x>=324&&x<420&&y>=98&&y<114)begin on=1;ox=324;oy=98;k=(x-324)/8;msg="AUTO / 20m                      ";ch=k==7?digit(range_mm/1000,1):k==8?digit(range_mm/1000,0):msg[255-k*8-:8];ink=ACCENT;end
if(x>=70&&x<110&&y>=398&&y<414)begin on=1;ox=70;oy=398;k=(x-70)/8;ring_label=ring_text(range_index,1);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=238&&x<278&&y>=285&&y<301)begin color=PANEL;on=1;ox=238;oy=285;k=(x-238)/8;ring_label=ring_text(range_index,1);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=256&&x<296&&y>=303&&y<319)begin color=PANEL;on=1;ox=256;oy=303;k=(x-256)/8;ring_label=ring_text(range_index,2);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=275&&x<315&&y>=322&&y<338)begin color=PANEL;on=1;ox=275;oy=322;k=(x-275)/8;ring_label=ring_text(range_index,3);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=293&&x<333&&y>=340&&y<356)begin color=PANEL;on=1;ox=293;oy=340;k=(x-293)/8;ring_label=ring_text(range_index,4);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=311&&x<351&&y>=359&&y<375)begin color=PANEL;on=1;ox=311;oy=359;k=(x-311)/8;ring_label=ring_text(range_index,5);ch=ring_label[39-k*8-:8];ink=MUTED;end
if(x>=116&&x<180&&y>=96&&y<112)begin on=1;cn=1;tid=21;ox=116;oy=96;ink=ACCENT;end
if(pv&&overhead&&x>=36&&x<100&&y>=122&&y<138)begin on=1;cn=1;tid=22;ox=36;oy=122;ink=AMBER;end
if(x>=632&&x<752&&y>=22&&y<38)begin on=1;ox=632;oy=22;k=(x-632)/8;msg="KEY4: DETECTION                 ";ch=msg[255-k*8-:8];ink=MUTED;end
if(x>=620&&x<764&&y>=345&&y<361)begin on=1;cn=1;tid=9;ox=620;oy=345;ink=MUTED;end
if(x>=620&&x<764&&y>=373&&y<389)begin on=1;cn=1;tid=!link?7:!pv?14:mf==1?10:mf==2?11:mf==3?12:13;ox=620;oy=373;ink=mf==1?ACCENT:AMBER;end
if(pv&&x>=tx&&x<tx+32&&y>=ty&&y<ty+16)begin on=1;cn=1;tid=20;ox=tx;oy=ty;ink=AMBER;end
if(x>=467&&x<587&&y>=132&&y<164)begin on=1;scale=2;ox=467;oy=132;k=(x-467)/16;ch=k<5?at[39-k*8-:8]:8'd32;ink=ACCENT;end
if(x>=634&&x<762&&y>=132&&y<164)begin on=1;scale=2;ox=634;oy=132;k=(x-634)/16;ch=k<4?et[31-k*8-:8]:8'd32;ink=ACCENT;end
if(y>=246&&y<278&&((x>=453&&x<549)||(x>=566&&x<662)||(x>=679&&x<775)))begin
 on=1;scale=2;oy=246;ox=x<554?453:x<667?566:679;k=(x-ox)/16;ch=x<554?xt[47-k*8-:8]:x<667?yt[47-k*8-:8]:zt[47-k*8-:8];end
if(x>=465&&x<585&&y>=356&&y<388)begin on=1;scale=2;ox=465;oy=356;k=(x-465)/16;ch=k<5?ht[39-k*8-:8]:k==6?8'd109:8'd32;end
if(dv&&(((x==554||x==558)&&y>=133&&y<=137)||((y==133||y==137)&&x>=554&&x<=558)||((x==705||x==709)&&y>=133&&y<=137)||((y==133||y==137)&&x>=705&&x<=709)))begin on=0;color=ACCENT;end
if(x>=105&&x<537&&y>=439&&y<464)begin
 if(x<297)begin bar=(x-137)/20;ox=137;idx=bar;end else begin bar=(x-377)/20;ox=377;idx=bar+8;end
 if(bar>=0&&bar<8&&x>=ox+bar*20&&x<ox+bar*20+14)begin color=PANEL2;height=lev[idx*8+:8]>23?23:lev[idx*8+:8];if(y>=463-height)color=ACCENT;end
end
if(x>=610&&x<714&&y>=438&&y<454)begin on=1;ox=610;oy=438;k=(x-610)/8;msg="ERR 00000000                    ";ch=k<4?msg[255-k*8-:8]:k<12?hexchar(err>>((11-k)*4)):8'd32;ink=MUTED;end
if(x>=610&&x<714&&y>=459&&y<475)begin on=1;ox=610;oy=459;k=(x-610)/8;msg="FIX 00000000                    ";ch=k<4?msg[255-k*8-:8]:k<12?hexchar(fix>>((11-k)*4)):8'd32;ink=MUTED;end
if(pv&&x>=80&&x<=370&&y>=130&&y<=410&&x>=ex-5&&x<=ex+5&&y>=ey-5&&y<=ey+5)begin
 on=0;color=mf==3?MUTED:AMBER;
 if(x>ex-3&&x<ex+3&&y>ey-3&&y<ey+3&&x!=ex&&y!=ey)color=PANEL;
end
end
                                                                  
always @(posedge clk)begin gx<=x-ox;gy<=y-oy;gs<=scale;gc<=ch;gt<=tid;gon<=on;gcn<=cn;gbig<=bigcn;gb<=color;gi<=ink;end
reg [6:0] cid;reg [5:0] row,col;reg [5:0] ci;
always @*begin cid=127;row=0;col=0;ci=0;
 if(gcn)begin ci=gbig?gx/24:gx/16;cid=cn_char(gt,ci);row=gy;col=gbig?gx%24:gx%16;end
 else begin row=gs==2?gy>>1:gy;col=gs==2?(gx>>1)%8:gx%8;end
end
(* rom_style="block" *)reg [15:0] cn16[0:2047];
(* rom_style="block" *)reg [23:0] cn24[0:4095];
(* rom_style="block" *)reg [7:0] ascii_rom[0:2047];
initial begin $readmemh("r20_cn16.mem",cn16);$readmemh("r20_cn24.mem",cn24);$readmemh("lcd_ascii.mem",ascii_rom);end
reg [15:0] cr16;reg [23:0] cr24;reg [7:0] ar;reg [5:0] column;reg en,usecn,usebig;reg [15:0] bc,fg;
always @(posedge clk)begin cr16<=cn16[{cid,row[3:0]}];cr24<=cn24[cid*24+row];ar<=ascii_rom[{gc[6:0],row[3:0]}];column<=col;en<=gon;usecn<=gcn;usebig<=gbig;bc<=gb;fg<=gi;end
assign pixel=en&&(usecn?(usebig?cr24[23-column]:cr16[15-column]):ar[7-column])?fg:bc;
endmodule
