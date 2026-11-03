`timescale 1ns/1ps
                                                                       
                                                                           
                                                                     
module detector_features(input clk,rst_n,load,input [6:0] band_addr,
input signed [47:0] band_db,input start,input [7:0] feature_addr,
output reg signed [47:0] feature_value,output reg busy,done,invalid);
reg signed [47:0] raw[0:96],features[0:217];
reg signed [31:0] coeff[0:2327];initial $readmemh("detector_dct.mem",coeff);
reg [3:0] state;integer i,j,k,index;reg signed [63:0] sum,mean;
reg signed [47:0] sample;reg signed [31:0] c;reg signed [79:0] product;
reg signed [87:0] accum;wire signed [87:0] result=accum>>>30;
reg div_start,negative;reg [63:0] numerator,denominator;wire div_busy,div_done,div_zero;wire [63:0] quotient,remainder;
fx_div divider(clk,rst_n,div_start,numerator,denominator,div_busy,div_done,div_zero,quotient,remainder);
always @*begin index=i+j-4;if(index<0)index=0;else if(index>96)index=96;end
always @(posedge clk)begin
feature_value<=features[feature_addr];if(load&&!busy&&band_addr<97)raw[band_addr]<=band_db;
if(!rst_n)begin busy<=0;done<=0;invalid<=0;state<=0;i<=0;j<=0;k<=0;sum<=0;mean<=0;sample<=0;c<=0;product<=0;accum<=0;
div_start<=0;negative<=0;numerator<=0;denominator<=1;end
else begin done<=0;div_start<=0;
if(start&&!busy)begin busy<=1;invalid<=0;state<=0;i<=0;j<=0;k<=0;sum<=0;end
else if(busy)case(state)
0:begin features[i]<=raw[i];sum<=sum+raw[i];if(i==96)state<=1;else i<=i+1;end
1:begin negative<=sum<0;numerator<=sum<0?-sum:sum;denominator<=97;div_start<=1;state<=8;end
8:if(div_done)begin mean<=negative?-$signed(quotient):$signed(quotient);sum<=0;i<=0;j<=0;state<=2;end
2:begin sum<=sum+raw[index];if(j==8)state<=3;else j<=j+1;end
3:begin negative<=sum<0;numerator<=sum<0?-sum:sum;denominator<=9;div_start<=1;state<=9;end
9:if(div_done)begin features[97+i]<=raw[i]-(negative?-$signed(quotient):$signed(quotient));sum<=0;j<=0;
if(i==96)begin i<=0;k<=0;accum<=0;state<=4;end else begin i<=i+1;state<=2;end end
4:begin sample<=raw[i]-mean;c<=coeff[k*97+i];state<=5;end
5:begin product<=sample*c;state<=6;end
6:begin accum<=accum+product;if(i==96)state<=7;else begin i<=i+1;state<=4;end end
7:begin
if(result>88'sd140737488355327||result< -88'sd140737488355328)invalid<=1;
features[194+k]<=result[47:0];i<=0;accum<=0;
if(k==23)begin busy<=0;done<=1;end else begin k<=k+1;state<=4;end end
endcase
end
end
endmodule
