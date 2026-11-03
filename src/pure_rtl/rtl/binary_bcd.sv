`timescale 1ns/1ps
                                                                                  
module binary_bcd #(parameter WIDTH=17,DIGITS=6)(input clk,rst_n,start,input [WIDTH-1:0] value,
output reg busy,done,output reg [DIGITS*4-1:0] digits);
reg [WIDTH-1:0] bits_left;reg [DIGITS*4-1:0] work,adjusted;integer bit_count,k;
always @*begin adjusted=work;for(k=0;k<DIGITS;k=k+1)if(work[k*4+:4]>=5)adjusted[k*4+:4]=work[k*4+:4]+3;end
always @(posedge clk)begin
if(!rst_n)begin busy<=0;done<=0;digits<=0;bits_left<=0;work<=0;bit_count<=0;end
else begin done<=0;
if(start&&!busy)begin busy<=1;bits_left<=value;work<=0;bit_count<=0;end
else if(busy)begin work<={adjusted[DIGITS*4-2:0],bits_left[WIDTH-1]};bits_left<=bits_left<<1;
if(bit_count==WIDTH-1)begin digits<={adjusted[DIGITS*4-2:0],bits_left[WIDTH-1]};busy<=0;done<=1;end else bit_count<=bit_count+1;end
end end
endmodule
