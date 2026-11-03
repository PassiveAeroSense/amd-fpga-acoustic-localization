                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="sqrt_hls_sqrt_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=9.878000,HLS_SYN_LAT=35,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=172,HLS_SYN_LUT=590,HLS_VERSION=2024_2}" *)

module sqrt_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        value_r,
        result
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] value_r;
output  [95:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [63:0] value_r_read_reg_71;
wire    grp_isqrt_fu_41_ap_start;
wire    grp_isqrt_fu_41_ap_done;
wire    grp_isqrt_fu_41_ap_idle;
wire    grp_isqrt_fu_41_ap_ready;
wire   [31:0] grp_isqrt_fu_41_ap_return;
reg    grp_isqrt_fu_41_ap_start_reg;
wire    ap_CS_fsm_state2;
wire   [31:0] mul_ln75_fu_47_p0;
wire   [63:0] zext_ln75_fu_51_p1;
wire   [31:0] mul_ln75_fu_47_p1;
wire   [63:0] mul_ln75_fu_47_p2;
wire   [63:0] sub_ln75_fu_57_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 2'd1;
#0 grp_isqrt_fu_41_ap_start_reg = 1'b0;
end

sqrt_hls_isqrt grp_isqrt_fu_41(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_isqrt_fu_41_ap_start),
    .ap_done(grp_isqrt_fu_41_ap_done),
    .ap_idle(grp_isqrt_fu_41_ap_idle),
    .ap_ready(grp_isqrt_fu_41_ap_ready),
    .x(value_r_read_reg_71),
    .ap_return(grp_isqrt_fu_41_ap_return)
);

sqrt_hls_mul_32ns_32ns_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32ns_32ns_64_1_1_U2(
    .din0(mul_ln75_fu_47_p0),
    .din1(mul_ln75_fu_47_p1),
    .dout(mul_ln75_fu_47_p2)
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
        grp_isqrt_fu_41_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_isqrt_fu_41_ap_start_reg <= 1'b1;
        end else if ((grp_isqrt_fu_41_ap_ready == 1'b1)) begin
            grp_isqrt_fu_41_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        value_r_read_reg_71 <= value_r;
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
    if ((grp_isqrt_fu_41_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_isqrt_fu_41_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((grp_isqrt_fu_41_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_isqrt_fu_41_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_isqrt_fu_41_ap_start = grp_isqrt_fu_41_ap_start_reg;

assign mul_ln75_fu_47_p0 = zext_ln75_fu_51_p1;

assign mul_ln75_fu_47_p1 = zext_ln75_fu_51_p1;

assign result = {{sub_ln75_fu_57_p2}, {grp_isqrt_fu_41_ap_return}};

assign sub_ln75_fu_57_p2 = (value_r_read_reg_71 - mul_ln75_fu_47_p2);

assign zext_ln75_fu_51_p1 = grp_isqrt_fu_41_ap_return;

endmodule           
