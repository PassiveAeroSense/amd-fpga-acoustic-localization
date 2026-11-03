                                                                   

`timescale 1 ns / 1 ps

 module power_db_hls_mul_32ns_19ns_51_1_1(din0, din1, dout);
parameter ID = 1;
parameter NUM_STAGE = 0;
parameter din0_WIDTH = 14;
parameter din1_WIDTH = 12;
parameter dout_WIDTH = 26;

input [din0_WIDTH - 1 : 0] din0; 
input [din1_WIDTH - 1 : 0] din1; 
output [dout_WIDTH - 1 : 0] dout;

wire signed [dout_WIDTH - 1 : 0] tmp_product;
























assign tmp_product = $signed({1'b0, din0}) * $signed({1'b0, din1});











assign dout = tmp_product;





















endmodule
