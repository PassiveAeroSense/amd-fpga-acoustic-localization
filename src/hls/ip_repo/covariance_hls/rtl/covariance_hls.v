                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="covariance_hls_covariance_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=12.525344,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=131,HLS_SYN_LUT=1423,HLS_VERSION=2024_2}" *)

module covariance_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ar,
        ai,
        br,
        bi,
        oldr,
        oldi,
        shift_old,
        next_exp,
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
input  [31:0] ar;
input  [31:0] ai;
input  [31:0] br;
input  [31:0] bi;
input  [31:0] oldr;
input  [31:0] oldi;
input  [5:0] shift_old;
input  [5:0] next_exp;
output  [64:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [64:0] rr_fu_173_p2;
reg   [64:0] rr_reg_374;
wire   [63:0] ri_fu_179_p2;
reg   [63:0] ri_reg_379;
wire    ap_CS_fsm_state2;
wire  signed [31:0] p0_fu_125_p0;
wire  signed [63:0] sext_ln107_1_fu_147_p1;
wire  signed [31:0] p0_fu_125_p1;
wire  signed [63:0] sext_ln107_fu_141_p1;
wire  signed [31:0] p1_fu_129_p0;
wire  signed [63:0] sext_ln107_3_fu_159_p1;
wire  signed [31:0] p1_fu_129_p1;
wire  signed [63:0] sext_ln107_2_fu_153_p1;
wire  signed [31:0] p2_fu_133_p0;
wire  signed [31:0] p2_fu_133_p1;
wire  signed [31:0] p3_fu_137_p0;
wire  signed [31:0] p3_fu_137_p1;
wire   [63:0] p0_fu_125_p2;
wire   [63:0] p1_fu_129_p2;
wire  signed [64:0] sext_ln108_1_fu_169_p1;
wire  signed [64:0] sext_ln108_fu_165_p1;
wire   [63:0] p2_fu_133_p2;
wire   [63:0] p3_fu_137_p2;
wire   [31:0] zext_ln109_fu_185_p1;
wire   [31:0] ashr_ln109_fu_189_p2;
wire   [64:0] zext_ln109_1_fu_199_p1;
wire   [64:0] ashr_ln109_1_fu_207_p2;
wire  signed [64:0] sext_ln109_fu_195_p1;
wire   [31:0] ashr_ln109_2_fu_218_p2;
wire   [63:0] zext_ln109_2_fu_203_p1;
wire   [63:0] ashr_ln109_3_fu_228_p2;
wire  signed [63:0] sext_ln109_1_fu_224_p1;
wire   [64:0] nr_fu_212_p2;
wire   [33:0] tmp_1_fu_239_p4;
wire   [0:0] icmp_ln41_fu_249_p2;
wire   [0:0] icmp_ln41_1_fu_255_p2;
wire   [0:0] or_ln41_fu_273_p2;
wire   [31:0] select_ln41_fu_265_p3;
wire   [31:0] trunc_ln41_fu_261_p1;
wire   [63:0] ni_fu_233_p2;
wire   [32:0] tmp_2_fu_287_p4;
wire   [0:0] icmp_ln41_2_fu_297_p2;
wire   [0:0] icmp_ln41_3_fu_303_p2;
wire   [0:0] or_ln41_1_fu_321_p2;
wire   [31:0] select_ln41_2_fu_313_p3;
wire   [31:0] trunc_ln41_1_fu_309_p1;
wire   [64:0] add_ln110_fu_335_p2;
wire   [32:0] tmp_3_fu_341_p4;
wire   [0:0] icmp_ln110_fu_351_p2;
wire   [0:0] or_ln110_fu_357_p2;
wire   [31:0] select_ln41_3_fu_327_p3;
wire   [31:0] select_ln41_1_fu_279_p3;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 2'd1;
end

covariance_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U1(
    .din0(p0_fu_125_p0),
    .din1(p0_fu_125_p1),
    .dout(p0_fu_125_p2)
);

covariance_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U2(
    .din0(p1_fu_129_p0),
    .din1(p1_fu_129_p1),
    .dout(p1_fu_129_p2)
);

covariance_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U3(
    .din0(p2_fu_133_p0),
    .din1(p2_fu_133_p1),
    .dout(p2_fu_133_p2)
);

covariance_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U4(
    .din0(p3_fu_137_p0),
    .din1(p3_fu_137_p1),
    .dout(p3_fu_137_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        ri_reg_379 <= ri_fu_179_p2;
        rr_reg_374 <= rr_fu_173_p2;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln110_fu_335_p2 = (nr_fu_212_p2 + 65'd2147483648);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ashr_ln109_1_fu_207_p2 = $signed(rr_reg_374) >>> zext_ln109_1_fu_199_p1;

assign ashr_ln109_2_fu_218_p2 = $signed(oldi) >>> zext_ln109_fu_185_p1;

assign ashr_ln109_3_fu_228_p2 = $signed(ri_reg_379) >>> zext_ln109_2_fu_203_p1;

assign ashr_ln109_fu_189_p2 = $signed(oldr) >>> zext_ln109_fu_185_p1;

assign icmp_ln110_fu_351_p2 = ((tmp_3_fu_341_p4 != 33'd0) ? 1'b1 : 1'b0);

assign icmp_ln41_1_fu_255_p2 = (($signed(nr_fu_212_p2) < $signed(65'd36893488145271619584)) ? 1'b1 : 1'b0);

assign icmp_ln41_2_fu_297_p2 = (($signed(tmp_2_fu_287_p4) > $signed(33'd0)) ? 1'b1 : 1'b0);

assign icmp_ln41_3_fu_303_p2 = (($signed(ni_fu_233_p2) < $signed(64'd18446744071562067968)) ? 1'b1 : 1'b0);

assign icmp_ln41_fu_249_p2 = (($signed(tmp_1_fu_239_p4) > $signed(34'd0)) ? 1'b1 : 1'b0);

assign ni_fu_233_p2 = ($signed(ashr_ln109_3_fu_228_p2) + $signed(sext_ln109_1_fu_224_p1));

assign nr_fu_212_p2 = ($signed(ashr_ln109_1_fu_207_p2) + $signed(sext_ln109_fu_195_p1));

assign or_ln110_fu_357_p2 = (or_ln41_1_fu_321_p2 | icmp_ln110_fu_351_p2);

assign or_ln41_1_fu_321_p2 = (icmp_ln41_3_fu_303_p2 | icmp_ln41_2_fu_297_p2);

assign or_ln41_fu_273_p2 = (icmp_ln41_fu_249_p2 | icmp_ln41_1_fu_255_p2);

assign p0_fu_125_p0 = sext_ln107_1_fu_147_p1;

assign p0_fu_125_p1 = sext_ln107_fu_141_p1;

assign p1_fu_129_p0 = sext_ln107_3_fu_159_p1;

assign p1_fu_129_p1 = sext_ln107_2_fu_153_p1;

assign p2_fu_133_p0 = sext_ln107_1_fu_147_p1;

assign p2_fu_133_p1 = sext_ln107_2_fu_153_p1;

assign p3_fu_137_p0 = sext_ln107_3_fu_159_p1;

assign p3_fu_137_p1 = sext_ln107_fu_141_p1;

assign result = {{{or_ln110_fu_357_p2}, {select_ln41_3_fu_327_p3}}, {select_ln41_1_fu_279_p3}};

assign ri_fu_179_p2 = (p2_fu_133_p2 - p3_fu_137_p2);

assign rr_fu_173_p2 = ($signed(sext_ln108_1_fu_169_p1) + $signed(sext_ln108_fu_165_p1));

assign select_ln41_1_fu_279_p3 = ((or_ln41_fu_273_p2[0:0] == 1'b1) ? select_ln41_fu_265_p3 : trunc_ln41_fu_261_p1);

assign select_ln41_2_fu_313_p3 = ((icmp_ln41_2_fu_297_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign select_ln41_3_fu_327_p3 = ((or_ln41_1_fu_321_p2[0:0] == 1'b1) ? select_ln41_2_fu_313_p3 : trunc_ln41_1_fu_309_p1);

assign select_ln41_fu_265_p3 = ((icmp_ln41_fu_249_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign sext_ln107_1_fu_147_p1 = $signed(br);

assign sext_ln107_2_fu_153_p1 = $signed(ai);

assign sext_ln107_3_fu_159_p1 = $signed(bi);

assign sext_ln107_fu_141_p1 = $signed(ar);

assign sext_ln108_1_fu_169_p1 = $signed(p1_fu_129_p2);

assign sext_ln108_fu_165_p1 = $signed(p0_fu_125_p2);

assign sext_ln109_1_fu_224_p1 = $signed(ashr_ln109_2_fu_218_p2);

assign sext_ln109_fu_195_p1 = $signed(ashr_ln109_fu_189_p2);

assign tmp_1_fu_239_p4 = {{nr_fu_212_p2[64:31]}};

assign tmp_2_fu_287_p4 = {{ni_fu_233_p2[63:31]}};

assign tmp_3_fu_341_p4 = {{add_ln110_fu_335_p2[64:32]}};

assign trunc_ln41_1_fu_309_p1 = ni_fu_233_p2[31:0];

assign trunc_ln41_fu_261_p1 = nr_fu_212_p2[31:0];

assign zext_ln109_1_fu_199_p1 = next_exp;

assign zext_ln109_2_fu_203_p1 = next_exp;

assign zext_ln109_fu_185_p1 = shift_old;

endmodule                 
