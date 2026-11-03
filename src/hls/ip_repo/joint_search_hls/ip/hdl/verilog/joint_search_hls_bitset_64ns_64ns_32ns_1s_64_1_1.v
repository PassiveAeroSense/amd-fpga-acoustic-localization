                                                                 
                                 
                                                        
                                                                        
                                                                 
`timescale 1ns / 1ps

module joint_search_hls_bitset_64ns_64ns_32ns_1s_64_1_1 (sel,din,value,dout);

parameter ADDRWIDTH = 32;
parameter DATAWIDTH = 64;


input [ADDRWIDTH-1:0] sel;
input [DATAWIDTH-1:0] din;
input value;
output [DATAWIDTH-1:0] dout;

reg [DATAWIDTH-1:0] out_tmp;



always @ (*) begin
    out_tmp = din;
    out_tmp[sel] = |value;
end




assign dout = out_tmp;




endmodule
