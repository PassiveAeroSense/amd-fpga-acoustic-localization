                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    bands_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    bands_ce0 : OUT STD_LOGIC;
    bands_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
    valid : IN STD_LOGIC_VECTOR (0 downto 0);
    new_sequence : IN STD_LOGIC_VECTOR (0 downto 0);
    array_id : IN STD_LOGIC_VECTOR (0 downto 0);
    result : OUT STD_LOGIC_VECTOR (103 downto 0) );
end;


architecture behav of detector_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "detector_hls_detector_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=14.246800,HLS_SYN_LAT=13156,HLS_SYN_TPT=none,HLS_SYN_MEM=27,HLS_SYN_DSP=0,HLS_SYN_FF=2379,HLS_SYN_LUT=3286,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (16 downto 0) := "00000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (16 downto 0) := "00000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (16 downto 0) := "00000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (16 downto 0) := "00000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (16 downto 0) := "00000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (16 downto 0) := "00000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (16 downto 0) := "00001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (16 downto 0) := "00010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (16 downto 0) := "00100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (16 downto 0) := "01000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (16 downto 0) := "10000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv104_40000000000000000000000000 : STD_LOGIC_VECTOR (103 downto 0) := "01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv48_0 : STD_LOGIC_VECTOR (47 downto 0) := "000000000000000000000000000000000000000000000000";
    constant ap_const_lv6_21 : STD_LOGIC_VECTOR (5 downto 0) := "100001";
    constant ap_const_lv6_9 : STD_LOGIC_VECTOR (5 downto 0) := "001001";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110110";
    constant ap_const_lv54_0 : STD_LOGIC_VECTOR (53 downto 0) := "000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv7_61 : STD_LOGIC_VECTOR (6 downto 0) := "1100001";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv51_0 : STD_LOGIC_VECTOR (50 downto 0) := "000000000000000000000000000000000000000000000000000";
    constant ap_const_lv8_61 : STD_LOGIC_VECTOR (7 downto 0) := "01100001";
    constant ap_const_lv7_78 : STD_LOGIC_VECTOR (6 downto 0) := "1111000";
    constant ap_const_lv64_80000000 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000010000000000000000000000000000000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv26_0 : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    constant ap_const_lv24_0 : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal r18_ROOTS_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal r18_ROOTS_q0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_VALUE_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_VALUE_q0 : STD_LOGIC_VECTOR (22 downto 0);
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal array_id_read_reg_1298 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln19_1_fu_660_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln19_1_reg_1337 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_fu_720_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_reg_1358 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_fu_728_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_reg_1363 : STD_LOGIC_VECTOR (63 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_fu_736_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_reg_1368 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_fu_750_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_reg_1382 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_fu_758_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_reg_1387 : STD_LOGIC_VECTOR (63 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_fu_766_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_reg_1392 : STD_LOGIC_VECTOR (1 downto 0);
    signal trunc_ln22_fu_777_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal trunc_ln22_reg_1397 : STD_LOGIC_VECTOR (53 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_fu_782_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_1402 : STD_LOGIC_VECTOR (0 downto 0);
    signal sub_ln26_fu_790_p2 : STD_LOGIC_VECTOR (53 downto 0);
    signal sub_ln26_reg_1406 : STD_LOGIC_VECTOR (53 downto 0);
    signal add_ln27_fu_812_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln27_reg_1424 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln27_fu_828_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_reg_1450 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal zext_ln27_1_fu_831_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln27_1_reg_1455 : STD_LOGIC_VECTOR (7 downto 0);
    signal sext_ln28_fu_837_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal sext_ln28_reg_1460 : STD_LOGIC_VECTOR (53 downto 0);
    signal tmp_3_fu_846_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_reg_1465 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln29_fu_860_p1 : STD_LOGIC_VECTOR (53 downto 0);
    signal zext_ln29_reg_1469 : STD_LOGIC_VECTOR (53 downto 0);
    signal grp_udiv_fu_569_ap_return : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_614_p2 : STD_LOGIC_VECTOR (47 downto 0);
    signal add_ln40_fu_895_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln40_reg_1492 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal trunc_ln52_fu_964_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln52_reg_1508 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln52_2_fu_988_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln52_2_reg_1513 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln52_3_fu_995_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln52_3_reg_1518 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_fu_1086_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_reg_1523 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_fu_1097_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_reg_1528 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_fu_1105_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_reg_1533 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_fu_1111_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_reg_1538 : STD_LOGIC_VECTOR (1 downto 0);
    signal empty_16_fu_1131_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal empty_16_reg_1543 : STD_LOGIC_VECTOR (1 downto 0);
    signal next_fu_1139_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal next_reg_1550 : STD_LOGIC_VECTOR (63 downto 0);
    signal r18_ROOTS_load_reg_1558 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal targetBlock_reg_1563 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal tmp_7_fu_1249_p7 : STD_LOGIC_VECTOR (103 downto 0);
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal raw_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal raw_ce0 : STD_LOGIC;
    signal raw_we0 : STD_LOGIC;
    signal raw_q0 : STD_LOGIC_VECTOR (47 downto 0);
    signal features_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal features_ce0 : STD_LOGIC;
    signal features_we0 : STD_LOGIC;
    signal features_d0 : STD_LOGIC_VECTOR (47 downto 0);
    signal features_q0 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_idle : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out : STD_LOGIC_VECTOR (54 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out_ap_vld : STD_LOGIC;
    signal grp_udiv_fu_569_ap_start : STD_LOGIC;
    signal grp_udiv_fu_569_ap_done : STD_LOGIC;
    signal grp_udiv_fu_569_ap_idle : STD_LOGIC;
    signal grp_udiv_fu_569_ap_ready : STD_LOGIC;
    signal grp_udiv_fu_569_n : STD_LOGIC_VECTOR (53 downto 0);
    signal grp_udiv_fu_569_d_val : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_idle : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out_ap_vld : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_idle : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_idle : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0 : STD_LOGIC;
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld : STD_LOGIC;
    signal conv3_i12_i3167_reg_283 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_block_state4_on_subcall_done : BOOLEAN;
    signal phi_ln29_reg_293 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_block_state8_on_subcall_done : BOOLEAN;
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln40_fu_889_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln50_fu_931_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314 : STD_LOGIC_VECTOR (63 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_read_read_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 : STD_LOGIC_VECTOR (0 downto 0);
    signal detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523 : STD_LOGIC_VECTOR (1 downto 0);
    signal storemerge9_reg_540 : STD_LOGIC_VECTOR (103 downto 0);
    signal grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal features_we0_out : STD_LOGIC;
    signal grp_udiv_fu_569_ap_start_reg : STD_LOGIC := '0';
    signal grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln27_fu_806_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal invalid_1_fu_204 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg : STD_LOGIC := '0';
    signal node_2_in_loc_fu_172 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln29_1_fu_881_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal zext_ln40_fu_901_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln43_fu_1189_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state17 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state17 : signal is "none";
    signal select_ln52_1_fu_959_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal i_2_fu_192 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal tree_fu_196 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal score_fu_200 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal score_1_fu_1198_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal raw_ce0_local : STD_LOGIC;
    signal features_we0_local : STD_LOGIC;
    signal sub_ln29_2_fu_869_p2 : STD_LOGIC_VECTOR (47 downto 0);
    signal features_ce0_local : STD_LOGIC;
    signal r18_ROOTS_ce0_local : STD_LOGIC;
    signal r18_NODE_VALUE_ce0_local : STD_LOGIC;
    signal xor_ln19_fu_624_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln19_fu_630_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln19_fu_666_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln19_1_fu_674_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln19_2_fu_682_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln19_3_fu_690_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln19_4_fu_698_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln19_5_fu_706_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal sext_ln28_fu_837_p0 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln28_fu_842_p0 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_3_fu_846_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln28_fu_842_p1 : STD_LOGIC_VECTOR (50 downto 0);
    signal sub_ln29_fu_854_p2 : STD_LOGIC_VECTOR (50 downto 0);
    signal add_ln29_fu_876_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln50_fu_909_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_fu_915_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln50_fu_925_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln51_fu_937_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln51_1_fu_948_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln52_fu_968_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln52_fu_974_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln52_fu_980_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_1014_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_1046_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_1046_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_1014_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln52_1_fu_1073_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln51_fu_953_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_fu_1092_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln52_4_fu_1079_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln51_2_fu_1066_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ref_tmp227_085_fu_1119_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln51_fu_942_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ref_tmp227_085_cast_fu_1127_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln43_fu_1194_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_8_fu_1223_p3 : STD_LOGIC_VECTOR (25 downto 0);
    signal p_shl_fu_1216_p3 : STD_LOGIC_VECTOR (27 downto 0);
    signal zext_ln53_1_fu_1230_p1 : STD_LOGIC_VECTOR (27 downto 0);
    signal sub_ln53_fu_1234_p2 : STD_LOGIC_VECTOR (27 downto 0);
    signal zext_ln53_2_fu_1240_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln53_fu_1244_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln53_fu_1213_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_condition_863 : BOOLEAN;
    signal tmp_4_fu_1014_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_1014_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_1014_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_5_fu_1046_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_5_fu_1046_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_5_fu_1046_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        raw_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
        raw_ce0 : OUT STD_LOGIC;
        raw_we0 : OUT STD_LOGIC;
        raw_d0 : OUT STD_LOGIC_VECTOR (47 downto 0);
        bands_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
        bands_ce0 : OUT STD_LOGIC;
        bands_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
        features_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        features_ce0 : OUT STD_LOGIC;
        features_we0 : OUT STD_LOGIC;
        features_d0 : OUT STD_LOGIC_VECTOR (47 downto 0);
        sum_out : OUT STD_LOGIC_VECTOR (54 downto 0);
        sum_out_ap_vld : OUT STD_LOGIC );
    end component;


    component detector_hls_udiv IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        n : IN STD_LOGIC_VECTOR (53 downto 0);
        d_val : IN STD_LOGIC_VECTOR (5 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (47 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_28_3 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        zext_ln27_1 : IN STD_LOGIC_VECTOR (6 downto 0);
        raw_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
        raw_ce0 : OUT STD_LOGIC;
        raw_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
        s_out : OUT STD_LOGIC_VECTOR (51 downto 0);
        s_out_ap_vld : OUT STD_LOGIC );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        raw_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
        raw_ce0 : OUT STD_LOGIC;
        raw_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
        conv3_i12_i3167 : IN STD_LOGIC_VECTOR (47 downto 0);
        features_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        features_ce0 : OUT STD_LOGIC;
        features_we0 : OUT STD_LOGIC;
        features_d0 : OUT STD_LOGIC_VECTOR (47 downto 0);
        invalid_21_out_i : IN STD_LOGIC_VECTOR (0 downto 0);
        invalid_21_out_o : OUT STD_LOGIC_VECTOR (0 downto 0);
        invalid_21_out_o_ap_vld : OUT STD_LOGIC );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        r18_ROOTS_load : IN STD_LOGIC_VECTOR (10 downto 0);
        features_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        features_ce0 : OUT STD_LOGIC;
        features_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
        node_2_in_out : OUT STD_LOGIC_VECTOR (10 downto 0);
        node_2_in_out_ap_vld : OUT STD_LOGIC;
        ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component detector_hls_sparsemux_7_2_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (1 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (1 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (1 downto 0);
        din2_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component detector_hls_r18_ROOTS_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (10 downto 0) );
    end component;


    component detector_hls_r18_NODE_VALUE_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (22 downto 0) );
    end component;


    component detector_hls_raw_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (47 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (47 downto 0) );
    end component;


    component detector_hls_features_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (7 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (47 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (47 downto 0) );
    end component;



begin
    r18_ROOTS_U : component detector_hls_r18_ROOTS_ROM_AUTO_1R
    generic map (
        DataWidth => 11,
        AddressRange => 120,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_ROOTS_address0,
        ce0 => r18_ROOTS_ce0_local,
        q0 => r18_ROOTS_q0);

    r18_NODE_VALUE_U : component detector_hls_r18_NODE_VALUE_ROM_AUTO_1R
    generic map (
        DataWidth => 23,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_NODE_VALUE_address0,
        ce0 => r18_NODE_VALUE_ce0_local,
        q0 => r18_NODE_VALUE_q0);

    raw_U : component detector_hls_raw_RAM_AUTO_1R1W
    generic map (
        DataWidth => 48,
        AddressRange => 97,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => raw_address0,
        ce0 => raw_ce0,
        we0 => raw_we0,
        d0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0,
        q0 => raw_q0);

    features_U : component detector_hls_features_RAM_AUTO_1R1W
    generic map (
        DataWidth => 48,
        AddressRange => 218,
        AddressWidth => 8)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => features_address0,
        ce0 => features_ce0,
        we0 => features_we0,
        d0 => features_d0,
        q0 => features_q0);

    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558 : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start,
        ap_done => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done,
        ap_idle => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_idle,
        ap_ready => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready,
        raw_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0,
        raw_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0,
        raw_we0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0,
        raw_d0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_d0,
        bands_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0,
        bands_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0,
        bands_q0 => bands_q0,
        features_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0,
        features_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0,
        features_we0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0,
        features_d0 => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0,
        sum_out => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out,
        sum_out_ap_vld => grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out_ap_vld);

    grp_udiv_fu_569 : component detector_hls_udiv
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_udiv_fu_569_ap_start,
        ap_done => grp_udiv_fu_569_ap_done,
        ap_idle => grp_udiv_fu_569_ap_idle,
        ap_ready => grp_udiv_fu_569_ap_ready,
        n => grp_udiv_fu_569_n,
        d_val => grp_udiv_fu_569_d_val,
        ap_return => grp_udiv_fu_569_ap_return);

    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578 : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_28_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start,
        ap_done => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done,
        ap_idle => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_idle,
        ap_ready => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready,
        zext_ln27_1 => i_2_fu_192,
        raw_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0,
        raw_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0,
        raw_q0 => raw_q0,
        s_out => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out,
        s_out_ap_vld => grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out_ap_vld);

    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585 : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start,
        ap_done => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done,
        ap_idle => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_idle,
        ap_ready => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready,
        raw_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0,
        raw_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0,
        raw_q0 => raw_q0,
        conv3_i12_i3167 => conv3_i12_i3167_reg_283,
        features_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0,
        features_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0,
        features_we0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0,
        features_d0 => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0,
        invalid_21_out_i => invalid_1_fu_204,
        invalid_21_out_o => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o,
        invalid_21_out_o_ap_vld => grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld);

    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596 : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start,
        ap_done => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done,
        ap_idle => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_idle,
        ap_ready => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready,
        r18_ROOTS_load => r18_ROOTS_load_reg_1558,
        features_address0 => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0,
        features_ce0 => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0,
        features_q0 => features_q0,
        node_2_in_out => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out,
        node_2_in_out_ap_vld => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld,
        ap_return => grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return);

    sparsemux_7_2_32_1_1_U31 : component detector_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0,
        din1 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1,
        din2 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2,
        def => tmp_4_fu_1014_p7,
        sel => select_ln52_1_fu_959_p3,
        dout => tmp_4_fu_1014_p9);

    sparsemux_7_2_32_1_1_U32 : component detector_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0,
        din1 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1,
        din2 => p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2,
        def => tmp_5_fu_1046_p7,
        sel => select_ln52_1_fu_959_p3,
        dout => tmp_5_fu_1046_p9);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr <= ap_const_lv2_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523;
                end if; 
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 <= ap_const_lv2_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425;
                end if; 
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums <= ap_const_lv64_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490;
                end if; 
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 <= ap_const_lv64_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394;
                end if; 
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts <= ap_const_lv2_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457;
                end if; 
            end if;
        end if;
    end process;


    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 <= ap_const_lv2_0;
            else
                if (((ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363;
                end if; 
            end if;
        end if;
    end process;


    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= ap_const_logic_0;
            else
                if (((valid_read_read_fu_220_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_ready = ap_const_logic_1)) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln27_fu_806_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_ready = ap_const_logic_1)) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln27_fu_806_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_ready = ap_const_logic_1)) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_ready = ap_const_logic_1)) then 
                    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_udiv_fu_569_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_udiv_fu_569_ap_start_reg <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_state7) and (tmp_3_fu_846_p3 = ap_const_lv1_1)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (tmp_3_fu_846_p3 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (tmp_fu_782_p3 = ap_const_lv1_1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (tmp_fu_782_p3 = ap_const_lv1_0)))) then 
                    grp_udiv_fu_569_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_udiv_fu_569_ap_ready = ap_const_logic_1)) then 
                    grp_udiv_fu_569_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    conv3_i12_i3167_reg_283_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state4_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                if ((tmp_reg_1402 = ap_const_lv1_0)) then 
                    conv3_i12_i3167_reg_283 <= grp_udiv_fu_569_ap_return;
                elsif ((tmp_reg_1402 = ap_const_lv1_1)) then 
                    conv3_i12_i3167_reg_283 <= grp_fu_614_p2;
                end if;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state16) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412 <= xor_ln19_1_reg_1337;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425 <= ap_const_lv2_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_new_reg_425 <= select_ln52_2_reg_1513;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394 <= ap_const_lv64_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_1_reg_394 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_863)) then
                if ((array_id_read_reg_1298 = ap_const_lv1_0)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314 <= next_fu_1139_p2;
                elsif ((array_id_read_reg_1298 = ap_const_lv1_1)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_new_reg_314 <= ap_const_lv64_0;
                end if;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= xor_ln19_1_reg_1337;
            elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_reg_1523;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363 <= ap_const_lv2_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_1_reg_363 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_reg_1528;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= ap_const_lv1_1;
            elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state16) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508 <= array_id_read_reg_1298;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523 <= ap_const_lv2_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_new_reg_523 <= select_ln52_3_reg_1518;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= array_id_read_reg_1298;
            elsif (((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= ap_const_lv1_1;
            elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_863)) then
                if ((array_id_read_reg_1298 = ap_const_lv1_0)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373;
                elsif ((array_id_read_reg_1298 = ap_const_lv1_1)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_reg_326 <= ap_const_lv1_1;
                end if;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490 <= ap_const_lv64_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_1_reg_490 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_863)) then
                if ((array_id_read_reg_1298 = ap_const_lv1_0)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338 <= ap_const_lv64_0;
                elsif ((array_id_read_reg_1298 = ap_const_lv1_1)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_new_reg_338 <= next_fu_1139_p2;
                end if;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= xor_ln19_1_reg_1337;
            elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_863)) then
                if ((array_id_read_reg_1298 = ap_const_lv1_0)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302 <= ap_const_lv1_1;
                elsif ((array_id_read_reg_1298 = ap_const_lv1_1)) then 
                    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_reg_302 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349;
                end if;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= array_id_read_reg_1298;
            elsif (((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= ap_const_lv1_1;
            elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_reg_1533;
            end if; 
        end if;
    end process;

    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457 <= ap_const_lv2_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_1_reg_457 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_reg_1538;
            end if; 
        end if;
    end process;

    i_2_fu_192_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state4_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                i_2_fu_192 <= ap_const_lv7_0;
            elsif (((ap_const_boolean_0 = ap_block_state8_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                i_2_fu_192 <= add_ln27_reg_1424;
            end if; 
        end if;
    end process;

    invalid_1_fu_204_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state14) and (targetBlock_reg_1563 = ap_const_lv1_0))) then 
                invalid_1_fu_204 <= ap_const_lv1_1;
            elsif (((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
                invalid_1_fu_204 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_invalid_21_out_o;
            end if; 
        end if;
    end process;

    phi_ln29_reg_293_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state8_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                if ((tmp_3_reg_1465 = ap_const_lv1_0)) then 
                    phi_ln29_reg_293 <= grp_udiv_fu_569_ap_return;
                elsif ((tmp_3_reg_1465 = ap_const_lv1_1)) then 
                    phi_ln29_reg_293 <= grp_fu_614_p2;
                end if;
            end if; 
        end if;
    end process;

    score_fu_200_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln27_fu_806_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                score_fu_200 <= ap_const_lv64_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state15) and (targetBlock_reg_1563 = ap_const_lv1_1))) then 
                score_fu_200 <= score_1_fu_1198_p2;
            end if; 
        end if;
    end process;

    storemerge9_reg_540_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)) or ((array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11)))) then 
                storemerge9_reg_540(0) <= '0';
                storemerge9_reg_540(1) <= '0';
                storemerge9_reg_540(2) <= '0';
                storemerge9_reg_540(3) <= '0';
                storemerge9_reg_540(4) <= '0';
                storemerge9_reg_540(5) <= '0';
                storemerge9_reg_540(6) <= '0';
                storemerge9_reg_540(7) <= '0';
                storemerge9_reg_540(8) <= '0';
                storemerge9_reg_540(9) <= '0';
                storemerge9_reg_540(10) <= '0';
                storemerge9_reg_540(11) <= '0';
                storemerge9_reg_540(12) <= '0';
                storemerge9_reg_540(13) <= '0';
                storemerge9_reg_540(14) <= '0';
                storemerge9_reg_540(15) <= '0';
                storemerge9_reg_540(16) <= '0';
                storemerge9_reg_540(17) <= '0';
                storemerge9_reg_540(18) <= '0';
                storemerge9_reg_540(19) <= '0';
                storemerge9_reg_540(20) <= '0';
                storemerge9_reg_540(21) <= '0';
                storemerge9_reg_540(22) <= '0';
                storemerge9_reg_540(23) <= '0';
                storemerge9_reg_540(24) <= '0';
                storemerge9_reg_540(25) <= '0';
                storemerge9_reg_540(26) <= '0';
                storemerge9_reg_540(27) <= '0';
                storemerge9_reg_540(28) <= '0';
                storemerge9_reg_540(29) <= '0';
                storemerge9_reg_540(30) <= '0';
                storemerge9_reg_540(31) <= '0';
                storemerge9_reg_540(32) <= '0';
                storemerge9_reg_540(33) <= '0';
                storemerge9_reg_540(34) <= '0';
                storemerge9_reg_540(35) <= '0';
                storemerge9_reg_540(36) <= '0';
                storemerge9_reg_540(37) <= '0';
                storemerge9_reg_540(38) <= '0';
                storemerge9_reg_540(39) <= '0';
                storemerge9_reg_540(40) <= '0';
                storemerge9_reg_540(41) <= '0';
                storemerge9_reg_540(42) <= '0';
                storemerge9_reg_540(43) <= '0';
                storemerge9_reg_540(44) <= '0';
                storemerge9_reg_540(45) <= '0';
                storemerge9_reg_540(46) <= '0';
                storemerge9_reg_540(47) <= '0';
                storemerge9_reg_540(48) <= '0';
                storemerge9_reg_540(49) <= '0';
                storemerge9_reg_540(50) <= '0';
                storemerge9_reg_540(51) <= '0';
                storemerge9_reg_540(52) <= '0';
                storemerge9_reg_540(53) <= '0';
                storemerge9_reg_540(54) <= '0';
                storemerge9_reg_540(55) <= '0';
                storemerge9_reg_540(56) <= '0';
                storemerge9_reg_540(57) <= '0';
                storemerge9_reg_540(58) <= '0';
                storemerge9_reg_540(59) <= '0';
                storemerge9_reg_540(60) <= '0';
                storemerge9_reg_540(61) <= '0';
                storemerge9_reg_540(62) <= '0';
                storemerge9_reg_540(63) <= '0';
                storemerge9_reg_540(64) <= '0';
                storemerge9_reg_540(65) <= '0';
                storemerge9_reg_540(66) <= '0';
                storemerge9_reg_540(67) <= '0';
                storemerge9_reg_540(68) <= '0';
                storemerge9_reg_540(69) <= '0';
                storemerge9_reg_540(70) <= '0';
                storemerge9_reg_540(71) <= '0';
                storemerge9_reg_540(72) <= '0';
                storemerge9_reg_540(73) <= '0';
                storemerge9_reg_540(74) <= '0';
                storemerge9_reg_540(75) <= '0';
                storemerge9_reg_540(76) <= '0';
                storemerge9_reg_540(77) <= '0';
                storemerge9_reg_540(78) <= '0';
                storemerge9_reg_540(79) <= '0';
                storemerge9_reg_540(80) <= '0';
                storemerge9_reg_540(81) <= '0';
                storemerge9_reg_540(82) <= '0';
                storemerge9_reg_540(83) <= '0';
                storemerge9_reg_540(84) <= '0';
                storemerge9_reg_540(85) <= '0';
                storemerge9_reg_540(86) <= '0';
                storemerge9_reg_540(87) <= '0';
                storemerge9_reg_540(88) <= '0';
                storemerge9_reg_540(89) <= '0';
                storemerge9_reg_540(90) <= '0';
                storemerge9_reg_540(91) <= '0';
                storemerge9_reg_540(92) <= '0';
                storemerge9_reg_540(93) <= '0';
                storemerge9_reg_540(94) <= '0';
                storemerge9_reg_540(95) <= '0';
                storemerge9_reg_540(96) <= '0';
                storemerge9_reg_540(97) <= '0';
                storemerge9_reg_540(101) <= '0';
                storemerge9_reg_540(102) <= '1';
                storemerge9_reg_540(103) <= '0';
            elsif ((ap_const_logic_1 = ap_CS_fsm_state16)) then 
                                storemerge9_reg_540(97 downto 0) <= tmp_7_fu_1249_p7(97 downto 0);                storemerge9_reg_540(103 downto 101) <= tmp_7_fu_1249_p7(103 downto 101);
            end if; 
        end if;
    end process;

    tree_fu_196_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln27_fu_806_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                tree_fu_196 <= ap_const_lv7_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                tree_fu_196 <= add_ln40_reg_1492;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                add_ln27_reg_1424 <= add_ln27_fu_812_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state11)) then
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
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
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
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state13))) then
                node_2_in_loc_fu_172 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_node_2_in_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_0) and (select_ln52_1_fu_959_p3 = ap_const_lv2_0) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_0 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_0) and (select_ln52_1_fu_959_p3 = ap_const_lv2_1) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_1 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((select_ln52_1_fu_959_p3 = ap_const_lv2_1)) and not((select_ln52_1_fu_959_p3 = ap_const_lv2_0)) and (array_id_read_reg_1298 = ap_const_lv1_0) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_0_2 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_1) and (select_ln52_1_fu_959_p3 = ap_const_lv2_0) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_0 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((array_id_read_reg_1298 = ap_const_lv1_1) and (select_ln52_1_fu_959_p3 = ap_const_lv2_1) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_1 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((select_ln52_1_fu_959_p3 = ap_const_lv2_1)) and not((select_ln52_1_fu_959_p3 = ap_const_lv2_0)) and (array_id_read_reg_1298 = ap_const_lv1_1) and (or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                p_ZZ12detector_hlsPK6ap_intILi48EE7ap_uintILi1EES4_S4_RS3_ILi104EEE7history_1_2 <= trunc_ln52_fu_964_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state12)) then
                r18_ROOTS_load_reg_1558 <= r18_ROOTS_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                sext_ln28_reg_1460 <= sext_ln28_fu_837_p1;
                tmp_3_reg_1465 <= tmp_3_fu_846_p1(51 downto 51);
                    zext_ln27_1_reg_1455(6 downto 0) <= zext_ln27_1_fu_831_p1(6 downto 0);
                    zext_ln27_reg_1450(6 downto 0) <= zext_ln27_fu_828_p1(6 downto 0);
                    zext_ln29_reg_1469(50 downto 0) <= zext_ln29_fu_860_p1(50 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                sub_ln26_reg_1406 <= sub_ln26_fu_790_p2;
                tmp_reg_1402 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out(54 downto 54);
                trunc_ln22_reg_1397 <= trunc_ln22_fu_777_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state13)) then
                targetBlock_reg_1563 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_return;
            end if;
        end if;
    end process;
    zext_ln27_reg_1450(63 downto 7) <= "000000000000000000000000000000000000000000000000000000000";
    zext_ln27_1_reg_1455(7) <= '0';
    zext_ln29_reg_1469(53 downto 51) <= "000";
    storemerge9_reg_540(100 downto 98) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state5, ap_CS_fsm_state8, ap_CS_fsm_state11, ap_CS_fsm_state13, grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done, grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done, grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done, ap_CS_fsm_state4, ap_block_state4_on_subcall_done, ap_block_state8_on_subcall_done, icmp_ln40_fu_889_p2, or_ln50_fu_931_p2, valid_read_read_fu_220_p2, ap_CS_fsm_state2, icmp_ln27_fu_806_p2, ap_CS_fsm_state6, ap_CS_fsm_state10)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((valid_read_read_fu_220_p2 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state17;
                elsif (((valid_read_read_fu_220_p2 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_boolean_0 = ap_block_state4_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((icmp_ln27_fu_806_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state6 => 
                if (((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                if (((ap_const_boolean_0 = ap_block_state8_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state10 => 
                if (((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                if (((or_ln50_fu_931_p2 = ap_const_lv1_1) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                    ap_NS_fsm <= ap_ST_fsm_state17;
                elsif (((or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                    ap_NS_fsm <= ap_ST_fsm_state16;
                else
                    ap_NS_fsm <= ap_ST_fsm_state12;
                end if;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                if (((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state13))) then
                    ap_NS_fsm <= ap_ST_fsm_state14;
                else
                    ap_NS_fsm <= ap_ST_fsm_state13;
                end if;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXX";
        end case;
    end process;
    add_ln27_fu_812_p2 <= std_logic_vector(unsigned(i_2_fu_192) + unsigned(ap_const_lv7_1));
    add_ln29_fu_876_p2 <= std_logic_vector(unsigned(zext_ln27_1_reg_1455) + unsigned(ap_const_lv8_61));
    add_ln40_fu_895_p2 <= std_logic_vector(unsigned(tree_fu_196) + unsigned(ap_const_lv7_1));
    add_ln50_fu_909_p2 <= std_logic_vector(unsigned(score_fu_200) + unsigned(ap_const_lv64_80000000));
    add_ln51_fu_942_p2 <= std_logic_vector(unsigned(select_ln51_fu_937_p3) + unsigned(score_fu_200));
    add_ln52_1_fu_1073_p2 <= std_logic_vector(unsigned(select_ln51_1_fu_948_p3) + unsigned(ap_const_lv2_1));
    add_ln52_fu_974_p2 <= std_logic_vector(unsigned(select_ln52_1_fu_959_p3) + unsigned(ap_const_lv2_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state17 <= ap_CS_fsm(16);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_ST_fsm_state10_blk_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done)
    begin
        if ((grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state10_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state10_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;

    ap_ST_fsm_state13_blk_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done)
    begin
        if ((grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state13_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state13_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;
    ap_ST_fsm_state17_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done)
    begin
        if ((grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(ap_block_state4_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state4_on_subcall_done)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done)
    begin
        if ((grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;

    ap_ST_fsm_state8_blk_assign_proc : process(ap_block_state8_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state8_on_subcall_done)) then 
            ap_ST_fsm_state8_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state8_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state4_on_subcall_done_assign_proc : process(tmp_reg_1402, grp_udiv_fu_569_ap_done)
    begin
                ap_block_state4_on_subcall_done <= (((grp_udiv_fu_569_ap_done = ap_const_logic_0) and (tmp_reg_1402 = ap_const_lv1_1)) or ((grp_udiv_fu_569_ap_done = ap_const_logic_0) and (tmp_reg_1402 = ap_const_lv1_0)));
    end process;


    ap_block_state8_on_subcall_done_assign_proc : process(tmp_3_reg_1465, grp_udiv_fu_569_ap_done)
    begin
                ap_block_state8_on_subcall_done <= (((grp_udiv_fu_569_ap_done = ap_const_logic_0) and (tmp_3_reg_1465 = ap_const_lv1_1)) or ((grp_udiv_fu_569_ap_done = ap_const_logic_0) and (tmp_3_reg_1465 = ap_const_lv1_0)));
    end process;


    ap_condition_863_assign_proc : process(ap_CS_fsm_state11, icmp_ln40_fu_889_p2, or_ln50_fu_931_p2)
    begin
                ap_condition_863 <= ((or_ln50_fu_931_p2 = ap_const_lv1_0) and (icmp_ln40_fu_889_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state11));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state17)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_phi_fu_415_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_flag_reg_412;
    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_phi_fu_353_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_2_reg_350;
    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_phi_fu_512_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_flag_reg_508;
    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_phi_fu_478_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_flag_1_reg_474;
    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_phi_fu_383_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_flag_1_reg_380;
    ap_phi_mux_detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_phi_fu_446_p8 <= detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_2_reg_442;

    ap_ready_assign_proc : process(ap_CS_fsm_state17)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state17)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    bands_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_address0;
    bands_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_bands_ce0;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_fu_736_p3 <= 
        select_ln19_2_fu_682_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_fu_728_p3 <= 
        select_ln19_1_fu_674_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_1_fu_1086_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_reg_1349 when (icmp_ln51_fu_953_p2(0) = '1') else 
        xor_ln19_1_reg_1337;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_flag_fu_714_p2 <= (xor_ln19_1_fu_660_p2 and or_ln19_fu_630_p2);
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_fu_720_p3 <= 
        select_ln19_fu_666_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_new_fu_1097_p3 <= 
        ap_const_lv2_0 when (empty_fu_1092_p2(0) = '1') else 
        add_ln52_1_fu_1073_p2;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_fu_766_p3 <= 
        select_ln19_5_fu_706_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_fu_758_p3 <= 
        select_ln19_4_fu_698_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_1_fu_1105_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_reg_1373 when (icmp_ln51_fu_953_p2(0) = '1') else 
        array_id_read_reg_1298;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_flag_fu_744_p2 <= (or_ln19_fu_630_p2 and array_id);
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_fu_750_p3 <= 
        select_ln19_3_fu_690_p3 when (or_ln19_fu_630_p2(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts;
    detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_new_fu_1111_p3 <= 
        ap_const_lv2_0 when (icmp_ln51_fu_953_p2(0) = '1') else 
        select_ln52_4_fu_1079_p3;
    empty_16_fu_1131_p3 <= 
        ap_const_lv2_3 when (icmp_ln51_fu_953_p2(0) = '1') else 
        add_ln52_1_fu_1073_p2;
    empty_fu_1092_p2 <= (icmp_ln51_fu_953_p2 or array_id_read_reg_1298);

    features_address0_assign_proc : process(ap_CS_fsm_state13, grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0, grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0, ap_CS_fsm_state2, ap_CS_fsm_state10, zext_ln29_1_fu_881_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state13)) then 
            features_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            features_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            features_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_address0;
        else 
            features_address0 <= zext_ln29_1_fu_881_p1(8 - 1 downto 0);
        end if; 
    end process;


    features_ce0_assign_proc : process(ap_CS_fsm_state13, grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0, grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0, ap_CS_fsm_state2, ap_CS_fsm_state10, features_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state13)) then 
            features_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_features_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            features_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            features_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_ce0;
        else 
            features_ce0 <= features_ce0_local;
        end if; 
    end process;


    features_ce0_local_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            features_ce0_local <= ap_const_logic_1;
        else 
            features_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    features_d0_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0, ap_CS_fsm_state2, ap_CS_fsm_state10, sub_ln29_2_fu_869_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            features_d0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            features_d0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_d0;
        else 
            features_d0 <= sub_ln29_2_fu_869_p2;
        end if; 
    end process;


    features_we0_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0, ap_CS_fsm_state2, features_we0_out, ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            features_we0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_features_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            features_we0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_features_we0;
        else 
            features_we0 <= (features_we0_out or ap_const_logic_0);
        end if; 
    end process;


    features_we0_local_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            features_we0_local <= ap_const_logic_1;
        else 
            features_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    features_we0_out <= features_we0_local;
    grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_ap_start_reg;
    grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_ap_start_reg;
    grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_ap_start_reg;
    grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start <= grp_detector_hls_Pipeline_VITIS_LOOP_42_7_fu_596_ap_start_reg;
    grp_fu_614_p2 <= std_logic_vector(unsigned(ap_const_lv48_0) - unsigned(grp_udiv_fu_569_ap_return));
    grp_udiv_fu_569_ap_start <= grp_udiv_fu_569_ap_start_reg;

    grp_udiv_fu_569_d_val_assign_proc : process(tmp_reg_1402, tmp_3_reg_1465, ap_CS_fsm_state8, ap_CS_fsm_state4)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state8) and (tmp_3_reg_1465 = ap_const_lv1_1)) or ((ap_const_logic_1 = ap_CS_fsm_state8) and (tmp_3_reg_1465 = ap_const_lv1_0)))) then 
            grp_udiv_fu_569_d_val <= ap_const_lv6_9;
        elsif ((((ap_const_logic_1 = ap_CS_fsm_state4) and (tmp_reg_1402 = ap_const_lv1_1)) or ((ap_const_logic_1 = ap_CS_fsm_state4) and (tmp_reg_1402 = ap_const_lv1_0)))) then 
            grp_udiv_fu_569_d_val <= ap_const_lv6_21;
        else 
            grp_udiv_fu_569_d_val <= "XXXXXX";
        end if; 
    end process;


    grp_udiv_fu_569_n_assign_proc : process(trunc_ln22_reg_1397, tmp_reg_1402, sub_ln26_reg_1406, sext_ln28_reg_1460, tmp_3_reg_1465, zext_ln29_reg_1469, ap_CS_fsm_state8, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) and (tmp_3_reg_1465 = ap_const_lv1_1))) then 
            grp_udiv_fu_569_n <= zext_ln29_reg_1469;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state8) and (tmp_3_reg_1465 = ap_const_lv1_0))) then 
            grp_udiv_fu_569_n <= sext_ln28_reg_1460;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (tmp_reg_1402 = ap_const_lv1_1))) then 
            grp_udiv_fu_569_n <= sub_ln26_reg_1406;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (tmp_reg_1402 = ap_const_lv1_0))) then 
            grp_udiv_fu_569_n <= trunc_ln22_reg_1397;
        else 
            grp_udiv_fu_569_n <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln27_fu_806_p2 <= "1" when (i_2_fu_192 = ap_const_lv7_61) else "0";
    icmp_ln40_fu_889_p2 <= "1" when (tree_fu_196 = ap_const_lv7_78) else "0";
    icmp_ln50_fu_925_p2 <= "0" when (tmp_6_fu_915_p4 = ap_const_lv32_0) else "1";
    icmp_ln51_fu_953_p2 <= "1" when (select_ln51_1_fu_948_p3 = ap_const_lv2_3) else "0";
    icmp_ln52_fu_968_p2 <= "1" when (select_ln52_1_fu_959_p3 = ap_const_lv2_2) else "0";
    icmp_ln53_fu_1244_p2 <= "1" when (signed(zext_ln53_2_fu_1240_p1) < signed(next_reg_1550)) else "0";
    next_fu_1139_p2 <= std_logic_vector(unsigned(add_ln51_fu_942_p2) - unsigned(ref_tmp227_085_cast_fu_1127_p1));
    or_ln19_fu_630_p2 <= (xor_ln19_fu_624_p2 or new_sequence);
    or_ln50_fu_931_p2 <= (invalid_1_fu_204 or icmp_ln50_fu_925_p2);
    p_shl_fu_1216_p3 <= (empty_16_reg_1543 & ap_const_lv26_0);
    r18_NODE_VALUE_address0 <= zext_ln43_fu_1189_p1(11 - 1 downto 0);

    r18_NODE_VALUE_ce0_local_assign_proc : process(ap_CS_fsm_state14)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            r18_NODE_VALUE_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_VALUE_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_ROOTS_address0 <= zext_ln40_fu_901_p1(7 - 1 downto 0);

    r18_ROOTS_ce0_local_assign_proc : process(ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            r18_ROOTS_ce0_local <= ap_const_logic_1;
        else 
            r18_ROOTS_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    raw_address0_assign_proc : process(zext_ln27_reg_1450, grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0, grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0, ap_CS_fsm_state2, ap_CS_fsm_state6, ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            raw_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            raw_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            raw_address0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_address0;
        else 
            raw_address0 <= zext_ln27_reg_1450(7 - 1 downto 0);
        end if; 
    end process;


    raw_ce0_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0, grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0, grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0, ap_CS_fsm_state2, ap_CS_fsm_state6, ap_CS_fsm_state10, raw_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            raw_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_fu_585_raw_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            raw_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_raw_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            raw_ce0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_ce0;
        else 
            raw_ce0 <= raw_ce0_local;
        end if; 
    end process;


    raw_ce0_local_assign_proc : process(ap_CS_fsm_state8, ap_block_state8_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state8_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
            raw_ce0_local <= ap_const_logic_1;
        else 
            raw_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    raw_we0_assign_proc : process(grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            raw_we0 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_raw_we0;
        else 
            raw_we0 <= ap_const_logic_0;
        end if; 
    end process;

        ref_tmp227_085_cast_fu_1127_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ref_tmp227_085_fu_1119_p3),64));

    ref_tmp227_085_fu_1119_p3 <= 
        select_ln51_2_fu_1066_p3 when (icmp_ln51_fu_953_p2(0) = '1') else 
        ap_const_lv32_0;
    result <= storemerge9_reg_540;
    score_1_fu_1198_p2 <= std_logic_vector(unsigned(score_fu_200) + unsigned(sext_ln43_fu_1194_p1));
    select_ln19_1_fu_674_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums_1 when (array_id(0) = '1') else 
        ap_const_lv64_0;
    select_ln19_2_fu_682_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr_1 when (array_id(0) = '1') else 
        ap_const_lv2_0;
    select_ln19_3_fu_690_p3 <= 
        ap_const_lv2_0 when (array_id(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts;
    select_ln19_4_fu_698_p3 <= 
        ap_const_lv64_0 when (array_id(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_sums;
    select_ln19_5_fu_706_p3 <= 
        ap_const_lv2_0 when (array_id(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_1_ap_uint_1_ap_uint_104_ptr;
    select_ln19_fu_666_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_counts_1 when (array_id(0) = '1') else 
        ap_const_lv2_0;
    select_ln51_1_fu_948_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_counts_2_loc_reg_1382 when (array_id_read_reg_1298(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_counts_loc_reg_1358;
    select_ln51_2_fu_1066_p3 <= 
        tmp_5_fu_1046_p9 when (array_id_read_reg_1298(0) = '1') else 
        tmp_4_fu_1014_p9;
    select_ln51_fu_937_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_sums_1_loc_reg_1387 when (array_id_read_reg_1298(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_sums_loc_reg_1363;
    select_ln52_1_fu_959_p3 <= 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_ap_uint_104_ptr_3_loc_reg_1392 when (array_id_read_reg_1298(0) = '1') else 
        detector_hls_ap_int_const_ap_uint_ap_uint_ap_uint_1_ap_uint_104_ptr_loc_reg_1368;
    select_ln52_2_fu_988_p3 <= 
        ap_const_lv2_0 when (array_id_read_reg_1298(0) = '1') else 
        select_ln52_fu_980_p3;
    select_ln52_3_fu_995_p3 <= 
        select_ln52_fu_980_p3 when (array_id_read_reg_1298(0) = '1') else 
        ap_const_lv2_0;
    select_ln52_4_fu_1079_p3 <= 
        add_ln52_1_fu_1073_p2 when (array_id_read_reg_1298(0) = '1') else 
        ap_const_lv2_0;
    select_ln52_fu_980_p3 <= 
        ap_const_lv2_0 when (icmp_ln52_fu_968_p2(0) = '1') else 
        add_ln52_fu_974_p2;
    sext_ln28_fu_837_p0 <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;
        sext_ln28_fu_837_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln28_fu_837_p0),54));

        sext_ln43_fu_1194_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r18_NODE_VALUE_q0),64));

    sub_ln26_fu_790_p2 <= std_logic_vector(unsigned(ap_const_lv54_0) - unsigned(trunc_ln22_fu_777_p1));
    sub_ln29_2_fu_869_p2 <= std_logic_vector(unsigned(raw_q0) - unsigned(phi_ln29_reg_293));
    sub_ln29_fu_854_p2 <= std_logic_vector(unsigned(ap_const_lv51_0) - unsigned(trunc_ln28_fu_842_p1));
    sub_ln53_fu_1234_p2 <= std_logic_vector(unsigned(p_shl_fu_1216_p3) - unsigned(zext_ln53_1_fu_1230_p1));
    tmp_3_fu_846_p1 <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;
    tmp_3_fu_846_p3 <= tmp_3_fu_846_p1(51 downto 51);
    tmp_4_fu_1014_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_5_fu_1046_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_6_fu_915_p4 <= add_ln50_fu_909_p2(63 downto 32);
    tmp_7_fu_1249_p7 <= (((((array_id_read_reg_1298 & ap_const_lv1_0) & icmp_ln53_fu_1244_p2) & zext_ln53_fu_1213_p1) & next_reg_1550) & trunc_ln52_reg_1508);
    tmp_8_fu_1223_p3 <= (empty_16_reg_1543 & ap_const_lv24_0);
    tmp_fu_782_p3 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out(54 downto 54);
    trunc_ln22_fu_777_p1 <= grp_detector_hls_Pipeline_VITIS_LOOP_22_1_fu_558_sum_out(54 - 1 downto 0);
    trunc_ln28_fu_842_p0 <= grp_detector_hls_Pipeline_VITIS_LOOP_28_3_fu_578_s_out;
    trunc_ln28_fu_842_p1 <= trunc_ln28_fu_842_p0(51 - 1 downto 0);
    trunc_ln52_fu_964_p1 <= score_fu_200(32 - 1 downto 0);
    valid_read_read_fu_220_p2 <= valid;
    xor_ln19_1_fu_660_p2 <= (array_id xor ap_const_lv1_1);
    xor_ln19_fu_624_p2 <= (valid xor ap_const_lv1_1);
    zext_ln27_1_fu_831_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_2_fu_192),8));
    zext_ln27_fu_828_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_2_fu_192),64));
    zext_ln29_1_fu_881_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln29_fu_876_p2),64));
    zext_ln29_fu_860_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln29_fu_854_p2),54));
    zext_ln40_fu_901_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tree_fu_196),64));
    zext_ln43_fu_1189_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(node_2_in_loc_fu_172),64));
    zext_ln53_1_fu_1230_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_8_fu_1223_p3),28));
    zext_ln53_2_fu_1240_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln53_fu_1234_p2),64));
    zext_ln53_fu_1213_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(empty_16_reg_1543),5));
end behav;
