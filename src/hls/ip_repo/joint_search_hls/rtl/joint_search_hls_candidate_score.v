                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_candidate_score (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        cx,
        cy,
        cz,
        obs_address0,
        obs_ce0,
        obs_q0,
        count,
        baseline_two,
        ap_return_0,
        ap_return_1,
        ap_return_2
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] cx;
input  [31:0] cy;
input  [31:0] cz;
output  [10:0] obs_address0;
output   obs_ce0;
input  [77:0] obs_q0;
input  [30:0] count;
input  [0:0] baseline_two;
output  [63:0] ap_return_0;
output  [63:0] ap_return_1;
output  [63:0] ap_return_2;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] r18_MIC_address0;
wire   [26:0] r18_MIC_q0;
wire   [0:0] baseline_two_read_read_fu_312_p2;
wire   [31:0] grp_fu_413_p2;
reg   [31:0] mul21_reg_1257;
wire   [4:0] add_ln14_fu_448_p2;
reg   [4:0] add_ln14_reg_1268;
wire    ap_CS_fsm_state2;
wire   [3:0] trunc_ln14_fu_533_p1;
reg   [3:0] trunc_ln14_reg_1372;
wire    ap_CS_fsm_state3;
wire  signed [31:0] dx_fu_593_p2;
reg  signed [31:0] dx_reg_1376;
wire  signed [31:0] dy_fu_603_p2;
reg  signed [31:0] dy_reg_1382;
wire   [63:0] shl_ln_fu_619_p3;
reg   [63:0] shl_ln_reg_1388;
wire    ap_CS_fsm_state4;
reg   [57:0] r_reg_1474;
wire    ap_CS_fsm_state9;
reg   [57:0] v_reg_1479;
wire   [63:0] add_ln42_fu_948_p2;
reg   [63:0] add_ln42_reg_1484;
wire    ap_CS_fsm_state10;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_idle;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready;
wire   [10:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out_ap_vld;
wire   [63:0] grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out;
wire    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out_ap_vld;
wire    grp_isqrt_fu_408_ap_start;
wire    grp_isqrt_fu_408_ap_done;
wire    grp_isqrt_fu_408_ap_idle;
wire    grp_isqrt_fu_408_ap_ready;
reg   [63:0] grp_isqrt_fu_408_x;
wire   [31:0] grp_isqrt_fu_408_ap_return;
reg    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg;
wire   [0:0] icmp_ln14_fu_442_p2;
wire    ap_CS_fsm_state7;
reg    grp_isqrt_fu_408_ap_start_reg;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state11;
wire   [63:0] zext_ln14_fu_454_p1;
reg   [4:0] i_fu_132;
wire    ap_CS_fsm_state6;
reg   [31:0] distance_fu_136;
reg   [31:0] distance_1_fu_140;
reg   [31:0] distance_2_fu_144;
reg   [31:0] distance_3_fu_148;
reg   [31:0] distance_4_fu_152;
reg   [31:0] distance_5_fu_156;
reg   [31:0] distance_6_fu_160;
reg   [31:0] distance_7_fu_164;
reg   [31:0] distance_8_fu_168;
reg   [31:0] distance_9_fu_172;
reg   [31:0] distance_10_fu_176;
reg   [31:0] distance_11_fu_180;
reg   [31:0] distance_12_fu_184;
reg   [31:0] distance_13_fu_188;
reg   [31:0] distance_14_fu_192;
reg   [31:0] distance_15_fu_196;
reg   [41:0] cross_fu_304;
wire   [41:0] cross_1_fu_967_p2;
wire   [0:0] icmp_ln42_fu_793_p2;
reg   [3:0] i_4_fu_308;
wire   [3:0] add_ln42_1_fu_799_p2;
reg    r18_MIC_ce0_local;
reg  signed [31:0] grp_fu_413_p0;
reg  signed [31:0] grp_fu_413_p1;
wire  signed [57:0] mul_ln42_fu_423_p0;
wire  signed [63:0] sext_ln42_fu_938_p1;
wire  signed [57:0] mul_ln42_fu_423_p1;
wire  signed [57:0] mul_ln42_1_fu_427_p0;
wire  signed [63:0] sext_ln42_1_fu_943_p1;
wire  signed [57:0] mul_ln42_1_fu_427_p1;
wire   [10:0] tmp_fu_536_p4;
wire  signed [31:0] sext_ln16_fu_550_p1;
wire   [1:0] tmp_51_fu_559_p4;
wire   [0:0] icmp_ln16_fu_568_p2;
wire   [9:0] select_ln16_fu_574_p3;
wire   [9:0] select_ln16_1_fu_582_p3;
wire   [31:0] sub_ln16_fu_554_p2;
wire  signed [31:0] sext_ln16_1_fu_589_p1;
wire   [15:0] trunc_ln15_fu_546_p1;
wire  signed [31:0] sext_ln16_2_fu_599_p1;
wire   [31:0] mul_ln17_1_fu_419_p2;
wire   [31:0] add_ln17_fu_608_p2;
wire   [31:0] add_ln17_1_fu_613_p2;
wire   [63:0] tmp_7_fu_805_p25;
wire   [63:0] tmp_7_fu_805_p27;
wire   [63:0] tmp_8_fu_859_p25;
wire   [63:0] tmp_8_fu_859_p27;
wire   [63:0] zext_ln42_fu_918_p1;
wire   [63:0] mul_ln42_1_fu_427_p2;
wire   [63:0] mul_ln42_fu_423_p2;
wire   [37:0] shl_ln1_fu_955_p3;
wire   [41:0] zext_ln42_1_fu_963_p1;
reg   [10:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
wire   [3:0] tmp_7_fu_805_p1;
wire   [3:0] tmp_7_fu_805_p3;
wire   [3:0] tmp_7_fu_805_p5;
wire   [3:0] tmp_7_fu_805_p7;
wire   [3:0] tmp_7_fu_805_p9;
wire   [3:0] tmp_7_fu_805_p11;
wire   [3:0] tmp_7_fu_805_p13;
wire   [3:0] tmp_7_fu_805_p15;
wire  signed [3:0] tmp_7_fu_805_p17;
wire  signed [3:0] tmp_7_fu_805_p19;
wire  signed [3:0] tmp_7_fu_805_p21;
wire  signed [3:0] tmp_7_fu_805_p23;
wire   [3:0] tmp_8_fu_859_p1;
wire   [3:0] tmp_8_fu_859_p3;
wire   [3:0] tmp_8_fu_859_p5;
wire   [3:0] tmp_8_fu_859_p7;
wire   [3:0] tmp_8_fu_859_p9;
wire   [3:0] tmp_8_fu_859_p11;
wire   [3:0] tmp_8_fu_859_p13;
wire   [3:0] tmp_8_fu_859_p15;
wire  signed [3:0] tmp_8_fu_859_p17;
wire  signed [3:0] tmp_8_fu_859_p19;
wire  signed [3:0] tmp_8_fu_859_p21;
wire  signed [3:0] tmp_8_fu_859_p23;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 11'd1;
#0 grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg = 1'b0;
#0 grp_isqrt_fu_408_ap_start_reg = 1'b0;
#0 i_fu_132 = 5'd0;
#0 distance_fu_136 = 32'd0;
#0 distance_1_fu_140 = 32'd0;
#0 distance_2_fu_144 = 32'd0;
#0 distance_3_fu_148 = 32'd0;
#0 distance_4_fu_152 = 32'd0;
#0 distance_5_fu_156 = 32'd0;
#0 distance_6_fu_160 = 32'd0;
#0 distance_7_fu_164 = 32'd0;
#0 distance_8_fu_168 = 32'd0;
#0 distance_9_fu_172 = 32'd0;
#0 distance_10_fu_176 = 32'd0;
#0 distance_11_fu_180 = 32'd0;
#0 distance_12_fu_184 = 32'd0;
#0 distance_13_fu_188 = 32'd0;
#0 distance_14_fu_192 = 32'd0;
#0 distance_15_fu_196 = 32'd0;
#0 cross_fu_304 = 42'd0;
#0 i_4_fu_308 = 4'd0;
end

joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R #(
    .DataWidth( 27 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
r18_MIC_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_MIC_address0),
    .ce0(r18_MIC_ce0_local),
    .q0(r18_MIC_q0)
);

joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3 grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start),
    .ap_done(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done),
    .ap_idle(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_idle),
    .ap_ready(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready),
    .count(count),
    .obs_address0(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0),
    .obs_ce0(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0),
    .obs_q0(obs_q0),
    .distance(distance_fu_136),
    .distance_1(distance_1_fu_140),
    .distance_2(distance_2_fu_144),
    .distance_3(distance_3_fu_148),
    .distance_4(distance_4_fu_152),
    .distance_5(distance_5_fu_156),
    .distance_6(distance_6_fu_160),
    .distance_7(distance_7_fu_164),
    .distance_8(distance_8_fu_168),
    .distance_9(distance_9_fu_172),
    .distance_10(distance_10_fu_176),
    .distance_11(distance_11_fu_180),
    .distance_12(distance_12_fu_184),
    .distance_13(distance_13_fu_188),
    .distance_14(distance_14_fu_192),
    .distance_15(distance_15_fu_196),
    .imag_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out),
    .imag_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out_ap_vld),
    .imag_1_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out),
    .imag_1_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out_ap_vld),
    .imag_2_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out),
    .imag_2_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out_ap_vld),
    .imag_3_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out),
    .imag_3_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out_ap_vld),
    .imag_4_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out),
    .imag_4_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out_ap_vld),
    .imag_5_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out),
    .imag_5_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out_ap_vld),
    .imag_6_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out),
    .imag_6_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out_ap_vld),
    .imag_7_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out),
    .imag_7_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out_ap_vld),
    .imag_8_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out),
    .imag_8_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out_ap_vld),
    .imag_9_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out),
    .imag_9_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out_ap_vld),
    .imag_10_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out),
    .imag_10_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out_ap_vld),
    .imag_11_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out),
    .imag_11_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out_ap_vld),
    .real_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out),
    .real_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out_ap_vld),
    .real_1_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out),
    .real_1_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out_ap_vld),
    .real_2_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out),
    .real_2_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out_ap_vld),
    .real_3_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out),
    .real_3_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out_ap_vld),
    .real_4_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out),
    .real_4_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out_ap_vld),
    .real_5_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out),
    .real_5_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out_ap_vld),
    .real_6_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out),
    .real_6_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out_ap_vld),
    .real_7_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out),
    .real_7_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out_ap_vld),
    .real_8_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out),
    .real_8_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out_ap_vld),
    .real_9_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out),
    .real_9_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out_ap_vld),
    .real_10_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out),
    .real_10_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out_ap_vld),
    .real_11_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out),
    .real_11_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out_ap_vld),
    .sum1_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out),
    .sum1_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out_ap_vld),
    .sum0_out(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out),
    .sum0_out_ap_vld(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out_ap_vld)
);

joint_search_hls_isqrt grp_isqrt_fu_408(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_isqrt_fu_408_ap_start),
    .ap_done(grp_isqrt_fu_408_ap_done),
    .ap_idle(grp_isqrt_fu_408_ap_idle),
    .ap_ready(grp_isqrt_fu_408_ap_ready),
    .x(grp_isqrt_fu_408_x),
    .ap_return(grp_isqrt_fu_408_ap_return)
);

joint_search_hls_mul_32s_32s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mul_32s_32s_32_1_1_U105(
    .din0(grp_fu_413_p0),
    .din1(grp_fu_413_p1),
    .dout(grp_fu_413_p2)
);

joint_search_hls_mul_32s_32s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mul_32s_32s_32_1_1_U106(
    .din0(dx_reg_1376),
    .din1(dx_reg_1376),
    .dout(mul_ln17_1_fu_419_p2)
);

joint_search_hls_mul_58s_58s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 58 ),
    .din1_WIDTH( 58 ),
    .dout_WIDTH( 64 ))
mul_58s_58s_64_1_1_U107(
    .din0(mul_ln42_fu_423_p0),
    .din1(mul_ln42_fu_423_p1),
    .dout(mul_ln42_fu_423_p2)
);

joint_search_hls_mul_58s_58s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 58 ),
    .din1_WIDTH( 58 ),
    .dout_WIDTH( 64 ))
mul_58s_58s_64_1_1_U108(
    .din0(mul_ln42_1_fu_427_p0),
    .din1(mul_ln42_1_fu_427_p1),
    .dout(mul_ln42_1_fu_427_p2)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_25_4_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 64 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 64 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 64 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 64 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 64 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 64 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 64 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 64 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 64 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 64 ),
    .CASE10( 4'hA ),
    .din10_WIDTH( 64 ),
    .CASE11( 4'hB ),
    .din11_WIDTH( 64 ),
    .def_WIDTH( 64 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 64 ))
sparsemux_25_4_64_1_1_U109(
    .din0(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out),
    .din1(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out),
    .din2(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out),
    .din3(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out),
    .din4(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out),
    .din5(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out),
    .din6(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out),
    .din7(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out),
    .din8(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out),
    .din9(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out),
    .din10(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out),
    .din11(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out),
    .def(tmp_7_fu_805_p25),
    .sel(i_4_fu_308),
    .dout(tmp_7_fu_805_p27)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_25_4_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 64 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 64 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 64 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 64 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 64 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 64 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 64 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 64 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 64 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 64 ),
    .CASE10( 4'hA ),
    .din10_WIDTH( 64 ),
    .CASE11( 4'hB ),
    .din11_WIDTH( 64 ),
    .def_WIDTH( 64 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 64 ))
sparsemux_25_4_64_1_1_U110(
    .din0(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out),
    .din1(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out),
    .din2(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out),
    .din3(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out),
    .din4(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out),
    .din5(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out),
    .din6(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out),
    .din7(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out),
    .din8(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out),
    .din9(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out),
    .din10(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out),
    .din11(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out),
    .def(tmp_8_fu_859_p25),
    .sel(i_4_fu_308),
    .dout(tmp_8_fu_859_p27)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln14_fu_442_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= 1'b1;
        end else if ((grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready == 1'b1)) begin
            grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_isqrt_fu_408_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state4))) begin
            grp_isqrt_fu_408_ap_start_reg <= 1'b1;
        end else if ((grp_isqrt_fu_408_ap_ready == 1'b1)) begin
            grp_isqrt_fu_408_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln14_fu_442_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        cross_fu_304 <= 42'd0;
    end else if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        cross_fu_304 <= cross_1_fu_967_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln14_fu_442_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_4_fu_308 <= 4'd0;
    end else if (((icmp_ln42_fu_793_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
        i_4_fu_308 <= add_ln42_1_fu_799_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_132 <= 5'd0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        i_fu_132 <= add_ln14_reg_1268;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln14_reg_1268 <= add_ln14_fu_448_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        add_ln42_reg_1484 <= add_ln42_fu_948_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd10))) begin
        distance_10_fu_176 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd11))) begin
        distance_11_fu_180 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd12))) begin
        distance_12_fu_184 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd13))) begin
        distance_13_fu_188 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd14))) begin
        distance_14_fu_192 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd15))) begin
        distance_15_fu_196 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd1))) begin
        distance_1_fu_140 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd2))) begin
        distance_2_fu_144 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd3))) begin
        distance_3_fu_148 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd4))) begin
        distance_4_fu_152 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd5))) begin
        distance_5_fu_156 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd6))) begin
        distance_6_fu_160 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd7))) begin
        distance_7_fu_164 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd8))) begin
        distance_8_fu_168 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd9))) begin
        distance_9_fu_172 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (trunc_ln14_reg_1372 == 4'd0))) begin
        distance_fu_136 <= grp_isqrt_fu_408_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        dx_reg_1376 <= dx_fu_593_p2;
        dy_reg_1382 <= dy_fu_603_p2;
        trunc_ln14_reg_1372 <= trunc_ln14_fu_533_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        mul21_reg_1257 <= grp_fu_413_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        r_reg_1474 <= {{tmp_7_fu_805_p27[63:6]}};
        v_reg_1479 <= {{tmp_8_fu_859_p27[63:6]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        shl_ln_reg_1388[63 : 32] <= shl_ln_fu_619_p3[63 : 32];
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

always @ (*) begin
    if ((grp_isqrt_fu_408_ap_done == 1'b0)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
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

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_isqrt_fu_408_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((((icmp_ln42_fu_793_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
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
    if (((icmp_ln42_fu_793_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_413_p0 = dy_reg_1382;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_413_p0 = cz;
    end else begin
        grp_fu_413_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_413_p1 = dy_reg_1382;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_413_p1 = cz;
    end else begin
        grp_fu_413_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_isqrt_fu_408_x = add_ln42_reg_1484;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_isqrt_fu_408_x = shl_ln_reg_1388;
    end else begin
        grp_isqrt_fu_408_x = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        r18_MIC_ce0_local = 1'b1;
    end else begin
        r18_MIC_ce0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln14_fu_442_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((icmp_ln42_fu_793_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            if (((grp_isqrt_fu_408_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln14_fu_448_p2 = (i_fu_132 + 5'd1);

assign add_ln17_1_fu_613_p2 = (add_ln17_fu_608_p2 + grp_fu_413_p2);

assign add_ln17_fu_608_p2 = (mul21_reg_1257 + mul_ln17_1_fu_419_p2);

assign add_ln42_1_fu_799_p2 = (i_4_fu_308 + 4'd1);

assign add_ln42_fu_948_p2 = (mul_ln42_1_fu_427_p2 + mul_ln42_fu_423_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_return_0 = grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out;

assign ap_return_1 = grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out;

assign ap_return_2 = zext_ln42_fu_918_p1;

assign baseline_two_read_read_fu_312_p2 = baseline_two;

assign cross_1_fu_967_p2 = (zext_ln42_1_fu_963_p1 + cross_fu_304);

assign dx_fu_593_p2 = ($signed(sub_ln16_fu_554_p2) - $signed(sext_ln16_1_fu_589_p1));

assign dy_fu_603_p2 = ($signed(cy) - $signed(sext_ln16_2_fu_599_p1));

assign grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start = grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg;

assign grp_isqrt_fu_408_ap_start = grp_isqrt_fu_408_ap_start_reg;

assign icmp_ln14_fu_442_p2 = ((i_fu_132 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln16_fu_568_p2 = ((tmp_51_fu_559_p4 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln42_fu_793_p2 = ((i_4_fu_308 == 4'd12) ? 1'b1 : 1'b0);

assign mul_ln42_1_fu_427_p0 = sext_ln42_1_fu_943_p1;

assign mul_ln42_1_fu_427_p1 = sext_ln42_1_fu_943_p1;

assign mul_ln42_fu_423_p0 = sext_ln42_fu_938_p1;

assign mul_ln42_fu_423_p1 = sext_ln42_fu_938_p1;

assign obs_address0 = grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0;

assign obs_ce0 = grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0;

assign r18_MIC_address0 = zext_ln14_fu_454_p1;

assign select_ln16_1_fu_582_p3 = ((baseline_two[0:0] == 1'b1) ? select_ln16_fu_574_p3 : 10'd0);

assign select_ln16_fu_574_p3 = ((icmp_ln16_fu_568_p2[0:0] == 1'b1) ? 10'd524 : 10'd500);

assign sext_ln16_1_fu_589_p1 = $signed(select_ln16_1_fu_582_p3);

assign sext_ln16_2_fu_599_p1 = $signed(trunc_ln15_fu_546_p1);

assign sext_ln16_fu_550_p1 = $signed(tmp_fu_536_p4);

assign sext_ln42_1_fu_943_p1 = $signed(v_reg_1479);

assign sext_ln42_fu_938_p1 = $signed(r_reg_1474);

assign shl_ln1_fu_955_p3 = {{grp_isqrt_fu_408_ap_return}, {6'd0}};

assign shl_ln_fu_619_p3 = {{add_ln17_1_fu_613_p2}, {32'd0}};

assign sub_ln16_fu_554_p2 = ($signed(cx) - $signed(sext_ln16_fu_550_p1));

assign tmp_51_fu_559_p4 = {{i_fu_132[4:3]}};

assign tmp_7_fu_805_p25 = 'bx;

assign tmp_8_fu_859_p25 = 'bx;

assign tmp_fu_536_p4 = {{r18_MIC_q0[26:16]}};

assign trunc_ln14_fu_533_p1 = i_fu_132[3:0];

assign trunc_ln15_fu_546_p1 = r18_MIC_q0[15:0];

assign zext_ln14_fu_454_p1 = i_fu_132;

assign zext_ln42_1_fu_963_p1 = shl_ln1_fu_955_p3;

assign zext_ln42_fu_918_p1 = cross_fu_304;

always @ (posedge ap_clk) begin
    shl_ln_reg_1388[31:0] <= 32'b00000000000000000000000000000000;
end

endmodule                                   
