                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="divide_hls_divide_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=13.448000,HLS_SYN_LAT=35,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=399,HLS_SYN_LUT=636,HLS_VERSION=2024_2}" *)

module divide_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        num,
        den,
        result
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] num;
input  [63:0] den;
output  [128:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg  signed [63:0] den_read_reg_98;
reg   [63:0] num_read_reg_104;
wire   [0:0] icmp_ln81_fu_77_p2;
reg   [0:0] icmp_ln81_reg_110;
wire   [63:0] grp_udiv_fu_64_ap_return;
wire    ap_CS_fsm_state2;
wire    grp_udiv_fu_64_ap_start;
wire    grp_udiv_fu_64_ap_done;
wire    grp_udiv_fu_64_ap_idle;
wire    grp_udiv_fu_64_ap_ready;
reg  signed [63:0] q_0_reg_53;
reg    grp_udiv_fu_64_ap_start_reg;
wire    ap_CS_fsm_state3;
wire  signed [63:0] icmp_ln81_fu_77_p0;
wire   [63:0] mul_ln81_fu_72_p2;
wire   [63:0] sub_ln81_fu_83_p2;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_udiv_fu_64_ap_start_reg = 1'b0;
end

divide_hls_udiv grp_udiv_fu_64(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_udiv_fu_64_ap_start),
    .ap_done(grp_udiv_fu_64_ap_done),
    .ap_idle(grp_udiv_fu_64_ap_idle),
    .ap_ready(grp_udiv_fu_64_ap_ready),
    .n(num_read_reg_104),
    .d(den_read_reg_98),
    .ap_return(grp_udiv_fu_64_ap_return)
);

divide_hls_mul_64s_64s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
mul_64s_64s_64_1_1_U7(
    .din0(q_0_reg_53),
    .din1(den_read_reg_98),
    .dout(mul_ln81_fu_72_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_udiv_fu_64_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln81_fu_77_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_udiv_fu_64_ap_start_reg <= 1'b1;
        end else if ((grp_udiv_fu_64_ap_ready == 1'b1)) begin
            grp_udiv_fu_64_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln81_fu_77_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        q_0_reg_53 <= 64'd18446744073709551615;
    end else if (((grp_udiv_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        q_0_reg_53 <= grp_udiv_fu_64_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        den_read_reg_98 <= den;
        icmp_ln81_reg_110 <= icmp_ln81_fu_77_p2;
        num_read_reg_104 <= num;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_udiv_fu_64_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((icmp_ln81_fu_77_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if (((icmp_ln81_fu_77_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_udiv_fu_64_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_udiv_fu_64_ap_start = grp_udiv_fu_64_ap_start_reg;

assign icmp_ln81_fu_77_p0 = den;

assign icmp_ln81_fu_77_p2 = ((icmp_ln81_fu_77_p0 == 64'd0) ? 1'b1 : 1'b0);

assign result = {{{icmp_ln81_reg_110}, {sub_ln81_fu_83_p2}}, {q_0_reg_53}};

assign sub_ln81_fu_83_p2 = (num_read_reg_104 - mul_ln81_fu_72_p2);

endmodule             
