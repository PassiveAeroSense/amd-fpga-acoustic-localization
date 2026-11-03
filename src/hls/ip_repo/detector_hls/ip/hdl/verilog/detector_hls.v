                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="detector_hls_detector_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=14.246800,HLS_SYN_LAT=13156,HLS_SYN_TPT=none,HLS_SYN_MEM=27,HLS_SYN_DSP=0,HLS_SYN_FF=2379,HLS_SYN_LUT=3286,HLS_VERSION=2024_2}" *)

module detector_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        bands_address0,
        bands_ce0,
        bands_q0,
        valid,
        new_sequence,
        array_id,
        result
);

parameter    ap_ST_fsm_state1 = 17'd1;
parameter    ap_ST_fsm_state2 = 17'd2;
parameter    ap_ST_fsm_state3 = 17'd4;
parameter    ap_ST_fsm_state4 = 17'd8;
parameter    ap_ST_fsm_state5 = 17'd16;
parameter    ap_ST_fsm_state6 = 17'd32;
parameter    ap_ST_fsm_state7 = 17'd64;
parameter    ap_ST_fsm_state8 = 17'd128;
parameter    ap_ST_fsm_state9 = 17'd256;
parameter    ap_ST_fsm_state10 = 17'd512;
parameter    ap_ST_fsm_state11 = 17'd1024;
parameter    ap_ST_fsm_state12 = 17'd2048;
parameter    ap_ST_fsm_state13 = 17'd4096;
parameter    ap_ST_fsm_state14 = 17'd8192;
parameter    ap_ST_fsm_state15 = 17'd16384;
parameter    ap_ST_fsm_state16 = 17'd32768;
parameter    ap_ST_fsm_state17 = 17'd65536;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] bands_address0;
output   bands_ce0;
input  [47:0] bands_q0;
input  [0:0] valid;
input  [0:0] new_sequence;
input  [0:0] array_id;
output  [103:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [16:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr;
wire   [6:0] r18_ROOTS_address0;
wire   [10:0] r18_ROOTS_q0;
wire   [10:0] r18_NODE_VALUE_address0;
wire   [22:0] r18_NODE_VALUE_q0;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1;
reg   [31:0] p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2;
reg   [0:0] array_id_read_reg_1298;
wire   [0:0] xor_ln19_1_fu_660_p2;
reg   [0:0] xor_ln19_1_reg_1337;
wire   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_fu_720_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_reg_1358;
wire   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_fu_728_p3;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_reg_1363;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_fu_736_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_reg_1368;
wire   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_fu_750_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_reg_1382;
wire   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_fu_758_p3;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_reg_1387;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_fu_766_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_reg_1392;
wire   [53:0] trunc_ln22_fu_777_p1;
reg   [53:0] trunc_ln22_reg_1397;
wire    ap_CS_fsm_state3;
wire   [0:0] tmp_fu_782_p3;
reg   [0:0] tmp_reg_1402;
wire   [53:0] sub_ln26_fu_790_p2;
reg   [53:0] sub_ln26_reg_1406;
wire   [6:0] add_ln27_fu_812_p2;
reg   [6:0] add_ln27_reg_1424;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln27_fu_828_p1;
reg   [63:0] zext_ln27_reg_1450;
wire    ap_CS_fsm_state7;
wire   [7:0] zext_ln27_1_fu_831_p1;
reg   [7:0] zext_ln27_1_reg_1455;
wire  signed [53:0] sext_ln28_fu_837_p1;
reg  signed [53:0] sext_ln28_reg_1460;
wire   [0:0] tmp_3_fu_846_p3;
reg   [0:0] tmp_3_reg_1465;
wire   [53:0] zext_ln29_fu_860_p1;
reg   [53:0] zext_ln29_reg_1469;
wire   [47:0] grp_udiv_fu_569_ap_return;
wire    ap_CS_fsm_state8;
wire   [47:0] grp_fu_614_p2;
wire   [6:0] add_ln40_fu_895_p2;
reg   [6:0] add_ln40_reg_1492;
wire    ap_CS_fsm_state11;
wire   [31:0] trunc_ln52_fu_964_p1;
reg   [31:0] trunc_ln52_reg_1508;
wire   [1:0] select_ln52_2_fu_988_p3;
reg   [1:0] select_ln52_2_reg_1513;
wire   [1:0] select_ln52_3_fu_995_p3;
reg   [1:0] select_ln52_3_reg_1518;
wire   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_fu_1086_p3;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_reg_1523;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_fu_1097_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_reg_1528;
wire   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_fu_1105_p3;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_reg_1533;
wire   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_fu_1111_p3;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_reg_1538;
wire   [1:0] empty_16_fu_1131_p3;
reg   [1:0] empty_16_reg_1543;
wire   [63:0] next_fu_1139_p2;
reg   [63:0] next_reg_1550;
reg   [10:0] r18_ROOTS_load_reg_1558;
wire    ap_CS_fsm_state12;
wire   [0:0] grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return;
reg   [0:0] targetBlock_reg_1563;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state14;
wire   [103:0] tmp_7_fu_1249_p7;
wire    ap_CS_fsm_state16;
reg   [6:0] raw_address0;
reg    raw_ce0;
reg    raw_we0;
wire   [47:0] raw_q0;
reg   [7:0] features_address0;
reg    features_ce0;
reg    features_we0;
reg   [47:0] features_d0;
wire   [47:0] features_q0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_idle;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready;
wire   [6:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0;
wire   [47:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0;
wire   [6:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0;
wire   [7:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0;
wire   [47:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0;
wire   [54:0] grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out_ap_vld;
wire    grp_udiv_fu_569_ap_start;
wire    grp_udiv_fu_569_ap_done;
wire    grp_udiv_fu_569_ap_idle;
wire    grp_udiv_fu_569_ap_ready;
reg   [53:0] grp_udiv_fu_569_n;
reg   [5:0] grp_udiv_fu_569_d_val;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_idle;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready;
wire   [6:0] grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0;
wire   [51:0] grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out_ap_vld;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_idle;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready;
wire   [6:0] grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0;
wire   [7:0] grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0;
wire   [47:0] grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0;
wire   [0:0] grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_idle;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready;
wire   [7:0] grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0;
wire   [10:0] grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out;
wire    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld;
reg   [47:0] conv3_i12_i3167_reg_283;
wire    ap_CS_fsm_state4;
reg    ap_block_state4_on_subcall_done;
reg   [47:0] phi_ln29_reg_293;
reg    ap_block_state8_on_subcall_done;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302;
wire   [0:0] icmp_ln40_fu_889_p2;
wire   [0:0] or_ln50_fu_931_p2;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350;
wire   [0:0] valid_read_read_fu_220_p2;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474;
reg   [63:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490;
wire   [0:0] ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8;
reg   [0:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508;
reg   [1:0] detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523;
reg   [103:0] storemerge9_reg_540;
reg    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    features_we0_out;
reg    grp_udiv_fu_569_ap_start_reg;
reg    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg;
wire   [0:0] icmp_ln27_fu_806_p2;
wire    ap_CS_fsm_state6;
reg    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg;
wire    ap_CS_fsm_state10;
reg   [0:0] invalid_1_fu_204;
reg    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg;
reg   [10:0] node_2_in_loc_fu_172;
wire   [63:0] zext_ln29_1_fu_881_p1;
wire    ap_CS_fsm_state9;
wire   [63:0] zext_ln40_fu_901_p1;
wire   [63:0] zext_ln43_fu_1189_p1;
wire    ap_CS_fsm_state17;
wire   [1:0] select_ln52_1_fu_959_p3;
reg   [6:0] i_2_fu_192;
reg   [6:0] tree_fu_196;
wire    ap_CS_fsm_state15;
reg   [63:0] score_fu_200;
wire   [63:0] score_1_fu_1198_p2;
reg    raw_ce0_local;
reg    features_we0_local;
wire   [47:0] sub_ln29_2_fu_869_p2;
reg    features_ce0_local;
reg    r18_ROOTS_ce0_local;
reg    r18_NODE_VALUE_ce0_local;
wire   [0:0] xor_ln19_fu_624_p2;
wire   [0:0] or_ln19_fu_630_p2;
wire   [1:0] select_ln19_fu_666_p3;
wire   [63:0] select_ln19_1_fu_674_p3;
wire   [1:0] select_ln19_2_fu_682_p3;
wire   [1:0] select_ln19_3_fu_690_p3;
wire   [63:0] select_ln19_4_fu_698_p3;
wire   [1:0] select_ln19_5_fu_706_p3;
wire  signed [51:0] sext_ln28_fu_837_p0;
wire  signed [51:0] trunc_ln28_fu_842_p0;
wire  signed [51:0] tmp_3_fu_846_p1;
wire   [50:0] trunc_ln28_fu_842_p1;
wire   [50:0] sub_ln29_fu_854_p2;
wire   [7:0] add_ln29_fu_876_p2;
wire   [63:0] add_ln50_fu_909_p2;
wire   [31:0] tmp_6_fu_915_p4;
wire   [0:0] icmp_ln50_fu_925_p2;
wire   [63:0] select_ln51_fu_937_p3;
wire   [1:0] select_ln51_1_fu_948_p3;
wire   [0:0] icmp_ln52_fu_968_p2;
wire   [1:0] add_ln52_fu_974_p2;
wire   [1:0] select_ln52_fu_980_p3;
wire   [31:0] tmp_4_fu_1014_p7;
wire   [31:0] tmp_5_fu_1046_p7;
wire   [31:0] tmp_5_fu_1046_p9;
wire   [31:0] tmp_4_fu_1014_p9;
wire   [1:0] add_ln52_1_fu_1073_p2;
wire   [0:0] icmp_ln51_fu_953_p2;
wire   [0:0] empty_fu_1092_p2;
wire   [1:0] select_ln52_4_fu_1079_p3;
wire   [31:0] select_ln51_2_fu_1066_p3;
wire   [31:0] ref_tmp227_085_fu_1119_p3;
wire   [63:0] add_ln51_fu_942_p2;
wire  signed [63:0] ref_tmp227_085_cast_fu_1127_p1;
wire  signed [63:0] sext_ln43_fu_1194_p1;
wire   [25:0] tmp_8_fu_1223_p3;
wire   [27:0] p_shl_fu_1216_p3;
wire   [27:0] zext_ln53_1_fu_1230_p1;
wire   [27:0] sub_ln53_fu_1234_p2;
wire   [63:0] zext_ln53_2_fu_1240_p1;
wire   [0:0] icmp_ln53_fu_1244_p2;
wire   [4:0] zext_ln53_fu_1213_p1;
reg   [16:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
reg    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
reg    ap_condition_863;
wire   [1:0] tmp_4_fu_1014_p1;
wire   [1:0] tmp_4_fu_1014_p3;
wire  signed [1:0] tmp_4_fu_1014_p5;
wire   [1:0] tmp_5_fu_1046_p1;
wire   [1:0] tmp_5_fu_1046_p3;
wire  signed [1:0] tmp_5_fu_1046_p5;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 17'd1;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 = 2'd0;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 = 64'd0;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 = 2'd0;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts = 2'd0;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums = 64'd0;
#0 detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr = 2'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0 = 32'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1 = 32'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2 = 32'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0 = 32'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1 = 32'd0;
#0 p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2 = 32'd0;
#0 grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg = 1'b0;
#0 grp_udiv_fu_569_ap_start_reg = 1'b0;
#0 grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg = 1'b0;
#0 grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg = 1'b0;
#0 invalid_1_fu_204 = 1'd0;
#0 grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg = 1'b0;
#0 i_2_fu_192 = 7'd0;
#0 tree_fu_196 = 7'd0;
#0 score_fu_200 = 64'd0;
end

detector_hls_r18_ROOTS_ROM_AUTO_1R #(
    .DataWidth( 11 ),
    .AddressRange( 120 ),
    .AddressWidth( 7 ))
r18_ROOTS_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_ROOTS_address0),
    .ce0(r18_ROOTS_ce0_local),
    .q0(r18_ROOTS_q0)
);

detector_hls_r18_NODE_VALUE_ROM_AUTO_1R #(
    .DataWidth( 23 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_VALUE_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_NODE_VALUE_address0),
    .ce0(r18_NODE_VALUE_ce0_local),
    .q0(r18_NODE_VALUE_q0)
);

detector_hls_raw_RAM_AUTO_1R1W #(
    .DataWidth( 48 ),
    .AddressRange( 97 ),
    .AddressWidth( 7 ))
raw_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(raw_address0),
    .ce0(raw_ce0),
    .we0(raw_we0),
    .d0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0),
    .q0(raw_q0)
);

detector_hls_features_RAM_AUTO_1R1W #(
    .DataWidth( 48 ),
    .AddressRange( 218 ),
    .AddressWidth( 8 ))
features_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(features_address0),
    .ce0(features_ce0),
    .we0(features_we0),
    .d0(features_d0),
    .q0(features_q0)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1 grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start),
    .ap_done(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done),
    .ap_idle(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_idle),
    .ap_ready(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready),
    .raw_address0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0),
    .raw_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0),
    .raw_we0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0),
    .raw_d0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0),
    .bands_address0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0),
    .bands_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0),
    .bands_q0(bands_q0),
    .features_address0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0),
    .features_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0),
    .features_we0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0),
    .features_d0(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0),
    .sum_out(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out),
    .sum_out_ap_vld(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out_ap_vld)
);

detector_hls_udiv grp_udiv_fu_569(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_udiv_fu_569_ap_start),
    .ap_done(grp_udiv_fu_569_ap_done),
    .ap_idle(grp_udiv_fu_569_ap_idle),
    .ap_ready(grp_udiv_fu_569_ap_ready),
    .n(grp_udiv_fu_569_n),
    .d_val(grp_udiv_fu_569_d_val),
    .ap_return(grp_udiv_fu_569_ap_return)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_28_3 grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start),
    .ap_done(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done),
    .ap_idle(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_idle),
    .ap_ready(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready),
    .zext_ln27_1(i_2_fu_192),
    .raw_address0(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0),
    .raw_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0),
    .raw_q0(raw_q0),
    .s_out(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out),
    .s_out_ap_vld(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out_ap_vld)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5 grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start),
    .ap_done(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done),
    .ap_idle(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_idle),
    .ap_ready(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready),
    .raw_address0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0),
    .raw_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0),
    .raw_q0(raw_q0),
    .conv3_i12_i3167(conv3_i12_i3167_reg_283),
    .features_address0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0),
    .features_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0),
    .features_we0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0),
    .features_d0(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0),
    .invalid_21_out_i(invalid_1_fu_204),
    .invalid_21_out_o(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o),
    .invalid_21_out_o_ap_vld(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7 grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start),
    .ap_done(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done),
    .ap_idle(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_idle),
    .ap_ready(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready),
    .r18_ROOTS_load(r18_ROOTS_load_reg_1558),
    .features_address0(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0),
    .features_ce0(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0),
    .features_q0(features_q0),
    .node_2_in_out(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out),
    .node_2_in_out_ap_vld(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld),
    .ap_return(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return)
);

(* dissolve_hierarchy = "yes" *) detector_hls_sparsemux_7_2_32_1_1 #(
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
sparsemux_7_2_32_1_1_U31(
    .din0(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0),
    .din1(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1),
    .din2(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2),
    .def(tmp_4_fu_1014_p7),
    .sel(select_ln52_1_fu_959_p3),
    .dout(tmp_4_fu_1014_p9)
);

(* dissolve_hierarchy = "yes" *) detector_hls_sparsemux_7_2_32_1_1 #(
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
sparsemux_7_2_32_1_1_U32(
    .din0(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0),
    .din1(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1),
    .din2(p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2),
    .def(tmp_5_fu_1046_p7),
    .sel(select_ln52_1_fu_959_p3),
    .dout(tmp_5_fu_1046_p9)
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
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr <= 2'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 <= 2'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums <= 64'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 <= 64'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts <= 2'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 <= 2'd0;
    end else begin
        if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8 == 1'd1) & (1'b1 == ap_CS_fsm_state17))) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= 1'b0;
    end else begin
        if (((valid_read_read_fu_220_p2 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= 1'b1;
        end else if ((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready == 1'b1)) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln27_fu_806_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state5))) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= 1'b1;
        end else if ((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready == 1'b1)) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln27_fu_806_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= 1'b1;
        end else if ((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready == 1'b1)) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state12)) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= 1'b1;
        end else if ((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready == 1'b1)) begin
            grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_udiv_fu_569_ap_start_reg <= 1'b0;
    end else begin
        if ((((1'b1 == ap_CS_fsm_state7) & (tmp_3_fu_846_p3 == 1'd1)) | ((1'b1 == ap_CS_fsm_state7) & (tmp_3_fu_846_p3 == 1'd0)) | ((1'b1 == ap_CS_fsm_state3) & (tmp_fu_782_p3 == 1'd1)) | ((1'b1 == ap_CS_fsm_state3) & (tmp_fu_782_p3 == 1'd0)))) begin
            grp_udiv_fu_569_ap_start_reg <= 1'b1;
        end else if ((grp_udiv_fu_569_ap_ready == 1'b1)) begin
            grp_udiv_fu_569_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
        if ((tmp_reg_1402 == 1'd0)) begin
            conv3_i12_i3167_reg_283 <= grp_udiv_fu_569_ap_return;
        end else if ((tmp_reg_1402 == 1'd1)) begin
            conv3_i12_i3167_reg_283 <= grp_fu_614_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
    end else if (((1'b1 == ap_CS_fsm_state16) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412 <= xor_ln19_1_reg_1337;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425 <= select_ln52_2_reg_1513;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_863)) begin
        if ((array_id_read_reg_1298 == 1'd0)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314 <= next_fu_1139_p2;
        end else if ((array_id_read_reg_1298 == 1'd1)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314 <= 64'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= xor_ln19_1_reg_1337;
    end else if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_reg_1523;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_reg_1528;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= 1'd1;
    end else if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
    end else if (((1'b1 == ap_CS_fsm_state16) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= array_id_read_reg_1298;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523 <= select_ln52_3_reg_1518;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= array_id_read_reg_1298;
    end else if (((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= 1'd1;
    end else if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_863)) begin
        if ((array_id_read_reg_1298 == 1'd0)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373;
        end else if ((array_id_read_reg_1298 == 1'd1)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_863)) begin
        if ((array_id_read_reg_1298 == 1'd0)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338 <= 64'd0;
        end else if ((array_id_read_reg_1298 == 1'd1)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338 <= next_fu_1139_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= xor_ln19_1_reg_1337;
    end else if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_863)) begin
        if ((array_id_read_reg_1298 == 1'd0)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302 <= 1'd1;
        end else if ((array_id_read_reg_1298 == 1'd1)) begin
            detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= array_id_read_reg_1298;
    end else if (((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= 1'd1;
    end else if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_reg_1533;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_reg_1538;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
        i_2_fu_192 <= 7'd0;
    end else if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
        i_2_fu_192 <= add_ln27_reg_1424;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state14) & (targetBlock_reg_1563 == 1'd0))) begin
        invalid_1_fu_204 <= 1'd1;
    end else if (((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        invalid_1_fu_204 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
        if ((tmp_3_reg_1465 == 1'd0)) begin
            phi_ln29_reg_293 <= grp_udiv_fu_569_ap_return;
        end else if ((tmp_3_reg_1465 == 1'd1)) begin
            phi_ln29_reg_293 <= grp_fu_614_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln27_fu_806_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        score_fu_200 <= 64'd0;
    end else if (((1'b1 == ap_CS_fsm_state15) & (targetBlock_reg_1563 == 1'd1))) begin
        score_fu_200 <= score_1_fu_1198_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | ((array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)) | ((array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11)))) begin
                storemerge9_reg_540[0] <= 1'b0;
        storemerge9_reg_540[1] <= 1'b0;
        storemerge9_reg_540[2] <= 1'b0;
        storemerge9_reg_540[3] <= 1'b0;
        storemerge9_reg_540[4] <= 1'b0;
        storemerge9_reg_540[5] <= 1'b0;
        storemerge9_reg_540[6] <= 1'b0;
        storemerge9_reg_540[7] <= 1'b0;
        storemerge9_reg_540[8] <= 1'b0;
        storemerge9_reg_540[9] <= 1'b0;
        storemerge9_reg_540[10] <= 1'b0;
        storemerge9_reg_540[11] <= 1'b0;
        storemerge9_reg_540[12] <= 1'b0;
        storemerge9_reg_540[13] <= 1'b0;
        storemerge9_reg_540[14] <= 1'b0;
        storemerge9_reg_540[15] <= 1'b0;
        storemerge9_reg_540[16] <= 1'b0;
        storemerge9_reg_540[17] <= 1'b0;
        storemerge9_reg_540[18] <= 1'b0;
        storemerge9_reg_540[19] <= 1'b0;
        storemerge9_reg_540[20] <= 1'b0;
        storemerge9_reg_540[21] <= 1'b0;
        storemerge9_reg_540[22] <= 1'b0;
        storemerge9_reg_540[23] <= 1'b0;
        storemerge9_reg_540[24] <= 1'b0;
        storemerge9_reg_540[25] <= 1'b0;
        storemerge9_reg_540[26] <= 1'b0;
        storemerge9_reg_540[27] <= 1'b0;
        storemerge9_reg_540[28] <= 1'b0;
        storemerge9_reg_540[29] <= 1'b0;
        storemerge9_reg_540[30] <= 1'b0;
        storemerge9_reg_540[31] <= 1'b0;
        storemerge9_reg_540[32] <= 1'b0;
        storemerge9_reg_540[33] <= 1'b0;
        storemerge9_reg_540[34] <= 1'b0;
        storemerge9_reg_540[35] <= 1'b0;
        storemerge9_reg_540[36] <= 1'b0;
        storemerge9_reg_540[37] <= 1'b0;
        storemerge9_reg_540[38] <= 1'b0;
        storemerge9_reg_540[39] <= 1'b0;
        storemerge9_reg_540[40] <= 1'b0;
        storemerge9_reg_540[41] <= 1'b0;
        storemerge9_reg_540[42] <= 1'b0;
        storemerge9_reg_540[43] <= 1'b0;
        storemerge9_reg_540[44] <= 1'b0;
        storemerge9_reg_540[45] <= 1'b0;
        storemerge9_reg_540[46] <= 1'b0;
        storemerge9_reg_540[47] <= 1'b0;
        storemerge9_reg_540[48] <= 1'b0;
        storemerge9_reg_540[49] <= 1'b0;
        storemerge9_reg_540[50] <= 1'b0;
        storemerge9_reg_540[51] <= 1'b0;
        storemerge9_reg_540[52] <= 1'b0;
        storemerge9_reg_540[53] <= 1'b0;
        storemerge9_reg_540[54] <= 1'b0;
        storemerge9_reg_540[55] <= 1'b0;
        storemerge9_reg_540[56] <= 1'b0;
        storemerge9_reg_540[57] <= 1'b0;
        storemerge9_reg_540[58] <= 1'b0;
        storemerge9_reg_540[59] <= 1'b0;
        storemerge9_reg_540[60] <= 1'b0;
        storemerge9_reg_540[61] <= 1'b0;
        storemerge9_reg_540[62] <= 1'b0;
        storemerge9_reg_540[63] <= 1'b0;
        storemerge9_reg_540[64] <= 1'b0;
        storemerge9_reg_540[65] <= 1'b0;
        storemerge9_reg_540[66] <= 1'b0;
        storemerge9_reg_540[67] <= 1'b0;
        storemerge9_reg_540[68] <= 1'b0;
        storemerge9_reg_540[69] <= 1'b0;
        storemerge9_reg_540[70] <= 1'b0;
        storemerge9_reg_540[71] <= 1'b0;
        storemerge9_reg_540[72] <= 1'b0;
        storemerge9_reg_540[73] <= 1'b0;
        storemerge9_reg_540[74] <= 1'b0;
        storemerge9_reg_540[75] <= 1'b0;
        storemerge9_reg_540[76] <= 1'b0;
        storemerge9_reg_540[77] <= 1'b0;
        storemerge9_reg_540[78] <= 1'b0;
        storemerge9_reg_540[79] <= 1'b0;
        storemerge9_reg_540[80] <= 1'b0;
        storemerge9_reg_540[81] <= 1'b0;
        storemerge9_reg_540[82] <= 1'b0;
        storemerge9_reg_540[83] <= 1'b0;
        storemerge9_reg_540[84] <= 1'b0;
        storemerge9_reg_540[85] <= 1'b0;
        storemerge9_reg_540[86] <= 1'b0;
        storemerge9_reg_540[87] <= 1'b0;
        storemerge9_reg_540[88] <= 1'b0;
        storemerge9_reg_540[89] <= 1'b0;
        storemerge9_reg_540[90] <= 1'b0;
        storemerge9_reg_540[91] <= 1'b0;
        storemerge9_reg_540[92] <= 1'b0;
        storemerge9_reg_540[93] <= 1'b0;
        storemerge9_reg_540[94] <= 1'b0;
        storemerge9_reg_540[95] <= 1'b0;
        storemerge9_reg_540[96] <= 1'b0;
        storemerge9_reg_540[97] <= 1'b0;
        storemerge9_reg_540[101] <= 1'b0;
        storemerge9_reg_540[102] <= 1'b1;
        storemerge9_reg_540[103] <= 1'b0;
    end else if ((1'b1 == ap_CS_fsm_state16)) begin
                storemerge9_reg_540[97 : 0] <= tmp_7_fu_1249_p7[97 : 0];
        storemerge9_reg_540[103 : 101] <= tmp_7_fu_1249_p7[103 : 101];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln27_fu_806_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        tree_fu_196 <= 7'd0;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        tree_fu_196 <= add_ln40_reg_1492;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        add_ln27_reg_1424 <= add_ln27_fu_812_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        add_ln40_reg_1492 <= add_ln40_fu_895_p2;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_reg_1523 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_fu_1086_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_reg_1528 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_fu_1097_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_reg_1533 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_fu_1105_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_reg_1538 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_fu_1111_p3;
        empty_16_reg_1543 <= empty_16_fu_1131_p3;
        next_reg_1550 <= next_fu_1139_p2;
        select_ln52_2_reg_1513 <= select_ln52_2_fu_988_p3;
        select_ln52_3_reg_1518 <= select_ln52_3_fu_995_p3;
        trunc_ln52_reg_1508 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        array_id_read_reg_1298 <= array_id;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_reg_1368 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_fu_736_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_reg_1363 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_fu_728_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_reg_1358 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_fu_720_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_reg_1392 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_fu_766_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_reg_1387 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_fu_758_p3;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_reg_1382 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_fu_750_p3;
        xor_ln19_1_reg_1337 <= xor_ln19_1_fu_660_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
        node_2_in_loc_fu_172 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd0) & (select_ln52_1_fu_959_p3 == 2'd0) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd0) & (select_ln52_1_fu_959_p3 == 2'd1) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(select_ln52_1_fu_959_p3 == 2'd1) & ~(select_ln52_1_fu_959_p3 == 2'd0) & (array_id_read_reg_1298 == 1'd0) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd1) & (select_ln52_1_fu_959_p3 == 2'd0) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((array_id_read_reg_1298 == 1'd1) & (select_ln52_1_fu_959_p3 == 2'd1) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((~(select_ln52_1_fu_959_p3 == 2'd1) & ~(select_ln52_1_fu_959_p3 == 2'd0) & (array_id_read_reg_1298 == 1'd1) & (or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2 <= trunc_ln52_fu_964_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        r18_ROOTS_load_reg_1558 <= r18_ROOTS_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        sext_ln28_reg_1460 <= sext_ln28_fu_837_p1;
        tmp_3_reg_1465 <= tmp_3_fu_846_p1[32'd51];
        zext_ln27_1_reg_1455[6 : 0] <= zext_ln27_1_fu_831_p1[6 : 0];
        zext_ln27_reg_1450[6 : 0] <= zext_ln27_fu_828_p1[6 : 0];
        zext_ln29_reg_1469[50 : 0] <= zext_ln29_fu_860_p1[50 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        sub_ln26_reg_1406 <= sub_ln26_fu_790_p2;
        tmp_reg_1402 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out[32'd54];
        trunc_ln22_reg_1397 <= trunc_ln22_fu_777_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        targetBlock_reg_1563 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return;
    end
end

always @ (*) begin
    if ((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

always @ (*) begin
    if ((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done == 1'b0)) begin
        ap_ST_fsm_state13_blk = 1'b1;
    end else begin
        ap_ST_fsm_state13_blk = 1'b0;
    end
end

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state4_on_subcall_done)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state8_on_subcall_done)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
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
    if ((1'b1 == ap_CS_fsm_state17)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        features_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        features_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        features_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0;
    end else begin
        features_address0 = zext_ln29_1_fu_881_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        features_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        features_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        features_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0;
    end else begin
        features_ce0 = features_ce0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        features_ce0_local = 1'b1;
    end else begin
        features_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        features_d0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        features_d0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0;
    end else begin
        features_d0 = sub_ln29_2_fu_869_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        features_we0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        features_we0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0;
    end else begin
        features_we0 = (features_we0_out | 1'b0);
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        features_we0_local = 1'b1;
    end else begin
        features_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state8) & (tmp_3_reg_1465 == 1'd1)) | ((1'b1 == ap_CS_fsm_state8) & (tmp_3_reg_1465 == 1'd0)))) begin
        grp_udiv_fu_569_d_val = 6'd9;
    end else if ((((1'b1 == ap_CS_fsm_state4) & (tmp_reg_1402 == 1'd1)) | ((1'b1 == ap_CS_fsm_state4) & (tmp_reg_1402 == 1'd0)))) begin
        grp_udiv_fu_569_d_val = 6'd33;
    end else begin
        grp_udiv_fu_569_d_val = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (tmp_3_reg_1465 == 1'd1))) begin
        grp_udiv_fu_569_n = zext_ln29_reg_1469;
    end else if (((1'b1 == ap_CS_fsm_state8) & (tmp_3_reg_1465 == 1'd0))) begin
        grp_udiv_fu_569_n = sext_ln28_reg_1460;
    end else if (((1'b1 == ap_CS_fsm_state4) & (tmp_reg_1402 == 1'd1))) begin
        grp_udiv_fu_569_n = sub_ln26_reg_1406;
    end else if (((1'b1 == ap_CS_fsm_state4) & (tmp_reg_1402 == 1'd0))) begin
        grp_udiv_fu_569_n = trunc_ln22_reg_1397;
    end else begin
        grp_udiv_fu_569_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        r18_NODE_VALUE_ce0_local = 1'b1;
    end else begin
        r18_NODE_VALUE_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        r18_ROOTS_ce0_local = 1'b1;
    end else begin
        r18_ROOTS_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        raw_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        raw_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        raw_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0;
    end else begin
        raw_address0 = zext_ln27_reg_1450;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        raw_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        raw_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        raw_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0;
    end else begin
        raw_ce0 = raw_ce0_local;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
        raw_ce0_local = 1'b1;
    end else begin
        raw_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        raw_we0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0;
    end else begin
        raw_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((valid_read_read_fu_220_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end else if (((valid_read_read_fu_220_p2 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((icmp_ln27_fu_806_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b0 == ap_block_state8_on_subcall_done) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state10 : begin
            if (((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((or_ln50_fu_931_p2 == 1'd1) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end else if (((or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            if (((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln27_fu_812_p2 = (i_2_fu_192 + 7'd1);

assign add_ln29_fu_876_p2 = (zext_ln27_1_reg_1455 + 8'd97);

assign add_ln40_fu_895_p2 = (tree_fu_196 + 7'd1);

assign add_ln50_fu_909_p2 = (score_fu_200 + 64'd2147483648);

assign add_ln51_fu_942_p2 = (select_ln51_fu_937_p3 + score_fu_200);

assign add_ln52_1_fu_1073_p2 = (select_ln51_1_fu_948_p3 + 2'd1);

assign add_ln52_fu_974_p2 = (select_ln52_1_fu_959_p3 + 2'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state4_on_subcall_done = (((grp_udiv_fu_569_ap_done == 1'b0) & (tmp_reg_1402 == 1'd1)) | ((grp_udiv_fu_569_ap_done == 1'b0) & (tmp_reg_1402 == 1'd0)));
end

always @ (*) begin
    ap_block_state8_on_subcall_done = (((grp_udiv_fu_569_ap_done == 1'b0) & (tmp_3_reg_1465 == 1'd1)) | ((grp_udiv_fu_569_ap_done == 1'b0) & (tmp_3_reg_1465 == 1'd0)));
end

always @ (*) begin
    ap_condition_863 = ((or_ln50_fu_931_p2 == 1'd0) & (icmp_ln40_fu_889_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11));
end

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412;

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350;

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508;

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474;

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380;

assign ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8 = detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign bands_address0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0;

assign bands_ce0 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0;

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_fu_736_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_2_fu_682_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_fu_728_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_1_fu_674_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_fu_1086_p3 = ((icmp_ln51_fu_953_p2[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349 : xor_ln19_1_reg_1337);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2 = (xor_ln19_1_fu_660_p2 & or_ln19_fu_630_p2);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_fu_720_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_fu_666_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_fu_1097_p3 = ((empty_fu_1092_p2[0:0] == 1'b1) ? 2'd0 : add_ln52_1_fu_1073_p2);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_fu_766_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_5_fu_706_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_fu_758_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_4_fu_698_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_fu_1105_p3 = ((icmp_ln51_fu_953_p2[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373 : array_id_read_reg_1298);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2 = (or_ln19_fu_630_p2 & array_id);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_fu_750_p3 = ((or_ln19_fu_630_p2[0:0] == 1'b1) ? select_ln19_3_fu_690_p3 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts);

assign detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_fu_1111_p3 = ((icmp_ln51_fu_953_p2[0:0] == 1'b1) ? 2'd0 : select_ln52_4_fu_1079_p3);

assign empty_16_fu_1131_p3 = ((icmp_ln51_fu_953_p2[0:0] == 1'b1) ? 2'd3 : add_ln52_1_fu_1073_p2);

assign empty_fu_1092_p2 = (icmp_ln51_fu_953_p2 | array_id_read_reg_1298);

assign features_we0_out = features_we0_local;

assign grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg;

assign grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg;

assign grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start = grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg;

assign grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start = grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg;

assign grp_fu_614_p2 = (48'd0 - grp_udiv_fu_569_ap_return);

assign grp_udiv_fu_569_ap_start = grp_udiv_fu_569_ap_start_reg;

assign icmp_ln27_fu_806_p2 = ((i_2_fu_192 == 7'd97) ? 1'b1 : 1'b0);

assign icmp_ln40_fu_889_p2 = ((tree_fu_196 == 7'd120) ? 1'b1 : 1'b0);

assign icmp_ln50_fu_925_p2 = ((tmp_6_fu_915_p4 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln51_fu_953_p2 = ((select_ln51_1_fu_948_p3 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln52_fu_968_p2 = ((select_ln52_1_fu_959_p3 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln53_fu_1244_p2 = (($signed(zext_ln53_2_fu_1240_p1) < $signed(next_reg_1550)) ? 1'b1 : 1'b0);

assign next_fu_1139_p2 = ($signed(add_ln51_fu_942_p2) - $signed(ref_tmp227_085_cast_fu_1127_p1));

assign or_ln19_fu_630_p2 = (xor_ln19_fu_624_p2 | new_sequence);

assign or_ln50_fu_931_p2 = (invalid_1_fu_204 | icmp_ln50_fu_925_p2);

assign p_shl_fu_1216_p3 = {{empty_16_reg_1543}, {26'd0}};

assign r18_NODE_VALUE_address0 = zext_ln43_fu_1189_p1;

assign r18_ROOTS_address0 = zext_ln40_fu_901_p1;

assign ref_tmp227_085_cast_fu_1127_p1 = $signed(ref_tmp227_085_fu_1119_p3);

assign ref_tmp227_085_fu_1119_p3 = ((icmp_ln51_fu_953_p2[0:0] == 1'b1) ? select_ln51_2_fu_1066_p3 : 32'd0);

assign result = storemerge9_reg_540;

assign score_1_fu_1198_p2 = ($signed(score_fu_200) + $signed(sext_ln43_fu_1194_p1));

assign select_ln19_1_fu_674_p3 = ((array_id[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 : 64'd0);

assign select_ln19_2_fu_682_p3 = ((array_id[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 : 2'd0);

assign select_ln19_3_fu_690_p3 = ((array_id[0:0] == 1'b1) ? 2'd0 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts);

assign select_ln19_4_fu_698_p3 = ((array_id[0:0] == 1'b1) ? 64'd0 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums);

assign select_ln19_5_fu_706_p3 = ((array_id[0:0] == 1'b1) ? 2'd0 : detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr);

assign select_ln19_fu_666_p3 = ((array_id[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 : 2'd0);

assign select_ln51_1_fu_948_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_reg_1382 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_reg_1358);

assign select_ln51_2_fu_1066_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? tmp_5_fu_1046_p9 : tmp_4_fu_1014_p9);

assign select_ln51_fu_937_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_reg_1387 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_reg_1363);

assign select_ln52_1_fu_959_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_reg_1392 : detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_reg_1368);

assign select_ln52_2_fu_988_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? 2'd0 : select_ln52_fu_980_p3);

assign select_ln52_3_fu_995_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? select_ln52_fu_980_p3 : 2'd0);

assign select_ln52_4_fu_1079_p3 = ((array_id_read_reg_1298[0:0] == 1'b1) ? add_ln52_1_fu_1073_p2 : 2'd0);

assign select_ln52_fu_980_p3 = ((icmp_ln52_fu_968_p2[0:0] == 1'b1) ? 2'd0 : add_ln52_fu_974_p2);

assign sext_ln28_fu_837_p0 = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;

assign sext_ln28_fu_837_p1 = sext_ln28_fu_837_p0;

assign sext_ln43_fu_1194_p1 = $signed(r18_NODE_VALUE_q0);

assign sub_ln26_fu_790_p2 = (54'd0 - trunc_ln22_fu_777_p1);

assign sub_ln29_2_fu_869_p2 = (raw_q0 - phi_ln29_reg_293);

assign sub_ln29_fu_854_p2 = (51'd0 - trunc_ln28_fu_842_p1);

assign sub_ln53_fu_1234_p2 = (p_shl_fu_1216_p3 - zext_ln53_1_fu_1230_p1);

assign tmp_3_fu_846_p1 = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;

assign tmp_3_fu_846_p3 = tmp_3_fu_846_p1[32'd51];

assign tmp_4_fu_1014_p7 = 'bx;

assign tmp_5_fu_1046_p7 = 'bx;

assign tmp_6_fu_915_p4 = {{add_ln50_fu_909_p2[63:32]}};

assign tmp_7_fu_1249_p7 = {{{{{{array_id_read_reg_1298}, {1'd0}}, {icmp_ln53_fu_1244_p2}}, {zext_ln53_fu_1213_p1}}, {next_reg_1550}}, {trunc_ln52_reg_1508}};

assign tmp_8_fu_1223_p3 = {{empty_16_reg_1543}, {24'd0}};

assign tmp_fu_782_p3 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out[32'd54];

assign trunc_ln22_fu_777_p1 = grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out[53:0];

assign trunc_ln28_fu_842_p0 = grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;

assign trunc_ln28_fu_842_p1 = trunc_ln28_fu_842_p0[50:0];

assign trunc_ln52_fu_964_p1 = score_fu_200[31:0];

assign valid_read_read_fu_220_p2 = valid;

assign xor_ln19_1_fu_660_p2 = (array_id ^ 1'd1);

assign xor_ln19_fu_624_p2 = (valid ^ 1'd1);

assign zext_ln27_1_fu_831_p1 = i_2_fu_192;

assign zext_ln27_fu_828_p1 = i_2_fu_192;

assign zext_ln29_1_fu_881_p1 = add_ln29_fu_876_p2;

assign zext_ln29_fu_860_p1 = sub_ln29_fu_854_p2;

assign zext_ln40_fu_901_p1 = tree_fu_196;

assign zext_ln43_fu_1189_p1 = node_2_in_loc_fu_172;

assign zext_ln53_1_fu_1230_p1 = tmp_8_fu_1223_p3;

assign zext_ln53_2_fu_1240_p1 = sub_ln53_fu_1234_p2;

assign zext_ln53_fu_1213_p1 = empty_16_reg_1543;

always @ (posedge ap_clk) begin
    zext_ln27_reg_1450[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln27_1_reg_1455[7] <= 1'b0;
    zext_ln29_reg_1469[53:51] <= 3'b000;
    storemerge9_reg_540[100:98] <= 3'b000;
end

endmodule               
