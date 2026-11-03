                                                                 
                                 
                                                        
                                                                        
                                                                 
`timescale 1ns / 1ps

module joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1 (sel,din,dout);

parameter ADDRWIDTH = 32;
parameter DATAWIDTH = 12;


input [ADDRWIDTH-1:0] sel;
input [DATAWIDTH-1:0] din;
output dout;

reg out_tmp;



always @ (*) begin
(* parallel_case *) case (sel)

0: out_tmp = din[0];

1: out_tmp = din[1];

2: out_tmp = din[2];

3: out_tmp = din[3];

4: out_tmp = din[4];

5: out_tmp = din[5];

6: out_tmp = din[6];

7: out_tmp = din[7];

8: out_tmp = din[8];

9: out_tmp = din[9];

10: out_tmp = din[10];

11: out_tmp = din[11];

default: out_tmp = 'bx;
endcase
end




assign dout = out_tmp;




endmodule
