                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="joint_search_hls_joint_search_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=14.224500,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=22,HLS_SYN_DSP=0,HLS_SYN_FF=14984,HLS_SYN_LUT=14931,HLS_VERSION=2024_2}" *)

module joint_search_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        covariance_address0,
        covariance_ce0,
        covariance_q0,
        grid_address0,
        grid_ce0,
        grid_q0,
        grid_count,
        horizontal_mm,
        vertical_mm,
        baseline_two,
        fast_mode,
        result
);

parameter    ap_ST_fsm_state1 = 69'd1;
parameter    ap_ST_fsm_state2 = 69'd2;
parameter    ap_ST_fsm_state3 = 69'd4;
parameter    ap_ST_fsm_state4 = 69'd8;
parameter    ap_ST_fsm_state5 = 69'd16;
parameter    ap_ST_fsm_state6 = 69'd32;
parameter    ap_ST_fsm_state7 = 69'd64;
parameter    ap_ST_fsm_state8 = 69'd128;
parameter    ap_ST_fsm_state9 = 69'd256;
parameter    ap_ST_fsm_state10 = 69'd512;
parameter    ap_ST_fsm_state11 = 69'd1024;
parameter    ap_ST_fsm_state12 = 69'd2048;
parameter    ap_ST_fsm_state13 = 69'd4096;
parameter    ap_ST_fsm_state14 = 69'd8192;
parameter    ap_ST_fsm_state15 = 69'd16384;
parameter    ap_ST_fsm_state16 = 69'd32768;
parameter    ap_ST_fsm_state17 = 69'd65536;
parameter    ap_ST_fsm_state18 = 69'd131072;
parameter    ap_ST_fsm_state19 = 69'd262144;
parameter    ap_ST_fsm_state20 = 69'd524288;
parameter    ap_ST_fsm_state21 = 69'd1048576;
parameter    ap_ST_fsm_state22 = 69'd2097152;
parameter    ap_ST_fsm_state23 = 69'd4194304;
parameter    ap_ST_fsm_state24 = 69'd8388608;
parameter    ap_ST_fsm_state25 = 69'd16777216;
parameter    ap_ST_fsm_state26 = 69'd33554432;
parameter    ap_ST_fsm_state27 = 69'd67108864;
parameter    ap_ST_fsm_state28 = 69'd134217728;
parameter    ap_ST_fsm_state29 = 69'd268435456;
parameter    ap_ST_fsm_state30 = 69'd536870912;
parameter    ap_ST_fsm_state31 = 69'd1073741824;
parameter    ap_ST_fsm_state32 = 69'd2147483648;
parameter    ap_ST_fsm_state33 = 69'd4294967296;
parameter    ap_ST_fsm_state34 = 69'd8589934592;
parameter    ap_ST_fsm_state35 = 69'd17179869184;
parameter    ap_ST_fsm_state36 = 69'd34359738368;
parameter    ap_ST_fsm_state37 = 69'd68719476736;
parameter    ap_ST_fsm_state38 = 69'd137438953472;
parameter    ap_ST_fsm_state39 = 69'd274877906944;
parameter    ap_ST_fsm_state40 = 69'd549755813888;
parameter    ap_ST_fsm_state41 = 69'd1099511627776;
parameter    ap_ST_fsm_state42 = 69'd2199023255552;
parameter    ap_ST_fsm_state43 = 69'd4398046511104;
parameter    ap_ST_fsm_state44 = 69'd8796093022208;
parameter    ap_ST_fsm_state45 = 69'd17592186044416;
parameter    ap_ST_fsm_state46 = 69'd35184372088832;
parameter    ap_ST_fsm_state47 = 69'd70368744177664;
parameter    ap_ST_fsm_state48 = 69'd140737488355328;
parameter    ap_ST_fsm_state49 = 69'd281474976710656;
parameter    ap_ST_fsm_state50 = 69'd562949953421312;
parameter    ap_ST_fsm_state51 = 69'd1125899906842624;
parameter    ap_ST_fsm_state52 = 69'd2251799813685248;
parameter    ap_ST_fsm_state53 = 69'd4503599627370496;
parameter    ap_ST_fsm_state54 = 69'd9007199254740992;
parameter    ap_ST_fsm_state55 = 69'd18014398509481984;
parameter    ap_ST_fsm_state56 = 69'd36028797018963968;
parameter    ap_ST_fsm_state57 = 69'd72057594037927936;
parameter    ap_ST_fsm_state58 = 69'd144115188075855872;
parameter    ap_ST_fsm_state59 = 69'd288230376151711744;
parameter    ap_ST_fsm_state60 = 69'd576460752303423488;
parameter    ap_ST_fsm_state61 = 69'd1152921504606846976;
parameter    ap_ST_fsm_state62 = 69'd2305843009213693952;
parameter    ap_ST_fsm_state63 = 69'd4611686018427387904;
parameter    ap_ST_fsm_state64 = 69'd9223372036854775808;
parameter    ap_ST_fsm_state65 = 69'd18446744073709551616;
parameter    ap_ST_fsm_state66 = 69'd36893488147419103232;
parameter    ap_ST_fsm_state67 = 69'd73786976294838206464;
parameter    ap_ST_fsm_state68 = 69'd147573952589676412928;
parameter    ap_ST_fsm_state69 = 69'd295147905179352825856;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [15:0] covariance_address0;
output   covariance_ce0;
input  [63:0] covariance_q0;
output  [15:0] grid_address0;
output   grid_ce0;
input  [47:0] grid_q0;
input  [31:0] grid_count;
input  [31:0] horizontal_mm;
input  [31:0] vertical_mm;
input  [0:0] baseline_two;
input  [0:0] fast_mode;
output  [143:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] covariance_address0;
reg covariance_ce0;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [68:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [8:0] r18_PHASE_MM_address0;
wire   [25:0] r18_PHASE_MM_q0;
wire   [6:0] r18_PAIRS_address0;
wire   [7:0] r18_PAIRS_q0;
reg   [31:0] reg_2464;
wire    ap_CS_fsm_state24;
wire    ap_CS_fsm_state28;
wire    ap_CS_fsm_state49;
wire    ap_CS_fsm_state62;
reg   [31:0] reg_2469;
reg   [31:0] reg_2474;
reg   [31:0] reg_2479;
wire    ap_CS_fsm_state25;
wire    ap_CS_fsm_state50;
reg   [63:0] reg_2484;
wire    ap_CS_fsm_state29;
wire    ap_CS_fsm_state63;
reg   [63:0] reg_2488;
reg   [63:0] reg_2492;
reg   [63:0] grp_load_fu_2434_p1;
reg   [63:0] reg_2496;
wire    ap_CS_fsm_state30;
wire    ap_CS_fsm_state51;
wire    ap_CS_fsm_state64;
reg   [63:0] grp_load_fu_2440_p1;
reg   [63:0] reg_2503;
reg   [63:0] grp_load_fu_2446_p1;
reg   [63:0] reg_2510;
reg   [0:0] fast_mode_read_reg_5396;
wire    ap_CS_fsm_state6;
reg   [0:0] baseline_two_read_reg_5406;
reg   [31:0] vertical_mm_read_reg_5411;
reg   [31:0] horizontal_mm_read_reg_5416;
reg   [31:0] grid_count_read_reg_5421;
wire   [16:0] trunc_ln58_fu_2532_p1;
reg   [16:0] trunc_ln58_reg_5426;
reg   [3:0] s_reg_5431;
wire    ap_CS_fsm_state7;
wire   [3:0] s_2_fu_2545_p2;
reg   [3:0] s_2_reg_5439;
reg   [11:0] mask_load_reg_5449;
reg   [8:0] f_reg_5454;
wire    ap_CS_fsm_state8;
wire   [15:0] mul115_fu_2580_p2;
reg   [15:0] mul115_reg_5470;
wire    ap_CS_fsm_state9;
wire   [15:0] add116_fu_2586_p2;
reg   [15:0] add116_reg_5476;
wire   [0:0] tobool_fu_2592_p2;
reg   [0:0] tobool_reg_5481;
wire   [31:0] s_1_cast51_fu_2598_p1;
reg   [31:0] s_1_cast51_reg_5486;
reg   [25:0] o_coefficient_reg_5491;
wire   [6:0] p_fu_2607_p2;
reg   [6:0] p_reg_5499;
wire    ap_CS_fsm_state10;
reg   [7:0] pair_reg_5514;
wire    ap_CS_fsm_state11;
wire   [15:0] add_ln95_1_fu_2668_p2;
reg   [15:0] add_ln95_1_reg_5525;
wire  signed [31:0] re_fu_2673_p1;
reg   [31:0] re_reg_5530;
wire    ap_CS_fsm_state12;
reg   [31:0] im_reg_5536;
wire   [30:0] trunc_ln95_1_fu_2693_p1;
reg   [30:0] trunc_ln95_1_reg_5547;
wire    ap_CS_fsm_state13;
wire   [0:0] icmp_ln96_fu_2697_p2;
reg   [0:0] icmp_ln96_reg_5552;
wire   [0:0] and_ln98_1_fu_2756_p2;
reg   [0:0] and_ln98_1_reg_5558;
wire    ap_CS_fsm_state14;
wire   [0:0] icmp_ln98_fu_2789_p2;
reg   [0:0] icmp_ln98_reg_5562;
wire   [1:0] o_group_fu_2825_p3;
reg   [1:0] o_group_reg_5566;
wire   [11:0] mask_1_fu_2895_p4;
reg   [11:0] mask_1_reg_5571;
wire   [30:0] trunc_ln90_fu_2985_p1;
reg   [30:0] trunc_ln90_reg_5576;
wire    ap_CS_fsm_state18;
wire   [11:0] trunc_ln106_fu_2992_p1;
reg   [11:0] trunc_ln106_reg_5585;
wire   [143:0] zext_ln106_fu_3004_p1;
reg   [1:0] g_2_reg_5623;
wire    ap_CS_fsm_state19;
wire   [1:0] add_ln108_fu_3116_p2;
reg   [1:0] add_ln108_reg_5630;
wire  signed [41:0] sext_ln108_fu_3142_p1;
reg  signed [41:0] sext_ln108_reg_5635;
wire   [32:0] conv2_i_i_i1144_fu_3152_p1;
reg   [32:0] conv2_i_i_i1144_reg_5731;
wire   [64:0] conv_i_i1171_fu_3155_p1;
reg   [64:0] conv_i_i1171_reg_5738;
wire   [16:0] select_ln114_fu_3174_p3;
reg   [16:0] select_ln114_reg_5745;
wire   [16:0] n_2_fu_3277_p2;
reg   [16:0] n_2_reg_5753;
wire    ap_CS_fsm_state21;
wire   [3:0] select_ln135_cast_cast_fu_3288_p3;
reg   [3:0] select_ln135_cast_cast_reg_5833;
wire   [2:0] zext_ln130_fu_3295_p1;
reg   [2:0] zext_ln130_reg_5838;
wire   [8:0] select_ln130_fu_3298_p3;
reg   [8:0] select_ln130_reg_5843;
wire  signed [15:0] cx_fu_3355_p3;
reg   [15:0] cx_reg_5848;
wire    ap_CS_fsm_state23;
wire  signed [31:0] sext_ln116_fu_3363_p1;
reg  signed [31:0] sext_ln116_reg_5853;
wire  signed [15:0] cy_fu_3367_p3;
reg   [15:0] cy_reg_5861;
wire  signed [31:0] sext_ln116_1_fu_3375_p1;
reg  signed [31:0] sext_ln116_1_reg_5866;
wire  signed [15:0] cz_fu_3379_p1;
reg   [15:0] cz_reg_5874;
wire  signed [31:0] sext_ln116_2_fu_3383_p1;
reg  signed [31:0] sext_ln116_2_reg_5879;
wire   [0:0] and_ln49_fu_3428_p2;
reg   [0:0] and_ln49_reg_5887;
wire   [0:0] icmp_ln49_1_fu_3456_p2;
reg   [0:0] icmp_ln49_1_reg_5891;
wire   [0:0] icmp_ln49_2_fu_3473_p2;
reg   [0:0] icmp_ln49_2_reg_5895;
reg   [31:0] seeds_x_load_reg_5899;
reg   [31:0] seeds_x_1_load_reg_5904;
reg   [31:0] seeds_x_2_load_reg_5909;
reg   [31:0] seeds_y_load_reg_5914;
reg   [31:0] seeds_y_1_load_reg_5919;
reg   [31:0] seeds_y_2_load_reg_5924;
reg   [31:0] seeds_z_load_reg_5929;
reg   [31:0] seeds_z_1_load_reg_5934;
reg   [31:0] seeds_z_2_load_reg_5939;
reg   [31:0] seeds_score_load_reg_5944;
reg   [31:0] seeds_score_1_load_reg_5950;
reg   [31:0] seeds_score_2_load_reg_5956;
reg   [31:0] bx_1_reg_5968;
wire    ap_CS_fsm_state27;
reg   [31:0] by_1_reg_5973;
reg   [31:0] bz_1_reg_5978;
reg   [31:0] best_2_reg_5983;
reg   [63:0] best_raw_1_reg_5989;
reg   [0:0] found_5_reg_5994;
reg   [63:0] p_load304_reg_5999;
reg   [63:0] p_load303_reg_6004;
reg   [63:0] p_load302_reg_6009;
wire   [1:0] add_ln130_fu_3619_p2;
reg   [1:0] add_ln130_reg_6017;
wire   [31:0] local_best_9_fu_3625_p9;
reg   [31:0] local_best_9_reg_6022;
wire   [0:0] icmp_ln131_fu_3645_p2;
reg   [0:0] icmp_ln131_reg_6029;
wire   [31:0] lx_9_fu_3651_p9;
reg   [31:0] lx_9_reg_6033;
wire   [31:0] ly_9_fu_3671_p9;
reg   [31:0] ly_9_reg_6040;
wire   [31:0] lz_9_fu_3691_p9;
reg   [31:0] lz_9_reg_6047;
wire   [0:0] icmp_ln170_1_fu_3711_p2;
reg   [0:0] icmp_ln170_1_reg_6054;
wire   [0:0] icmp_ln170_2_fu_3726_p2;
reg   [0:0] icmp_ln170_2_reg_6059;
wire   [0:0] icmp_ln170_3_fu_3742_p2;
reg   [0:0] icmp_ln170_3_reg_6064;
wire   [0:0] icmp_ln170_4_fu_3758_p2;
reg   [0:0] icmp_ln170_4_reg_6069;
wire   [44:0] add_ln170_3_fu_3874_p2;
reg   [44:0] add_ln170_3_reg_6074;
wire   [44:0] add_ln170_7_fu_3990_p2;
reg   [44:0] add_ln170_7_reg_6079;
wire   [44:0] add_ln170_11_fu_4106_p2;
reg   [44:0] add_ln170_11_reg_6084;
wire   [0:0] icmp_ln134_fu_4127_p2;
reg   [0:0] icmp_ln134_reg_6089;
wire   [63:0] grp_fu_2458_p2;
reg   [63:0] best_raw_11_reg_6093;
wire   [2:0] level_2_fu_4152_p2;
reg   [2:0] level_2_reg_6101;
wire    ap_CS_fsm_state33;
wire   [13:0] zext_ln138_fu_4178_p1;
reg   [13:0] zext_ln138_reg_6109;
wire   [15:0] zext_ln138_1_fu_4182_p1;
reg   [15:0] zext_ln138_1_reg_6115;
wire   [17:0] add_ln141_fu_4186_p2;
reg   [17:0] add_ln141_reg_6120;
wire    ap_CS_fsm_state34;
wire   [17:0] add_ln141_1_fu_4192_p2;
reg   [17:0] add_ln141_1_reg_6125;
wire   [18:0] add_ln141_2_fu_4198_p2;
reg   [18:0] add_ln141_2_reg_6130;
wire   [17:0] add_ln141_3_fu_4204_p2;
reg   [17:0] add_ln141_3_reg_6135;
wire   [8:0] n_5_fu_4215_p2;
reg   [8:0] n_5_reg_6143;
wire    ap_CS_fsm_state37;
wire  signed [31:0] grp_fu_5206_p3;
reg  signed [31:0] cx_1_reg_6168;
wire  signed [31:0] grp_fu_5213_p3;
reg  signed [31:0] cz_1_reg_6177;
wire    ap_CS_fsm_state40;
wire   [0:0] and_ln49_2_fu_4362_p2;
reg   [0:0] and_ln49_2_reg_6185;
wire   [2:0] grp_fu_4287_p2;
reg   [2:0] urem_ln145_reg_6189;
wire    ap_CS_fsm_state43;
wire    ap_CS_fsm_state44;
wire  signed [31:0] grp_fu_5222_p3;
reg  signed [31:0] cy_1_reg_6199;
wire    ap_CS_fsm_state47;
wire   [0:0] icmp_ln49_4_fu_4422_p2;
reg   [0:0] icmp_ln49_4_reg_6208;
wire    ap_CS_fsm_state48;
wire   [0:0] icmp_ln49_6_fu_4436_p2;
reg   [0:0] icmp_ln49_6_reg_6212;
wire   [31:0] lx_7_fu_4463_p3;
reg   [31:0] lx_7_reg_6216;
wire   [31:0] ly_7_fu_4470_p3;
reg   [31:0] ly_7_reg_6222;
wire   [31:0] lz_7_fu_4477_p3;
reg   [31:0] lz_7_reg_6228;
wire   [31:0] local_best_7_fu_4484_p3;
reg   [31:0] local_best_7_reg_6234;
wire   [0:0] icmp_ln150_fu_4492_p2;
reg   [0:0] icmp_ln150_reg_6240;
reg   [63:0] best_raw_12_reg_6244;
wire   [8:0] select_ln129_fu_4522_p3;
wire    ap_CS_fsm_state53;
wire   [8:0] select_ln129_1_fu_4542_p3;
wire   [1:0] level_3_fu_4556_p2;
reg   [1:0] level_3_reg_6262;
wire    ap_CS_fsm_state54;
wire  signed [45:0] lx_10_cast_fu_4596_p1;
reg  signed [45:0] lx_10_cast_reg_6267;
wire   [45:0] conv576_cast_cast_fu_4608_p3;
reg   [45:0] conv576_cast_cast_reg_6272;
wire  signed [45:0] ly_10_cast_fu_4616_p1;
reg  signed [45:0] ly_10_cast_reg_6277;
wire   [45:0] select_ln162_fu_4628_p3;
reg   [45:0] select_ln162_reg_6282;
wire   [12:0] zext_ln162_fu_4640_p1;
reg   [12:0] zext_ln162_reg_6287;
wire  signed [45:0] sext_ln158_fu_4644_p1;
reg  signed [45:0] sext_ln158_reg_6292;
wire    ap_CS_fsm_state55;
wire  signed [45:0] add_ln160_fu_4713_p2;
reg  signed [45:0] add_ln160_reg_6305;
wire    ap_CS_fsm_state58;
reg   [0:0] tmp_46_reg_6310;
wire  signed [45:0] add_ln161_fu_4726_p2;
reg  signed [45:0] add_ln161_reg_6316;
reg   [0:0] tmp_47_reg_6321;
wire   [45:0] mul_ln162_fu_2293_p2;
reg   [45:0] mul_ln162_reg_6327;
wire   [92:0] mul_ln160_1_fu_2318_p2;
reg   [92:0] mul_ln160_1_reg_6332;
wire    ap_CS_fsm_state59;
reg   [31:0] tmp_10_cast_reg_6337;
wire   [92:0] mul_ln161_1_fu_2323_p2;
reg   [92:0] mul_ln161_1_reg_6343;
reg   [31:0] tmp_14_cast_reg_6348;
wire   [92:0] mul_ln162_1_fu_2328_p2;
reg   [92:0] mul_ln162_1_reg_6354;
reg   [0:0] tmp_48_reg_6359;
reg   [31:0] tmp_18_cast_reg_6365;
wire  signed [31:0] cx_2_fu_4822_p3;
reg  signed [31:0] cx_2_reg_6371;
wire    ap_CS_fsm_state60;
wire  signed [31:0] cy_2_fu_4855_p3;
reg  signed [31:0] cy_2_reg_6380;
wire  signed [31:0] cz_2_fu_4888_p3;
reg  signed [31:0] cz_2_reg_6389;
wire   [0:0] and_ln49_1_fu_4923_p2;
reg   [0:0] and_ln49_1_reg_6397;
wire   [0:0] icmp_ln49_7_fu_4953_p2;
reg   [0:0] icmp_ln49_7_reg_6401;
wire    ap_CS_fsm_state61;
wire   [0:0] icmp_ln49_8_fu_4967_p2;
reg   [0:0] icmp_ln49_8_reg_6405;
reg   [31:0] score_2_reg_6409;
wire   [31:0] lx_8_fu_4993_p3;
reg   [31:0] lx_8_reg_6417;
wire   [31:0] ly_8_fu_5000_p3;
reg   [31:0] ly_8_reg_6423;
wire   [31:0] lz_8_fu_5007_p3;
reg   [31:0] lz_8_reg_6429;
wire   [31:0] local_best_8_fu_5014_p3;
reg   [31:0] local_best_8_reg_6435;
wire   [0:0] icmp_ln166_fu_5021_p2;
reg   [0:0] icmp_ln166_reg_6441;
reg   [63:0] best_raw_13_reg_6445;
wire   [5:0] add_ln158_fu_5035_p2;
reg   [5:0] add_ln158_reg_6459;
wire    ap_CS_fsm_state66;
wire   [143:0] tmp_s_fu_5192_p9;
wire    ap_CS_fsm_state68;
reg   [8:0] trace_address0;
reg    trace_ce0;
reg    trace_we0;
wire   [39:0] trace_q0;
reg    trace_ce1;
wire   [39:0] trace_q1;
reg   [8:0] weights_address0;
reg    weights_ce0;
reg    weights_we0;
wire   [19:0] weights_q0;
reg   [8:0] blocked_address0;
reg    blocked_ce0;
reg    blocked_we0;
reg   [0:0] blocked_d0;
wire   [0:0] blocked_q0;
reg    blocked_ce1;
reg    blocked_we1;
reg   [3:0] chosen_address0;
reg    chosen_ce0;
reg    chosen_we0;
wire   [8:0] chosen_q0;
reg   [10:0] obs_address0;
reg    obs_ce0;
wire   [77:0] obs_q0;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_ap_done;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_ap_idle;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_groups_out;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_p_out;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_p_out1;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_1_fu_2146_p_out2;
wire    grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready;
wire   [15:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0;
wire   [8:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0;
wire   [39:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0;
wire   [8:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0;
wire   [0:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_idle;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0;
wire   [19:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0;
wire   [55:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1;
wire  signed [41:0] grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_idle;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready;
wire   [3:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0;
wire   [0:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1;
wire   [0:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1;
wire   [8:0] grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0;
wire    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready;
wire   [3:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out_ap_vld;
wire    grp_cordic_fu_2185_ap_start;
wire    grp_cordic_fu_2185_ap_done;
wire    grp_cordic_fu_2185_ap_idle;
wire    grp_cordic_fu_2185_ap_ready;
wire  signed [31:0] grp_cordic_fu_2185_ap_return;
reg    grp_udiv_fu_2193_ap_start;
wire    grp_udiv_fu_2193_ap_done;
wire    grp_udiv_fu_2193_ap_idle;
wire    grp_udiv_fu_2193_ap_ready;
reg   [55:0] grp_udiv_fu_2193_n;
reg   [41:0] grp_udiv_fu_2193_d;
wire   [63:0] grp_udiv_fu_2193_ap_return;
wire    grp_evaluate_fu_2200_ap_start;
wire    grp_evaluate_fu_2200_ap_done;
wire    grp_evaluate_fu_2200_ap_idle;
wire    grp_evaluate_fu_2200_ap_ready;
reg   [31:0] grp_evaluate_fu_2200_x;
reg   [31:0] grp_evaluate_fu_2200_y;
reg   [31:0] grp_evaluate_fu_2200_z;
wire   [10:0] grp_evaluate_fu_2200_obs_address0;
wire    grp_evaluate_fu_2200_obs_ce0;
wire   [31:0] grp_evaluate_fu_2200_ap_return_0;
wire   [63:0] grp_evaluate_fu_2200_ap_return_1;
wire   [63:0] grp_evaluate_fu_2200_ap_return_2;
wire   [63:0] grp_evaluate_fu_2200_ap_return_3;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready;
wire   [31:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out_ap_vld;
wire   [31:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out_ap_vld;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2_ap_vld;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2_ap_vld;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1_ap_vld;
wire   [63:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2_ap_vld;
reg   [6:0] p_1_reg_763;
wire    ap_CS_fsm_state16;
reg    ap_predicate_op253_call_state16;
reg    ap_block_state16_on_subcall_done;
reg   [63:0] ap_phi_mux_p_ph_phi_fu_778_p4;
reg   [63:0] p_ph_reg_775;
wire    ap_CS_fsm_state32;
reg   [63:0] ap_phi_mux_p_ph305_phi_fu_788_p4;
reg   [63:0] p_ph305_reg_785;
reg   [63:0] ap_phi_mux_p_ph306_phi_fu_798_p4;
reg   [63:0] p_ph306_reg_795;
reg   [0:0] ap_phi_mux_found_1_ph_phi_fu_808_p4;
reg   [0:0] found_1_ph_reg_805;
reg   [63:0] ap_phi_mux_best_raw_2_ph_phi_fu_819_p4;
reg   [63:0] best_raw_2_ph_reg_816;
reg   [31:0] ap_phi_mux_best_4_ph_phi_fu_829_p4;
reg   [31:0] best_4_ph_reg_826;
reg   [31:0] ap_phi_mux_bz_2_ph_phi_fu_839_p4;
reg   [31:0] bz_2_ph_reg_836;
reg   [31:0] ap_phi_mux_by_2_ph_phi_fu_849_p4;
reg   [31:0] by_2_ph_reg_846;
reg   [31:0] ap_phi_mux_bx_2_ph_phi_fu_859_p4;
reg   [31:0] bx_2_ph_reg_856;
reg   [63:0] empty_85_reg_866;
wire   [0:0] icmp_ln141_fu_4210_p2;
reg   [63:0] empty_86_reg_877;
reg   [63:0] empty_87_reg_888;
reg   [0:0] found_1_reg_899;
reg   [2:0] level_reg_910;
reg   [31:0] local_best_reg_921;
reg  signed [31:0] lz_reg_931;
reg  signed [31:0] ly_reg_941;
reg  signed [31:0] lx_reg_951;
reg   [63:0] best_raw_2_reg_961;
reg   [31:0] best_4_reg_972;
reg   [31:0] bz_2_reg_983;
reg   [31:0] by_2_reg_994;
reg   [31:0] bx_2_reg_1005;
reg   [10:0] ap_phi_mux_step_phi_fu_1019_p12;
wire   [0:0] icmp_ln136_fu_4147_p2;
wire   [2:0] j_fu_4158_p2;
wire   [10:0] select_ln138_fu_4169_p3;
reg   [63:0] empty_88_reg_1038;
reg   [63:0] ap_phi_mux_empty_91_phi_fu_1277_p10;
reg   [63:0] empty_89_reg_1050;
reg   [63:0] ap_phi_mux_empty_92_phi_fu_1298_p10;
reg   [63:0] empty_90_reg_1062;
reg   [63:0] ap_phi_mux_empty_93_phi_fu_1319_p10;
reg   [0:0] found_3_reg_1074;
reg   [0:0] ap_phi_mux_found_4_phi_fu_1525_p10;
reg   [8:0] n_3_reg_1086;
reg   [31:0] local_best_2_reg_1097;
reg   [31:0] ap_phi_mux_local_best_3_phi_fu_1505_p10;
reg   [31:0] lz_4_reg_1109;
reg   [31:0] ap_phi_mux_lz_3_phi_fu_1485_p10;
reg   [31:0] ly_4_reg_1121;
reg   [31:0] ap_phi_mux_ly_3_phi_fu_1465_p10;
reg   [31:0] lx_4_reg_1133;
reg   [31:0] ap_phi_mux_lx_3_phi_fu_1445_p10;
reg   [63:0] best_raw_4_reg_1145;
reg   [63:0] ap_phi_mux_best_raw_5_phi_fu_1424_p10;
reg   [31:0] best_6_reg_1157;
reg   [31:0] ap_phi_mux_best_7_phi_fu_1403_p10;
reg   [31:0] bz_4_reg_1169;
reg   [31:0] ap_phi_mux_bz_5_phi_fu_1382_p10;
reg   [31:0] by_4_reg_1181;
reg   [31:0] ap_phi_mux_by_5_phi_fu_1361_p10;
reg   [31:0] bx_4_reg_1193;
reg   [31:0] ap_phi_mux_bx_5_phi_fu_1340_p10;
reg   [17:0] phi_mul_reg_1205;
reg   [18:0] phi_mul74_reg_1216;
reg   [17:0] phi_mul76_reg_1227;
reg   [17:0] phi_mul78_reg_1238;
reg   [8:0] phi_urem_reg_1249;
reg   [8:0] phi_urem80_reg_1261;
reg   [63:0] empty_91_reg_1273;
reg   [63:0] empty_92_reg_1294;
reg   [63:0] empty_93_reg_1315;
reg   [31:0] bx_5_reg_1336;
reg   [31:0] by_5_reg_1357;
reg   [31:0] bz_5_reg_1378;
reg   [31:0] best_7_reg_1399;
reg   [63:0] best_raw_5_reg_1420;
reg   [31:0] lx_3_reg_1441;
reg   [31:0] ly_3_reg_1461;
reg   [31:0] lz_3_reg_1481;
reg   [31:0] local_best_3_reg_1501;
reg   [0:0] found_4_reg_1521;
reg   [63:0] empty_94_reg_1543;
wire   [0:0] icmp_ln158_fu_4697_p2;
reg   [63:0] empty_95_reg_1554;
reg   [63:0] empty_96_reg_1565;
reg   [0:0] found_2_reg_1576;
reg   [1:0] level_1_reg_1587;
reg   [31:0] local_best_1_reg_1598;
reg  signed [31:0] lz_10_reg_1609;
reg  signed [31:0] ly_10_reg_1620;
reg  signed [31:0] lx_10_reg_1631;
reg   [63:0] best_raw_3_reg_1642;
reg   [31:0] best_5_reg_1653;
reg   [31:0] bz_3_reg_1664;
reg   [31:0] by_3_reg_1675;
reg   [31:0] bx_3_reg_1686;
reg   [63:0] empty_97_reg_1697;
wire   [0:0] icmp_ln155_fu_4550_p2;
wire    ap_CS_fsm_state67;
reg   [63:0] empty_98_reg_1709;
reg   [63:0] empty_99_reg_1721;
reg  signed [5:0] n_4_reg_1733;
reg   [0:0] found_7_reg_1745;
reg   [31:0] local_best_5_reg_1757;
reg   [31:0] lz_6_reg_1769;
reg   [31:0] ly_6_reg_1781;
reg   [31:0] lx_6_reg_1793;
reg   [63:0] best_raw_8_reg_1805;
reg   [31:0] best_9_reg_1817;
reg   [31:0] bz_8_reg_1829;
reg   [31:0] by_8_reg_1841;
reg   [31:0] bx_8_reg_1853;
reg   [63:0] empty_100_reg_1865;
reg   [63:0] empty_101_reg_1886;
reg   [63:0] empty_102_reg_1907;
reg   [31:0] bx_7_reg_1928;
reg   [31:0] by_7_reg_1949;
reg   [31:0] bz_7_reg_1970;
reg   [31:0] best_8_reg_1991;
reg   [63:0] best_raw_7_reg_2012;
reg   [31:0] lx_5_reg_2033;
reg   [31:0] ly_5_reg_2053;
reg   [31:0] lz_5_reg_2073;
reg   [31:0] local_best_4_reg_2093;
reg   [0:0] found_6_reg_2113;
reg   [143:0] result_local_0_reg_2136;
wire   [0:0] or_ln107_3_fu_3096_p2;
reg    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg;
reg   [31:0] groups_2_fu_430;
wire    ap_CS_fsm_state2;
reg   [31:0] groups_1_fu_426;
reg   [31:0] groups_fu_422;
reg   [31:0] empty_81_fu_418;
reg   [31:0] empty_80_fu_414;
reg   [31:0] empty_fu_410;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg;
reg    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg;
wire    ap_CS_fsm_state5;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg;
wire   [0:0] icmp_ln90_fu_2539_p2;
wire    ap_CS_fsm_state17;
reg    grp_cordic_fu_2185_ap_start_reg;
wire    ap_CS_fsm_state15;
reg    grp_udiv_fu_2193_ap_start_reg;
wire   [0:0] icmp_ln108_fu_3110_p2;
wire    ap_CS_fsm_state20;
reg    grp_evaluate_fu_2200_ap_start_reg;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg;
wire    ap_CS_fsm_state31;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg;
wire    ap_CS_fsm_state52;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg;
wire    ap_CS_fsm_state65;
wire   [63:0] zext_ln90_fu_2551_p1;
wire   [63:0] idxprom140_fu_2556_p1;
wire   [63:0] zext_ln92_fu_2613_p1;
wire   [0:0] icmp_ln92_fu_2601_p2;
wire   [63:0] zext_ln94_fu_2627_p1;
wire   [63:0] zext_ln95_fu_2663_p1;
wire   [63:0] zext_ln95_1_fu_2685_p1;
wire   [63:0] zext_ln101_fu_2959_p1;
wire   [63:0] zext_ln116_fu_3283_p1;
wire   [0:0] icmp_ln114_fu_3272_p2;
reg   [3:0] o_slot_fu_398;
reg   [11:0] mask_fu_402;
reg   [31:0] count_fu_406;
wire   [31:0] count_1_fu_2953_p2;
wire   [31:0] groups_6_fu_2887_p3;
wire   [0:0] icmp_ln130_fu_3613_p2;
wire   [31:0] groups_5_fu_2879_p3;
wire   [31:0] groups_4_fu_2871_p3;
wire    ap_CS_fsm_state26;
reg   [63:0] sg_fu_502;
reg   [63:0] ap_sig_allocacmp_sg_load_1;
reg   [63:0] ap_sig_allocacmp_sg_load_2;
reg   [63:0] ap_sig_allocacmp_sg_load;
reg   [63:0] sg_1_fu_506;
reg   [63:0] ap_sig_allocacmp_sg_1_load_1;
reg   [63:0] ap_sig_allocacmp_sg_1_load_2;
reg   [63:0] ap_sig_allocacmp_sg_1_load;
reg   [63:0] sg_2_fu_510;
reg   [63:0] ap_sig_allocacmp_sg_2_load_1;
reg   [63:0] ap_sig_allocacmp_sg_2_load_2;
reg   [63:0] ap_sig_allocacmp_sg_2_load;
reg   [1:0] g_fu_514;
reg   [31:0] reciprocal_idx53_val97_fu_518;
wire   [31:0] reciprocal_fu_3246_p1;
reg   [31:0] reciprocal_idx54_val99_fu_522;
reg   [31:0] reciprocal_idx55_val101_fu_526;
reg   [16:0] n_fu_530;
reg   [31:0] seeds_x_fu_534;
wire   [0:0] icmp_ln127_fu_3522_p2;
wire   [1:0] trunc_ln126_fu_3501_p1;
reg   [31:0] seeds_x_1_fu_538;
reg   [31:0] seeds_x_2_fu_542;
reg   [31:0] seeds_y_fu_546;
reg   [31:0] seeds_y_1_fu_550;
reg   [31:0] seeds_y_2_fu_554;
reg   [31:0] seeds_z_fu_558;
reg   [31:0] seeds_z_1_fu_562;
reg   [31:0] seeds_z_2_fu_566;
reg   [31:0] seeds_score_fu_570;
reg   [31:0] seeds_score_1_fu_574;
reg   [31:0] seeds_score_2_fu_578;
reg   [1:0] k_fu_582;
reg   [31:0] bx_fu_586;
reg   [31:0] by_fu_590;
reg   [31:0] bz_fu_594;
reg   [31:0] best_fu_598;
reg   [63:0] best_raw_fu_602;
reg   [0:0] found_fu_606;
reg   [63:0] empty_82_fu_610;
reg   [63:0] empty_83_fu_614;
reg   [63:0] empty_84_fu_618;
wire    ap_CS_fsm_state69;
reg    chosen_ce0_local;
reg    weights_ce0_local;
reg    r18_PHASE_MM_ce0_local;
reg    r18_PAIRS_ce0_local;
reg    covariance_ce0_local;
reg   [15:0] covariance_address0_local;
reg    obs_we0_local;
wire   [77:0] or_ln101_3_fu_2964_p8;
reg    obs_ce0_local;
reg    grid_ce0_local;
wire    ap_CS_fsm_state22;
wire   [13:0] mul_ln160_fu_2285_p0;
wire   [45:0] zext_ln160_fu_4707_p1;
wire  signed [31:0] mul_ln160_fu_2285_p1;
wire   [13:0] mul_ln161_fu_2289_p0;
wire  signed [31:0] mul_ln161_fu_2289_p1;
wire   [13:0] mul_ln162_fu_2293_p0;
wire  signed [31:0] mul_ln162_fu_2293_p1;
wire   [30:0] pp_fu_2297_p0;
wire   [30:0] pp_fu_2297_p1;
wire   [31:0] hh_fu_2301_p0;
wire   [63:0] conv2_i_i61_i1109_fu_3147_p1;
wire   [31:0] hh_fu_2301_p1;
reg  signed [31:0] grp_fu_2305_p0;
wire  signed [63:0] sext_ln97_fu_2741_p1;
wire  signed [63:0] sext_ln48_fu_4398_p1;
wire  signed [63:0] sext_ln48_2_fu_4929_p1;
reg  signed [31:0] grp_fu_2305_p1;
reg  signed [31:0] grp_fu_2309_p0;
wire  signed [63:0] sext_ln97_1_fu_2746_p1;
wire  signed [63:0] sext_ln48_1_fu_4403_p1;
wire  signed [63:0] sext_ln48_3_fu_4934_p1;
reg  signed [31:0] grp_fu_2309_p1;
wire   [31:0] phase_fu_2313_p1;
wire   [47:0] mul_ln160_1_fu_2318_p1;
wire   [47:0] mul_ln161_1_fu_2323_p1;
wire   [47:0] mul_ln162_1_fu_2328_p1;
wire   [63:0] grp_fu_2452_p2;
wire   [11:0] tmp_13_fu_2569_p3;
wire   [15:0] p_shl1_fu_2562_p3;
wire   [15:0] p_shl261_fu_2576_p1;
wire   [15:0] zext_ln92_1_fu_2618_p1;
wire   [15:0] add_ln94_fu_2622_p2;
wire   [3:0] ia_fu_2640_p4;
wire   [3:0] ib_fu_2636_p1;
wire   [15:0] zext_ln93_fu_2650_p1;
wire   [15:0] add_ln95_fu_2658_p2;
wire   [15:0] zext_ln93_1_fu_2654_p1;
wire   [31:0] aa_fu_2689_p1;
wire   [31:0] bb_fu_2703_p1;
wire   [0:0] icmp_ln96_1_fu_2717_p2;
wire   [30:0] trunc_ln95_2_fu_2707_p1;
wire   [30:0] pa_1_fu_2711_p3;
wire   [30:0] pb_1_fu_2723_p3;
wire   [0:0] and_ln98_fu_2751_p2;
wire   [63:0] grp_fu_2305_p2;
wire   [63:0] grp_fu_2309_p2;
wire   [64:0] zext_ln98_1_fu_2765_p1;
wire   [64:0] zext_ln98_fu_2761_p1;
wire   [61:0] pp_fu_2297_p2;
wire   [60:0] lshr_ln_fu_2775_p4;
wire   [64:0] add_ln98_fu_2769_p2;
wire   [64:0] zext_ln98_2_fu_2785_p1;
wire   [0:0] tmp_15_fu_2795_p3;
wire   [0:0] tmp_16_fu_2808_p3;
wire   [0:0] xor_ln100_fu_2802_p2;
wire   [0:0] or_ln100_fu_2819_p2;
wire   [1:0] zext_ln100_fu_2815_p1;
wire   [31:0] tmp_8_fu_2833_p7;
wire   [31:0] tmp_8_fu_2833_p9;
wire   [0:0] icmp_ln101_fu_2859_p2;
wire   [0:0] or_ln101_fu_2865_p2;
wire   [31:0] groups_3_fu_2853_p2;
wire   [61:0] phase_fu_2313_p2;
wire   [31:0] o_phase_fu_2943_p4;
wire   [111:0] tmp2_fu_2996_p3;
wire   [2:0] tmp_fu_3014_p4;
wire   [29:0] tmp_10_fu_3030_p4;
wire   [29:0] tmp_11_fu_3046_p4;
wire   [29:0] tmp_12_fu_3062_p4;
wire   [0:0] icmp_ln107_fu_3008_p2;
wire   [0:0] icmp_ln107_1_fu_3024_p2;
wire   [0:0] icmp_ln107_3_fu_3056_p2;
wire   [0:0] icmp_ln107_4_fu_3072_p2;
wire   [0:0] or_ln107_1_fu_3084_p2;
wire   [0:0] icmp_ln107_2_fu_3040_p2;
wire   [0:0] or_ln107_2_fu_3090_p2;
wire   [0:0] or_ln107_fu_3078_p2;
wire   [31:0] tmp_9_fu_3122_p7;
wire   [31:0] tmp_9_fu_3122_p9;
wire   [63:0] hh_fu_2301_p2;
wire   [15:0] tmp_14_fu_3159_p4;
wire   [0:0] icmp103_fu_3168_p2;
wire  signed [15:0] xx_fu_3387_p0;
wire  signed [15:0] xx_fu_3387_p1;
wire  signed [15:0] yy_fu_3393_p0;
wire  signed [15:0] yy_fu_3393_p1;
wire   [0:0] tmp_18_fu_3399_p3;
wire  signed [32:0] sext_ln49_fu_3413_p1;
wire   [0:0] icmp_ln49_fu_3417_p2;
wire   [0:0] xor_ln49_1_fu_3422_p2;
wire   [0:0] xor_ln49_fu_3407_p2;
wire   [31:0] xx_fu_3387_p2;
wire  signed [63:0] sext_ln49_3_fu_3434_p1;
wire   [31:0] yy_fu_3393_p2;
wire  signed [63:0] sext_ln49_4_fu_3442_p1;
wire   [64:0] zext_ln49_1_fu_3446_p1;
wire   [64:0] zext_ln49_fu_3438_p1;
wire   [64:0] add_ln49_fu_3450_p2;
wire   [15:0] or_ln49_fu_3461_p2;
wire   [15:0] or_ln49_1_fu_3467_p2;
wire   [0:0] tmp_41_fu_3485_p3;
wire   [31:0] k_3_fu_3493_p3;
wire   [31:0] tmp_4_fu_3505_p7;
wire   [1:0] tmp_4_fu_3505_p8;
wire   [31:0] tmp_4_fu_3505_p9;
wire   [31:0] local_best_9_fu_3625_p7;
wire   [31:0] lx_9_fu_3651_p7;
wire   [31:0] ly_9_fu_3671_p7;
wire   [31:0] lz_9_fu_3691_p7;
wire   [28:0] tmp_19_fu_3716_p4;
wire   [28:0] tmp_20_fu_3732_p4;
wire   [28:0] tmp_21_fu_3748_p4;
wire   [42:0] tmp_23_fu_3772_p3;
wire   [44:0] p_shl3_fu_3764_p3;
wire   [44:0] zext_ln170_2_fu_3780_p1;
wire   [40:0] tmp_24_fu_3790_p3;
wire   [44:0] add_ln170_fu_3784_p2;
wire   [44:0] zext_ln170_4_fu_3798_p1;
wire   [38:0] tmp_25_fu_3808_p3;
wire   [44:0] add_ln170_1_fu_3802_p2;
wire   [44:0] zext_ln170_6_fu_3816_p1;
wire   [36:0] tmp_26_fu_3826_p3;
wire   [44:0] sub_ln170_1_fu_3820_p2;
wire   [44:0] zext_ln170_8_fu_3834_p1;
wire   [34:0] tmp_27_fu_3844_p3;
wire   [44:0] add_ln170_2_fu_3838_p2;
wire   [44:0] zext_ln170_9_fu_3852_p1;
wire   [32:0] tmp_28_fu_3862_p3;
wire   [44:0] sub_ln170_2_fu_3856_p2;
wire   [44:0] zext_ln170_10_fu_3870_p1;
wire   [42:0] tmp_29_fu_3888_p3;
wire   [44:0] p_shl4_fu_3880_p3;
wire   [44:0] zext_ln170_11_fu_3896_p1;
wire   [40:0] tmp_30_fu_3906_p3;
wire   [44:0] add_ln170_4_fu_3900_p2;
wire   [44:0] zext_ln170_12_fu_3914_p1;
wire   [38:0] tmp_31_fu_3924_p3;
wire   [44:0] add_ln170_5_fu_3918_p2;
wire   [44:0] zext_ln170_13_fu_3932_p1;
wire   [36:0] tmp_32_fu_3942_p3;
wire   [44:0] sub_ln170_3_fu_3936_p2;
wire   [44:0] zext_ln170_14_fu_3950_p1;
wire   [34:0] tmp_33_fu_3960_p3;
wire   [44:0] add_ln170_6_fu_3954_p2;
wire   [44:0] zext_ln170_15_fu_3968_p1;
wire   [32:0] tmp_34_fu_3978_p3;
wire   [44:0] sub_ln170_4_fu_3972_p2;
wire   [44:0] zext_ln170_16_fu_3986_p1;
wire   [42:0] tmp_35_fu_4004_p3;
wire   [44:0] p_shl_fu_3996_p3;
wire   [44:0] zext_ln170_17_fu_4012_p1;
wire   [40:0] tmp_36_fu_4022_p3;
wire   [44:0] add_ln170_8_fu_4016_p2;
wire   [44:0] zext_ln170_18_fu_4030_p1;
wire   [38:0] tmp_37_fu_4040_p3;
wire   [44:0] add_ln170_9_fu_4034_p2;
wire   [44:0] zext_ln170_19_fu_4048_p1;
wire   [36:0] tmp_38_fu_4058_p3;
wire   [44:0] sub_ln170_5_fu_4052_p2;
wire   [44:0] zext_ln170_20_fu_4066_p1;
wire   [34:0] tmp_39_fu_4076_p3;
wire   [44:0] add_ln170_10_fu_4070_p2;
wire   [44:0] zext_ln170_21_fu_4084_p1;
wire   [32:0] tmp_40_fu_4094_p3;
wire   [44:0] sub_ln170_6_fu_4088_p2;
wire   [44:0] zext_ln170_22_fu_4102_p1;
wire   [3:0] zext_ln136_fu_4143_p1;
wire   [0:0] icmp_ln138_fu_4163_p2;
wire   [3:0] tmp_44_fu_4221_p4;
wire   [4:0] zext_ln144_fu_4231_p1;
wire   [6:0] grp_fu_4251_p0;
wire   [3:0] grp_fu_4251_p1;
wire   [2:0] trunc_ln8_fu_4257_p4;
wire   [2:0] ix_1_fu_4267_p2;
wire   [5:0] grp_fu_4287_p0;
wire   [3:0] grp_fu_4287_p1;
wire   [4:0] ix_fu_4235_p2;
wire  signed [4:0] sext_ln143_fu_4273_p1;
wire  signed [4:0] ix_2_fu_4293_p3;
wire   [2:0] trunc_ln144_2_fu_4304_p1;
wire   [2:0] trunc_ln145_2_fu_4314_p1;
wire   [2:0] iz_fu_4308_p2;
wire   [2:0] iz_1_fu_4318_p2;
wire  signed [2:0] iz_2_fu_4324_p3;
wire   [0:0] tmp_45_fu_4335_p3;
wire  signed [32:0] sext_ln49_2_fu_4348_p1;
wire   [0:0] icmp_ln49_3_fu_4351_p2;
wire   [0:0] xor_ln49_3_fu_4356_p2;
wire   [0:0] xor_ln49_2_fu_4342_p2;
wire   [2:0] grp_fu_4251_p2;
wire   [2:0] trunc_ln144_fu_4368_p1;
wire   [2:0] trunc_ln145_fu_4378_p1;
wire   [2:0] iy_fu_4372_p2;
wire   [2:0] iy_1_fu_4381_p2;
wire  signed [2:0] iy_2_fu_4387_p3;
wire   [64:0] zext_ln49_4_fu_4408_p1;
wire   [64:0] zext_ln49_5_fu_4412_p1;
wire   [64:0] add_ln49_2_fu_4416_p2;
wire   [31:0] or_ln49_2_fu_4427_p2;
wire   [31:0] or_ln49_4_fu_4431_p2;
wire   [0:0] icmp_ln149_fu_4457_p2;
wire   [0:0] icmp_ln129_fu_4516_p2;
wire   [8:0] add_ln129_fu_4510_p2;
wire   [0:0] icmp_ln129_1_fu_4536_p2;
wire   [8:0] add_ln129_1_fu_4530_p2;
wire   [0:0] icmp_ln156_fu_4562_p2;
wire   [0:0] icmp_ln156_1_fu_4568_p2;
wire   [0:0] or_ln156_fu_4582_p2;
wire   [5:0] select_ln156_fu_4574_p3;
wire   [0:0] tmp_42_fu_4600_p3;
wire   [0:0] tmp_43_fu_4620_p3;
wire   [5:0] step_1_fu_4588_p3;
wire  signed [6:0] sext_ln162_fu_4636_p1;
wire  signed [13:0] zext_ln160_fu_4707_p0;
wire   [13:0] grp_fu_5229_p3;
wire   [45:0] mul_ln160_fu_2285_p2;
wire   [45:0] mul_ln161_fu_2289_p2;
wire  signed [45:0] add_ln162_fu_4767_p2;
wire   [92:0] sub_ln160_fu_4795_p2;
wire   [31:0] tmp_cast_fu_4800_p4;
wire   [31:0] select_ln160_fu_4810_p3;
wire   [31:0] sub_ln160_1_fu_4816_p2;
wire   [92:0] sub_ln161_fu_4828_p2;
wire   [31:0] tmp_13_cast_fu_4833_p4;
wire   [31:0] select_ln161_fu_4843_p3;
wire   [31:0] sub_ln161_1_fu_4849_p2;
wire   [92:0] sub_ln162_fu_4861_p2;
wire   [31:0] tmp_17_cast_fu_4866_p4;
wire   [31:0] select_ln162_1_fu_4876_p3;
wire   [31:0] sub_ln162_1_fu_4882_p2;
wire   [0:0] tmp_49_fu_4894_p3;
wire  signed [32:0] sext_ln49_1_fu_4908_p1;
wire   [0:0] icmp_ln49_5_fu_4912_p2;
wire   [0:0] xor_ln49_5_fu_4917_p2;
wire   [0:0] xor_ln49_4_fu_4902_p2;
wire   [64:0] zext_ln49_3_fu_4943_p1;
wire   [64:0] zext_ln49_2_fu_4939_p1;
wire   [64:0] add_ln49_1_fu_4947_p2;
wire   [31:0] or_ln49_5_fu_4958_p2;
wire   [31:0] or_ln49_3_fu_4962_p2;
wire   [0:0] icmp_ln165_fu_4988_p2;
wire   [43:0] tmp_22_fu_5059_p3;
wire   [44:0] p_shl2_fu_5052_p3;
wire   [44:0] zext_ln170_fu_5067_p1;
wire   [44:0] sub_ln170_fu_5071_p2;
wire   [60:0] shl_ln_fu_5077_p3;
wire   [63:0] zext_ln170_1_fu_5085_p1;
wire   [60:0] shl_ln170_1_fu_5094_p3;
wire   [63:0] zext_ln170_3_fu_5101_p1;
wire   [60:0] shl_ln170_2_fu_5110_p3;
wire   [63:0] zext_ln170_5_fu_5117_p1;
wire   [60:0] shl_ln170_3_fu_5126_p3;
wire   [63:0] zext_ln170_7_fu_5133_p1;
wire   [0:0] icmp_ln170_fu_5041_p2;
wire   [0:0] and_ln170_1_fu_5147_p2;
wire   [0:0] and_ln170_fu_5142_p2;
wire   [0:0] icmp_ln170_5_fu_5047_p2;
wire   [0:0] icmp_ln170_7_fu_5105_p2;
wire   [0:0] icmp_ln170_8_fu_5121_p2;
wire   [0:0] and_ln170_4_fu_5162_p2;
wire   [0:0] icmp_ln170_6_fu_5089_p2;
wire   [0:0] and_ln170_5_fu_5168_p2;
wire   [0:0] and_ln170_3_fu_5157_p2;
wire   [0:0] and_ln170_6_fu_5174_p2;
wire   [0:0] and_ln170_2_fu_5151_p2;
wire   [0:0] and_ln170_7_fu_5180_p2;
wire   [0:0] icmp_ln170_9_fu_5137_p2;
wire   [0:0] quality_fu_5186_p2;
wire   [10:0] grp_fu_5206_p0;
wire    ap_CS_fsm_state36;
wire   [10:0] grp_fu_5213_p0;
wire    ap_CS_fsm_state39;
wire   [10:0] grp_fu_5222_p0;
wire    ap_CS_fsm_state46;
wire   [6:0] grp_fu_5229_p0;
wire    ap_CS_fsm_state57;
reg    grp_fu_4251_ap_start;
wire    grp_fu_4251_ap_done;
reg    grp_fu_4287_ap_start;
wire    grp_fu_4287_ap_done;
reg   [68:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_block_state2_on_subcall_done;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
reg    ap_ST_fsm_state16_blk;
reg    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
wire    ap_ST_fsm_state19_blk;
reg    ap_ST_fsm_state20_blk;
wire    ap_ST_fsm_state21_blk;
wire    ap_ST_fsm_state22_blk;
wire    ap_ST_fsm_state23_blk;
wire    ap_ST_fsm_state24_blk;
reg    ap_block_state25_on_subcall_done;
reg    ap_ST_fsm_state25_blk;
wire    ap_ST_fsm_state26_blk;
wire    ap_ST_fsm_state27_blk;
wire    ap_ST_fsm_state28_blk;
reg    ap_ST_fsm_state29_blk;
wire    ap_ST_fsm_state30_blk;
reg    ap_ST_fsm_state31_blk;
wire    ap_ST_fsm_state32_blk;
wire    ap_ST_fsm_state33_blk;
wire    ap_ST_fsm_state34_blk;
wire    ap_ST_fsm_state35_blk;
wire    ap_ST_fsm_state36_blk;
wire    ap_ST_fsm_state37_blk;
wire    ap_ST_fsm_state38_blk;
wire    ap_ST_fsm_state39_blk;
wire    ap_ST_fsm_state40_blk;
wire    ap_ST_fsm_state41_blk;
wire    ap_ST_fsm_state42_blk;
wire    ap_ST_fsm_state43_blk;
wire    ap_ST_fsm_state44_blk;
wire    ap_ST_fsm_state45_blk;
wire    ap_ST_fsm_state46_blk;
wire    ap_ST_fsm_state47_blk;
wire    ap_ST_fsm_state48_blk;
wire    ap_ST_fsm_state49_blk;
reg    ap_ST_fsm_state50_blk;
wire    ap_ST_fsm_state51_blk;
reg    ap_ST_fsm_state52_blk;
wire    ap_ST_fsm_state53_blk;
wire    ap_ST_fsm_state54_blk;
wire    ap_ST_fsm_state55_blk;
wire    ap_ST_fsm_state56_blk;
wire    ap_ST_fsm_state57_blk;
wire    ap_ST_fsm_state58_blk;
wire    ap_ST_fsm_state59_blk;
wire    ap_ST_fsm_state60_blk;
wire    ap_ST_fsm_state61_blk;
wire    ap_ST_fsm_state62_blk;
reg    ap_ST_fsm_state63_blk;
wire    ap_ST_fsm_state64_blk;
reg    ap_ST_fsm_state65_blk;
wire    ap_ST_fsm_state66_blk;
wire    ap_ST_fsm_state67_blk;
wire    ap_ST_fsm_state68_blk;
wire    ap_ST_fsm_state69_blk;
wire   [61:0] pp_fu_2297_p00;
wire   [61:0] pp_fu_2297_p10;
reg    ap_condition_3537;
wire   [1:0] tmp_8_fu_2833_p1;
wire   [1:0] tmp_8_fu_2833_p3;
wire  signed [1:0] tmp_8_fu_2833_p5;
wire   [11:0] mask_1_fu_2895_p0;
wire   [1:0] tmp_9_fu_3122_p1;
wire   [1:0] tmp_9_fu_3122_p3;
wire  signed [1:0] tmp_9_fu_3122_p5;
wire   [1:0] tmp_4_fu_3505_p1;
wire   [1:0] tmp_4_fu_3505_p3;
wire  signed [1:0] tmp_4_fu_3505_p5;
wire   [1:0] local_best_9_fu_3625_p1;
wire   [1:0] local_best_9_fu_3625_p3;
wire  signed [1:0] local_best_9_fu_3625_p5;
wire   [1:0] lx_9_fu_3651_p1;
wire   [1:0] lx_9_fu_3651_p3;
wire  signed [1:0] lx_9_fu_3651_p5;
wire   [1:0] ly_9_fu_3671_p1;
wire   [1:0] ly_9_fu_3671_p3;
wire  signed [1:0] ly_9_fu_3671_p5;
wire   [1:0] lz_9_fu_3691_p1;
wire   [1:0] lz_9_fu_3691_p3;
wire  signed [1:0] lz_9_fu_3691_p5;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 69'd1;
#0 grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg = 1'b0;
#0 groups_2_fu_430 = 32'd0;
#0 groups_1_fu_426 = 32'd0;
#0 groups_fu_422 = 32'd0;
#0 empty_81_fu_418 = 32'd0;
#0 empty_80_fu_414 = 32'd0;
#0 empty_fu_410 = 32'd0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg = 1'b0;
#0 grp_cordic_fu_2185_ap_start_reg = 1'b0;
#0 grp_udiv_fu_2193_ap_start_reg = 1'b0;
#0 grp_evaluate_fu_2200_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg = 1'b0;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg = 1'b0;
#0 o_slot_fu_398 = 4'd0;
#0 mask_fu_402 = 12'd0;
#0 count_fu_406 = 32'd0;
#0 sg_fu_502 = 64'd0;
#0 sg_1_fu_506 = 64'd0;
#0 sg_2_fu_510 = 64'd0;
#0 g_fu_514 = 2'd0;
#0 reciprocal_idx53_val97_fu_518 = 32'd0;
#0 reciprocal_idx54_val99_fu_522 = 32'd0;
#0 reciprocal_idx55_val101_fu_526 = 32'd0;
#0 n_fu_530 = 17'd0;
#0 seeds_x_fu_534 = 32'd0;
#0 seeds_x_1_fu_538 = 32'd0;
#0 seeds_x_2_fu_542 = 32'd0;
#0 seeds_y_fu_546 = 32'd0;
#0 seeds_y_1_fu_550 = 32'd0;
#0 seeds_y_2_fu_554 = 32'd0;
#0 seeds_z_fu_558 = 32'd0;
#0 seeds_z_1_fu_562 = 32'd0;
#0 seeds_z_2_fu_566 = 32'd0;
#0 seeds_score_fu_570 = 32'd0;
#0 seeds_score_1_fu_574 = 32'd0;
#0 seeds_score_2_fu_578 = 32'd0;
#0 k_fu_582 = 2'd0;
#0 bx_fu_586 = 32'd0;
#0 by_fu_590 = 32'd0;
#0 bz_fu_594 = 32'd0;
#0 best_fu_598 = 32'd0;
#0 best_raw_fu_602 = 64'd0;
#0 found_fu_606 = 1'd0;
#0 empty_82_fu_610 = 64'd0;
#0 empty_83_fu_614 = 64'd0;
#0 empty_84_fu_618 = 64'd0;
end

joint_search_hls_r18_PHASE_MM_ROM_AUTO_1R #(
    .DataWidth( 26 ),
    .AddressRange( 266 ),
    .AddressWidth( 9 ))
r18_PHASE_MM_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_PHASE_MM_address0),
    .ce0(r18_PHASE_MM_ce0_local),
    .q0(r18_PHASE_MM_q0)
);

joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 120 ),
    .AddressWidth( 7 ))
r18_PAIRS_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_PAIRS_address0),
    .ce0(r18_PAIRS_ce0_local),
    .q0(r18_PAIRS_q0)
);

joint_search_hls_trace_RAM_AUTO_1R1W #(
    .DataWidth( 40 ),
    .AddressRange( 266 ),
    .AddressWidth( 9 ))
trace_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(trace_address0),
    .ce0(trace_ce0),
    .we0(trace_we0),
    .d0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0),
    .q0(trace_q0),
    .address1(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1),
    .ce1(trace_ce1),
    .q1(trace_q1)
);

joint_search_hls_weights_RAM_AUTO_1R1W #(
    .DataWidth( 20 ),
    .AddressRange( 266 ),
    .AddressWidth( 9 ))
weights_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(weights_address0),
    .ce0(weights_ce0),
    .we0(weights_we0),
    .d0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0),
    .q0(weights_q0)
);

joint_search_hls_blocked_RAM_AUTO_1R1W #(
    .DataWidth( 1 ),
    .AddressRange( 266 ),
    .AddressWidth( 9 ))
blocked_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(blocked_address0),
    .ce0(blocked_ce0),
    .we0(blocked_we0),
    .d0(blocked_d0),
    .q0(blocked_q0),
    .address1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1),
    .ce1(blocked_ce1),
    .we1(blocked_we1),
    .d1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1)
);

joint_search_hls_chosen_RAM_AUTO_1R1W #(
    .DataWidth( 9 ),
    .AddressRange( 12 ),
    .AddressWidth( 4 ))
chosen_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(chosen_address0),
    .ce0(chosen_ce0),
    .we0(chosen_we0),
    .d0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0),
    .q0(chosen_q0)
);

joint_search_hls_obs_RAM_1P_BRAM_1R1W #(
    .DataWidth( 78 ),
    .AddressRange( 1440 ),
    .AddressWidth( 11 ))
obs_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(obs_address0),
    .ce0(obs_ce0),
    .we0(obs_we0_local),
    .d0(or_ln101_3_fu_2964_p8),
    .q0(obs_q0)
);

joint_search_hls_joint_search_hls_Pipeline_1 grp_joint_search_hls_Pipeline_1_fu_2146(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_1_fu_2146_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_1_fu_2146_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_1_fu_2146_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready),
    .groups_2_out(grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out),
    .groups_2_out_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld),
    .groups_1_out(grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out),
    .groups_1_out_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld),
    .groups_out(grp_joint_search_hls_Pipeline_1_fu_2146_groups_out),
    .groups_out_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld),
    .p_out(grp_joint_search_hls_Pipeline_1_fu_2146_p_out),
    .p_out_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld),
    .p_out1(grp_joint_search_hls_Pipeline_1_fu_2146_p_out1),
    .p_out1_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld),
    .p_out2(grp_joint_search_hls_Pipeline_1_fu_2146_p_out2),
    .p_out2_ap_vld(grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2 grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready),
    .covariance_address0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0),
    .covariance_ce0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0),
    .covariance_q0(covariance_q0),
    .trace_address0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0),
    .trace_ce0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0),
    .trace_we0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0),
    .trace_d0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0),
    .blocked_address0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0),
    .blocked_ce0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0),
    .blocked_we0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0),
    .blocked_d0(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0)
);

joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3 grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start),
    .ap_done(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done),
    .ap_idle(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_idle),
    .ap_ready(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready),
    .trace_address0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0),
    .trace_ce0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0),
    .trace_q0(trace_q0),
    .trace_address1(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1),
    .trace_ce1(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1),
    .trace_q1(trace_q1),
    .weights_address0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0),
    .weights_ce0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0),
    .weights_we0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0),
    .weights_d0(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0),
    .grp_udiv_fu_2193_p_din1(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1),
    .grp_udiv_fu_2193_p_din2(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2),
    .grp_udiv_fu_2193_p_dout0(grp_udiv_fu_2193_ap_return),
    .grp_udiv_fu_2193_p_start(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start),
    .grp_udiv_fu_2193_p_ready(grp_udiv_fu_2193_ap_ready),
    .grp_udiv_fu_2193_p_done(grp_udiv_fu_2193_ap_done),
    .grp_udiv_fu_2193_p_idle(grp_udiv_fu_2193_ap_idle)
);

joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4 grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start),
    .ap_done(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done),
    .ap_idle(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_idle),
    .ap_ready(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready),
    .chosen_address0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0),
    .chosen_ce0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0),
    .chosen_we0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0),
    .chosen_d0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0),
    .blocked_address0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0),
    .blocked_ce0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0),
    .blocked_we0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0),
    .blocked_d0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0),
    .blocked_q0(blocked_q0),
    .blocked_address1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1),
    .blocked_ce1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1),
    .blocked_we1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1),
    .blocked_d1(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1),
    .weights_address0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0),
    .weights_ce0(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0),
    .weights_q0(weights_q0)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8 grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready),
    .mask(mask_load_reg_5449),
    .frequencies_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out),
    .frequencies_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out_ap_vld)
);

joint_search_hls_cordic grp_cordic_fu_2185(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_cordic_fu_2185_ap_start),
    .ap_done(grp_cordic_fu_2185_ap_done),
    .ap_idle(grp_cordic_fu_2185_ap_idle),
    .ap_ready(grp_cordic_fu_2185_ap_ready),
    .vx(re_reg_5530),
    .vy(im_reg_5536),
    .ap_return(grp_cordic_fu_2185_ap_return)
);

joint_search_hls_udiv grp_udiv_fu_2193(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_udiv_fu_2193_ap_start),
    .ap_done(grp_udiv_fu_2193_ap_done),
    .ap_idle(grp_udiv_fu_2193_ap_idle),
    .ap_ready(grp_udiv_fu_2193_ap_ready),
    .n(grp_udiv_fu_2193_n),
    .d(grp_udiv_fu_2193_d),
    .ap_return(grp_udiv_fu_2193_ap_return)
);

joint_search_hls_evaluate grp_evaluate_fu_2200(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_evaluate_fu_2200_ap_start),
    .ap_done(grp_evaluate_fu_2200_ap_done),
    .ap_idle(grp_evaluate_fu_2200_ap_idle),
    .ap_ready(grp_evaluate_fu_2200_ap_ready),
    .x(grp_evaluate_fu_2200_x),
    .y(grp_evaluate_fu_2200_y),
    .z(grp_evaluate_fu_2200_z),
    .obs_address0(grp_evaluate_fu_2200_obs_address0),
    .obs_ce0(grp_evaluate_fu_2200_obs_ce0),
    .obs_q0(obs_q0),
    .count(trunc_ln90_reg_5576),
    .baseline_two(baseline_two_read_reg_5406),
    .reciprocal_0_0_val(reg_2464),
    .reciprocal_0_1_val(reg_2469),
    .reciprocal_0_2_val(reg_2474),
    .ap_return_0(grp_evaluate_fu_2200_ap_return_0),
    .ap_return_1(grp_evaluate_fu_2200_ap_return_1),
    .ap_return_2(grp_evaluate_fu_2200_ap_return_2),
    .ap_return_3(grp_evaluate_fu_2200_ap_return_3)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12 grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready),
    .seeds_x(seeds_x_load_reg_5899),
    .seeds_x_1(seeds_x_1_load_reg_5904),
    .seeds_x_2(seeds_x_2_load_reg_5909),
    .sext_ln116(cx_reg_5848),
    .seeds_y(seeds_y_load_reg_5914),
    .seeds_y_1(seeds_y_1_load_reg_5919),
    .seeds_y_2(seeds_y_2_load_reg_5924),
    .sext_ln116_1(cy_reg_5861),
    .seeds_z(seeds_z_load_reg_5929),
    .seeds_z_1(seeds_z_1_load_reg_5934),
    .seeds_z_2(seeds_z_2_load_reg_5939),
    .sext_ln116_2(cz_reg_5874),
    .seeds_score(seeds_score_load_reg_5944),
    .seeds_score_1(seeds_score_1_load_reg_5950),
    .seeds_score_2(seeds_score_2_load_reg_5956),
    .near_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out),
    .near_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out_ap_vld),
    .worst_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out),
    .worst_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out_ap_vld)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_134_14 grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready),
    .empty_67(empty_84_fu_618),
    .empty_68(empty_83_fu_614),
    .empty(empty_82_fu_610),
    .sg_load(reg_2496),
    .sg_1_load(reg_2503),
    .sg_2_load(reg_2510),
    .p_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out),
    .p_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out_ap_vld),
    .p_out1(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1),
    .p_out1_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1_ap_vld),
    .p_out2(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2),
    .p_out2_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2_ap_vld)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_150_17 grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready),
    .empty_65(empty_88_reg_1038),
    .empty_66(empty_89_reg_1050),
    .empty(empty_90_reg_1062),
    .sg_load_2(reg_2496),
    .sg_1_load_2(reg_2503),
    .sg_2_load_2(reg_2510),
    .p_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out),
    .p_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out_ap_vld),
    .p_out1(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1),
    .p_out1_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1_ap_vld),
    .p_out2(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2),
    .p_out2_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2_ap_vld)
);

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_166_20 grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready),
    .empty_63(empty_97_reg_1697),
    .empty_64(empty_98_reg_1709),
    .empty(empty_99_reg_1721),
    .sg_load_1(reg_2496),
    .sg_1_load_1(reg_2503),
    .sg_2_load_1(reg_2510),
    .p_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out),
    .p_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out_ap_vld),
    .p_out1(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1),
    .p_out1_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1_ap_vld),
    .p_out2(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2),
    .p_out2_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2_ap_vld)
);

joint_search_hls_mul_14ns_32s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 46 ))
mul_14ns_32s_46_1_1_U190(
    .din0(mul_ln160_fu_2285_p0),
    .din1(mul_ln160_fu_2285_p1),
    .dout(mul_ln160_fu_2285_p2)
);

joint_search_hls_mul_14ns_32s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 46 ))
mul_14ns_32s_46_1_1_U191(
    .din0(mul_ln161_fu_2289_p0),
    .din1(mul_ln161_fu_2289_p1),
    .dout(mul_ln161_fu_2289_p2)
);

joint_search_hls_mul_14ns_32s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 14 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 46 ))
mul_14ns_32s_46_1_1_U192(
    .din0(mul_ln162_fu_2293_p0),
    .din1(mul_ln162_fu_2293_p1),
    .dout(mul_ln162_fu_2293_p2)
);

joint_search_hls_mul_31ns_31ns_62_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 31 ),
    .dout_WIDTH( 62 ))
mul_31ns_31ns_62_1_1_U193(
    .din0(pp_fu_2297_p0),
    .din1(pp_fu_2297_p1),
    .dout(pp_fu_2297_p2)
);

joint_search_hls_mul_32ns_32ns_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32ns_32ns_64_1_1_U194(
    .din0(hh_fu_2301_p0),
    .din1(hh_fu_2301_p1),
    .dout(hh_fu_2301_p2)
);

joint_search_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U195(
    .din0(grp_fu_2305_p0),
    .din1(grp_fu_2305_p1),
    .dout(grp_fu_2305_p2)
);

joint_search_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U196(
    .din0(grp_fu_2309_p0),
    .din1(grp_fu_2309_p1),
    .dout(grp_fu_2309_p2)
);

joint_search_hls_mul_32s_32ns_62_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 62 ))
mul_32s_32ns_62_1_1_U197(
    .din0(grp_cordic_fu_2185_ap_return),
    .din1(phase_fu_2313_p1),
    .dout(phase_fu_2313_p2)
);

joint_search_hls_mul_46s_48ns_93_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 48 ),
    .dout_WIDTH( 93 ))
mul_46s_48ns_93_1_1_U198(
    .din0(add_ln160_reg_6305),
    .din1(mul_ln160_1_fu_2318_p1),
    .dout(mul_ln160_1_fu_2318_p2)
);

joint_search_hls_mul_46s_48ns_93_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 48 ),
    .dout_WIDTH( 93 ))
mul_46s_48ns_93_1_1_U199(
    .din0(add_ln161_reg_6316),
    .din1(mul_ln161_1_fu_2323_p1),
    .dout(mul_ln161_1_fu_2323_p2)
);

joint_search_hls_mul_46s_48ns_93_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 46 ),
    .din1_WIDTH( 48 ),
    .dout_WIDTH( 93 ))
mul_46s_48ns_93_1_1_U200(
    .din0(add_ln162_fu_4767_p2),
    .din1(mul_ln162_1_fu_2328_p1),
    .dout(mul_ln162_1_fu_2328_p2)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U201(
    .din0(groups_fu_422),
    .din1(groups_1_fu_426),
    .din2(groups_2_fu_430),
    .def(tmp_8_fu_2833_p7),
    .sel(o_group_fu_2825_p3),
    .dout(tmp_8_fu_2833_p9)
);

joint_search_hls_bitset_12ns_12ns_32ns_1s_12_1_1 #(
    .DATAWIDTH( 12 ),
    .ADDRWIDTH( 32 ))
bitset_12ns_12ns_32ns_1s_12_1_1_U202(
    .din(mask_fu_402),
    .sel(s_1_cast51_reg_5486),
    .value(1'd1),
    .dout(mask_1_fu_2895_p4)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U203(
    .din0(groups_fu_422),
    .din1(groups_1_fu_426),
    .din2(groups_2_fu_430),
    .def(tmp_9_fu_3122_p7),
    .sel(g_fu_514),
    .dout(tmp_9_fu_3122_p9)
);

joint_search_hls_mul_16s_16s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_16s_16s_32_1_1_U204(
    .din0(xx_fu_3387_p0),
    .din1(xx_fu_3387_p1),
    .dout(xx_fu_3387_p2)
);

joint_search_hls_mul_16s_16s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mul_16s_16s_32_1_1_U205(
    .din0(yy_fu_3393_p0),
    .din1(yy_fu_3393_p1),
    .dout(yy_fu_3393_p2)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U206(
    .din0(seeds_score_load_reg_5944),
    .din1(seeds_score_1_load_reg_5950),
    .din2(seeds_score_2_load_reg_5956),
    .def(tmp_4_fu_3505_p7),
    .sel(tmp_4_fu_3505_p8),
    .dout(tmp_4_fu_3505_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U207(
    .din0(seeds_score_fu_570),
    .din1(seeds_score_1_fu_574),
    .din2(seeds_score_2_fu_578),
    .def(local_best_9_fu_3625_p7),
    .sel(k_fu_582),
    .dout(local_best_9_fu_3625_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U208(
    .din0(seeds_x_fu_534),
    .din1(seeds_x_1_fu_538),
    .din2(seeds_x_2_fu_542),
    .def(lx_9_fu_3651_p7),
    .sel(k_fu_582),
    .dout(lx_9_fu_3651_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U209(
    .din0(seeds_y_fu_546),
    .din1(seeds_y_1_fu_550),
    .din2(seeds_y_2_fu_554),
    .def(ly_9_fu_3671_p7),
    .sel(k_fu_582),
    .dout(ly_9_fu_3671_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U210(
    .din0(seeds_z_fu_558),
    .din1(seeds_z_1_fu_562),
    .din2(seeds_z_2_fu_566),
    .def(lz_9_fu_3691_p7),
    .sel(k_fu_582),
    .dout(lz_9_fu_3691_p9)
);

joint_search_hls_urem_7ns_4ns_3_11_seq_1 #(
    .ID( 1 ),
    .NUM_STAGE( 11 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 4 ),
    .dout_WIDTH( 3 ))
urem_7ns_4ns_3_11_seq_1_U211(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .start(grp_fu_4251_ap_start),
    .done(grp_fu_4251_ap_done),
    .din0(grp_fu_4251_p0),
    .din1(grp_fu_4251_p1),
    .ce(1'b1),
    .dout(grp_fu_4251_p2)
);

joint_search_hls_urem_6ns_4ns_3_10_seq_1 #(
    .ID( 1 ),
    .NUM_STAGE( 10 ),
    .din0_WIDTH( 6 ),
    .din1_WIDTH( 4 ),
    .dout_WIDTH( 3 ))
urem_6ns_4ns_3_10_seq_1_U212(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .start(grp_fu_4287_ap_start),
    .done(grp_fu_4287_ap_done),
    .din0(grp_fu_4287_p0),
    .din1(grp_fu_4287_p1),
    .ce(1'b1),
    .dout(grp_fu_4287_p2)
);

joint_search_hls_mac_muladd_11ns_5s_32s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 5 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mac_muladd_11ns_5s_32s_32_4_1_U213(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_5206_p0),
    .din1(ix_2_fu_4293_p3),
    .din2(lx_reg_951),
    .ce(1'b1),
    .dout(grp_fu_5206_p3)
);

joint_search_hls_mac_muladd_11ns_3s_32s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 3 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mac_muladd_11ns_3s_32s_32_4_1_U214(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_5213_p0),
    .din1(iz_2_fu_4324_p3),
    .din2(lz_reg_931),
    .ce(1'b1),
    .dout(grp_fu_5213_p3)
);

joint_search_hls_mac_muladd_11ns_3s_32s_32_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 3 ),
    .din2_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mac_muladd_11ns_3s_32s_32_4_1_U215(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_5222_p0),
    .din1(iy_2_fu_4387_p3),
    .din2(ly_reg_941),
    .ce(1'b1),
    .dout(grp_fu_5222_p3)
);

joint_search_hls_mac_muladd_7ns_6s_14s_14_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 6 ),
    .din2_WIDTH( 14 ),
    .dout_WIDTH( 14 ))
mac_muladd_7ns_6s_14s_14_4_1_U216(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_5229_p0),
    .din1(n_4_reg_1733),
    .din2(14'd10000),
    .ce(1'b1),
    .dout(grp_fu_5229_p3)
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
        grp_cordic_fu_2185_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state15)) begin
            grp_cordic_fu_2185_ap_start_reg <= 1'b1;
        end else if ((grp_cordic_fu_2185_ap_ready == 1'b1)) begin
            grp_cordic_fu_2185_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_evaluate_fu_2200_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state62) | (1'b1 == ap_CS_fsm_state49) | (1'b1 == ap_CS_fsm_state28) | (1'b1 == ap_CS_fsm_state24))) begin
            grp_evaluate_fu_2200_ap_start_reg <= 1'b1;
        end else if ((grp_evaluate_fu_2200_ap_ready == 1'b1)) begin
            grp_evaluate_fu_2200_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln90_fu_2539_p2 == 1'd1))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state24)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln134_fu_4127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state30))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln150_fu_4492_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state51))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln166_fu_5021_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state64))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_udiv_fu_2193_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd0))) begin
            grp_udiv_fu_2193_ap_start_reg <= 1'b1;
        end else if ((grp_udiv_fu_2193_ap_ready == 1'b1)) begin
            grp_udiv_fu_2193_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        best_4_ph_reg_826 <= local_best_9_reg_6022;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        best_4_ph_reg_826 <= best_fu_598;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        best_4_reg_972 <= ap_phi_mux_best_4_ph_phi_fu_829_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        best_4_reg_972 <= best_6_reg_1157;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        best_5_reg_1653 <= best_4_reg_972;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        best_5_reg_1653 <= best_9_reg_1817;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        best_6_reg_1157 <= ap_phi_mux_best_7_phi_fu_1403_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        best_6_reg_1157 <= best_4_reg_972;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        best_7_reg_1399 <= reg_2479;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        best_7_reg_1399 <= best_6_reg_1157;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        best_8_reg_1991 <= score_2_reg_6409;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        best_8_reg_1991 <= best_9_reg_1817;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        best_9_reg_1817 <= best_8_reg_1991;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        best_9_reg_1817 <= best_5_reg_1653;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        best_fu_598 <= 32'd2147483649;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        best_fu_598 <= best_5_reg_1653;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        best_raw_2_ph_reg_816 <= best_raw_11_reg_6093;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        best_raw_2_ph_reg_816 <= best_raw_fu_602;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        best_raw_2_reg_961 <= ap_phi_mux_best_raw_2_ph_phi_fu_819_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        best_raw_2_reg_961 <= best_raw_4_reg_1145;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        best_raw_3_reg_1642 <= best_raw_2_reg_961;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        best_raw_3_reg_1642 <= best_raw_8_reg_1805;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        best_raw_4_reg_1145 <= ap_phi_mux_best_raw_5_phi_fu_1424_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        best_raw_4_reg_1145 <= best_raw_2_reg_961;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        best_raw_5_reg_1420 <= best_raw_12_reg_6244;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        best_raw_5_reg_1420 <= best_raw_4_reg_1145;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        best_raw_7_reg_2012 <= best_raw_13_reg_6445;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        best_raw_7_reg_2012 <= best_raw_8_reg_1805;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        best_raw_8_reg_1805 <= best_raw_7_reg_2012;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        best_raw_8_reg_1805 <= best_raw_3_reg_1642;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        best_raw_fu_602 <= 64'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        best_raw_fu_602 <= best_raw_3_reg_1642;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        bx_2_ph_reg_856 <= lx_9_reg_6033;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        bx_2_ph_reg_856 <= bx_fu_586;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        bx_2_reg_1005 <= ap_phi_mux_bx_2_ph_phi_fu_859_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        bx_2_reg_1005 <= bx_4_reg_1193;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        bx_3_reg_1686 <= bx_2_reg_1005;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        bx_3_reg_1686 <= bx_8_reg_1853;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        bx_4_reg_1193 <= ap_phi_mux_bx_5_phi_fu_1340_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        bx_4_reg_1193 <= bx_2_reg_1005;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        bx_5_reg_1336 <= cx_1_reg_6168;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        bx_5_reg_1336 <= bx_4_reg_1193;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        bx_7_reg_1928 <= cx_2_reg_6371;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        bx_7_reg_1928 <= bx_8_reg_1853;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        bx_8_reg_1853 <= bx_7_reg_1928;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        bx_8_reg_1853 <= bx_3_reg_1686;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        bx_fu_586 <= 32'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        bx_fu_586 <= bx_3_reg_1686;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        by_2_ph_reg_846 <= ly_9_reg_6040;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        by_2_ph_reg_846 <= by_fu_590;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        by_2_reg_994 <= ap_phi_mux_by_2_ph_phi_fu_849_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        by_2_reg_994 <= by_4_reg_1181;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        by_3_reg_1675 <= by_2_reg_994;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        by_3_reg_1675 <= by_8_reg_1841;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        by_4_reg_1181 <= ap_phi_mux_by_5_phi_fu_1361_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        by_4_reg_1181 <= by_2_reg_994;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        by_5_reg_1357 <= cy_1_reg_6199;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        by_5_reg_1357 <= by_4_reg_1181;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        by_7_reg_1949 <= cy_2_reg_6380;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        by_7_reg_1949 <= by_8_reg_1841;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        by_8_reg_1841 <= by_7_reg_1949;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        by_8_reg_1841 <= by_3_reg_1675;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        by_fu_590 <= 32'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        by_fu_590 <= by_3_reg_1675;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        bz_2_ph_reg_836 <= lz_9_reg_6047;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        bz_2_ph_reg_836 <= bz_fu_594;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        bz_2_reg_983 <= ap_phi_mux_bz_2_ph_phi_fu_839_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        bz_2_reg_983 <= bz_4_reg_1169;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        bz_3_reg_1664 <= bz_2_reg_983;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        bz_3_reg_1664 <= bz_8_reg_1829;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        bz_4_reg_1169 <= ap_phi_mux_bz_5_phi_fu_1382_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        bz_4_reg_1169 <= bz_2_reg_983;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        bz_5_reg_1378 <= cz_1_reg_6177;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        bz_5_reg_1378 <= bz_4_reg_1169;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        bz_7_reg_1970 <= cz_2_reg_6389;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        bz_7_reg_1970 <= bz_8_reg_1829;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        bz_8_reg_1829 <= bz_7_reg_1970;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        bz_8_reg_1829 <= bz_3_reg_1664;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        bz_fu_594 <= 32'd1000;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        bz_fu_594 <= bz_3_reg_1664;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        count_fu_406 <= 32'd0;
    end else if (((1'b0 == ap_block_state16_on_subcall_done) & (1'd1 == and_ln98_1_reg_5558) & (icmp_ln98_reg_5562 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        count_fu_406 <= count_1_fu_2953_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        empty_100_reg_1865 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        empty_100_reg_1865 <= empty_97_reg_1697;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        empty_101_reg_1886 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        empty_101_reg_1886 <= empty_98_reg_1709;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        empty_102_reg_1907 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        empty_102_reg_1907 <= empty_99_reg_1721;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        empty_80_fu_414 <= groups_5_fu_2879_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_80_fu_414 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        empty_81_fu_418 <= groups_4_fu_2871_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_81_fu_418 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        empty_82_fu_610 <= 64'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        empty_82_fu_610 <= empty_96_reg_1565;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        empty_83_fu_614 <= 64'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        empty_83_fu_614 <= empty_95_reg_1554;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        empty_84_fu_618 <= 64'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        empty_84_fu_618 <= empty_94_reg_1543;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        empty_85_reg_866 <= ap_phi_mux_p_ph_phi_fu_778_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        empty_85_reg_866 <= empty_88_reg_1038;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        empty_86_reg_877 <= ap_phi_mux_p_ph305_phi_fu_788_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        empty_86_reg_877 <= empty_89_reg_1050;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        empty_87_reg_888 <= ap_phi_mux_p_ph306_phi_fu_798_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        empty_87_reg_888 <= empty_90_reg_1062;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        empty_88_reg_1038 <= ap_phi_mux_empty_91_phi_fu_1277_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        empty_88_reg_1038 <= empty_85_reg_866;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        empty_89_reg_1050 <= ap_phi_mux_empty_92_phi_fu_1298_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        empty_89_reg_1050 <= empty_86_reg_877;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        empty_90_reg_1062 <= ap_phi_mux_empty_93_phi_fu_1319_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        empty_90_reg_1062 <= empty_87_reg_888;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        empty_91_reg_1273 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        empty_91_reg_1273 <= empty_88_reg_1038;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        empty_92_reg_1294 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        empty_92_reg_1294 <= empty_89_reg_1050;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        empty_93_reg_1315 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        empty_93_reg_1315 <= empty_90_reg_1062;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        empty_94_reg_1543 <= empty_85_reg_866;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        empty_94_reg_1543 <= empty_97_reg_1697;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        empty_95_reg_1554 <= empty_86_reg_877;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        empty_95_reg_1554 <= empty_98_reg_1709;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        empty_96_reg_1565 <= empty_87_reg_888;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        empty_96_reg_1565 <= empty_99_reg_1721;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        empty_97_reg_1697 <= empty_100_reg_1865;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        empty_97_reg_1697 <= empty_94_reg_1543;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        empty_98_reg_1709 <= empty_101_reg_1886;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        empty_98_reg_1709 <= empty_95_reg_1554;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        empty_99_reg_1721 <= empty_102_reg_1907;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        empty_99_reg_1721 <= empty_96_reg_1565;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        empty_fu_410 <= groups_6_fu_2887_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_fu_410 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        found_1_ph_reg_805 <= 1'd1;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        found_1_ph_reg_805 <= found_fu_606;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        found_1_reg_899 <= ap_phi_mux_found_1_ph_phi_fu_808_p4;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        found_1_reg_899 <= found_3_reg_1074;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        found_2_reg_1576 <= found_1_reg_899;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        found_2_reg_1576 <= found_7_reg_1745;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        found_3_reg_1074 <= ap_phi_mux_found_4_phi_fu_1525_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        found_3_reg_1074 <= found_1_reg_899;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        found_4_reg_1521 <= 1'd1;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        found_4_reg_1521 <= found_3_reg_1074;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        found_6_reg_2113 <= 1'd1;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        found_6_reg_2113 <= found_7_reg_1745;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        found_7_reg_1745 <= found_6_reg_2113;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        found_7_reg_1745 <= found_2_reg_1576;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        found_fu_606 <= 1'd0;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd1))) begin
        found_fu_606 <= found_2_reg_1576;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state18) & (or_ln107_3_fu_3096_p2 == 1'd0))) begin
        g_fu_514 <= 2'd0;
    end else if (((grp_udiv_fu_2193_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state20))) begin
        g_fu_514 <= add_ln108_reg_5630;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        groups_1_fu_426 <= groups_5_fu_2879_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        groups_1_fu_426 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        groups_2_fu_430 <= groups_4_fu_2871_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        groups_2_fu_430 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
        groups_fu_422 <= groups_6_fu_2887_p3;
    end else if (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        groups_fu_422 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
        k_fu_582 <= 2'd0;
    end else if (((1'b1 == ap_CS_fsm_state54) & ((icmp_ln131_reg_6029 == 1'd1) | (icmp_ln155_fu_4550_p2 == 1'd1)))) begin
        k_fu_582 <= add_ln130_reg_6017;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        level_1_reg_1587 <= 2'd0;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        level_1_reg_1587 <= level_3_reg_6262;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        level_reg_910 <= 3'd0;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        level_reg_910 <= level_2_reg_6101;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        local_best_1_reg_1598 <= local_best_reg_921;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        local_best_1_reg_1598 <= local_best_5_reg_1757;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        local_best_2_reg_1097 <= ap_phi_mux_local_best_3_phi_fu_1505_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        local_best_2_reg_1097 <= local_best_reg_921;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51))) begin
        local_best_3_reg_1501 <= local_best_7_fu_4484_p3;
    end else if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        local_best_3_reg_1501 <= local_best_7_reg_6234;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        local_best_3_reg_1501 <= local_best_2_reg_1097;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64))) begin
        local_best_4_reg_2093 <= local_best_8_fu_5014_p3;
    end else if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        local_best_4_reg_2093 <= local_best_8_reg_6435;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        local_best_4_reg_2093 <= local_best_5_reg_1757;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        local_best_5_reg_1757 <= local_best_4_reg_2093;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        local_best_5_reg_1757 <= local_best_1_reg_1598;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        local_best_reg_921 <= local_best_9_reg_6022;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        local_best_reg_921 <= local_best_2_reg_1097;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        lx_10_reg_1631 <= lx_reg_951;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        lx_10_reg_1631 <= lx_6_reg_1793;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51))) begin
        lx_3_reg_1441 <= lx_7_fu_4463_p3;
    end else if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        lx_3_reg_1441 <= lx_7_reg_6216;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        lx_3_reg_1441 <= lx_4_reg_1133;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        lx_4_reg_1133 <= ap_phi_mux_lx_3_phi_fu_1445_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        lx_4_reg_1133 <= lx_reg_951;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64))) begin
        lx_5_reg_2033 <= lx_8_fu_4993_p3;
    end else if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        lx_5_reg_2033 <= lx_8_reg_6417;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        lx_5_reg_2033 <= lx_6_reg_1793;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        lx_6_reg_1793 <= lx_5_reg_2033;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        lx_6_reg_1793 <= lx_10_reg_1631;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        lx_reg_951 <= lx_9_reg_6033;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        lx_reg_951 <= lx_4_reg_1133;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        ly_10_reg_1620 <= ly_reg_941;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        ly_10_reg_1620 <= ly_6_reg_1781;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51))) begin
        ly_3_reg_1461 <= ly_7_fu_4470_p3;
    end else if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ly_3_reg_1461 <= ly_7_reg_6222;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        ly_3_reg_1461 <= ly_4_reg_1121;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        ly_4_reg_1121 <= ap_phi_mux_ly_3_phi_fu_1465_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        ly_4_reg_1121 <= ly_reg_941;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64))) begin
        ly_5_reg_2053 <= ly_8_fu_5000_p3;
    end else if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        ly_5_reg_2053 <= ly_8_reg_6423;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        ly_5_reg_2053 <= ly_6_reg_1781;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        ly_6_reg_1781 <= ly_5_reg_2053;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        ly_6_reg_1781 <= ly_10_reg_1620;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        ly_reg_941 <= ly_9_reg_6040;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        ly_reg_941 <= ly_4_reg_1121;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
        lz_10_reg_1609 <= lz_reg_931;
    end else if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
        lz_10_reg_1609 <= lz_6_reg_1769;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51))) begin
        lz_3_reg_1481 <= lz_7_fu_4477_p3;
    end else if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        lz_3_reg_1481 <= lz_7_reg_6228;
    end else if ((((1'd0 == and_ln49_2_reg_6185) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd1) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48)) | ((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_4_fu_4422_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state48)))) begin
        lz_3_reg_1481 <= lz_4_reg_1109;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        lz_4_reg_1109 <= ap_phi_mux_lz_3_phi_fu_1485_p10;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        lz_4_reg_1109 <= lz_reg_931;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64))) begin
        lz_5_reg_2073 <= lz_8_fu_5007_p3;
    end else if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln166_reg_6441 == 1'd1) & (icmp_ln49_8_reg_6405 == 1'd0) & (icmp_ln49_7_reg_6401 == 1'd0) & (1'b1 == ap_CS_fsm_state66))) begin
        lz_5_reg_2073 <= lz_8_reg_6429;
    end else if ((((1'd0 == and_ln49_1_reg_6397) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd1) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61)) | ((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_7_fu_4953_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state61)))) begin
        lz_5_reg_2073 <= lz_6_reg_1769;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        lz_6_reg_1769 <= lz_5_reg_2073;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        lz_6_reg_1769 <= lz_10_reg_1609;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state32)) begin
        lz_reg_931 <= lz_9_reg_6047;
    end else if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        lz_reg_931 <= lz_4_reg_1109;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        mask_fu_402 <= 12'd0;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        mask_fu_402 <= mask_1_reg_5571;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        n_3_reg_1086 <= n_5_reg_6143;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        n_3_reg_1086 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state67)) begin
        n_4_reg_1733 <= add_ln158_reg_6459;
    end else if (((icmp_ln131_reg_6029 == 1'd0) & (1'b1 == ap_CS_fsm_state54) & (icmp_ln155_fu_4550_p2 == 1'd0))) begin
        n_4_reg_1733 <= 6'd44;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        n_fu_530 <= 17'd0;
    end else if ((1'b1 == ap_CS_fsm_state26)) begin
        n_fu_530 <= n_2_reg_5753;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        o_slot_fu_398 <= 4'd0;
    end else if (((1'b1 == ap_CS_fsm_state10) & (icmp_ln92_fu_2601_p2 == 1'd1))) begin
        o_slot_fu_398 <= s_2_reg_5439;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state16_on_subcall_done) & (1'b1 == ap_CS_fsm_state16))) begin
        p_1_reg_763 <= p_reg_5499;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        p_1_reg_763 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        p_ph305_reg_785 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        p_ph305_reg_785 <= empty_83_fu_614;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        p_ph306_reg_795 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        p_ph306_reg_795 <= empty_82_fu_610;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        p_ph_reg_775 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
        p_ph_reg_775 <= empty_84_fu_618;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_mul74_reg_1216 <= add_ln141_2_reg_6130;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_mul74_reg_1216 <= 19'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_mul76_reg_1227 <= add_ln141_1_reg_6125;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_mul76_reg_1227 <= 18'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_mul78_reg_1238 <= add_ln141_reg_6120;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_mul78_reg_1238 <= 18'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_mul_reg_1205 <= add_ln141_3_reg_6135;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_mul_reg_1205 <= 18'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_urem80_reg_1261 <= select_ln129_fu_4522_p3;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_urem80_reg_1261 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state53)) begin
        phi_urem_reg_1249 <= select_ln129_1_fu_4542_p3;
    end else if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        phi_urem_reg_1249 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state68)) begin
                result_local_0_reg_2136[97 : 0] <= tmp_s_fu_5192_p9[97 : 0];
        result_local_0_reg_2136[143 : 100] <= tmp_s_fu_5192_p9[143 : 100];
    end else if (((1'b1 == ap_CS_fsm_state18) & (or_ln107_3_fu_3096_p2 == 1'd1))) begin
                result_local_0_reg_2136[97 : 0] <= zext_ln106_fu_3004_p1[97 : 0];
        result_local_0_reg_2136[143 : 100] <= zext_ln106_fu_3004_p1[143 : 100];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_score_1_fu_574 <= 32'd2147483649;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd1) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_score_1_fu_574 <= reg_2479;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_score_2_fu_578 <= 32'd2147483649;
    end else if ((~(trunc_ln126_fu_3501_p1 == 2'd1) & ~(trunc_ln126_fu_3501_p1 == 2'd0) & (1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_score_2_fu_578 <= reg_2479;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_score_fu_570 <= 32'd2147483649;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd0) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_score_fu_570 <= reg_2479;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_x_1_fu_538 <= 32'd0;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd1) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_x_1_fu_538 <= sext_ln116_reg_5853;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_x_2_fu_542 <= 32'd0;
    end else if ((~(trunc_ln126_fu_3501_p1 == 2'd1) & ~(trunc_ln126_fu_3501_p1 == 2'd0) & (1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_x_2_fu_542 <= sext_ln116_reg_5853;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_x_fu_534 <= 32'd0;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd0) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_x_fu_534 <= sext_ln116_reg_5853;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_y_1_fu_550 <= 32'd0;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd1) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_y_1_fu_550 <= sext_ln116_1_reg_5866;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_y_2_fu_554 <= 32'd0;
    end else if ((~(trunc_ln126_fu_3501_p1 == 2'd1) & ~(trunc_ln126_fu_3501_p1 == 2'd0) & (1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_y_2_fu_554 <= sext_ln116_1_reg_5866;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_y_fu_546 <= 32'd0;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd0) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_y_fu_546 <= sext_ln116_1_reg_5866;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_z_1_fu_562 <= 32'd1000;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd1) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_z_1_fu_562 <= sext_ln116_2_reg_5879;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_z_2_fu_566 <= 32'd1000;
    end else if ((~(trunc_ln126_fu_3501_p1 == 2'd1) & ~(trunc_ln126_fu_3501_p1 == 2'd0) & (1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_z_2_fu_566 <= sext_ln116_2_reg_5879;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
        seeds_z_fu_558 <= 32'd1000;
    end else if (((1'd1 == and_ln49_reg_5887) & (icmp_ln49_2_reg_5895 == 1'd0) & (icmp_ln49_1_reg_5891 == 1'd0) & (1'b1 == ap_CS_fsm_state26) & (trunc_ln126_fu_3501_p1 == 2'd0) & (icmp_ln127_fu_3522_p2 == 1'd1))) begin
        seeds_z_fu_558 <= sext_ln116_2_reg_5879;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        add116_reg_5476[15 : 3] <= add116_fu_2586_p2[15 : 3];
        mul115_reg_5470[15 : 3] <= mul115_fu_2580_p2[15 : 3];
        o_coefficient_reg_5491 <= r18_PHASE_MM_q0;
        s_1_cast51_reg_5486[3 : 0] <= s_1_cast51_fu_2598_p1[3 : 0];
        tobool_reg_5481 <= tobool_fu_2592_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        add_ln108_reg_5630 <= add_ln108_fu_3116_p2;
        conv2_i_i_i1144_reg_5731[31 : 0] <= conv2_i_i_i1144_fu_3152_p1[31 : 0];
        conv_i_i1171_reg_5738[63 : 0] <= conv_i_i1171_fu_3155_p1[63 : 0];
        g_2_reg_5623 <= g_fu_514;
        select_ln114_reg_5745 <= select_ln114_fu_3174_p3;
        sext_ln108_reg_5635 <= sext_ln108_fu_3142_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state27)) begin
        add_ln130_reg_6017 <= add_ln130_fu_3619_p2;
        add_ln170_11_reg_6084[44 : 1] <= add_ln170_11_fu_4106_p2[44 : 1];
        add_ln170_3_reg_6074[44 : 1] <= add_ln170_3_fu_3874_p2[44 : 1];
        add_ln170_7_reg_6079[44 : 1] <= add_ln170_7_fu_3990_p2[44 : 1];
        best_2_reg_5983 <= best_fu_598;
        best_raw_1_reg_5989 <= best_raw_fu_602;
        bx_1_reg_5968 <= bx_fu_586;
        by_1_reg_5973 <= by_fu_590;
        bz_1_reg_5978 <= bz_fu_594;
        found_5_reg_5994 <= found_fu_606;
        icmp_ln131_reg_6029 <= icmp_ln131_fu_3645_p2;
        icmp_ln170_1_reg_6054 <= icmp_ln170_1_fu_3711_p2;
        icmp_ln170_2_reg_6059 <= icmp_ln170_2_fu_3726_p2;
        icmp_ln170_3_reg_6064 <= icmp_ln170_3_fu_3742_p2;
        icmp_ln170_4_reg_6069 <= icmp_ln170_4_fu_3758_p2;
        local_best_9_reg_6022 <= local_best_9_fu_3625_p9;
        lx_9_reg_6033 <= lx_9_fu_3651_p9;
        ly_9_reg_6040 <= ly_9_fu_3671_p9;
        lz_9_reg_6047 <= lz_9_fu_3691_p9;
        p_load302_reg_6009 <= empty_84_fu_618;
        p_load303_reg_6004 <= empty_83_fu_614;
        p_load304_reg_5999 <= empty_82_fu_610;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state34)) begin
        add_ln141_1_reg_6125 <= add_ln141_1_fu_4192_p2;
        add_ln141_2_reg_6130 <= add_ln141_2_fu_4198_p2;
        add_ln141_3_reg_6135 <= add_ln141_3_fu_4204_p2;
        add_ln141_reg_6120 <= add_ln141_fu_4186_p2;
        n_5_reg_6143 <= n_5_fu_4215_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state66)) begin
        add_ln158_reg_6459 <= add_ln158_fu_5035_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state58)) begin
        add_ln160_reg_6305 <= add_ln160_fu_4713_p2;
        add_ln161_reg_6316 <= add_ln161_fu_4726_p2;
        mul_ln162_reg_6327 <= mul_ln162_fu_2293_p2;
        tmp_46_reg_6310 <= add_ln160_fu_4713_p2[32'd45];
        tmp_47_reg_6321 <= add_ln161_fu_4726_p2[32'd45];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        add_ln95_1_reg_5525 <= add_ln95_1_fu_2668_p2;
        pair_reg_5514 <= r18_PAIRS_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state60)) begin
        and_ln49_1_reg_6397 <= and_ln49_1_fu_4923_p2;
        cx_2_reg_6371 <= cx_2_fu_4822_p3;
        cy_2_reg_6380 <= cy_2_fu_4855_p3;
        cz_2_reg_6389 <= cz_2_fu_4888_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state40)) begin
        and_ln49_2_reg_6185 <= and_ln49_2_fu_4362_p2;
        cz_1_reg_6177 <= grp_fu_5213_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state23)) begin
        and_ln49_reg_5887 <= and_ln49_fu_3428_p2;
        cx_reg_5848 <= {{grid_q0[47:32]}};
        cy_reg_5861 <= {{grid_q0[31:16]}};
        cz_reg_5874 <= cz_fu_3379_p1;
        icmp_ln49_1_reg_5891 <= icmp_ln49_1_fu_3456_p2;
        icmp_ln49_2_reg_5895 <= icmp_ln49_2_fu_3473_p2;
        sext_ln116_1_reg_5866 <= sext_ln116_1_fu_3375_p1;
        sext_ln116_2_reg_5879 <= sext_ln116_2_fu_3383_p1;
        sext_ln116_reg_5853 <= sext_ln116_fu_3363_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        and_ln98_1_reg_5558 <= and_ln98_1_fu_2756_p2;
        icmp_ln98_reg_5562 <= icmp_ln98_fu_2789_p2;
        mask_1_reg_5571 <= mask_1_fu_2895_p4;
        o_group_reg_5566 <= o_group_fu_2825_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        baseline_two_read_reg_5406 <= baseline_two;
        fast_mode_read_reg_5396 <= fast_mode;
        grid_count_read_reg_5421 <= grid_count;
        horizontal_mm_read_reg_5416 <= horizontal_mm;
        trunc_ln58_reg_5426 <= trunc_ln58_fu_2532_p1;
        vertical_mm_read_reg_5411 <= vertical_mm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state30)) begin
        best_raw_11_reg_6093 <= grp_fu_2458_p2;
        icmp_ln134_reg_6089 <= icmp_ln134_fu_4127_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state51)) begin
        best_raw_12_reg_6244 <= grp_fu_2458_p2;
        icmp_ln150_reg_6240 <= icmp_ln150_fu_4492_p2;
        local_best_7_reg_6234 <= local_best_7_fu_4484_p3;
        lx_7_reg_6216 <= lx_7_fu_4463_p3;
        ly_7_reg_6222 <= ly_7_fu_4470_p3;
        lz_7_reg_6228 <= lz_7_fu_4477_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        best_raw_13_reg_6445 <= grp_fu_2458_p2;
        icmp_ln166_reg_6441 <= icmp_ln166_fu_5021_p2;
        local_best_8_reg_6435 <= local_best_8_fu_5014_p3;
        lx_8_reg_6417 <= lx_8_fu_4993_p3;
        ly_8_reg_6423 <= ly_8_fu_5000_p3;
        lz_8_reg_6429 <= lz_8_fu_5007_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state54)) begin
        conv576_cast_cast_reg_6272[45 : 4] <= conv576_cast_cast_fu_4608_p3[45 : 4];
        level_3_reg_6262 <= level_3_fu_4556_p2;
        lx_10_cast_reg_6267 <= lx_10_cast_fu_4596_p1;
        ly_10_cast_reg_6277 <= ly_10_cast_fu_4616_p1;
        select_ln162_reg_6282[45 : 4] <= select_ln162_fu_4628_p3[45 : 4];
        sext_ln158_reg_6292 <= sext_ln158_fu_4644_p1;
        zext_ln162_reg_6287[3 : 0] <= zext_ln162_fu_4640_p1[3 : 0];
zext_ln162_reg_6287[6 : 5] <= zext_ln162_fu_4640_p1[6 : 5];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state37)) begin
        cx_1_reg_6168 <= grp_fu_5206_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state47)) begin
        cy_1_reg_6199 <= grp_fu_5222_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        f_reg_5454 <= chosen_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state48)) begin
        icmp_ln49_4_reg_6208 <= icmp_ln49_4_fu_4422_p2;
        icmp_ln49_6_reg_6212 <= icmp_ln49_6_fu_4436_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state61)) begin
        icmp_ln49_7_reg_6401 <= icmp_ln49_7_fu_4953_p2;
        icmp_ln49_8_reg_6405 <= icmp_ln49_8_fu_4967_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        icmp_ln96_reg_5552 <= icmp_ln96_fu_2697_p2;
        trunc_ln95_1_reg_5547 <= trunc_ln95_1_fu_2693_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        im_reg_5536 <= {{covariance_q0[63:32]}};
        re_reg_5530 <= re_fu_2673_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state33)) begin
        level_2_reg_6101 <= level_2_fu_4152_p2;
        zext_ln138_1_reg_6115[10 : 0] <= zext_ln138_1_fu_4182_p1[10 : 0];
        zext_ln138_reg_6109[10 : 0] <= zext_ln138_fu_4178_p1[10 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        mask_load_reg_5449 <= mask_fu_402;
        s_2_reg_5439 <= s_2_fu_2545_p2;
        s_reg_5431 <= o_slot_fu_398;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state59)) begin
        mul_ln160_1_reg_6332 <= mul_ln160_1_fu_2318_p2;
        mul_ln161_1_reg_6343 <= mul_ln161_1_fu_2323_p2;
        mul_ln162_1_reg_6354 <= mul_ln162_1_fu_2328_p2;
        tmp_10_cast_reg_6337 <= {{mul_ln160_1_fu_2318_p2[91:60]}};
        tmp_14_cast_reg_6348 <= {{mul_ln161_1_fu_2323_p2[91:60]}};
        tmp_18_cast_reg_6365 <= {{mul_ln162_1_fu_2328_p2[91:60]}};
        tmp_48_reg_6359 <= add_ln162_fu_4767_p2[32'd45];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
        n_2_reg_5753 <= n_2_fu_3277_p2;
        select_ln130_reg_5843[1] <= select_ln130_fu_3298_p3[1];
select_ln130_reg_5843[3] <= select_ln130_fu_3298_p3[3];
select_ln130_reg_5843[5] <= select_ln130_fu_3298_p3[5];
select_ln130_reg_5843[8] <= select_ln130_fu_3298_p3[8];
        select_ln135_cast_cast_reg_5833[0] <= select_ln135_cast_cast_fu_3288_p3[0];
        zext_ln130_reg_5838[0] <= zext_ln130_fu_3295_p1[0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        p_reg_5499 <= p_fu_2607_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_udiv_fu_2193_ap_done == 1'b1) & (g_2_reg_5623 == 2'd0) & (1'b1 == ap_CS_fsm_state20))) begin
        reciprocal_idx53_val97_fu_518 <= reciprocal_fu_3246_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_udiv_fu_2193_ap_done == 1'b1) & (g_2_reg_5623 == 2'd1) & (1'b1 == ap_CS_fsm_state20))) begin
        reciprocal_idx54_val99_fu_522 <= reciprocal_fu_3246_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(g_2_reg_5623 == 2'd1) & ~(g_2_reg_5623 == 2'd0) & (grp_udiv_fu_2193_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state20))) begin
        reciprocal_idx55_val101_fu_526 <= reciprocal_fu_3246_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state62) | (1'b1 == ap_CS_fsm_state49) | (1'b1 == ap_CS_fsm_state28) | (1'b1 == ap_CS_fsm_state24))) begin
        reg_2464 <= reciprocal_idx53_val97_fu_518;
        reg_2469 <= reciprocal_idx54_val99_fu_522;
        reg_2474 <= reciprocal_idx55_val101_fu_526;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state25))) begin
        reg_2479 <= grp_evaluate_fu_2200_ap_return_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state63) | (1'b1 == ap_CS_fsm_state29) | (1'b1 == ap_CS_fsm_state50))) begin
        reg_2484 <= grp_evaluate_fu_2200_ap_return_1;
        reg_2488 <= grp_evaluate_fu_2200_ap_return_2;
        reg_2492 <= grp_evaluate_fu_2200_ap_return_3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state64) | (1'b1 == ap_CS_fsm_state51) | (1'b1 == ap_CS_fsm_state30))) begin
        reg_2496 <= grp_load_fu_2434_p1;
        reg_2503 <= grp_load_fu_2440_p1;
        reg_2510 <= grp_load_fu_2446_p1;
        sg_1_fu_506 <= reg_2488;
        sg_2_fu_510 <= reg_2492;
        sg_fu_502 <= reg_2484;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state63)) begin
        score_2_reg_6409 <= grp_evaluate_fu_2200_ap_return_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state24)) begin
        seeds_score_1_load_reg_5950 <= seeds_score_1_fu_574;
        seeds_score_2_load_reg_5956 <= seeds_score_2_fu_578;
        seeds_score_load_reg_5944 <= seeds_score_fu_570;
        seeds_x_1_load_reg_5904 <= seeds_x_1_fu_538;
        seeds_x_2_load_reg_5909 <= seeds_x_2_fu_542;
        seeds_x_load_reg_5899 <= seeds_x_fu_534;
        seeds_y_1_load_reg_5919 <= seeds_y_1_fu_550;
        seeds_y_2_load_reg_5924 <= seeds_y_2_fu_554;
        seeds_y_load_reg_5914 <= seeds_y_fu_546;
        seeds_z_1_load_reg_5934 <= seeds_z_1_fu_562;
        seeds_z_2_load_reg_5939 <= seeds_z_2_fu_566;
        seeds_z_load_reg_5929 <= seeds_z_fu_558;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        trunc_ln106_reg_5585 <= trunc_ln106_fu_2992_p1;
        trunc_ln90_reg_5576 <= trunc_ln90_fu_2985_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state43)) begin
        urem_ln145_reg_6189 <= grp_fu_4287_p2;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state16_on_subcall_done)) begin
        ap_ST_fsm_state16_blk = 1'b1;
    end else begin
        ap_ST_fsm_state16_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done == 1'b0)) begin
        ap_ST_fsm_state17_blk = 1'b1;
    end else begin
        ap_ST_fsm_state17_blk = 1'b0;
    end
end

assign ap_ST_fsm_state18_blk = 1'b0;

assign ap_ST_fsm_state19_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_udiv_fu_2193_ap_done == 1'b0)) begin
        ap_ST_fsm_state20_blk = 1'b1;
    end else begin
        ap_ST_fsm_state20_blk = 1'b0;
    end
end

assign ap_ST_fsm_state21_blk = 1'b0;

assign ap_ST_fsm_state22_blk = 1'b0;

assign ap_ST_fsm_state23_blk = 1'b0;

assign ap_ST_fsm_state24_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state25_on_subcall_done)) begin
        ap_ST_fsm_state25_blk = 1'b1;
    end else begin
        ap_ST_fsm_state25_blk = 1'b0;
    end
end

assign ap_ST_fsm_state26_blk = 1'b0;

assign ap_ST_fsm_state27_blk = 1'b0;

assign ap_ST_fsm_state28_blk = 1'b0;

always @ (*) begin
    if ((grp_evaluate_fu_2200_ap_done == 1'b0)) begin
        ap_ST_fsm_state29_blk = 1'b1;
    end else begin
        ap_ST_fsm_state29_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state2_on_subcall_done)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state30_blk = 1'b0;

always @ (*) begin
    if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done == 1'b0)) begin
        ap_ST_fsm_state31_blk = 1'b1;
    end else begin
        ap_ST_fsm_state31_blk = 1'b0;
    end
end

assign ap_ST_fsm_state32_blk = 1'b0;

assign ap_ST_fsm_state33_blk = 1'b0;

assign ap_ST_fsm_state34_blk = 1'b0;

assign ap_ST_fsm_state35_blk = 1'b0;

assign ap_ST_fsm_state36_blk = 1'b0;

assign ap_ST_fsm_state37_blk = 1'b0;

assign ap_ST_fsm_state38_blk = 1'b0;

assign ap_ST_fsm_state39_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state40_blk = 1'b0;

assign ap_ST_fsm_state41_blk = 1'b0;

assign ap_ST_fsm_state42_blk = 1'b0;

assign ap_ST_fsm_state43_blk = 1'b0;

assign ap_ST_fsm_state44_blk = 1'b0;

assign ap_ST_fsm_state45_blk = 1'b0;

assign ap_ST_fsm_state46_blk = 1'b0;

assign ap_ST_fsm_state47_blk = 1'b0;

assign ap_ST_fsm_state48_blk = 1'b0;

assign ap_ST_fsm_state49_blk = 1'b0;

always @ (*) begin
    if ((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_evaluate_fu_2200_ap_done == 1'b0)) begin
        ap_ST_fsm_state50_blk = 1'b1;
    end else begin
        ap_ST_fsm_state50_blk = 1'b0;
    end
end

assign ap_ST_fsm_state51_blk = 1'b0;

always @ (*) begin
    if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done == 1'b0)) begin
        ap_ST_fsm_state52_blk = 1'b1;
    end else begin
        ap_ST_fsm_state52_blk = 1'b0;
    end
end

assign ap_ST_fsm_state53_blk = 1'b0;

assign ap_ST_fsm_state54_blk = 1'b0;

assign ap_ST_fsm_state55_blk = 1'b0;

assign ap_ST_fsm_state56_blk = 1'b0;

assign ap_ST_fsm_state57_blk = 1'b0;

assign ap_ST_fsm_state58_blk = 1'b0;

assign ap_ST_fsm_state59_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state60_blk = 1'b0;

assign ap_ST_fsm_state61_blk = 1'b0;

assign ap_ST_fsm_state62_blk = 1'b0;

always @ (*) begin
    if ((grp_evaluate_fu_2200_ap_done == 1'b0)) begin
        ap_ST_fsm_state63_blk = 1'b1;
    end else begin
        ap_ST_fsm_state63_blk = 1'b0;
    end
end

assign ap_ST_fsm_state64_blk = 1'b0;

always @ (*) begin
    if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done == 1'b0)) begin
        ap_ST_fsm_state65_blk = 1'b1;
    end else begin
        ap_ST_fsm_state65_blk = 1'b0;
    end
end

assign ap_ST_fsm_state66_blk = 1'b0;

assign ap_ST_fsm_state67_blk = 1'b0;

assign ap_ST_fsm_state68_blk = 1'b0;

assign ap_ST_fsm_state69_blk = 1'b0;

always @ (*) begin
    if ((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state69)) begin
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
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_best_4_ph_phi_fu_829_p4 = local_best_9_reg_6022;
    end else begin
        ap_phi_mux_best_4_ph_phi_fu_829_p4 = best_4_ph_reg_826;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_best_7_phi_fu_1403_p10 = reg_2479;
    end else begin
        ap_phi_mux_best_7_phi_fu_1403_p10 = best_7_reg_1399;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_best_raw_2_ph_phi_fu_819_p4 = best_raw_11_reg_6093;
    end else begin
        ap_phi_mux_best_raw_2_ph_phi_fu_819_p4 = best_raw_2_ph_reg_816;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_best_raw_5_phi_fu_1424_p10 = best_raw_12_reg_6244;
    end else begin
        ap_phi_mux_best_raw_5_phi_fu_1424_p10 = best_raw_5_reg_1420;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_bx_2_ph_phi_fu_859_p4 = lx_9_reg_6033;
    end else begin
        ap_phi_mux_bx_2_ph_phi_fu_859_p4 = bx_2_ph_reg_856;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_bx_5_phi_fu_1340_p10 = cx_1_reg_6168;
    end else begin
        ap_phi_mux_bx_5_phi_fu_1340_p10 = bx_5_reg_1336;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_by_2_ph_phi_fu_849_p4 = ly_9_reg_6040;
    end else begin
        ap_phi_mux_by_2_ph_phi_fu_849_p4 = by_2_ph_reg_846;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_by_5_phi_fu_1361_p10 = cy_1_reg_6199;
    end else begin
        ap_phi_mux_by_5_phi_fu_1361_p10 = by_5_reg_1357;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_bz_2_ph_phi_fu_839_p4 = lz_9_reg_6047;
    end else begin
        ap_phi_mux_bz_2_ph_phi_fu_839_p4 = bz_2_ph_reg_836;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_bz_5_phi_fu_1382_p10 = cz_1_reg_6177;
    end else begin
        ap_phi_mux_bz_5_phi_fu_1382_p10 = bz_5_reg_1378;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_empty_91_phi_fu_1277_p10 = grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out;
    end else begin
        ap_phi_mux_empty_91_phi_fu_1277_p10 = empty_91_reg_1273;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_empty_92_phi_fu_1298_p10 = grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1;
    end else begin
        ap_phi_mux_empty_92_phi_fu_1298_p10 = empty_92_reg_1294;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_empty_93_phi_fu_1319_p10 = grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2;
    end else begin
        ap_phi_mux_empty_93_phi_fu_1319_p10 = empty_93_reg_1315;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_found_1_ph_phi_fu_808_p4 = 1'd1;
    end else begin
        ap_phi_mux_found_1_ph_phi_fu_808_p4 = found_1_ph_reg_805;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_found_4_phi_fu_1525_p10 = 1'd1;
    end else begin
        ap_phi_mux_found_4_phi_fu_1525_p10 = found_4_reg_1521;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_local_best_3_phi_fu_1505_p10 = local_best_7_reg_6234;
    end else begin
        ap_phi_mux_local_best_3_phi_fu_1505_p10 = local_best_3_reg_1501;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_lx_3_phi_fu_1445_p10 = lx_7_reg_6216;
    end else begin
        ap_phi_mux_lx_3_phi_fu_1445_p10 = lx_3_reg_1441;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_ly_3_phi_fu_1465_p10 = ly_7_reg_6222;
    end else begin
        ap_phi_mux_ly_3_phi_fu_1465_p10 = ly_3_reg_1461;
    end
end

always @ (*) begin
    if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln150_reg_6240 == 1'd1) & (icmp_ln49_6_reg_6212 == 1'd0) & (icmp_ln49_4_reg_6208 == 1'd0) & (1'b1 == ap_CS_fsm_state53))) begin
        ap_phi_mux_lz_3_phi_fu_1485_p10 = lz_7_reg_6228;
    end else begin
        ap_phi_mux_lz_3_phi_fu_1485_p10 = lz_3_reg_1481;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_p_ph305_phi_fu_788_p4 = grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1;
    end else begin
        ap_phi_mux_p_ph305_phi_fu_788_p4 = p_ph305_reg_785;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_p_ph306_phi_fu_798_p4 = grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2;
    end else begin
        ap_phi_mux_p_ph306_phi_fu_798_p4 = p_ph306_reg_795;
    end
end

always @ (*) begin
    if (((icmp_ln134_reg_6089 == 1'd1) & (1'b1 == ap_CS_fsm_state32))) begin
        ap_phi_mux_p_ph_phi_fu_778_p4 = grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out;
    end else begin
        ap_phi_mux_p_ph_phi_fu_778_p4 = p_ph_reg_775;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd1))) begin
        if ((j_fu_4158_p2 == 3'd4)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = 11'd100;
        end else if ((1'b1 == ap_condition_3537)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = select_ln138_fu_4169_p3;
        end else if ((j_fu_4158_p2 == 3'd3)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = 11'd200;
        end else if ((j_fu_4158_p2 == 3'd2)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = 11'd500;
        end else if ((j_fu_4158_p2 == 3'd1)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = 11'd1000;
        end else if ((j_fu_4158_p2 == 3'd0)) begin
            ap_phi_mux_step_phi_fu_1019_p12 = 11'd2000;
        end else begin
            ap_phi_mux_step_phi_fu_1019_p12 = 'bx;
        end
    end else begin
        ap_phi_mux_step_phi_fu_1019_p12 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state69)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state30)) begin
        ap_sig_allocacmp_sg_1_load = reg_2488;
    end else begin
        ap_sig_allocacmp_sg_1_load = sg_1_fu_506;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        ap_sig_allocacmp_sg_1_load_1 = reg_2488;
    end else begin
        ap_sig_allocacmp_sg_1_load_1 = sg_1_fu_506;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state51)) begin
        ap_sig_allocacmp_sg_1_load_2 = reg_2488;
    end else begin
        ap_sig_allocacmp_sg_1_load_2 = sg_1_fu_506;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state30)) begin
        ap_sig_allocacmp_sg_2_load = reg_2492;
    end else begin
        ap_sig_allocacmp_sg_2_load = sg_2_fu_510;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        ap_sig_allocacmp_sg_2_load_1 = reg_2492;
    end else begin
        ap_sig_allocacmp_sg_2_load_1 = sg_2_fu_510;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state51)) begin
        ap_sig_allocacmp_sg_2_load_2 = reg_2492;
    end else begin
        ap_sig_allocacmp_sg_2_load_2 = sg_2_fu_510;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state30)) begin
        ap_sig_allocacmp_sg_load = reg_2484;
    end else begin
        ap_sig_allocacmp_sg_load = sg_fu_502;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state64)) begin
        ap_sig_allocacmp_sg_load_1 = reg_2484;
    end else begin
        ap_sig_allocacmp_sg_load_1 = sg_fu_502;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state51)) begin
        ap_sig_allocacmp_sg_load_2 = reg_2484;
    end else begin
        ap_sig_allocacmp_sg_load_2 = sg_fu_502;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_address0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        blocked_address0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0;
    end else begin
        blocked_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_ce0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        blocked_ce0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0;
    end else begin
        blocked_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_ce1 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1;
    end else begin
        blocked_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_d0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        blocked_d0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0;
    end else begin
        blocked_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_we0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        blocked_we0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0;
    end else begin
        blocked_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        blocked_we1 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1;
    end else begin
        blocked_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        chosen_address0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0;
    end else begin
        chosen_address0 = zext_ln90_fu_2551_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        chosen_ce0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0;
    end else begin
        chosen_ce0 = chosen_ce0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        chosen_ce0_local = 1'b1;
    end else begin
        chosen_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        chosen_we0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0;
    end else begin
        chosen_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        covariance_address0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0;
    end else begin
        covariance_address0 = covariance_address0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        covariance_address0_local = zext_ln95_1_fu_2685_p1;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        covariance_address0_local = zext_ln95_fu_2663_p1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        covariance_address0_local = zext_ln94_fu_2627_p1;
    end else begin
        covariance_address0_local = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        covariance_ce0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0;
    end else begin
        covariance_ce0 = covariance_ce0_local;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state10))) begin
        covariance_ce0_local = 1'b1;
    end else begin
        covariance_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state22))) begin
        grid_ce0_local = 1'b1;
    end else begin
        grid_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state63)) begin
        grp_evaluate_fu_2200_x = cx_2_reg_6371;
    end else if ((1'b1 == ap_CS_fsm_state50)) begin
        grp_evaluate_fu_2200_x = cx_1_reg_6168;
    end else if ((1'b1 == ap_CS_fsm_state29)) begin
        grp_evaluate_fu_2200_x = lx_9_reg_6033;
    end else if ((1'b1 == ap_CS_fsm_state25)) begin
        grp_evaluate_fu_2200_x = sext_ln116_reg_5853;
    end else begin
        grp_evaluate_fu_2200_x = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state63)) begin
        grp_evaluate_fu_2200_y = cy_2_reg_6380;
    end else if ((1'b1 == ap_CS_fsm_state50)) begin
        grp_evaluate_fu_2200_y = cy_1_reg_6199;
    end else if ((1'b1 == ap_CS_fsm_state29)) begin
        grp_evaluate_fu_2200_y = ly_9_reg_6040;
    end else if ((1'b1 == ap_CS_fsm_state25)) begin
        grp_evaluate_fu_2200_y = sext_ln116_1_reg_5866;
    end else begin
        grp_evaluate_fu_2200_y = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state63)) begin
        grp_evaluate_fu_2200_z = cz_2_reg_6389;
    end else if ((1'b1 == ap_CS_fsm_state50)) begin
        grp_evaluate_fu_2200_z = cz_1_reg_6177;
    end else if ((1'b1 == ap_CS_fsm_state29)) begin
        grp_evaluate_fu_2200_z = lz_9_reg_6047;
    end else if ((1'b1 == ap_CS_fsm_state25)) begin
        grp_evaluate_fu_2200_z = sext_ln116_2_reg_5879;
    end else begin
        grp_evaluate_fu_2200_z = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state61)) begin
        grp_fu_2305_p0 = sext_ln48_2_fu_4929_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_2305_p0 = sext_ln48_fu_4398_p1;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_2305_p0 = sext_ln97_fu_2741_p1;
    end else begin
        grp_fu_2305_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state61)) begin
        grp_fu_2305_p1 = sext_ln48_2_fu_4929_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_2305_p1 = sext_ln48_fu_4398_p1;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_2305_p1 = sext_ln97_fu_2741_p1;
    end else begin
        grp_fu_2305_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state61)) begin
        grp_fu_2309_p0 = sext_ln48_3_fu_4934_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_2309_p0 = sext_ln48_1_fu_4403_p1;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_2309_p0 = sext_ln97_1_fu_2746_p1;
    end else begin
        grp_fu_2309_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state61)) begin
        grp_fu_2309_p1 = sext_ln48_3_fu_4934_p1;
    end else if ((1'b1 == ap_CS_fsm_state48)) begin
        grp_fu_2309_p1 = sext_ln48_1_fu_4403_p1;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_2309_p1 = sext_ln97_1_fu_2746_p1;
    end else begin
        grp_fu_2309_p1 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln141_fu_4210_p2 == 1'd1) & (fast_mode_read_reg_5396 == 1'd1) & (1'b1 == ap_CS_fsm_state34))) begin
        grp_fu_4251_ap_start = 1'b1;
    end else begin
        grp_fu_4251_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln141_fu_4210_p2 == 1'd1) & (fast_mode_read_reg_5396 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
        grp_fu_4287_ap_start = 1'b1;
    end else begin
        grp_fu_4287_ap_start = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state64))) begin
        grp_load_fu_2434_p1 = ap_sig_allocacmp_sg_load_1;
    end else if (((icmp_ln150_fu_4492_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state51))) begin
        grp_load_fu_2434_p1 = ap_sig_allocacmp_sg_load_2;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state30))) begin
        grp_load_fu_2434_p1 = ap_sig_allocacmp_sg_load;
    end else begin
        grp_load_fu_2434_p1 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state64))) begin
        grp_load_fu_2440_p1 = ap_sig_allocacmp_sg_1_load_1;
    end else if (((icmp_ln150_fu_4492_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state51))) begin
        grp_load_fu_2440_p1 = ap_sig_allocacmp_sg_1_load_2;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state30))) begin
        grp_load_fu_2440_p1 = ap_sig_allocacmp_sg_1_load;
    end else begin
        grp_load_fu_2440_p1 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln166_fu_5021_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state64))) begin
        grp_load_fu_2446_p1 = ap_sig_allocacmp_sg_2_load_1;
    end else if (((icmp_ln150_fu_4492_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state51))) begin
        grp_load_fu_2446_p1 = ap_sig_allocacmp_sg_2_load_2;
    end else if (((icmp_ln134_fu_4127_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state30))) begin
        grp_load_fu_2446_p1 = ap_sig_allocacmp_sg_2_load;
    end else begin
        grp_load_fu_2446_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_udiv_fu_2193_ap_start = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start;
    end else begin
        grp_udiv_fu_2193_ap_start = grp_udiv_fu_2193_ap_start_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_udiv_fu_2193_d = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2;
    end else if ((1'b1 == ap_CS_fsm_state20)) begin
        grp_udiv_fu_2193_d = sext_ln108_reg_5635;
    end else begin
        grp_udiv_fu_2193_d = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_udiv_fu_2193_n = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1;
    end else if ((1'b1 == ap_CS_fsm_state20)) begin
        grp_udiv_fu_2193_n = 56'd1048576;
    end else begin
        grp_udiv_fu_2193_n = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state63) | (1'b1 == ap_CS_fsm_state29) | (1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state25))) begin
        obs_address0 = grp_evaluate_fu_2200_obs_address0;
    end else begin
        obs_address0 = zext_ln101_fu_2959_p1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state63) | (1'b1 == ap_CS_fsm_state29) | (1'b1 == ap_CS_fsm_state50) | (1'b1 == ap_CS_fsm_state25))) begin
        obs_ce0 = grp_evaluate_fu_2200_obs_ce0;
    end else begin
        obs_ce0 = obs_ce0_local;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state16_on_subcall_done) & (1'b1 == ap_CS_fsm_state16))) begin
        obs_ce0_local = 1'b1;
    end else begin
        obs_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state16_on_subcall_done) & (1'd1 == and_ln98_1_reg_5558) & (icmp_ln98_reg_5562 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        obs_we0_local = 1'b1;
    end else begin
        obs_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        r18_PAIRS_ce0_local = 1'b1;
    end else begin
        r18_PAIRS_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        r18_PHASE_MM_ce0_local = 1'b1;
    end else begin
        r18_PHASE_MM_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trace_address0 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        trace_address0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0;
    end else begin
        trace_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trace_ce0 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        trace_ce0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0;
    end else begin
        trace_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trace_ce1 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1;
    end else begin
        trace_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        trace_we0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0;
    end else begin
        trace_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        weights_address0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        weights_address0 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0;
    end else begin
        weights_address0 = idxprom140_fu_2556_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        weights_ce0 = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        weights_ce0 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0;
    end else begin
        weights_ce0 = weights_ce0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        weights_ce0_local = 1'b1;
    end else begin
        weights_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        weights_we0 = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0;
    end else begin
        weights_we0 = 1'b0;
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
            if (((1'b0 == ap_block_state2_on_subcall_done) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln90_fu_2539_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (icmp_ln92_fu_2601_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            if (((1'd1 == and_ln98_1_fu_2756_p2) & (icmp_ln98_fu_2789_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state14))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            if (((1'b0 == ap_block_state16_on_subcall_done) & (1'b1 == ap_CS_fsm_state16))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end
        end
        ap_ST_fsm_state17 : begin
            if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state17))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end
        end
        ap_ST_fsm_state18 : begin
            if (((1'b1 == ap_CS_fsm_state18) & (or_ln107_3_fu_3096_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state69;
            end
        end
        ap_ST_fsm_state19 : begin
            if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln108_fu_3110_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state21;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end
        end
        ap_ST_fsm_state20 : begin
            if (((grp_udiv_fu_2193_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state20))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state20;
            end
        end
        ap_ST_fsm_state21 : begin
            if (((1'b1 == ap_CS_fsm_state21) & (icmp_ln114_fu_3272_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state27;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state22;
            end
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            if (((1'd1 == and_ln49_fu_3428_p2) & (icmp_ln49_2_fu_3473_p2 == 1'd0) & (icmp_ln49_1_fu_3456_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state23))) begin
                ap_NS_fsm = ap_ST_fsm_state24;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state26;
            end
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            if (((1'b0 == ap_block_state25_on_subcall_done) & (1'b1 == ap_CS_fsm_state25))) begin
                ap_NS_fsm = ap_ST_fsm_state26;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state25;
            end
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state27 : begin
            if (((icmp_ln131_fu_3645_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state27) & (icmp_ln130_fu_3613_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state54;
            end else if (((icmp_ln131_fu_3645_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state27) & (icmp_ln130_fu_3613_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state28;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state68;
            end
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            if (((grp_evaluate_fu_2200_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state29))) begin
                ap_NS_fsm = ap_ST_fsm_state30;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state29;
            end
        end
        ap_ST_fsm_state30 : begin
            if (((icmp_ln134_fu_4127_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state30))) begin
                ap_NS_fsm = ap_ST_fsm_state32;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state31;
            end
        end
        ap_ST_fsm_state31 : begin
            if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state31))) begin
                ap_NS_fsm = ap_ST_fsm_state32;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state31;
            end
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            if (((1'b1 == ap_CS_fsm_state33) & (icmp_ln136_fu_4147_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state54;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state34;
            end
        end
        ap_ST_fsm_state34 : begin
            if (((icmp_ln141_fu_4210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state34))) begin
                ap_NS_fsm = ap_ST_fsm_state33;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state35;
            end
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            if (((1'd1 == and_ln49_2_reg_6185) & (icmp_ln49_6_fu_4436_p2 == 1'd0) & (icmp_ln49_4_fu_4422_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state48))) begin
                ap_NS_fsm = ap_ST_fsm_state49;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state53;
            end
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            if (((grp_evaluate_fu_2200_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state50))) begin
                ap_NS_fsm = ap_ST_fsm_state51;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state50;
            end
        end
        ap_ST_fsm_state51 : begin
            if (((icmp_ln150_fu_4492_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state51))) begin
                ap_NS_fsm = ap_ST_fsm_state53;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state52;
            end
        end
        ap_ST_fsm_state52 : begin
            if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state52))) begin
                ap_NS_fsm = ap_ST_fsm_state53;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state52;
            end
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state54 : begin
            if (((1'b1 == ap_CS_fsm_state54) & ((icmp_ln131_reg_6029 == 1'd1) | (icmp_ln155_fu_4550_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state27;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state55;
            end
        end
        ap_ST_fsm_state55 : begin
            if (((1'b1 == ap_CS_fsm_state55) & (icmp_ln158_fu_4697_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state54;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state56;
            end
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            if (((1'd1 == and_ln49_1_reg_6397) & (icmp_ln49_8_fu_4967_p2 == 1'd0) & (icmp_ln49_7_fu_4953_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state61))) begin
                ap_NS_fsm = ap_ST_fsm_state62;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state66;
            end
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            if (((grp_evaluate_fu_2200_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state63))) begin
                ap_NS_fsm = ap_ST_fsm_state64;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state63;
            end
        end
        ap_ST_fsm_state64 : begin
            if (((icmp_ln166_fu_5021_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state64))) begin
                ap_NS_fsm = ap_ST_fsm_state66;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state65;
            end
        end
        ap_ST_fsm_state65 : begin
            if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state65))) begin
                ap_NS_fsm = ap_ST_fsm_state66;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state65;
            end
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign aa_fu_2689_p1 = covariance_q0[31:0];

assign add116_fu_2586_p2 = (mul115_fu_2580_p2 + 16'd16);

assign add_ln108_fu_3116_p2 = (g_fu_514 + 2'd1);

assign add_ln129_1_fu_4530_p2 = (phi_urem_reg_1249 + 9'd1);

assign add_ln129_fu_4510_p2 = (phi_urem80_reg_1261 + 9'd1);

assign add_ln130_fu_3619_p2 = (k_fu_582 + 2'd1);

assign add_ln141_1_fu_4192_p2 = (phi_mul76_reg_1227 + 18'd669);

assign add_ln141_2_fu_4198_p2 = (phi_mul74_reg_1216 + 19'd820);

assign add_ln141_3_fu_4204_p2 = (phi_mul_reg_1205 + 18'd656);

assign add_ln141_fu_4186_p2 = (phi_mul78_reg_1238 + 18'd586);

assign add_ln158_fu_5035_p2 = ($signed(n_4_reg_1733) + $signed(6'd1));

assign add_ln160_fu_4713_p2 = (mul_ln160_fu_2285_p2 + conv576_cast_cast_reg_6272);

assign add_ln161_fu_4726_p2 = (mul_ln161_fu_2289_p2 + select_ln162_reg_6282);

assign add_ln162_fu_4767_p2 = (mul_ln162_reg_6327 + 46'd5000);

assign add_ln170_10_fu_4070_p2 = (sub_ln170_5_fu_4052_p2 + zext_ln170_20_fu_4066_p1);

assign add_ln170_11_fu_4106_p2 = (sub_ln170_6_fu_4088_p2 + zext_ln170_22_fu_4102_p1);

assign add_ln170_1_fu_3802_p2 = (add_ln170_fu_3784_p2 + zext_ln170_4_fu_3798_p1);

assign add_ln170_2_fu_3838_p2 = (sub_ln170_1_fu_3820_p2 + zext_ln170_8_fu_3834_p1);

assign add_ln170_3_fu_3874_p2 = (sub_ln170_2_fu_3856_p2 + zext_ln170_10_fu_3870_p1);

assign add_ln170_4_fu_3900_p2 = (p_shl4_fu_3880_p3 + zext_ln170_11_fu_3896_p1);

assign add_ln170_5_fu_3918_p2 = (add_ln170_4_fu_3900_p2 + zext_ln170_12_fu_3914_p1);

assign add_ln170_6_fu_3954_p2 = (sub_ln170_3_fu_3936_p2 + zext_ln170_14_fu_3950_p1);

assign add_ln170_7_fu_3990_p2 = (sub_ln170_4_fu_3972_p2 + zext_ln170_16_fu_3986_p1);

assign add_ln170_8_fu_4016_p2 = (p_shl_fu_3996_p3 + zext_ln170_17_fu_4012_p1);

assign add_ln170_9_fu_4034_p2 = (add_ln170_8_fu_4016_p2 + zext_ln170_18_fu_4030_p1);

assign add_ln170_fu_3784_p2 = (p_shl3_fu_3764_p3 + zext_ln170_2_fu_3780_p1);

assign add_ln49_1_fu_4947_p2 = (zext_ln49_3_fu_4943_p1 + zext_ln49_2_fu_4939_p1);

assign add_ln49_2_fu_4416_p2 = (zext_ln49_4_fu_4408_p1 + zext_ln49_5_fu_4412_p1);

assign add_ln49_fu_3450_p2 = (zext_ln49_1_fu_3446_p1 + zext_ln49_fu_3438_p1);

assign add_ln94_fu_2622_p2 = (zext_ln92_1_fu_2618_p1 + add116_reg_5476);

assign add_ln95_1_fu_2668_p2 = (zext_ln93_1_fu_2654_p1 + mul115_reg_5470);

assign add_ln95_fu_2658_p2 = (zext_ln93_fu_2650_p1 + mul115_reg_5470);

assign add_ln98_fu_2769_p2 = (zext_ln98_1_fu_2765_p1 + zext_ln98_fu_2761_p1);

assign and_ln170_1_fu_5147_p2 = (icmp_ln170_3_reg_6064 & icmp_ln170_2_reg_6059);

assign and_ln170_2_fu_5151_p2 = (and_ln170_fu_5142_p2 & and_ln170_1_fu_5147_p2);

assign and_ln170_3_fu_5157_p2 = (icmp_ln170_5_fu_5047_p2 & icmp_ln170_4_reg_6069);

assign and_ln170_4_fu_5162_p2 = (icmp_ln170_8_fu_5121_p2 & icmp_ln170_7_fu_5105_p2);

assign and_ln170_5_fu_5168_p2 = (icmp_ln170_6_fu_5089_p2 & and_ln170_4_fu_5162_p2);

assign and_ln170_6_fu_5174_p2 = (and_ln170_5_fu_5168_p2 & and_ln170_3_fu_5157_p2);

assign and_ln170_7_fu_5180_p2 = (and_ln170_6_fu_5174_p2 & and_ln170_2_fu_5151_p2);

assign and_ln170_fu_5142_p2 = (icmp_ln170_fu_5041_p2 & icmp_ln170_1_reg_6054);

assign and_ln49_1_fu_4923_p2 = (xor_ln49_5_fu_4917_p2 & xor_ln49_4_fu_4902_p2);

assign and_ln49_2_fu_4362_p2 = (xor_ln49_3_fu_4356_p2 & xor_ln49_2_fu_4342_p2);

assign and_ln49_fu_3428_p2 = (xor_ln49_fu_3407_p2 & xor_ln49_1_fu_3422_p2);

assign and_ln98_1_fu_2756_p2 = (tobool_reg_5481 & and_ln98_fu_2751_p2);

assign and_ln98_fu_2751_p2 = (icmp_ln96_reg_5552 & icmp_ln96_1_fu_2717_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];

assign ap_CS_fsm_state23 = ap_CS_fsm[32'd22];

assign ap_CS_fsm_state24 = ap_CS_fsm[32'd23];

assign ap_CS_fsm_state25 = ap_CS_fsm[32'd24];

assign ap_CS_fsm_state26 = ap_CS_fsm[32'd25];

assign ap_CS_fsm_state27 = ap_CS_fsm[32'd26];

assign ap_CS_fsm_state28 = ap_CS_fsm[32'd27];

assign ap_CS_fsm_state29 = ap_CS_fsm[32'd28];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state30 = ap_CS_fsm[32'd29];

assign ap_CS_fsm_state31 = ap_CS_fsm[32'd30];

assign ap_CS_fsm_state32 = ap_CS_fsm[32'd31];

assign ap_CS_fsm_state33 = ap_CS_fsm[32'd32];

assign ap_CS_fsm_state34 = ap_CS_fsm[32'd33];

assign ap_CS_fsm_state36 = ap_CS_fsm[32'd35];

assign ap_CS_fsm_state37 = ap_CS_fsm[32'd36];

assign ap_CS_fsm_state39 = ap_CS_fsm[32'd38];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state40 = ap_CS_fsm[32'd39];

assign ap_CS_fsm_state43 = ap_CS_fsm[32'd42];

assign ap_CS_fsm_state44 = ap_CS_fsm[32'd43];

assign ap_CS_fsm_state46 = ap_CS_fsm[32'd45];

assign ap_CS_fsm_state47 = ap_CS_fsm[32'd46];

assign ap_CS_fsm_state48 = ap_CS_fsm[32'd47];

assign ap_CS_fsm_state49 = ap_CS_fsm[32'd48];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state50 = ap_CS_fsm[32'd49];

assign ap_CS_fsm_state51 = ap_CS_fsm[32'd50];

assign ap_CS_fsm_state52 = ap_CS_fsm[32'd51];

assign ap_CS_fsm_state53 = ap_CS_fsm[32'd52];

assign ap_CS_fsm_state54 = ap_CS_fsm[32'd53];

assign ap_CS_fsm_state55 = ap_CS_fsm[32'd54];

assign ap_CS_fsm_state57 = ap_CS_fsm[32'd56];

assign ap_CS_fsm_state58 = ap_CS_fsm[32'd57];

assign ap_CS_fsm_state59 = ap_CS_fsm[32'd58];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state60 = ap_CS_fsm[32'd59];

assign ap_CS_fsm_state61 = ap_CS_fsm[32'd60];

assign ap_CS_fsm_state62 = ap_CS_fsm[32'd61];

assign ap_CS_fsm_state63 = ap_CS_fsm[32'd62];

assign ap_CS_fsm_state64 = ap_CS_fsm[32'd63];

assign ap_CS_fsm_state65 = ap_CS_fsm[32'd64];

assign ap_CS_fsm_state66 = ap_CS_fsm[32'd65];

assign ap_CS_fsm_state67 = ap_CS_fsm[32'd66];

assign ap_CS_fsm_state68 = ap_CS_fsm[32'd67];

assign ap_CS_fsm_state69 = ap_CS_fsm[32'd68];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state16_on_subcall_done = ((ap_predicate_op253_call_state16 == 1'b1) & (grp_cordic_fu_2185_ap_done == 1'b0));
end

always @ (*) begin
    ap_block_state25_on_subcall_done = ((grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done == 1'b0) | (grp_evaluate_fu_2200_ap_done == 1'b0));
end

always @ (*) begin
    ap_block_state2_on_subcall_done = ((grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done == 1'b0) | (grp_joint_search_hls_Pipeline_1_fu_2146_ap_done == 1'b0));
end

always @ (*) begin
    ap_condition_3537 = (~(j_fu_4158_p2 == 3'd4) & ~(j_fu_4158_p2 == 3'd3) & ~(j_fu_4158_p2 == 3'd2) & ~(j_fu_4158_p2 == 3'd1) & ~(j_fu_4158_p2 == 3'd0));
end

always @ (*) begin
    ap_predicate_op253_call_state16 = ((1'd1 == and_ln98_1_reg_5558) & (icmp_ln98_reg_5562 == 1'd0));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign bb_fu_2703_p1 = covariance_q0[31:0];

assign conv2_i_i61_i1109_fu_3147_p1 = horizontal_mm_read_reg_5416;

assign conv2_i_i_i1144_fu_3152_p1 = vertical_mm_read_reg_5411;

assign conv576_cast_cast_fu_4608_p3 = ((tmp_42_fu_4600_p3[0:0] == 1'b1) ? 46'd70368744172664 : 46'd5000);

assign conv_i_i1171_fu_3155_p1 = hh_fu_2301_p2;

assign count_1_fu_2953_p2 = (count_fu_406 + 32'd1);

assign cx_2_fu_4822_p3 = ((tmp_46_reg_6310[0:0] == 1'b1) ? sub_ln160_1_fu_4816_p2 : tmp_10_cast_reg_6337);

assign cx_fu_3355_p3 = {{grid_q0[47:32]}};

assign cy_2_fu_4855_p3 = ((tmp_47_reg_6321[0:0] == 1'b1) ? sub_ln161_1_fu_4849_p2 : tmp_14_cast_reg_6348);

assign cy_fu_3367_p3 = {{grid_q0[31:16]}};

assign cz_2_fu_4888_p3 = ((tmp_48_reg_6359[0:0] == 1'b1) ? sub_ln162_1_fu_4882_p2 : tmp_18_cast_reg_6365);

assign cz_fu_3379_p1 = grid_q0[15:0];

assign grid_address0 = zext_ln116_fu_3283_p1;

assign grid_ce0 = grid_ce0_local;

assign groups_3_fu_2853_p2 = (tmp_8_fu_2833_p9 + 32'd1);

assign groups_4_fu_2871_p3 = ((or_ln101_fu_2865_p2[0:0] == 1'b1) ? groups_2_fu_430 : groups_3_fu_2853_p2);

assign groups_5_fu_2879_p3 = ((icmp_ln101_fu_2859_p2[0:0] == 1'b1) ? groups_3_fu_2853_p2 : groups_1_fu_426);

assign groups_6_fu_2887_p3 = ((tmp_15_fu_2795_p3[0:0] == 1'b1) ? groups_fu_422 : groups_3_fu_2853_p2);

assign grp_cordic_fu_2185_ap_start = grp_cordic_fu_2185_ap_start_reg;

assign grp_evaluate_fu_2200_ap_start = grp_evaluate_fu_2200_ap_start_reg;

assign grp_fu_2452_p2 = (grp_load_fu_2434_p1 + grp_load_fu_2446_p1);

assign grp_fu_2458_p2 = (grp_fu_2452_p2 + grp_load_fu_2440_p1);

assign grp_fu_4251_p0 = {{phi_mul74_reg_1216[18:12]}};

assign grp_fu_4251_p1 = 7'd5;

assign grp_fu_4287_p0 = {{phi_mul78_reg_1238[17:12]}};

assign grp_fu_4287_p1 = 6'd7;

assign grp_fu_5206_p0 = zext_ln138_1_reg_6115;

assign grp_fu_5213_p0 = zext_ln138_reg_6109;

assign grp_fu_5222_p0 = zext_ln138_reg_6109;

assign grp_fu_5229_p0 = zext_ln162_reg_6287;

assign grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start = grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg;

assign grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start = grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg;

assign grp_joint_search_hls_Pipeline_1_fu_2146_ap_start = grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg;

assign hh_fu_2301_p0 = conv2_i_i61_i1109_fu_3147_p1;

assign hh_fu_2301_p1 = conv2_i_i61_i1109_fu_3147_p1;

assign ia_fu_2640_p4 = {{r18_PAIRS_q0[7:4]}};

assign ib_fu_2636_p1 = r18_PAIRS_q0[3:0];

assign icmp103_fu_3168_p2 = ((tmp_14_fu_3159_p4 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln101_fu_2859_p2 = ((o_group_fu_2825_p3 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln107_1_fu_3024_p2 = ((tmp_fu_3014_p4 == 3'd0) ? 1'b1 : 1'b0);

assign icmp_ln107_2_fu_3040_p2 = (($signed(tmp_10_fu_3030_p4) < $signed(30'd1)) ? 1'b1 : 1'b0);

assign icmp_ln107_3_fu_3056_p2 = (($signed(tmp_11_fu_3046_p4) < $signed(30'd1)) ? 1'b1 : 1'b0);

assign icmp_ln107_4_fu_3072_p2 = (($signed(tmp_12_fu_3062_p4) < $signed(30'd1)) ? 1'b1 : 1'b0);

assign icmp_ln107_fu_3008_p2 = (($signed(count_fu_406) < $signed(32'd24)) ? 1'b1 : 1'b0);

assign icmp_ln108_fu_3110_p2 = ((g_fu_514 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln114_fu_3272_p2 = ((n_fu_530 == select_ln114_reg_5745) ? 1'b1 : 1'b0);

assign icmp_ln127_fu_3522_p2 = (($signed(reg_2479) > $signed(tmp_4_fu_3505_p9)) ? 1'b1 : 1'b0);

assign icmp_ln129_1_fu_4536_p2 = ((phi_urem_reg_1249 == 9'd4) ? 1'b1 : 1'b0);

assign icmp_ln129_fu_4516_p2 = ((phi_urem80_reg_1261 == 9'd6) ? 1'b1 : 1'b0);

assign icmp_ln130_fu_3613_p2 = ((k_fu_582 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln131_fu_3645_p2 = ((local_best_9_fu_3625_p9 == 32'd2147483649) ? 1'b1 : 1'b0);

assign icmp_ln134_fu_4127_p2 = (($signed(local_best_9_reg_6022) > $signed(best_fu_598)) ? 1'b1 : 1'b0);

assign icmp_ln136_fu_4147_p2 = ((zext_ln136_fu_4143_p1 < select_ln135_cast_cast_reg_5833) ? 1'b1 : 1'b0);

assign icmp_ln138_fu_4163_p2 = ((j_fu_4158_p2 == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln141_fu_4210_p2 = ((n_3_reg_1086 < select_ln130_reg_5843) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_4457_p2 = (($signed(reg_2479) > $signed(local_best_2_reg_1097)) ? 1'b1 : 1'b0);

assign icmp_ln150_fu_4492_p2 = (($signed(reg_2479) > $signed(best_6_reg_1157)) ? 1'b1 : 1'b0);

assign icmp_ln155_fu_4550_p2 = ((level_1_reg_1587 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln156_1_fu_4568_p2 = ((level_1_reg_1587 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln156_fu_4562_p2 = ((level_1_reg_1587 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln158_fu_4697_p2 = ((n_4_reg_1733 == 6'd21) ? 1'b1 : 1'b0);

assign icmp_ln165_fu_4988_p2 = (($signed(score_2_reg_6409) > $signed(local_best_5_reg_1757)) ? 1'b1 : 1'b0);

assign icmp_ln166_fu_5021_p2 = (($signed(score_2_reg_6409) > $signed(best_9_reg_1817)) ? 1'b1 : 1'b0);

assign icmp_ln170_1_fu_3711_p2 = ((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out > 4'd2) ? 1'b1 : 1'b0);

assign icmp_ln170_2_fu_3726_p2 = (($signed(tmp_19_fu_3716_p4) > $signed(29'd0)) ? 1'b1 : 1'b0);

assign icmp_ln170_3_fu_3742_p2 = (($signed(tmp_20_fu_3732_p4) > $signed(29'd0)) ? 1'b1 : 1'b0);

assign icmp_ln170_4_fu_3758_p2 = (($signed(tmp_21_fu_3748_p4) > $signed(29'd0)) ? 1'b1 : 1'b0);

assign icmp_ln170_5_fu_5047_p2 = (($signed(best_2_reg_5983) > $signed(32'd697958400)) ? 1'b1 : 1'b0);

assign icmp_ln170_6_fu_5089_p2 = (($signed(zext_ln170_1_fu_5085_p1) < $signed(best_raw_1_reg_5989)) ? 1'b1 : 1'b0);

assign icmp_ln170_7_fu_5105_p2 = (($signed(zext_ln170_3_fu_5101_p1) < $signed(p_load304_reg_5999)) ? 1'b1 : 1'b0);

assign icmp_ln170_8_fu_5121_p2 = (($signed(zext_ln170_5_fu_5117_p1) < $signed(p_load303_reg_6004)) ? 1'b1 : 1'b0);

assign icmp_ln170_9_fu_5137_p2 = (($signed(zext_ln170_7_fu_5133_p1) < $signed(p_load302_reg_6009)) ? 1'b1 : 1'b0);

assign icmp_ln170_fu_5041_p2 = (($signed(count_fu_406) > $signed(32'd47)) ? 1'b1 : 1'b0);

assign icmp_ln49_1_fu_3456_p2 = ((add_ln49_fu_3450_p2 > conv_i_i1171_reg_5738) ? 1'b1 : 1'b0);

assign icmp_ln49_2_fu_3473_p2 = ((or_ln49_1_fu_3467_p2 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln49_3_fu_4351_p2 = (($signed(conv2_i_i_i1144_reg_5731) < $signed(sext_ln49_2_fu_4348_p1)) ? 1'b1 : 1'b0);

assign icmp_ln49_4_fu_4422_p2 = ((add_ln49_2_fu_4416_p2 > conv_i_i1171_reg_5738) ? 1'b1 : 1'b0);

assign icmp_ln49_5_fu_4912_p2 = (($signed(conv2_i_i_i1144_reg_5731) < $signed(sext_ln49_1_fu_4908_p1)) ? 1'b1 : 1'b0);

assign icmp_ln49_6_fu_4436_p2 = ((or_ln49_4_fu_4431_p2 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln49_7_fu_4953_p2 = ((add_ln49_1_fu_4947_p2 > conv_i_i1171_reg_5738) ? 1'b1 : 1'b0);

assign icmp_ln49_8_fu_4967_p2 = ((or_ln49_3_fu_4962_p2 == 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_3417_p2 = (($signed(conv2_i_i_i1144_reg_5731) < $signed(sext_ln49_fu_3413_p1)) ? 1'b1 : 1'b0);

assign icmp_ln90_fu_2539_p2 = ((o_slot_fu_398 == 4'd12) ? 1'b1 : 1'b0);

assign icmp_ln92_fu_2601_p2 = ((p_1_reg_763 == 7'd120) ? 1'b1 : 1'b0);

assign icmp_ln96_1_fu_2717_p2 = (($signed(bb_fu_2703_p1) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln96_fu_2697_p2 = (($signed(aa_fu_2689_p1) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln98_fu_2789_p2 = ((add_ln98_fu_2769_p2 < zext_ln98_2_fu_2785_p1) ? 1'b1 : 1'b0);

assign idxprom140_fu_2556_p1 = chosen_q0;

assign ix_1_fu_4267_p2 = ($signed(trunc_ln8_fu_4257_p4) + $signed(3'd5));

assign ix_2_fu_4293_p3 = ((fast_mode_read_reg_5396[0:0] == 1'b1) ? ix_fu_4235_p2 : sext_ln143_fu_4273_p1);

assign ix_fu_4235_p2 = ($signed(zext_ln144_fu_4231_p1) + $signed(5'd30));

assign iy_1_fu_4381_p2 = ($signed(trunc_ln145_fu_4378_p1) + $signed(3'd5));

assign iy_2_fu_4387_p3 = ((fast_mode_read_reg_5396[0:0] == 1'b1) ? iy_fu_4372_p2 : iy_1_fu_4381_p2);

assign iy_fu_4372_p2 = ($signed(trunc_ln144_fu_4368_p1) + $signed(3'd6));

assign iz_1_fu_4318_p2 = ($signed(trunc_ln145_2_fu_4314_p1) + $signed(3'd5));

assign iz_2_fu_4324_p3 = ((fast_mode_read_reg_5396[0:0] == 1'b1) ? iz_fu_4308_p2 : iz_1_fu_4318_p2);

assign iz_fu_4308_p2 = ($signed(trunc_ln144_2_fu_4304_p1) + $signed(3'd6));

assign j_fu_4158_p2 = (level_reg_910 + zext_ln130_reg_5838);

assign k_3_fu_3493_p3 = ((tmp_41_fu_3485_p3[0:0] == 1'b1) ? grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out : grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out);

assign level_2_fu_4152_p2 = (level_reg_910 + 3'd1);

assign level_3_fu_4556_p2 = (level_1_reg_1587 + 2'd1);

assign local_best_7_fu_4484_p3 = ((icmp_ln149_fu_4457_p2[0:0] == 1'b1) ? reg_2479 : local_best_2_reg_1097);

assign local_best_8_fu_5014_p3 = ((icmp_ln165_fu_4988_p2[0:0] == 1'b1) ? score_2_reg_6409 : local_best_5_reg_1757);

assign local_best_9_fu_3625_p7 = 'bx;

assign lshr_ln_fu_2775_p4 = {{pp_fu_2297_p2[61:1]}};

assign lx_10_cast_fu_4596_p1 = lx_10_reg_1631;

assign lx_7_fu_4463_p3 = ((icmp_ln149_fu_4457_p2[0:0] == 1'b1) ? cx_1_reg_6168 : lx_4_reg_1133);

assign lx_8_fu_4993_p3 = ((icmp_ln165_fu_4988_p2[0:0] == 1'b1) ? cx_2_reg_6371 : lx_6_reg_1793);

assign lx_9_fu_3651_p7 = 'bx;

assign ly_10_cast_fu_4616_p1 = ly_10_reg_1620;

assign ly_7_fu_4470_p3 = ((icmp_ln149_fu_4457_p2[0:0] == 1'b1) ? cy_1_reg_6199 : ly_4_reg_1121);

assign ly_8_fu_5000_p3 = ((icmp_ln165_fu_4988_p2[0:0] == 1'b1) ? cy_2_reg_6380 : ly_6_reg_1781);

assign ly_9_fu_3671_p7 = 'bx;

assign lz_7_fu_4477_p3 = ((icmp_ln149_fu_4457_p2[0:0] == 1'b1) ? cz_1_reg_6177 : lz_4_reg_1109);

assign lz_8_fu_5007_p3 = ((icmp_ln165_fu_4988_p2[0:0] == 1'b1) ? cz_2_reg_6389 : lz_6_reg_1769);

assign lz_9_fu_3691_p7 = 'bx;

assign mul115_fu_2580_p2 = (p_shl1_fu_2562_p3 + p_shl261_fu_2576_p1);

assign mul_ln160_1_fu_2318_p1 = 93'd115292150460685;

assign mul_ln160_fu_2285_p0 = zext_ln160_fu_4707_p1;

assign mul_ln160_fu_2285_p1 = lx_10_cast_reg_6267;

assign mul_ln161_1_fu_2323_p1 = 93'd115292150460685;

assign mul_ln161_fu_2289_p0 = zext_ln160_fu_4707_p1;

assign mul_ln161_fu_2289_p1 = ly_10_cast_reg_6277;

assign mul_ln162_1_fu_2328_p1 = 93'd115292150460685;

assign mul_ln162_fu_2293_p0 = zext_ln160_fu_4707_p1;

assign mul_ln162_fu_2293_p1 = sext_ln158_reg_6292;

assign n_2_fu_3277_p2 = (n_fu_530 + 17'd1);

assign n_5_fu_4215_p2 = (n_3_reg_1086 + 9'd1);

assign o_group_fu_2825_p3 = ((or_ln100_fu_2819_p2[0:0] == 1'b1) ? zext_ln100_fu_2815_p1 : 2'd2);

assign o_phase_fu_2943_p4 = {{phase_fu_2313_p2[61:30]}};

assign or_ln100_fu_2819_p2 = (xor_ln100_fu_2802_p2 | tmp_16_fu_2808_p3);

assign or_ln101_3_fu_2964_p8 = {{{{{{{s_reg_5431}, {o_group_reg_5566}}, {1'd0}}, {p_1_reg_763}}, {6'd0}}, {o_coefficient_reg_5491}}, {o_phase_fu_2943_p4}};

assign or_ln101_fu_2865_p2 = (xor_ln100_fu_2802_p2 | icmp_ln101_fu_2859_p2);

assign or_ln107_1_fu_3084_p2 = (icmp_ln107_4_fu_3072_p2 | icmp_ln107_3_fu_3056_p2);

assign or_ln107_2_fu_3090_p2 = (or_ln107_1_fu_3084_p2 | icmp_ln107_2_fu_3040_p2);

assign or_ln107_3_fu_3096_p2 = (or_ln107_fu_3078_p2 | or_ln107_2_fu_3090_p2);

assign or_ln107_fu_3078_p2 = (icmp_ln107_fu_3008_p2 | icmp_ln107_1_fu_3024_p2);

assign or_ln156_fu_4582_p2 = (icmp_ln156_fu_4562_p2 | icmp_ln156_1_fu_4568_p2);

assign or_ln49_1_fu_3467_p2 = (or_ln49_fu_3461_p2 | cy_fu_3367_p3);

assign or_ln49_2_fu_4427_p2 = (cz_1_reg_6177 | cy_1_reg_6199);

assign or_ln49_3_fu_4962_p2 = (or_ln49_5_fu_4958_p2 | cy_2_reg_6380);

assign or_ln49_4_fu_4431_p2 = (or_ln49_2_fu_4427_p2 | cx_1_reg_6168);

assign or_ln49_5_fu_4958_p2 = (cz_2_reg_6389 | cx_2_reg_6371);

assign or_ln49_fu_3461_p2 = (cz_fu_3379_p1 | cx_fu_3355_p3);

assign p_fu_2607_p2 = (p_1_reg_763 + 7'd1);

assign p_shl1_fu_2562_p3 = {{f_reg_5454}, {7'd0}};

assign p_shl261_fu_2576_p1 = tmp_13_fu_2569_p3;

assign p_shl2_fu_5052_p3 = {{trunc_ln90_reg_5576}, {14'd0}};

assign p_shl3_fu_3764_p3 = {{empty_fu_410}, {13'd0}};

assign p_shl4_fu_3880_p3 = {{empty_80_fu_414}, {13'd0}};

assign p_shl_fu_3996_p3 = {{empty_81_fu_418}, {13'd0}};

assign pa_1_fu_2711_p3 = ((icmp_ln96_reg_5552[0:0] == 1'b1) ? trunc_ln95_1_reg_5547 : 31'd0);

assign pb_1_fu_2723_p3 = ((icmp_ln96_1_fu_2717_p2[0:0] == 1'b1) ? trunc_ln95_2_fu_2707_p1 : 31'd0);

assign phase_fu_2313_p1 = 62'd1367130551;

assign pp_fu_2297_p0 = pp_fu_2297_p00;

assign pp_fu_2297_p00 = pb_1_fu_2723_p3;

assign pp_fu_2297_p1 = pp_fu_2297_p10;

assign pp_fu_2297_p10 = pa_1_fu_2711_p3;

assign quality_fu_5186_p2 = (icmp_ln170_9_fu_5137_p2 & and_ln170_7_fu_5180_p2);

assign r18_PAIRS_address0 = zext_ln92_fu_2613_p1;

assign r18_PHASE_MM_address0 = idxprom140_fu_2556_p1;

assign re_fu_2673_p1 = covariance_q0[31:0];

assign reciprocal_fu_3246_p1 = grp_udiv_fu_2193_ap_return[31:0];

assign result = result_local_0_reg_2136;

assign s_1_cast51_fu_2598_p1 = o_slot_fu_398;

assign s_2_fu_2545_p2 = (o_slot_fu_398 + 4'd1);

assign select_ln114_fu_3174_p3 = ((icmp103_fu_3168_p2[0:0] == 1'b1) ? trunc_ln58_reg_5426 : 17'd65536);

assign select_ln129_1_fu_4542_p3 = ((icmp_ln129_1_fu_4536_p2[0:0] == 1'b1) ? 9'd0 : add_ln129_1_fu_4530_p2);

assign select_ln129_fu_4522_p3 = ((icmp_ln129_fu_4516_p2[0:0] == 1'b1) ? 9'd0 : add_ln129_fu_4510_p2);

assign select_ln130_fu_3298_p3 = ((fast_mode_read_reg_5396[0:0] == 1'b1) ? 9'd125 : 9'd343);

assign select_ln135_cast_cast_fu_3288_p3 = ((fast_mode_read_reg_5396[0:0] == 1'b1) ? 4'd6 : 4'd7);

assign select_ln138_fu_4169_p3 = ((icmp_ln138_fu_4163_p2[0:0] == 1'b1) ? 11'd25 : 11'd10);

assign select_ln156_fu_4574_p3 = ((icmp_ln156_fu_4562_p2[0:0] == 1'b1) ? 6'd36 : 6'd10);

assign select_ln160_fu_4810_p3 = ((tmp_46_reg_6310[0:0] == 1'b1) ? tmp_cast_fu_4800_p4 : tmp_10_cast_reg_6337);

assign select_ln161_fu_4843_p3 = ((tmp_47_reg_6321[0:0] == 1'b1) ? tmp_13_cast_fu_4833_p4 : tmp_14_cast_reg_6348);

assign select_ln162_1_fu_4876_p3 = ((tmp_48_reg_6359[0:0] == 1'b1) ? tmp_17_cast_fu_4866_p4 : tmp_18_cast_reg_6365);

assign select_ln162_fu_4628_p3 = ((tmp_43_fu_4620_p3[0:0] == 1'b1) ? 46'd70368744172664 : 46'd5000);

assign sext_ln108_fu_3142_p1 = $signed(tmp_9_fu_3122_p9);

assign sext_ln116_1_fu_3375_p1 = cy_fu_3367_p3;

assign sext_ln116_2_fu_3383_p1 = cz_fu_3379_p1;

assign sext_ln116_fu_3363_p1 = cx_fu_3355_p3;

assign sext_ln143_fu_4273_p1 = $signed(ix_1_fu_4267_p2);

assign sext_ln158_fu_4644_p1 = lz_10_reg_1609;

assign sext_ln162_fu_4636_p1 = $signed(step_1_fu_4588_p3);

assign sext_ln48_1_fu_4403_p1 = cy_1_reg_6199;

assign sext_ln48_2_fu_4929_p1 = cx_2_reg_6371;

assign sext_ln48_3_fu_4934_p1 = cy_2_reg_6380;

assign sext_ln48_fu_4398_p1 = cx_1_reg_6168;

assign sext_ln49_1_fu_4908_p1 = cz_2_fu_4888_p3;

assign sext_ln49_2_fu_4348_p1 = grp_fu_5213_p3;

assign sext_ln49_3_fu_3434_p1 = $signed(xx_fu_3387_p2);

assign sext_ln49_4_fu_3442_p1 = $signed(yy_fu_3393_p2);

assign sext_ln49_fu_3413_p1 = cz_fu_3379_p1;

assign sext_ln97_1_fu_2746_p1 = $signed(im_reg_5536);

assign sext_ln97_fu_2741_p1 = $signed(re_reg_5530);

assign shl_ln170_1_fu_5094_p3 = {{add_ln170_3_reg_6074}, {16'd0}};

assign shl_ln170_2_fu_5110_p3 = {{add_ln170_7_reg_6079}, {16'd0}};

assign shl_ln170_3_fu_5126_p3 = {{add_ln170_11_reg_6084}, {16'd0}};

assign shl_ln_fu_5077_p3 = {{sub_ln170_fu_5071_p2}, {16'd0}};

assign step_1_fu_4588_p3 = ((or_ln156_fu_4582_p2[0:0] == 1'b1) ? select_ln156_fu_4574_p3 : 6'd1);

assign sub_ln160_1_fu_4816_p2 = (32'd0 - select_ln160_fu_4810_p3);

assign sub_ln160_fu_4795_p2 = (93'd0 - mul_ln160_1_reg_6332);

assign sub_ln161_1_fu_4849_p2 = (32'd0 - select_ln161_fu_4843_p3);

assign sub_ln161_fu_4828_p2 = (93'd0 - mul_ln161_1_reg_6343);

assign sub_ln162_1_fu_4882_p2 = (32'd0 - select_ln162_1_fu_4876_p3);

assign sub_ln162_fu_4861_p2 = (93'd0 - mul_ln162_1_reg_6354);

assign sub_ln170_1_fu_3820_p2 = (add_ln170_1_fu_3802_p2 - zext_ln170_6_fu_3816_p1);

assign sub_ln170_2_fu_3856_p2 = (add_ln170_2_fu_3838_p2 - zext_ln170_9_fu_3852_p1);

assign sub_ln170_3_fu_3936_p2 = (add_ln170_5_fu_3918_p2 - zext_ln170_13_fu_3932_p1);

assign sub_ln170_4_fu_3972_p2 = (add_ln170_6_fu_3954_p2 - zext_ln170_15_fu_3968_p1);

assign sub_ln170_5_fu_4052_p2 = (add_ln170_9_fu_4034_p2 - zext_ln170_19_fu_4048_p1);

assign sub_ln170_6_fu_4088_p2 = (add_ln170_10_fu_4070_p2 - zext_ln170_21_fu_4084_p1);

assign sub_ln170_fu_5071_p2 = (p_shl2_fu_5052_p3 - zext_ln170_fu_5067_p1);

assign tmp2_fu_2996_p3 = {{trunc_ln106_fu_2992_p1}, {100'd0}};

assign tmp_10_fu_3030_p4 = {{empty_fu_410[31:2]}};

assign tmp_11_fu_3046_p4 = {{empty_80_fu_414[31:2]}};

assign tmp_12_fu_3062_p4 = {{empty_81_fu_418[31:2]}};

assign tmp_13_cast_fu_4833_p4 = {{sub_ln161_fu_4828_p2[91:60]}};

assign tmp_13_fu_2569_p3 = {{f_reg_5454}, {3'd0}};

assign tmp_14_fu_3159_p4 = {{grid_count_read_reg_5421[31:16]}};

assign tmp_15_fu_2795_p3 = pair_reg_5514[32'd7];

assign tmp_16_fu_2808_p3 = pair_reg_5514[32'd3];

assign tmp_17_cast_fu_4866_p4 = {{sub_ln162_fu_4861_p2[91:60]}};

assign tmp_18_fu_3399_p3 = grid_q0[32'd15];

assign tmp_19_fu_3716_p4 = {{empty_fu_410[31:3]}};

assign tmp_20_fu_3732_p4 = {{empty_80_fu_414[31:3]}};

assign tmp_21_fu_3748_p4 = {{empty_81_fu_418[31:3]}};

assign tmp_22_fu_5059_p3 = {{count_fu_406}, {12'd0}};

assign tmp_23_fu_3772_p3 = {{empty_fu_410}, {11'd0}};

assign tmp_24_fu_3790_p3 = {{empty_fu_410}, {9'd0}};

assign tmp_25_fu_3808_p3 = {{empty_fu_410}, {7'd0}};

assign tmp_26_fu_3826_p3 = {{empty_fu_410}, {5'd0}};

assign tmp_27_fu_3844_p3 = {{empty_fu_410}, {3'd0}};

assign tmp_28_fu_3862_p3 = {{empty_fu_410}, {1'd0}};

assign tmp_29_fu_3888_p3 = {{empty_80_fu_414}, {11'd0}};

assign tmp_30_fu_3906_p3 = {{empty_80_fu_414}, {9'd0}};

assign tmp_31_fu_3924_p3 = {{empty_80_fu_414}, {7'd0}};

assign tmp_32_fu_3942_p3 = {{empty_80_fu_414}, {5'd0}};

assign tmp_33_fu_3960_p3 = {{empty_80_fu_414}, {3'd0}};

assign tmp_34_fu_3978_p3 = {{empty_80_fu_414}, {1'd0}};

assign tmp_35_fu_4004_p3 = {{empty_81_fu_418}, {11'd0}};

assign tmp_36_fu_4022_p3 = {{empty_81_fu_418}, {9'd0}};

assign tmp_37_fu_4040_p3 = {{empty_81_fu_418}, {7'd0}};

assign tmp_38_fu_4058_p3 = {{empty_81_fu_418}, {5'd0}};

assign tmp_39_fu_4076_p3 = {{empty_81_fu_418}, {3'd0}};

assign tmp_40_fu_4094_p3 = {{empty_81_fu_418}, {1'd0}};

assign tmp_41_fu_3485_p3 = grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out[32'd31];

assign tmp_42_fu_4600_p3 = lx_10_reg_1631[32'd31];

assign tmp_43_fu_4620_p3 = ly_10_reg_1620[32'd31];

assign tmp_44_fu_4221_p4 = {{phi_mul_reg_1205[17:14]}};

assign tmp_45_fu_4335_p3 = grp_fu_5213_p3[32'd31];

assign tmp_49_fu_4894_p3 = cz_2_fu_4888_p3[32'd31];

assign tmp_4_fu_3505_p7 = 'bx;

assign tmp_4_fu_3505_p8 = k_3_fu_3493_p3[1:0];

assign tmp_8_fu_2833_p7 = 'bx;

assign tmp_9_fu_3122_p7 = 'bx;

assign tmp_cast_fu_4800_p4 = {{sub_ln160_fu_4795_p2[91:60]}};

assign tmp_fu_3014_p4 = {{grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out[3:1]}};

assign tmp_s_fu_5192_p9 = {{{{{{{{best_2_reg_5983}, {trunc_ln106_reg_5585}}, {2'd0}}, {quality_fu_5186_p2}}, {found_5_reg_5994}}, {bz_1_reg_5978}}, {by_1_reg_5973}}, {bx_1_reg_5968}};

assign tobool_fu_2592_p2 = ((weights_q0 != 20'd0) ? 1'b1 : 1'b0);

assign trunc_ln106_fu_2992_p1 = count_fu_406[11:0];

assign trunc_ln126_fu_3501_p1 = k_3_fu_3493_p3[1:0];

assign trunc_ln144_2_fu_4304_p1 = phi_urem_reg_1249[2:0];

assign trunc_ln144_fu_4368_p1 = grp_fu_4251_p2[2:0];

assign trunc_ln145_2_fu_4314_p1 = phi_urem80_reg_1261[2:0];

assign trunc_ln145_fu_4378_p1 = urem_ln145_reg_6189[2:0];

assign trunc_ln58_fu_2532_p1 = grid_count[16:0];

assign trunc_ln8_fu_4257_p4 = {{phi_mul76_reg_1227[17:15]}};

assign trunc_ln90_fu_2985_p1 = count_fu_406[30:0];

assign trunc_ln95_1_fu_2693_p1 = covariance_q0[30:0];

assign trunc_ln95_2_fu_2707_p1 = covariance_q0[30:0];

assign xor_ln100_fu_2802_p2 = (tmp_15_fu_2795_p3 ^ 1'd1);

assign xor_ln49_1_fu_3422_p2 = (icmp_ln49_fu_3417_p2 ^ 1'd1);

assign xor_ln49_2_fu_4342_p2 = (tmp_45_fu_4335_p3 ^ 1'd1);

assign xor_ln49_3_fu_4356_p2 = (icmp_ln49_3_fu_4351_p2 ^ 1'd1);

assign xor_ln49_4_fu_4902_p2 = (tmp_49_fu_4894_p3 ^ 1'd1);

assign xor_ln49_5_fu_4917_p2 = (icmp_ln49_5_fu_4912_p2 ^ 1'd1);

assign xor_ln49_fu_3407_p2 = (tmp_18_fu_3399_p3 ^ 1'd1);

assign xx_fu_3387_p0 = sext_ln116_fu_3363_p1;

assign xx_fu_3387_p1 = sext_ln116_fu_3363_p1;

assign yy_fu_3393_p0 = sext_ln116_1_fu_3375_p1;

assign yy_fu_3393_p1 = sext_ln116_1_fu_3375_p1;

assign zext_ln100_fu_2815_p1 = tmp_15_fu_2795_p3;

assign zext_ln101_fu_2959_p1 = count_fu_406;

assign zext_ln106_fu_3004_p1 = tmp2_fu_2996_p3;

assign zext_ln116_fu_3283_p1 = n_fu_530;

assign zext_ln130_fu_3295_p1 = fast_mode_read_reg_5396;

assign zext_ln136_fu_4143_p1 = level_reg_910;

assign zext_ln138_1_fu_4182_p1 = ap_phi_mux_step_phi_fu_1019_p12;

assign zext_ln138_fu_4178_p1 = ap_phi_mux_step_phi_fu_1019_p12;

assign zext_ln144_fu_4231_p1 = tmp_44_fu_4221_p4;

assign zext_ln160_fu_4707_p0 = grp_fu_5229_p3;

assign zext_ln160_fu_4707_p1 = $unsigned(zext_ln160_fu_4707_p0);

assign zext_ln162_fu_4640_p1 = $unsigned(sext_ln162_fu_4636_p1);

assign zext_ln170_10_fu_3870_p1 = tmp_28_fu_3862_p3;

assign zext_ln170_11_fu_3896_p1 = tmp_29_fu_3888_p3;

assign zext_ln170_12_fu_3914_p1 = tmp_30_fu_3906_p3;

assign zext_ln170_13_fu_3932_p1 = tmp_31_fu_3924_p3;

assign zext_ln170_14_fu_3950_p1 = tmp_32_fu_3942_p3;

assign zext_ln170_15_fu_3968_p1 = tmp_33_fu_3960_p3;

assign zext_ln170_16_fu_3986_p1 = tmp_34_fu_3978_p3;

assign zext_ln170_17_fu_4012_p1 = tmp_35_fu_4004_p3;

assign zext_ln170_18_fu_4030_p1 = tmp_36_fu_4022_p3;

assign zext_ln170_19_fu_4048_p1 = tmp_37_fu_4040_p3;

assign zext_ln170_1_fu_5085_p1 = shl_ln_fu_5077_p3;

assign zext_ln170_20_fu_4066_p1 = tmp_38_fu_4058_p3;

assign zext_ln170_21_fu_4084_p1 = tmp_39_fu_4076_p3;

assign zext_ln170_22_fu_4102_p1 = tmp_40_fu_4094_p3;

assign zext_ln170_2_fu_3780_p1 = tmp_23_fu_3772_p3;

assign zext_ln170_3_fu_5101_p1 = shl_ln170_1_fu_5094_p3;

assign zext_ln170_4_fu_3798_p1 = tmp_24_fu_3790_p3;

assign zext_ln170_5_fu_5117_p1 = shl_ln170_2_fu_5110_p3;

assign zext_ln170_6_fu_3816_p1 = tmp_25_fu_3808_p3;

assign zext_ln170_7_fu_5133_p1 = shl_ln170_3_fu_5126_p3;

assign zext_ln170_8_fu_3834_p1 = tmp_26_fu_3826_p3;

assign zext_ln170_9_fu_3852_p1 = tmp_27_fu_3844_p3;

assign zext_ln170_fu_5067_p1 = tmp_22_fu_5059_p3;

assign zext_ln49_1_fu_3446_p1 = $unsigned(sext_ln49_4_fu_3442_p1);

assign zext_ln49_2_fu_4939_p1 = grp_fu_2305_p2;

assign zext_ln49_3_fu_4943_p1 = grp_fu_2309_p2;

assign zext_ln49_4_fu_4408_p1 = grp_fu_2305_p2;

assign zext_ln49_5_fu_4412_p1 = grp_fu_2309_p2;

assign zext_ln49_fu_3438_p1 = $unsigned(sext_ln49_3_fu_3434_p1);

assign zext_ln90_fu_2551_p1 = o_slot_fu_398;

assign zext_ln92_1_fu_2618_p1 = p_1_reg_763;

assign zext_ln92_fu_2613_p1 = p_1_reg_763;

assign zext_ln93_1_fu_2654_p1 = ib_fu_2636_p1;

assign zext_ln93_fu_2650_p1 = ia_fu_2640_p4;

assign zext_ln94_fu_2627_p1 = add_ln94_fu_2622_p2;

assign zext_ln95_1_fu_2685_p1 = add_ln95_1_reg_5525;

assign zext_ln95_fu_2663_p1 = add_ln95_fu_2658_p2;

assign zext_ln98_1_fu_2765_p1 = grp_fu_2309_p2;

assign zext_ln98_2_fu_2785_p1 = lshr_ln_fu_2775_p4;

assign zext_ln98_fu_2761_p1 = grp_fu_2305_p2;

always @ (posedge ap_clk) begin
    mul115_reg_5470[2:0] <= 3'b000;
    add116_reg_5476[2:0] <= 3'b000;
    s_1_cast51_reg_5486[31:4] <= 28'b0000000000000000000000000000;
    conv2_i_i_i1144_reg_5731[32] <= 1'b0;
    conv_i_i1171_reg_5738[64] <= 1'b0;
    select_ln135_cast_cast_reg_5833[3:1] <= 3'b011;
    zext_ln130_reg_5838[2:1] <= 2'b00;
    select_ln130_reg_5843[0] <= 1'b1;
    select_ln130_reg_5843[2:2] <= 1'b1;
    select_ln130_reg_5843[4:4] <= 1'b1;
    select_ln130_reg_5843[7:6] <= 2'b01;
    add_ln170_3_reg_6074[0] <= 1'b0;
    add_ln170_7_reg_6079[0] <= 1'b0;
    add_ln170_11_reg_6084[0] <= 1'b0;
    zext_ln138_reg_6109[13:11] <= 3'b000;
    zext_ln138_1_reg_6115[15:11] <= 5'b00000;
    conv576_cast_cast_reg_6272[3:0] <= 4'b1000;
    select_ln162_reg_6282[3:0] <= 4'b1000;
    zext_ln162_reg_6287[4] <= 1'b0;
    zext_ln162_reg_6287[12:7] <= 6'b000000;
    result_local_0_reg_2136[99:98] <= 2'b00;
end

endmodule                   
