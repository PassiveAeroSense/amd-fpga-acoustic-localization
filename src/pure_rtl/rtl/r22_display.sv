`timescale 1ns/1ps
                                                                        
                                                                               
module r22_display(input clk,rst_n,input [10:0] x,y,
 input [527:0] waveform,input [255:0] dc_values,input [63:0] scales,
 input [1:0] displayed_good,input display_valid,stream_alive,detected,
 input [2:0] phase,input calibrated,input [31:0] errors,fixes,
 output [7:0] read_column,output reg [15:0] pixel);
localparam BG=16'h08a3,PANEL=16'h1106,LINE=16'h226b,WHITE=16'he79e,MUTED=16'h8516,RED=16'hf986,GREEN=16'h2ee9,BLUE=16'h07ff;
reg active,alive,cal;reg [2:0] mode;reg [31:0] err,fix;
always @(posedge clk)if(!rst_n)begin active<=0;alive<=0;cal<=0;mode<=0;err<=0;fix<=0;end
else if(x==0&&y==0)begin active<=detected;alive<=stream_alive;cal<=calibrated;mode<=phase;err<=errors;fix<=fixes;end
assign read_column=x>=582&&x<774?x-582:x>=322&&x<514?x-322:0;
reg [7:0] font[0:2047];reg [23:0] cnfont[0:511];
initial begin $readmemh("lcd_ascii.mem",font);$readmemh("r22_cn24.mem",cnfont);end
function [7:0] hx(input [3:0] v);begin hx=v<10?48+v:55+v;end endfunction
function [3:0] title_char(input integer k);begin case(k)0:title_char=0;1:title_char=1;2:title_char=2;3:title_char=3;4:title_char=4;5:title_char=5;default:title_char=6;endcase end endfunction
integer channel,row,local_x,k,n,xx,yy;reg [15:0] bg,ink;reg text_on,cn_on,in_wave;
reg [7:0] ascii;reg [3:0] glyph_row;reg [2:0] glyph_col;reg [3:0] cid;reg [4:0] cy,cx;
reg [127:0] msg;
always @*begin
 bg=BG;ink=MUTED;text_on=0;cn_on=0;in_wave=0;ascii=32;glyph_row=0;glyph_col=0;cid=0;cy=0;cx=0;
 channel=0;row=0;local_x=0;k=0;n=0;xx=0;yy=0;msg=0;
 if((x>=20&&x<270&&y>=82&&y<448)||(x>=286&&x<518&&y>=82&&y<448)||(x>=546&&x<778&&y>=82&&y<448))bg=PANEL;
 if(x>=20&&x<780&&(y==58||y==458))bg=LINE;
 if(x>=20&&x<188&&y>=16&&y<40)begin
  cn_on=1;cid=title_char((x-20)/24);cx=(x-20)%24;cy=y-16;ink=WHITE;
 end
 if(x>=632&&x<752&&y>=22&&y<38)begin msg="KEY4: LOCATION  ";ascii=msg[127-((x-632)/8)*8-:8];glyph_col=(x-632)%8;glyph_row=y-22;text_on=1;end
                                                                    
 if(x>=49&&x<241&&y>=216&&y<264)begin
  cn_on=1;k=(x-49)/48;cid=k==0?(active?9:7):k==1?5:k==2?6:8;
  cx=((x-49)%48)>>1;cy=(y-216)>>1;ink=active?GREEN:RED;
 end
 if(x>=73&&x<217&&y>=280&&y<328)begin cn_on=1;cid=(x-73)/48;cx=((x-73)%48)>>1;cy=(y-280)>>1;ink=active?GREEN:RED;end
 xx=$signed({1'b0,x})-145;yy=$signed({1'b0,y})-155;
 if(xx*xx+yy*yy<=196)bg=active?GREEN:RED;
 if(x>=94&&x<196&&y==349)bg=LINE;
 if(x>=32&&x<160&&y>=365&&y<381)begin
  msg=!alive?"NO ADC DATA     ":!cal?"CALIBRATING     ":mode==4?"RESULT PENDING  ":active?"LIVE POSITIVE   ":"LIVE NEGATIVE   ";
  ascii=msg[127-((x-32)/8)*8-:8];glyph_col=(x-32)%8;glyph_row=y-365;text_on=1;
 end
 if(x>=32&&x<160&&((y>=391&&y<407)||(y>=415&&y<431)))begin
  msg=y<407?"ERR 00000000    ":"FIX 00000000    ";
  for(n=0;n<8;n=n+1)msg[127-(4+n)*8-:8]=hx((y<407?err:fix)>>((7-n)*4));
  ascii=msg[127-((x-32)/8)*8-:8];glyph_col=(x-32)%8;glyph_row=y<407?y-391:y-415;text_on=1;
 end
 if(y>=88&&y<104&&((x>=294&&x<374)||(x>=554&&x<634)))begin
  k=x>=554?x-554:x-294;msg=x>=554?"A2 (1-8)        ":"A1 (1-8)        ";
  ascii=msg[127-(k/8)*8-:8];glyph_col=k%8;glyph_row=y-88;text_on=1;ink=BLUE;
 end
 if(y>=112&&y<448&&((x>=286&&x<518)||(x>=546&&x<778)))begin
  local_x=x>=546?x-546:x-286;channel=(y-112)/42+(x>=546?8:0);row=(y-112)%42;
  if(row==0)bg=LINE;
  if(local_x>=36&&local_x<228)begin
   in_wave=1;if(row==21||(local_x-36)%48==0)bg=LINE;
  end
  if(local_x>=8&&local_x<16&&row>=13&&row<29)begin
   text_on=1;ascii=49+(channel%8);glyph_col=local_x-8;glyph_row=row-13;ink=MUTED;
  end
 end
 if(x>=708&&x<772&&y>=463&&y<479)begin msg="TINGKONG        ";ascii=msg[127-((x-708)/8)*8-:8];glyph_col=(x-708)%8;glyph_row=y-463;text_on=1;end
end
reg [7:0] glyph;reg [23:0] cglyph;reg [2:0] bit_col;reg [4:0] cbit;
reg text_q,cn_q,wave_q;reg [15:0] bg_q,ink_q;reg [3:0] channel_q;reg [5:0] row_q;
reg signed [16:0] mn,mx,mean;reg signed [17:0] lo,hi;reg [32:0] word;reg [3:0] shift;
always @*begin
 word=waveform[channel_q*33+:33];mn=$signed(word[15:0]);mx=$signed(word[31:16]);mean=$signed(dc_values[channel_q*16+:16]);shift=scales[channel_q*4+:4];
 lo=($signed(mn)-$signed(mean))>>>shift;hi=($signed(mx)-$signed(mean))>>>shift;
 if(lo>18)lo=18;if(lo< -18)lo=-18;if(hi>18)hi=18;if(hi< -18)hi=-18;
end
always @(posedge clk)begin
 glyph<=font[ascii[6:0]*16+glyph_row];cglyph<=cnfont[cid*32+cy];bit_col<=glyph_col;cbit<=cx;
 text_q<=text_on;cn_q<=cn_on;wave_q<=in_wave;bg_q<=bg;ink_q<=ink;channel_q<=channel;row_q<=row;
 if(!rst_n)pixel<=0;
 else if(cn_q&&cglyph[23-cbit])pixel<=ink_q;
 else if(text_q&&glyph[7-bit_col])pixel<=ink_q;
 else if(wave_q&&display_valid&&alive&&displayed_good[channel_q[3]]&&word[32]&&$signed({1'b0,row_q})>=21-hi&&$signed({1'b0,row_q})<=21-lo)pixel<=BLUE;
 else pixel<=bg_q;
end
endmodule
