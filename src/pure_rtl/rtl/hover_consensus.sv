`timescale 1ns/1ps
                                                                               
                                                                               
module hover_consensus(input clk,rst_n,update,candidate_valid,confident,gap,
 input signed [31:0] x,y,z,
 output reg out_update,out_valid,output reg signed [31:0] ox,oy,oz);
reg signed [31:0] x0,y0,z0,x1,y1,z1;reg [1:0] count;
function [31:0] ab(input signed [31:0] a);begin ab=a<0?-a:a;end endfunction
function [32:0] dif(input signed [31:0] a,b);reg signed [32:0] d;begin d=$signed({a[31],a})-$signed({b[31],b});dif=d<0?-d:d;end endfunction
function signed [31:0] median(input signed [31:0] a,b,c);begin
 median=a>b?(b>c?b:(a>c?c:a)):(a>c?a:(b>c?c:b));end endfunction
wire [31:0] tolerance=350+((ab(x)+ab(y)+ab(z))>>5);
wire consistent=count==0||(dif(x,x0)<=tolerance&&dif(y,y0)<=tolerance&&dif(z,z0)<=tolerance);
always @(posedge clk)begin
 if(!rst_n)begin count<=0;out_update<=0;out_valid<=0;ox<=0;oy<=0;oz<=0;x0<=0;y0<=0;z0<=0;x1<=0;y1<=0;z1<=0;end
 else begin
  out_update<=0;
  if(gap)begin count<=0;out_valid<=0;end
  else if(update)begin
   out_valid<=0;
   if(!candidate_valid||!confident)count<=0;
   else begin
    x0<=x;y0<=y;z0<=z;
    if(!consistent)count<=1;
    else begin
     x1<=x0;y1<=y0;z1<=z0;
     if(count<2)count<=count+1;
     else begin ox<=median(x,x0,x1);oy<=median(y,y0,y1);oz<=median(z,z0,z1);out_update<=1;out_valid<=1;end
    end
   end
  end
 end
end
endmodule
