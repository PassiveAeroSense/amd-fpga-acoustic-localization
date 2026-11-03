                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        count,
        obs_address0,
        obs_ce0,
        obs_q0,
        distance,
        distance_1,
        distance_2,
        distance_3,
        distance_4,
        distance_5,
        distance_6,
        distance_7,
        distance_8,
        distance_9,
        distance_10,
        distance_11,
        distance_12,
        distance_13,
        distance_14,
        distance_15,
        imag_out,
        imag_out_ap_vld,
        imag_1_out,
        imag_1_out_ap_vld,
        imag_2_out,
        imag_2_out_ap_vld,
        imag_3_out,
        imag_3_out_ap_vld,
        imag_4_out,
        imag_4_out_ap_vld,
        imag_5_out,
        imag_5_out_ap_vld,
        imag_6_out,
        imag_6_out_ap_vld,
        imag_7_out,
        imag_7_out_ap_vld,
        imag_8_out,
        imag_8_out_ap_vld,
        imag_9_out,
        imag_9_out_ap_vld,
        imag_10_out,
        imag_10_out_ap_vld,
        imag_11_out,
        imag_11_out_ap_vld,
        real_out,
        real_out_ap_vld,
        real_1_out,
        real_1_out_ap_vld,
        real_2_out,
        real_2_out_ap_vld,
        real_3_out,
        real_3_out_ap_vld,
        real_4_out,
        real_4_out_ap_vld,
        real_5_out,
        real_5_out_ap_vld,
        real_6_out,
        real_6_out_ap_vld,
        real_7_out,
        real_7_out_ap_vld,
        real_8_out,
        real_8_out_ap_vld,
        real_9_out,
        real_9_out_ap_vld,
        real_10_out,
        real_10_out_ap_vld,
        real_11_out,
        real_11_out_ap_vld,
        sum1_out,
        sum1_out_ap_vld,
        sum0_out,
        sum0_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [30:0] count;
output  [10:0] obs_address0;
output   obs_ce0;
input  [77:0] obs_q0;
input  [31:0] distance;
input  [31:0] distance_1;
input  [31:0] distance_2;
input  [31:0] distance_3;
input  [31:0] distance_4;
input  [31:0] distance_5;
input  [31:0] distance_6;
input  [31:0] distance_7;
input  [31:0] distance_8;
input  [31:0] distance_9;
input  [31:0] distance_10;
input  [31:0] distance_11;
input  [31:0] distance_12;
input  [31:0] distance_13;
input  [31:0] distance_14;
input  [31:0] distance_15;
output  [63:0] imag_out;
output   imag_out_ap_vld;
output  [63:0] imag_1_out;
output   imag_1_out_ap_vld;
output  [63:0] imag_2_out;
output   imag_2_out_ap_vld;
output  [63:0] imag_3_out;
output   imag_3_out_ap_vld;
output  [63:0] imag_4_out;
output   imag_4_out_ap_vld;
output  [63:0] imag_5_out;
output   imag_5_out_ap_vld;
output  [63:0] imag_6_out;
output   imag_6_out_ap_vld;
output  [63:0] imag_7_out;
output   imag_7_out_ap_vld;
output  [63:0] imag_8_out;
output   imag_8_out_ap_vld;
output  [63:0] imag_9_out;
output   imag_9_out_ap_vld;
output  [63:0] imag_10_out;
output   imag_10_out_ap_vld;
output  [63:0] imag_11_out;
output   imag_11_out_ap_vld;
output  [63:0] real_out;
output   real_out_ap_vld;
output  [63:0] real_1_out;
output   real_1_out_ap_vld;
output  [63:0] real_2_out;
output   real_2_out_ap_vld;
output  [63:0] real_3_out;
output   real_3_out_ap_vld;
output  [63:0] real_4_out;
output   real_4_out_ap_vld;
output  [63:0] real_5_out;
output   real_5_out_ap_vld;
output  [63:0] real_6_out;
output   real_6_out_ap_vld;
output  [63:0] real_7_out;
output   real_7_out_ap_vld;
output  [63:0] real_8_out;
output   real_8_out_ap_vld;
output  [63:0] real_9_out;
output   real_9_out_ap_vld;
output  [63:0] real_10_out;
output   real_10_out_ap_vld;
output  [63:0] real_11_out;
output   real_11_out_ap_vld;
output  [63:0] sum1_out;
output   sum1_out_ap_vld;
output  [63:0] sum0_out;
output   sum0_out_ap_vld;

reg ap_idle;
reg imag_out_ap_vld;
reg imag_1_out_ap_vld;
reg imag_2_out_ap_vld;
reg imag_3_out_ap_vld;
reg imag_4_out_ap_vld;
reg imag_5_out_ap_vld;
reg imag_6_out_ap_vld;
reg imag_7_out_ap_vld;
reg imag_8_out_ap_vld;
reg imag_9_out_ap_vld;
reg imag_10_out_ap_vld;
reg imag_11_out_ap_vld;
reg real_out_ap_vld;
reg real_1_out_ap_vld;
reg real_2_out_ap_vld;
reg real_3_out_ap_vld;
reg real_4_out_ap_vld;
reg real_5_out_ap_vld;
reg real_6_out_ap_vld;
reg real_7_out_ap_vld;
reg real_8_out_ap_vld;
reg real_9_out_ap_vld;
reg real_10_out_ap_vld;
reg real_11_out_ap_vld;
reg sum1_out_ap_vld;
reg sum0_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln26_fu_852_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [6:0] r18_PAIRS_address0;
wire   [7:0] r18_PAIRS_q0;
wire   [11:0] SEARCH_COS_address0;
wire   [31:0] SEARCH_COS_q0;
wire   [11:0] SEARCH_COS_address1;
wire   [31:0] SEARCH_COS_q1;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln26_reg_2008;
reg   [0:0] icmp_ln26_reg_2008_pp0_iter1_reg;
reg   [0:0] icmp_ln26_reg_2008_pp0_iter2_reg;
reg   [0:0] icmp_ln26_reg_2008_pp0_iter3_reg;
wire   [31:0] o_phase_fu_874_p1;
reg   [31:0] o_phase_reg_2017;
reg   [31:0] o_phase_reg_2017_pp0_iter2_reg;
reg   [1:0] o_group_reg_2022;
reg   [1:0] o_group_reg_2022_pp0_iter2_reg;
reg   [1:0] o_group_reg_2022_pp0_iter3_reg;
reg   [1:0] o_group_reg_2022_pp0_iter4_reg;
reg   [3:0] o_slot_reg_2026;
reg   [3:0] o_slot_reg_2026_pp0_iter2_reg;
reg   [3:0] o_slot_reg_2026_pp0_iter3_reg;
reg   [3:0] o_slot_reg_2026_pp0_iter4_reg;
reg   [31:0] tmp_2_reg_2037;
reg   [31:0] trunc_ln_reg_2042;
wire   [20:0] angle_fu_1100_p4;
reg   [20:0] angle_reg_2047;
reg   [11:0] angle2_reg_2052;
wire   [31:0] re_fu_1200_p2;
reg   [31:0] re_reg_2067;
wire   [31:0] im_fu_1240_p2;
reg   [31:0] im_reg_2072;
wire   [63:0] zext_ln19_fu_864_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln29_fu_908_p1;
wire   [63:0] zext_ln35_fu_1126_p1;
wire   [63:0] zext_ln35_1_fu_1131_p1;
reg   [30:0] i_3_fu_242;
wire   [30:0] add_ln26_fu_858_p2;
wire    ap_loop_init;
reg   [30:0] ap_sig_allocacmp_i;
reg   [63:0] sum0_fu_246;
wire   [63:0] sum0_1_fu_1266_p2;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [63:0] sum1_fu_250;
wire   [63:0] sum1_1_fu_1252_p2;
reg   [63:0] real_11_fu_254;
wire   [63:0] real_12_fu_1368_p2;
reg    ap_predicate_pred484_state6;
reg   [63:0] real_10_fu_258;
reg    ap_predicate_pred496_state6;
reg   [63:0] real_9_fu_262;
reg    ap_predicate_pred508_state6;
reg   [63:0] real_8_fu_266;
reg    ap_predicate_pred520_state6;
reg   [63:0] real_7_fu_270;
reg    ap_predicate_pred532_state6;
reg   [63:0] real_6_fu_274;
reg    ap_predicate_pred544_state6;
reg   [63:0] real_5_fu_278;
reg    ap_predicate_pred556_state6;
reg   [63:0] real_4_fu_282;
reg    ap_predicate_pred568_state6;
reg   [63:0] real_3_fu_286;
reg    ap_predicate_pred580_state6;
reg   [63:0] real_2_fu_290;
reg    ap_predicate_pred592_state6;
reg   [63:0] real_1_fu_294;
reg    ap_predicate_pred604_state6;
reg   [63:0] real_fu_298;
reg    ap_predicate_pred635_state6;
reg   [63:0] imag_11_fu_302;
wire   [63:0] imag_12_fu_1528_p2;
reg   [63:0] imag_10_fu_306;
reg   [63:0] imag_9_fu_310;
reg   [63:0] imag_8_fu_314;
reg   [63:0] imag_7_fu_318;
reg   [63:0] imag_6_fu_322;
reg   [63:0] imag_5_fu_326;
reg   [63:0] imag_4_fu_330;
reg   [63:0] imag_3_fu_334;
reg   [63:0] imag_2_fu_338;
reg   [63:0] imag_1_fu_342;
reg   [63:0] imag_fu_346;
wire    ap_block_pp0_stage0_01001;
reg    obs_ce0_local;
reg    r18_PAIRS_ce0_local;
reg    SEARCH_COS_ce1_local;
reg    SEARCH_COS_ce0_local;
wire   [11:0] mul_ln36_1_fu_685_p0;
wire   [43:0] zext_ln34_4_fu_1141_p1;
wire   [11:0] mul_ln37_1_fu_689_p0;
wire   [19:0] mul_ln34_fu_693_p0;
wire   [21:0] mul_ln34_fu_693_p1;
wire   [20:0] mul_ln34_1_fu_698_p0;
wire   [41:0] zext_ln34_3_fu_1110_p1;
wire   [20:0] mul_ln34_1_fu_698_p1;
wire   [20:0] mul_ln36_fu_702_p0;
wire   [51:0] zext_ln34_2_fu_1136_p1;
wire   [20:0] mul_ln37_fu_706_p0;
wire   [31:0] predicted_fu_710_p1;
wire   [6:0] tmp_s_fu_898_p4;
wire   [31:0] tmp_4_fu_927_p33;
wire   [3:0] tmp_4_fu_927_p34;
wire   [31:0] tmp_5_fu_993_p31;
wire   [3:0] tmp_5_fu_993_p32;
wire   [31:0] tmp_4_fu_927_p35;
wire   [31:0] tmp_5_fu_993_p33;
wire  signed [31:0] delta_fu_1046_p2;
wire   [47:0] predicted_fu_710_p2;
wire   [31:0] phase_fu_1071_p2;
wire   [11:0] a_fu_1079_p4;
wire   [19:0] fraction_fu_1075_p1;
wire   [40:0] mul_ln34_fu_693_p2;
wire   [41:0] mul_ln34_1_fu_698_p2;
wire   [11:0] si_fu_1089_p2;
wire  signed [31:0] sext_ln36_fu_1146_p0;
wire  signed [31:0] sext_ln36_1_fu_1151_p0;
wire   [51:0] mul_ln36_fu_702_p2;
wire   [21:0] trunc_ln1_fu_1156_p4;
wire  signed [31:0] sub_ln36_fu_1170_p0;
wire  signed [31:0] sext_ln36_2_fu_1166_p1;
wire  signed [31:0] sext_ln36_3_fu_1176_p0;
wire  signed [31:0] sext_ln36_4_fu_1181_p0;
wire   [43:0] mul_ln36_1_fu_685_p2;
wire   [12:0] trunc_ln36_1_fu_1186_p4;
wire   [31:0] sub_ln36_fu_1170_p2;
wire  signed [31:0] sext_ln36_5_fu_1196_p1;
wire   [51:0] mul_ln37_fu_706_p2;
wire   [21:0] trunc_ln2_fu_1206_p4;
wire  signed [31:0] sext_ln37_fu_1216_p1;
wire  signed [31:0] add_ln37_fu_1220_p1;
wire   [43:0] mul_ln37_1_fu_689_p2;
wire   [12:0] trunc_ln37_1_fu_1226_p4;
wire   [31:0] add_ln37_fu_1220_p2;
wire  signed [31:0] sext_ln37_1_fu_1236_p1;
wire  signed [63:0] sext_ln39_fu_1246_p1;
wire   [63:0] tmp_6_fu_1313_p25;
wire   [63:0] tmp_6_fu_1313_p27;
wire   [63:0] tmp_9_fu_1473_p25;
wire   [63:0] tmp_9_fu_1473_p27;
wire  signed [63:0] sext_ln39_1_fu_1470_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire   [40:0] mul_ln34_fu_693_p00;
wire   [47:0] predicted_fu_710_p10;
wire   [3:0] tmp_4_fu_927_p1;
wire   [3:0] tmp_4_fu_927_p3;
wire   [3:0] tmp_4_fu_927_p5;
wire   [3:0] tmp_4_fu_927_p7;
wire   [3:0] tmp_4_fu_927_p9;
wire   [3:0] tmp_4_fu_927_p11;
wire   [3:0] tmp_4_fu_927_p13;
wire   [3:0] tmp_4_fu_927_p15;
wire  signed [3:0] tmp_4_fu_927_p17;
wire  signed [3:0] tmp_4_fu_927_p19;
wire  signed [3:0] tmp_4_fu_927_p21;
wire  signed [3:0] tmp_4_fu_927_p23;
wire  signed [3:0] tmp_4_fu_927_p25;
wire  signed [3:0] tmp_4_fu_927_p27;
wire  signed [3:0] tmp_4_fu_927_p29;
wire  signed [3:0] tmp_4_fu_927_p31;
wire   [3:0] tmp_5_fu_993_p1;
wire   [3:0] tmp_5_fu_993_p3;
wire   [3:0] tmp_5_fu_993_p5;
wire   [3:0] tmp_5_fu_993_p7;
wire   [3:0] tmp_5_fu_993_p9;
wire   [3:0] tmp_5_fu_993_p11;
wire   [3:0] tmp_5_fu_993_p13;
wire  signed [3:0] tmp_5_fu_993_p15;
wire  signed [3:0] tmp_5_fu_993_p17;
wire  signed [3:0] tmp_5_fu_993_p19;
wire  signed [3:0] tmp_5_fu_993_p21;
wire  signed [3:0] tmp_5_fu_993_p23;
wire  signed [3:0] tmp_5_fu_993_p25;
wire  signed [3:0] tmp_5_fu_993_p27;
wire  signed [3:0] tmp_5_fu_993_p29;
wire   [3:0] tmp_6_fu_1313_p1;
wire   [3:0] tmp_6_fu_1313_p3;
wire   [3:0] tmp_6_fu_1313_p5;
wire   [3:0] tmp_6_fu_1313_p7;
wire   [3:0] tmp_6_fu_1313_p9;
wire   [3:0] tmp_6_fu_1313_p11;
wire   [3:0] tmp_6_fu_1313_p13;
wire   [3:0] tmp_6_fu_1313_p15;
wire  signed [3:0] tmp_6_fu_1313_p17;
wire  signed [3:0] tmp_6_fu_1313_p19;
wire  signed [3:0] tmp_6_fu_1313_p21;
wire  signed [3:0] tmp_6_fu_1313_p23;
wire   [3:0] tmp_9_fu_1473_p1;
wire   [3:0] tmp_9_fu_1473_p3;
wire   [3:0] tmp_9_fu_1473_p5;
wire   [3:0] tmp_9_fu_1473_p7;
wire   [3:0] tmp_9_fu_1473_p9;
wire   [3:0] tmp_9_fu_1473_p11;
wire   [3:0] tmp_9_fu_1473_p13;
wire   [3:0] tmp_9_fu_1473_p15;
wire  signed [3:0] tmp_9_fu_1473_p17;
wire  signed [3:0] tmp_9_fu_1473_p19;
wire  signed [3:0] tmp_9_fu_1473_p21;
wire  signed [3:0] tmp_9_fu_1473_p23;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 i_3_fu_242 = 31'd0;
#0 sum0_fu_246 = 64'd0;
#0 sum1_fu_250 = 64'd0;
#0 real_11_fu_254 = 64'd0;
#0 real_10_fu_258 = 64'd0;
#0 real_9_fu_262 = 64'd0;
#0 real_8_fu_266 = 64'd0;
#0 real_7_fu_270 = 64'd0;
#0 real_6_fu_274 = 64'd0;
#0 real_5_fu_278 = 64'd0;
#0 real_4_fu_282 = 64'd0;
#0 real_3_fu_286 = 64'd0;
#0 real_2_fu_290 = 64'd0;
#0 real_1_fu_294 = 64'd0;
#0 real_fu_298 = 64'd0;
#0 imag_11_fu_302 = 64'd0;
#0 imag_10_fu_306 = 64'd0;
#0 imag_9_fu_310 = 64'd0;
#0 imag_8_fu_314 = 64'd0;
#0 imag_7_fu_318 = 64'd0;
#0 imag_6_fu_322 = 64'd0;
#0 imag_5_fu_326 = 64'd0;
#0 imag_4_fu_330 = 64'd0;
#0 imag_3_fu_334 = 64'd0;
#0 imag_2_fu_338 = 64'd0;
#0 imag_1_fu_342 = 64'd0;
#0 imag_fu_346 = 64'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 120 ),
    .AddressWidth( 7 ))
r18_PAIRS_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_PAIRS_address0),
    .ce0(r18_PAIRS_ce0_local),
    .q0(r18_PAIRS_q0)
);

joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_SEARCH_COS_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 4096 ),
    .AddressWidth( 12 ))
SEARCH_COS_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(SEARCH_COS_address0),
    .ce0(SEARCH_COS_ce0_local),
    .q0(SEARCH_COS_q0),
    .address1(SEARCH_COS_address1),
    .ce1(SEARCH_COS_ce1_local),
    .q1(SEARCH_COS_q1)
);

joint_search_hls_mul_12ns_32s_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 44 ))
mul_12ns_32s_44_1_1_U40(
    .din0(mul_ln36_1_fu_685_p0),
    .din1(sext_ln36_4_fu_1181_p0),
    .dout(mul_ln36_1_fu_685_p2)
);

joint_search_hls_mul_12ns_32s_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 12 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 44 ))
mul_12ns_32s_44_1_1_U41(
    .din0(mul_ln37_1_fu_689_p0),
    .din1(sext_ln36_fu_1146_p0),
    .dout(mul_ln37_1_fu_689_p2)
);

joint_search_hls_mul_20ns_22ns_41_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 20 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 41 ))
mul_20ns_22ns_41_1_1_U42(
    .din0(mul_ln34_fu_693_p0),
    .din1(mul_ln34_fu_693_p1),
    .dout(mul_ln34_fu_693_p2)
);

joint_search_hls_mul_21ns_21ns_42_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 21 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 42 ))
mul_21ns_21ns_42_1_1_U43(
    .din0(mul_ln34_1_fu_698_p0),
    .din1(mul_ln34_1_fu_698_p1),
    .dout(mul_ln34_1_fu_698_p2)
);

joint_search_hls_mul_21ns_32s_52_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 21 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 52 ))
mul_21ns_32s_52_1_1_U44(
    .din0(mul_ln36_fu_702_p0),
    .din1(sext_ln36_1_fu_1151_p0),
    .dout(mul_ln36_fu_702_p2)
);

joint_search_hls_mul_21ns_32s_52_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 21 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 52 ))
mul_21ns_32s_52_1_1_U45(
    .din0(mul_ln37_fu_706_p0),
    .din1(sext_ln36_3_fu_1176_p0),
    .dout(mul_ln37_fu_706_p2)
);

joint_search_hls_mul_32s_32ns_48_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 48 ))
mul_32s_32ns_48_1_1_U46(
    .din0(delta_fu_1046_p2),
    .din1(predicted_fu_710_p1),
    .dout(predicted_fu_710_p2)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_33_4_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 4'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 4'h2 ),
    .din2_WIDTH( 32 ),
    .CASE3( 4'h3 ),
    .din3_WIDTH( 32 ),
    .CASE4( 4'h4 ),
    .din4_WIDTH( 32 ),
    .CASE5( 4'h5 ),
    .din5_WIDTH( 32 ),
    .CASE6( 4'h6 ),
    .din6_WIDTH( 32 ),
    .CASE7( 4'h7 ),
    .din7_WIDTH( 32 ),
    .CASE8( 4'h8 ),
    .din8_WIDTH( 32 ),
    .CASE9( 4'h9 ),
    .din9_WIDTH( 32 ),
    .CASE10( 4'hA ),
    .din10_WIDTH( 32 ),
    .CASE11( 4'hB ),
    .din11_WIDTH( 32 ),
    .CASE12( 4'hC ),
    .din12_WIDTH( 32 ),
    .CASE13( 4'hD ),
    .din13_WIDTH( 32 ),
    .CASE14( 4'hE ),
    .din14_WIDTH( 32 ),
    .CASE15( 4'hF ),
    .din15_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
sparsemux_33_4_32_1_1_U47(
    .din0(distance),
    .din1(distance_1),
    .din2(distance_2),
    .din3(distance_3),
    .din4(distance_4),
    .din5(distance_5),
    .din6(distance_6),
    .din7(distance_7),
    .din8(distance_8),
    .din9(distance_9),
    .din10(distance_10),
    .din11(distance_11),
    .din12(distance_12),
    .din13(distance_13),
    .din14(distance_14),
    .din15(distance_15),
    .def(tmp_4_fu_927_p33),
    .sel(tmp_4_fu_927_p34),
    .dout(tmp_4_fu_927_p35)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_31_4_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 4'h1 ),
    .din0_WIDTH( 32 ),
    .CASE1( 4'h2 ),
    .din1_WIDTH( 32 ),
    .CASE2( 4'h3 ),
    .din2_WIDTH( 32 ),
    .CASE3( 4'h4 ),
    .din3_WIDTH( 32 ),
    .CASE4( 4'h5 ),
    .din4_WIDTH( 32 ),
    .CASE5( 4'h6 ),
    .din5_WIDTH( 32 ),
    .CASE6( 4'h7 ),
    .din6_WIDTH( 32 ),
    .CASE7( 4'h8 ),
    .din7_WIDTH( 32 ),
    .CASE8( 4'h9 ),
    .din8_WIDTH( 32 ),
    .CASE9( 4'hA ),
    .din9_WIDTH( 32 ),
    .CASE10( 4'hB ),
    .din10_WIDTH( 32 ),
    .CASE11( 4'hC ),
    .din11_WIDTH( 32 ),
    .CASE12( 4'hD ),
    .din12_WIDTH( 32 ),
    .CASE13( 4'hE ),
    .din13_WIDTH( 32 ),
    .CASE14( 4'hF ),
    .din14_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 4 ),
    .dout_WIDTH( 32 ))
sparsemux_31_4_32_1_1_U48(
    .din0(distance_1),
    .din1(distance_2),
    .din2(distance_3),
    .din3(distance_4),
    .din4(distance_5),
    .din5(distance_6),
    .din6(distance_7),
    .din7(distance_8),
    .din8(distance_9),
    .din9(distance_10),
    .din10(distance_11),
    .din11(distance_12),
    .din12(distance_13),
    .din13(distance_14),
    .din14(distance_15),
    .def(tmp_5_fu_993_p31),
    .sel(tmp_5_fu_993_p32),
    .dout(tmp_5_fu_993_p33)
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
sparsemux_25_4_64_1_1_U49(
    .din0(real_11_fu_254),
    .din1(real_10_fu_258),
    .din2(real_9_fu_262),
    .din3(real_8_fu_266),
    .din4(real_7_fu_270),
    .din5(real_6_fu_274),
    .din6(real_5_fu_278),
    .din7(real_4_fu_282),
    .din8(real_3_fu_286),
    .din9(real_2_fu_290),
    .din10(real_1_fu_294),
    .din11(real_fu_298),
    .def(tmp_6_fu_1313_p25),
    .sel(o_slot_reg_2026_pp0_iter4_reg),
    .dout(tmp_6_fu_1313_p27)
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
sparsemux_25_4_64_1_1_U50(
    .din0(imag_11_fu_302),
    .din1(imag_10_fu_306),
    .din2(imag_9_fu_310),
    .din3(imag_8_fu_314),
    .din4(imag_7_fu_318),
    .din5(imag_6_fu_322),
    .din6(imag_5_fu_326),
    .din7(imag_4_fu_330),
    .din8(imag_3_fu_334),
    .din9(imag_2_fu_338),
    .din10(imag_1_fu_342),
    .din11(imag_fu_346),
    .def(tmp_9_fu_1473_p25),
    .sel(o_slot_reg_2026_pp0_iter4_reg),
    .dout(tmp_9_fu_1473_p27)
);

joint_search_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln26_fu_852_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_3_fu_242 <= add_ln26_fu_858_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_3_fu_242 <= 31'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_10_fu_306 <= 64'd0;
        end else if (((ap_predicate_pred496_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_10_fu_306 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_11_fu_302 <= 64'd0;
        end else if (((ap_predicate_pred484_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_11_fu_302 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_1_fu_342 <= 64'd0;
        end else if (((ap_predicate_pred604_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_1_fu_342 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_2_fu_338 <= 64'd0;
        end else if (((ap_predicate_pred592_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_2_fu_338 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_3_fu_334 <= 64'd0;
        end else if (((ap_predicate_pred580_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_3_fu_334 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_4_fu_330 <= 64'd0;
        end else if (((ap_predicate_pred568_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_4_fu_330 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_5_fu_326 <= 64'd0;
        end else if (((ap_predicate_pred556_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_5_fu_326 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_6_fu_322 <= 64'd0;
        end else if (((ap_predicate_pred544_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_6_fu_322 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_7_fu_318 <= 64'd0;
        end else if (((ap_predicate_pred532_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_7_fu_318 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_8_fu_314 <= 64'd0;
        end else if (((ap_predicate_pred520_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_8_fu_314 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_9_fu_310 <= 64'd0;
        end else if (((ap_predicate_pred508_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_9_fu_310 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            imag_fu_346 <= 64'd0;
        end else if (((ap_predicate_pred635_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            imag_fu_346 <= imag_12_fu_1528_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_10_fu_258 <= 64'd0;
        end else if (((ap_predicate_pred496_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_10_fu_258 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_11_fu_254 <= 64'd0;
        end else if (((ap_predicate_pred484_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_11_fu_254 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_1_fu_294 <= 64'd0;
        end else if (((ap_predicate_pred604_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_1_fu_294 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_2_fu_290 <= 64'd0;
        end else if (((ap_predicate_pred592_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_2_fu_290 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_3_fu_286 <= 64'd0;
        end else if (((ap_predicate_pred580_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_3_fu_286 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_4_fu_282 <= 64'd0;
        end else if (((ap_predicate_pred568_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_4_fu_282 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_5_fu_278 <= 64'd0;
        end else if (((ap_predicate_pred556_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_5_fu_278 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_6_fu_274 <= 64'd0;
        end else if (((ap_predicate_pred544_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_6_fu_274 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_7_fu_270 <= 64'd0;
        end else if (((ap_predicate_pred532_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_7_fu_270 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_8_fu_266 <= 64'd0;
        end else if (((ap_predicate_pred520_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_8_fu_266 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_9_fu_262 <= 64'd0;
        end else if (((ap_predicate_pred508_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_9_fu_262 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            real_fu_298 <= 64'd0;
        end else if (((ap_predicate_pred635_state6 == 1'b1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            real_fu_298 <= real_12_fu_1368_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            sum0_fu_246 <= 64'd0;
        end else if (((o_group_reg_2022_pp0_iter4_reg == 2'd0) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            sum0_fu_246 <= sum0_1_fu_1266_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            sum1_fu_250 <= 64'd0;
        end else if (((o_group_reg_2022_pp0_iter4_reg == 2'd1) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            sum1_fu_250 <= sum1_1_fu_1252_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        angle2_reg_2052 <= {{mul_ln34_1_fu_698_p2[41:30]}};
        angle_reg_2047 <= {{mul_ln34_fu_693_p2[40:20]}};
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_predicate_pred484_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd0));
        ap_predicate_pred496_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd1));
        ap_predicate_pred508_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd2));
        ap_predicate_pred520_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd3));
        ap_predicate_pred532_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd4));
        ap_predicate_pred544_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd5));
        ap_predicate_pred556_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd6));
        ap_predicate_pred568_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd7));
        ap_predicate_pred580_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd8));
        ap_predicate_pred592_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd9));
        ap_predicate_pred604_state6 <= (~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0) & (o_slot_reg_2026_pp0_iter3_reg == 4'd10));
        ap_predicate_pred635_state6 <= (~(o_slot_reg_2026_pp0_iter3_reg == 4'd10) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd9) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd8) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd7) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd6) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd5) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd4) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd3) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd2) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd1) & ~(o_slot_reg_2026_pp0_iter3_reg == 4'd0) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd1) & ~(o_group_reg_2022_pp0_iter3_reg == 2'd0));
        icmp_ln26_reg_2008_pp0_iter2_reg <= icmp_ln26_reg_2008_pp0_iter1_reg;
        icmp_ln26_reg_2008_pp0_iter3_reg <= icmp_ln26_reg_2008_pp0_iter2_reg;
        im_reg_2072 <= im_fu_1240_p2;
        o_group_reg_2022_pp0_iter2_reg <= o_group_reg_2022;
        o_group_reg_2022_pp0_iter3_reg <= o_group_reg_2022_pp0_iter2_reg;
        o_group_reg_2022_pp0_iter4_reg <= o_group_reg_2022_pp0_iter3_reg;
        o_phase_reg_2017_pp0_iter2_reg <= o_phase_reg_2017;
        o_slot_reg_2026_pp0_iter2_reg <= o_slot_reg_2026;
        o_slot_reg_2026_pp0_iter3_reg <= o_slot_reg_2026_pp0_iter2_reg;
        o_slot_reg_2026_pp0_iter4_reg <= o_slot_reg_2026_pp0_iter3_reg;
        re_reg_2067 <= re_fu_1200_p2;
        trunc_ln_reg_2042 <= {{predicted_fu_710_p2[47:16]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln26_reg_2008 <= icmp_ln26_fu_852_p2;
        icmp_ln26_reg_2008_pp0_iter1_reg <= icmp_ln26_reg_2008;
        o_group_reg_2022 <= {{obs_q0[73:72]}};
        o_phase_reg_2017 <= o_phase_fu_874_p1;
        o_slot_reg_2026 <= {{obs_q0[77:74]}};
        tmp_2_reg_2037 <= {{obs_q0[63:32]}};
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        SEARCH_COS_ce0_local = 1'b1;
    end else begin
        SEARCH_COS_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        SEARCH_COS_ce1_local = 1'b1;
    end else begin
        SEARCH_COS_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln26_fu_852_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i = 31'd0;
    end else begin
        ap_sig_allocacmp_i = i_3_fu_242;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_10_out_ap_vld = 1'b1;
    end else begin
        imag_10_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_11_out_ap_vld = 1'b1;
    end else begin
        imag_11_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_1_out_ap_vld = 1'b1;
    end else begin
        imag_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_2_out_ap_vld = 1'b1;
    end else begin
        imag_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_3_out_ap_vld = 1'b1;
    end else begin
        imag_3_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_4_out_ap_vld = 1'b1;
    end else begin
        imag_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_5_out_ap_vld = 1'b1;
    end else begin
        imag_5_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_6_out_ap_vld = 1'b1;
    end else begin
        imag_6_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_7_out_ap_vld = 1'b1;
    end else begin
        imag_7_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_8_out_ap_vld = 1'b1;
    end else begin
        imag_8_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_9_out_ap_vld = 1'b1;
    end else begin
        imag_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        imag_out_ap_vld = 1'b1;
    end else begin
        imag_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        obs_ce0_local = 1'b1;
    end else begin
        obs_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_PAIRS_ce0_local = 1'b1;
    end else begin
        r18_PAIRS_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_10_out_ap_vld = 1'b1;
    end else begin
        real_10_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_11_out_ap_vld = 1'b1;
    end else begin
        real_11_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_1_out_ap_vld = 1'b1;
    end else begin
        real_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_2_out_ap_vld = 1'b1;
    end else begin
        real_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_3_out_ap_vld = 1'b1;
    end else begin
        real_3_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_4_out_ap_vld = 1'b1;
    end else begin
        real_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_5_out_ap_vld = 1'b1;
    end else begin
        real_5_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_6_out_ap_vld = 1'b1;
    end else begin
        real_6_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_7_out_ap_vld = 1'b1;
    end else begin
        real_7_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_8_out_ap_vld = 1'b1;
    end else begin
        real_8_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_9_out_ap_vld = 1'b1;
    end else begin
        real_9_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        real_out_ap_vld = 1'b1;
    end else begin
        real_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        sum0_out_ap_vld = 1'b1;
    end else begin
        sum0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln26_reg_2008_pp0_iter3_reg == 1'd1))) begin
        sum1_out_ap_vld = 1'b1;
    end else begin
        sum1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign SEARCH_COS_address0 = zext_ln35_1_fu_1131_p1;

assign SEARCH_COS_address1 = zext_ln35_fu_1126_p1;

assign a_fu_1079_p4 = {{phase_fu_1071_p2[31:20]}};

assign add_ln26_fu_858_p2 = (ap_sig_allocacmp_i + 31'd1);

assign add_ln37_fu_1220_p1 = SEARCH_COS_q0;

assign add_ln37_fu_1220_p2 = ($signed(sext_ln37_fu_1216_p1) + $signed(add_ln37_fu_1220_p1));

assign angle_fu_1100_p4 = {{mul_ln34_fu_693_p2[40:20]}};

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign delta_fu_1046_p2 = (tmp_4_fu_927_p35 - tmp_5_fu_993_p33);

assign fraction_fu_1075_p1 = phase_fu_1071_p2[19:0];

assign icmp_ln26_fu_852_p2 = ((ap_sig_allocacmp_i == count) ? 1'b1 : 1'b0);

assign im_fu_1240_p2 = ($signed(add_ln37_fu_1220_p2) - $signed(sext_ln37_1_fu_1236_p1));

assign imag_10_out = imag_10_fu_306;

assign imag_11_out = imag_11_fu_302;

assign imag_12_fu_1528_p2 = ($signed(tmp_9_fu_1473_p27) + $signed(sext_ln39_1_fu_1470_p1));

assign imag_1_out = imag_1_fu_342;

assign imag_2_out = imag_2_fu_338;

assign imag_3_out = imag_3_fu_334;

assign imag_4_out = imag_4_fu_330;

assign imag_5_out = imag_5_fu_326;

assign imag_6_out = imag_6_fu_322;

assign imag_7_out = imag_7_fu_318;

assign imag_8_out = imag_8_fu_314;

assign imag_9_out = imag_9_fu_310;

assign imag_out = imag_fu_346;

assign mul_ln34_1_fu_698_p0 = zext_ln34_3_fu_1110_p1;

assign mul_ln34_1_fu_698_p1 = zext_ln34_3_fu_1110_p1;

assign mul_ln34_fu_693_p0 = mul_ln34_fu_693_p00;

assign mul_ln34_fu_693_p00 = fraction_fu_1075_p1;

assign mul_ln34_fu_693_p1 = 41'd1647099;

assign mul_ln36_1_fu_685_p0 = zext_ln34_4_fu_1141_p1;

assign mul_ln36_fu_702_p0 = zext_ln34_2_fu_1136_p1;

assign mul_ln37_1_fu_689_p0 = zext_ln34_4_fu_1141_p1;

assign mul_ln37_fu_706_p0 = zext_ln34_2_fu_1136_p1;

assign o_phase_fu_874_p1 = obs_q0[31:0];

assign obs_address0 = zext_ln19_fu_864_p1;

assign obs_ce0 = obs_ce0_local;

assign phase_fu_1071_p2 = (o_phase_reg_2017_pp0_iter2_reg - trunc_ln_reg_2042);

assign predicted_fu_710_p1 = predicted_fu_710_p10;

assign predicted_fu_710_p10 = tmp_2_reg_2037;

assign r18_PAIRS_address0 = zext_ln29_fu_908_p1;

assign re_fu_1200_p2 = ($signed(sub_ln36_fu_1170_p2) - $signed(sext_ln36_5_fu_1196_p1));

assign real_10_out = real_10_fu_258;

assign real_11_out = real_11_fu_254;

assign real_12_fu_1368_p2 = ($signed(tmp_6_fu_1313_p27) + $signed(sext_ln39_fu_1246_p1));

assign real_1_out = real_1_fu_294;

assign real_2_out = real_2_fu_290;

assign real_3_out = real_3_fu_286;

assign real_4_out = real_4_fu_282;

assign real_5_out = real_5_fu_278;

assign real_6_out = real_6_fu_274;

assign real_7_out = real_7_fu_270;

assign real_8_out = real_8_fu_266;

assign real_9_out = real_9_fu_262;

assign real_out = real_fu_298;

assign sext_ln36_1_fu_1151_p0 = SEARCH_COS_q0;

assign sext_ln36_2_fu_1166_p1 = $signed(trunc_ln1_fu_1156_p4);

assign sext_ln36_3_fu_1176_p0 = SEARCH_COS_q1;

assign sext_ln36_4_fu_1181_p0 = SEARCH_COS_q1;

assign sext_ln36_5_fu_1196_p1 = $signed(trunc_ln36_1_fu_1186_p4);

assign sext_ln36_fu_1146_p0 = SEARCH_COS_q0;

assign sext_ln37_1_fu_1236_p1 = $signed(trunc_ln37_1_fu_1226_p4);

assign sext_ln37_fu_1216_p1 = $signed(trunc_ln2_fu_1206_p4);

assign sext_ln39_1_fu_1470_p1 = $signed(im_reg_2072);

assign sext_ln39_fu_1246_p1 = $signed(re_reg_2067);

assign si_fu_1089_p2 = ($signed(a_fu_1079_p4) + $signed(12'd3072));

assign sub_ln36_fu_1170_p0 = SEARCH_COS_q1;

assign sub_ln36_fu_1170_p2 = ($signed(sub_ln36_fu_1170_p0) - $signed(sext_ln36_2_fu_1166_p1));

assign sum0_1_fu_1266_p2 = ($signed(sum0_fu_246) + $signed(sext_ln39_fu_1246_p1));

assign sum0_out = sum0_fu_246;

assign sum1_1_fu_1252_p2 = ($signed(sum1_fu_250) + $signed(sext_ln39_fu_1246_p1));

assign sum1_out = sum1_fu_250;

assign tmp_4_fu_927_p33 = 'bx;

assign tmp_4_fu_927_p34 = r18_PAIRS_q0[3:0];

assign tmp_5_fu_993_p31 = 'bx;

assign tmp_5_fu_993_p32 = {{r18_PAIRS_q0[7:4]}};

assign tmp_6_fu_1313_p25 = 'bx;

assign tmp_9_fu_1473_p25 = 'bx;

assign tmp_s_fu_898_p4 = {{obs_q0[70:64]}};

assign trunc_ln1_fu_1156_p4 = {{mul_ln36_fu_702_p2[51:30]}};

assign trunc_ln2_fu_1206_p4 = {{mul_ln37_fu_706_p2[51:30]}};

assign trunc_ln36_1_fu_1186_p4 = {{mul_ln36_1_fu_685_p2[43:31]}};

assign trunc_ln37_1_fu_1226_p4 = {{mul_ln37_1_fu_689_p2[43:31]}};

assign zext_ln19_fu_864_p1 = ap_sig_allocacmp_i;

assign zext_ln29_fu_908_p1 = tmp_s_fu_898_p4;

assign zext_ln34_2_fu_1136_p1 = angle_reg_2047;

assign zext_ln34_3_fu_1110_p1 = angle_fu_1100_p4;

assign zext_ln34_4_fu_1141_p1 = angle2_reg_2052;

assign zext_ln35_1_fu_1131_p1 = si_fu_1089_p2;

assign zext_ln35_fu_1126_p1 = a_fu_1079_p4;

endmodule                                                            
