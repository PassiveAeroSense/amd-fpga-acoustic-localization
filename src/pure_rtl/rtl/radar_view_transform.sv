`timescale 1ns/1ps
                                                                                   
                                                                           
module radar_view_transform #(
 parameter HORIZONTAL_MM=20000, BASELINE_MM=1000, SHRINK_FRAMES=172
)(input clk,rst_n,frame_tick,input valid,fresh,
 input signed [31:0] px_mm,py_mm,pz_mm,
 output reg [31:0] horizontal,range_mm,
 output reg [2:0] range_index,
 output reg signed [10:0] dx,dy,bx,by,
 output reg [7:0] baseline_px,
 output reg overhead,ready);
localparam [2:0] MAX_INDEX=HORIZONTAL_MM>=20000?4:HORIZONTAL_MM>=15000?3:2;
function [31:0] scale_mm(input [2:0] i);begin
 case(i)0:scale_mm=2000;1:scale_mm=5000;2:scale_mm=10000;3:scale_mm=15000;default:scale_mm=20000;endcase
end endfunction
function [2:0] fit_index(input [31:0] r);reg [2:0] i;begin
 i=r<=1600?0:r<=4000?1:r<=8000?2:r<=12000?3:4;
 fit_index=i>MAX_INDEX?MAX_INDEX:i;
end endfunction
function [2:0] shrink_index(input [31:0] r);reg [2:0] i;begin
 i=r<=1300?0:r<=3250?1:r<=6500?2:r<=9750?3:4;
 shrink_index=i>MAX_INDEX?MAX_INDEX:i;
end endfunction
                                                                        
                                                                          
function [31:0] expand_limit(input [2:0] i);begin
 case(i)0:expand_limit=1700;1:expand_limit=4250;2:expand_limit=8500;3:expand_limit=12750;default:expand_limit=17000;endcase
end endfunction
reg [4:0] state;
reg signed [31:0] px,py,pz;
reg v,f,seen;reg [2:0] selected,candidate;reg [15:0] shrink_count;
reg [31:0] radius,selected_mm;
reg [63:0] xx,yy,rad,num,den;
reg ss,ds;wire sb,sd,db,dd,dz;wire [31:0] rt;wire [63:0] remn,dq,dr;
reg signed [10:0] mx,my,mbx,mby;
wire [63:0] ax=px<0?-$signed({{32{px[31]}},px}):$signed({{32{px[31]}},px});
wire [63:0] ay=py<0?-$signed({{32{py[31]}},py}):$signed({{32{py[31]}},py});
wire [10:0] limited=dq>134?11'd134:dq[10:0];
fx_sqrt radial(clk,rst_n,ss,rad,sb,sd,rt,remn);
fx_div mapper(clk,rst_n,ds,num,den,db,dd,dz,dq,dr);
always @(posedge clk)begin
 if(!rst_n)begin
  state<=0;px<=0;py<=0;pz<=0;v<=0;f<=0;seen<=0;selected<=MAX_INDEX;candidate<=MAX_INDEX;shrink_count<=0;
  radius<=0;selected_mm<=HORIZONTAL_MM;xx<=0;yy<=0;rad<=0;num<=0;den<=1;ss<=0;ds<=0;
  mx<=0;my<=0;mbx<=0;mby<=0;horizontal<=0;range_mm<=HORIZONTAL_MM;range_index<=MAX_INDEX;
  dx<=0;dy<=0;bx<=0;by<=0;baseline_px<=130*BASELINE_MM/(2*HORIZONTAL_MM);overhead<=0;ready<=0;
 end else begin
  ss<=0;ds<=0;ready<=0;
  if(frame_tick&&state==0)begin px<=px_mm;py<=py_mm;pz<=pz_mm;v<=valid;f<=fresh;state<=1;end
  else case(state)
   1:begin xx<=$signed(px)*$signed(px);yy<=$signed(py)*$signed(py);state<=2;end
   2:begin rad<=xx+yy;ss<=1;state<=3;end
   3:if(sd)begin
    radius<=rt;selected<=range_index;
    if(v&&f)begin
     seen<=1;
     if(!seen || rt>expand_limit(range_index))begin selected<=fit_index(rt);shrink_count<=0;candidate<=MAX_INDEX;end
     else if(shrink_index(rt)<range_index)begin
      if(candidate!=shrink_index(rt))begin candidate<=shrink_index(rt);shrink_count<=1;end
      else if(shrink_count>=SHRINK_FRAMES-1)begin selected<=candidate;shrink_count<=0;end
      else shrink_count<=shrink_count+1;
     end else begin shrink_count<=0;candidate<=MAX_INDEX;end
    end else begin shrink_count<=0;candidate<=MAX_INDEX;end
    state<=4;
   end
   4:begin selected_mm<=scale_mm(selected);den<=scale_mm(selected);num<=ax*130;ds<=1;state<=5;end
   5:if(dd)begin mx<=px<0?-$signed(limited):$signed(limited);num<=ay*130;ds<=1;state<=6;end
   6:if(dd)begin my<=py<0?-$signed(limited):$signed(limited);num<=ax*134;den<=radius==0?1:radius;ds<=1;state<=7;end
   7:if(dd)begin mbx<=px<0?-$signed(limited):$signed(limited);num<=ay*134;ds<=1;state<=8;end
   8:if(dd)begin mby<=py<0?-$signed(limited):$signed(limited);num<=130*BASELINE_MM/2;den<=selected_mm;ds<=1;state<=9;end
   9:if(dd)begin
    dx<=mx;dy<=my;bx<=mbx;by<=mby;baseline_px<=dq[7:0];
    horizontal<=radius;range_index<=selected;range_mm<=selected_mm;
    overhead<=v&&(radius<=100 || (pz>0 && {32'd0,radius}*10<={32'd0,pz}));
    ready<=1;state<=0;
   end
   default:state<=0;
  endcase
 end
end
endmodule
