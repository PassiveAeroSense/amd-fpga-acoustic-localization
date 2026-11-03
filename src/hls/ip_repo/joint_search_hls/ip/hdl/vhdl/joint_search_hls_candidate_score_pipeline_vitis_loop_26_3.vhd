                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    count : IN STD_LOGIC_VECTOR (30 downto 0);
    obs_address0 : OUT STD_LOGIC_VECTOR (10 downto 0);
    obs_ce0 : OUT STD_LOGIC;
    obs_q0 : IN STD_LOGIC_VECTOR (77 downto 0);
    distance : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_2 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_3 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_4 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_5 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_6 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_7 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_8 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_9 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_10 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_11 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_12 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_13 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_14 : IN STD_LOGIC_VECTOR (31 downto 0);
    distance_15 : IN STD_LOGIC_VECTOR (31 downto 0);
    imag_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_out_ap_vld : OUT STD_LOGIC;
    imag_1_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_1_out_ap_vld : OUT STD_LOGIC;
    imag_2_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_2_out_ap_vld : OUT STD_LOGIC;
    imag_3_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_3_out_ap_vld : OUT STD_LOGIC;
    imag_4_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_4_out_ap_vld : OUT STD_LOGIC;
    imag_5_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_5_out_ap_vld : OUT STD_LOGIC;
    imag_6_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_6_out_ap_vld : OUT STD_LOGIC;
    imag_7_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_7_out_ap_vld : OUT STD_LOGIC;
    imag_8_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_8_out_ap_vld : OUT STD_LOGIC;
    imag_9_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_9_out_ap_vld : OUT STD_LOGIC;
    imag_10_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_10_out_ap_vld : OUT STD_LOGIC;
    imag_11_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    imag_11_out_ap_vld : OUT STD_LOGIC;
    real_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_out_ap_vld : OUT STD_LOGIC;
    real_1_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_1_out_ap_vld : OUT STD_LOGIC;
    real_2_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_2_out_ap_vld : OUT STD_LOGIC;
    real_3_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_3_out_ap_vld : OUT STD_LOGIC;
    real_4_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_4_out_ap_vld : OUT STD_LOGIC;
    real_5_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_5_out_ap_vld : OUT STD_LOGIC;
    real_6_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_6_out_ap_vld : OUT STD_LOGIC;
    real_7_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_7_out_ap_vld : OUT STD_LOGIC;
    real_8_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_8_out_ap_vld : OUT STD_LOGIC;
    real_9_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_9_out_ap_vld : OUT STD_LOGIC;
    real_10_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_10_out_ap_vld : OUT STD_LOGIC;
    real_11_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    real_11_out_ap_vld : OUT STD_LOGIC;
    sum1_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    sum1_out_ap_vld : OUT STD_LOGIC;
    sum0_out : OUT STD_LOGIC_VECTOR (63 downto 0);
    sum0_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv4_3 : STD_LOGIC_VECTOR (3 downto 0) := "0011";
    constant ap_const_lv4_4 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_const_lv4_5 : STD_LOGIC_VECTOR (3 downto 0) := "0101";
    constant ap_const_lv4_6 : STD_LOGIC_VECTOR (3 downto 0) := "0110";
    constant ap_const_lv4_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv4_9 : STD_LOGIC_VECTOR (3 downto 0) := "1001";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv41_1921FB : STD_LOGIC_VECTOR (40 downto 0) := "00000000000000000000110010010000111111011";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_49 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001001";
    constant ap_const_lv32_4A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001010";
    constant ap_const_lv32_4D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001101";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_46 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000110";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv12_C00 : STD_LOGIC_VECTOR (11 downto 0) := "110000000000";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_29 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101001";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln26_fu_852_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_PAIRS_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal r18_PAIRS_q0 : STD_LOGIC_VECTOR (7 downto 0);
    signal SEARCH_COS_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal SEARCH_COS_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SEARCH_COS_address1 : STD_LOGIC_VECTOR (11 downto 0);
    signal SEARCH_COS_q1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln26_reg_2008 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_2008_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_2008_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln26_reg_2008_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal o_phase_fu_874_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal o_phase_reg_2017 : STD_LOGIC_VECTOR (31 downto 0);
    signal o_phase_reg_2017_pp0_iter2_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal o_group_reg_2022 : STD_LOGIC_VECTOR (1 downto 0);
    signal o_group_reg_2022_pp0_iter2_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal o_group_reg_2022_pp0_iter3_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal o_group_reg_2022_pp0_iter4_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal o_slot_reg_2026 : STD_LOGIC_VECTOR (3 downto 0);
    signal o_slot_reg_2026_pp0_iter2_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal o_slot_reg_2026_pp0_iter3_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal o_slot_reg_2026_pp0_iter4_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_2_reg_2037 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln_reg_2042 : STD_LOGIC_VECTOR (31 downto 0);
    signal angle_fu_1100_p4 : STD_LOGIC_VECTOR (20 downto 0);
    signal angle_reg_2047 : STD_LOGIC_VECTOR (20 downto 0);
    signal angle2_reg_2052 : STD_LOGIC_VECTOR (11 downto 0);
    signal re_fu_1200_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal re_reg_2067 : STD_LOGIC_VECTOR (31 downto 0);
    signal im_fu_1240_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal im_reg_2072 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln19_fu_864_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln29_fu_908_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln35_fu_1126_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln35_1_fu_1131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_3_fu_242 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    signal add_ln26_fu_858_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i : STD_LOGIC_VECTOR (30 downto 0);
    signal sum0_fu_246 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal sum0_1_fu_1266_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal sum1_fu_250 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal sum1_1_fu_1252_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal real_11_fu_254 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal real_12_fu_1368_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_predicate_pred484_state6 : BOOLEAN;
    signal real_10_fu_258 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred496_state6 : BOOLEAN;
    signal real_9_fu_262 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred508_state6 : BOOLEAN;
    signal real_8_fu_266 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred520_state6 : BOOLEAN;
    signal real_7_fu_270 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred532_state6 : BOOLEAN;
    signal real_6_fu_274 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred544_state6 : BOOLEAN;
    signal real_5_fu_278 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred556_state6 : BOOLEAN;
    signal real_4_fu_282 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred568_state6 : BOOLEAN;
    signal real_3_fu_286 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred580_state6 : BOOLEAN;
    signal real_2_fu_290 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred592_state6 : BOOLEAN;
    signal real_1_fu_294 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred604_state6 : BOOLEAN;
    signal real_fu_298 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_predicate_pred635_state6 : BOOLEAN;
    signal imag_11_fu_302 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_12_fu_1528_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal imag_10_fu_306 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_9_fu_310 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_8_fu_314 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_7_fu_318 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_6_fu_322 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_5_fu_326 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_4_fu_330 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_3_fu_334 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_2_fu_338 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_1_fu_342 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal imag_fu_346 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal obs_ce0_local : STD_LOGIC;
    signal r18_PAIRS_ce0_local : STD_LOGIC;
    signal SEARCH_COS_ce1_local : STD_LOGIC;
    signal SEARCH_COS_ce0_local : STD_LOGIC;
    signal mul_ln36_1_fu_685_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln34_4_fu_1141_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal mul_ln37_1_fu_689_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal mul_ln34_fu_693_p0 : STD_LOGIC_VECTOR (19 downto 0);
    signal mul_ln34_fu_693_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal mul_ln34_1_fu_698_p0 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln34_3_fu_1110_p1 : STD_LOGIC_VECTOR (41 downto 0);
    signal mul_ln34_1_fu_698_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal mul_ln36_fu_702_p0 : STD_LOGIC_VECTOR (20 downto 0);
    signal zext_ln34_2_fu_1136_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal mul_ln37_fu_706_p0 : STD_LOGIC_VECTOR (20 downto 0);
    signal predicted_fu_710_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_s_fu_898_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_4_fu_927_p33 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_927_p34 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p31 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_993_p32 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p35 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_993_p33 : STD_LOGIC_VECTOR (31 downto 0);
    signal delta_fu_1046_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal predicted_fu_710_p2 : STD_LOGIC_VECTOR (47 downto 0);
    signal phase_fu_1071_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal a_fu_1079_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal fraction_fu_1075_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal mul_ln34_fu_693_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal mul_ln34_1_fu_698_p2 : STD_LOGIC_VECTOR (41 downto 0);
    signal si_fu_1089_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal sext_ln36_fu_1146_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln36_1_fu_1151_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln36_fu_702_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln1_fu_1156_p4 : STD_LOGIC_VECTOR (21 downto 0);
    signal sub_ln36_fu_1170_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln36_2_fu_1166_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln36_3_fu_1176_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln36_4_fu_1181_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln36_1_fu_685_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal trunc_ln36_1_fu_1186_p4 : STD_LOGIC_VECTOR (12 downto 0);
    signal sub_ln36_fu_1170_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln36_5_fu_1196_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln37_fu_706_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal trunc_ln2_fu_1206_p4 : STD_LOGIC_VECTOR (21 downto 0);
    signal sext_ln37_fu_1216_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln37_fu_1220_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln37_1_fu_689_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal trunc_ln37_1_fu_1226_p4 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln37_fu_1220_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln37_1_fu_1236_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln39_fu_1246_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_fu_1313_p25 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_fu_1313_p27 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_9_fu_1473_p25 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_9_fu_1473_p27 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln39_1_fu_1470_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal mul_ln34_fu_693_p00 : STD_LOGIC_VECTOR (40 downto 0);
    signal predicted_fu_710_p10 : STD_LOGIC_VECTOR (47 downto 0);
    signal tmp_4_fu_927_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p25 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p27 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p29 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_4_fu_927_p31 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p25 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p27 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_993_p29 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_6_fu_1313_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_fu_1473_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_mul_12ns_32s_44_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (11 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (43 downto 0) );
    end component;


    component joint_search_hls_mul_20ns_22ns_41_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (19 downto 0);
        din1 : IN STD_LOGIC_VECTOR (21 downto 0);
        dout : OUT STD_LOGIC_VECTOR (40 downto 0) );
    end component;


    component joint_search_hls_mul_21ns_21ns_42_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (20 downto 0);
        din1 : IN STD_LOGIC_VECTOR (20 downto 0);
        dout : OUT STD_LOGIC_VECTOR (41 downto 0) );
    end component;


    component joint_search_hls_mul_21ns_32s_52_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (20 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (51 downto 0) );
    end component;


    component joint_search_hls_mul_32s_32ns_48_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (47 downto 0) );
    end component;


    component joint_search_hls_sparsemux_33_4_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (3 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (3 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (3 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (3 downto 0);
        din3_WIDTH : INTEGER;
        CASE4 : STD_LOGIC_VECTOR (3 downto 0);
        din4_WIDTH : INTEGER;
        CASE5 : STD_LOGIC_VECTOR (3 downto 0);
        din5_WIDTH : INTEGER;
        CASE6 : STD_LOGIC_VECTOR (3 downto 0);
        din6_WIDTH : INTEGER;
        CASE7 : STD_LOGIC_VECTOR (3 downto 0);
        din7_WIDTH : INTEGER;
        CASE8 : STD_LOGIC_VECTOR (3 downto 0);
        din8_WIDTH : INTEGER;
        CASE9 : STD_LOGIC_VECTOR (3 downto 0);
        din9_WIDTH : INTEGER;
        CASE10 : STD_LOGIC_VECTOR (3 downto 0);
        din10_WIDTH : INTEGER;
        CASE11 : STD_LOGIC_VECTOR (3 downto 0);
        din11_WIDTH : INTEGER;
        CASE12 : STD_LOGIC_VECTOR (3 downto 0);
        din12_WIDTH : INTEGER;
        CASE13 : STD_LOGIC_VECTOR (3 downto 0);
        din13_WIDTH : INTEGER;
        CASE14 : STD_LOGIC_VECTOR (3 downto 0);
        din14_WIDTH : INTEGER;
        CASE15 : STD_LOGIC_VECTOR (3 downto 0);
        din15_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        din3 : IN STD_LOGIC_VECTOR (31 downto 0);
        din4 : IN STD_LOGIC_VECTOR (31 downto 0);
        din5 : IN STD_LOGIC_VECTOR (31 downto 0);
        din6 : IN STD_LOGIC_VECTOR (31 downto 0);
        din7 : IN STD_LOGIC_VECTOR (31 downto 0);
        din8 : IN STD_LOGIC_VECTOR (31 downto 0);
        din9 : IN STD_LOGIC_VECTOR (31 downto 0);
        din10 : IN STD_LOGIC_VECTOR (31 downto 0);
        din11 : IN STD_LOGIC_VECTOR (31 downto 0);
        din12 : IN STD_LOGIC_VECTOR (31 downto 0);
        din13 : IN STD_LOGIC_VECTOR (31 downto 0);
        din14 : IN STD_LOGIC_VECTOR (31 downto 0);
        din15 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (3 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_sparsemux_31_4_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (3 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (3 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (3 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (3 downto 0);
        din3_WIDTH : INTEGER;
        CASE4 : STD_LOGIC_VECTOR (3 downto 0);
        din4_WIDTH : INTEGER;
        CASE5 : STD_LOGIC_VECTOR (3 downto 0);
        din5_WIDTH : INTEGER;
        CASE6 : STD_LOGIC_VECTOR (3 downto 0);
        din6_WIDTH : INTEGER;
        CASE7 : STD_LOGIC_VECTOR (3 downto 0);
        din7_WIDTH : INTEGER;
        CASE8 : STD_LOGIC_VECTOR (3 downto 0);
        din8_WIDTH : INTEGER;
        CASE9 : STD_LOGIC_VECTOR (3 downto 0);
        din9_WIDTH : INTEGER;
        CASE10 : STD_LOGIC_VECTOR (3 downto 0);
        din10_WIDTH : INTEGER;
        CASE11 : STD_LOGIC_VECTOR (3 downto 0);
        din11_WIDTH : INTEGER;
        CASE12 : STD_LOGIC_VECTOR (3 downto 0);
        din12_WIDTH : INTEGER;
        CASE13 : STD_LOGIC_VECTOR (3 downto 0);
        din13_WIDTH : INTEGER;
        CASE14 : STD_LOGIC_VECTOR (3 downto 0);
        din14_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        din3 : IN STD_LOGIC_VECTOR (31 downto 0);
        din4 : IN STD_LOGIC_VECTOR (31 downto 0);
        din5 : IN STD_LOGIC_VECTOR (31 downto 0);
        din6 : IN STD_LOGIC_VECTOR (31 downto 0);
        din7 : IN STD_LOGIC_VECTOR (31 downto 0);
        din8 : IN STD_LOGIC_VECTOR (31 downto 0);
        din9 : IN STD_LOGIC_VECTOR (31 downto 0);
        din10 : IN STD_LOGIC_VECTOR (31 downto 0);
        din11 : IN STD_LOGIC_VECTOR (31 downto 0);
        din12 : IN STD_LOGIC_VECTOR (31 downto 0);
        din13 : IN STD_LOGIC_VECTOR (31 downto 0);
        din14 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (3 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_sparsemux_25_4_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (3 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (3 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (3 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (3 downto 0);
        din3_WIDTH : INTEGER;
        CASE4 : STD_LOGIC_VECTOR (3 downto 0);
        din4_WIDTH : INTEGER;
        CASE5 : STD_LOGIC_VECTOR (3 downto 0);
        din5_WIDTH : INTEGER;
        CASE6 : STD_LOGIC_VECTOR (3 downto 0);
        din6_WIDTH : INTEGER;
        CASE7 : STD_LOGIC_VECTOR (3 downto 0);
        din7_WIDTH : INTEGER;
        CASE8 : STD_LOGIC_VECTOR (3 downto 0);
        din8_WIDTH : INTEGER;
        CASE9 : STD_LOGIC_VECTOR (3 downto 0);
        din9_WIDTH : INTEGER;
        CASE10 : STD_LOGIC_VECTOR (3 downto 0);
        din10_WIDTH : INTEGER;
        CASE11 : STD_LOGIC_VECTOR (3 downto 0);
        din11_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        din2 : IN STD_LOGIC_VECTOR (63 downto 0);
        din3 : IN STD_LOGIC_VECTOR (63 downto 0);
        din4 : IN STD_LOGIC_VECTOR (63 downto 0);
        din5 : IN STD_LOGIC_VECTOR (63 downto 0);
        din6 : IN STD_LOGIC_VECTOR (63 downto 0);
        din7 : IN STD_LOGIC_VECTOR (63 downto 0);
        din8 : IN STD_LOGIC_VECTOR (63 downto 0);
        din9 : IN STD_LOGIC_VECTOR (63 downto 0);
        din10 : IN STD_LOGIC_VECTOR (63 downto 0);
        din11 : IN STD_LOGIC_VECTOR (63 downto 0);
        def : IN STD_LOGIC_VECTOR (63 downto 0);
        sel : IN STD_LOGIC_VECTOR (3 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_SEARCH_COS_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        address1 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    r18_PAIRS_U : component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R
    generic map (
        DataWidth => 8,
        AddressRange => 120,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_PAIRS_address0,
        ce0 => r18_PAIRS_ce0_local,
        q0 => r18_PAIRS_q0);

    SEARCH_COS_U : component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_SEARCH_COS_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 4096,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => SEARCH_COS_address0,
        ce0 => SEARCH_COS_ce0_local,
        q0 => SEARCH_COS_q0,
        address1 => SEARCH_COS_address1,
        ce1 => SEARCH_COS_ce1_local,
        q1 => SEARCH_COS_q1);

    mul_12ns_32s_44_1_1_U40 : component joint_search_hls_mul_12ns_32s_44_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 12,
        din1_WIDTH => 32,
        dout_WIDTH => 44)
    port map (
        din0 => mul_ln36_1_fu_685_p0,
        din1 => sext_ln36_4_fu_1181_p0,
        dout => mul_ln36_1_fu_685_p2);

    mul_12ns_32s_44_1_1_U41 : component joint_search_hls_mul_12ns_32s_44_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 12,
        din1_WIDTH => 32,
        dout_WIDTH => 44)
    port map (
        din0 => mul_ln37_1_fu_689_p0,
        din1 => sext_ln36_fu_1146_p0,
        dout => mul_ln37_1_fu_689_p2);

    mul_20ns_22ns_41_1_1_U42 : component joint_search_hls_mul_20ns_22ns_41_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 20,
        din1_WIDTH => 22,
        dout_WIDTH => 41)
    port map (
        din0 => mul_ln34_fu_693_p0,
        din1 => mul_ln34_fu_693_p1,
        dout => mul_ln34_fu_693_p2);

    mul_21ns_21ns_42_1_1_U43 : component joint_search_hls_mul_21ns_21ns_42_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 21,
        din1_WIDTH => 21,
        dout_WIDTH => 42)
    port map (
        din0 => mul_ln34_1_fu_698_p0,
        din1 => mul_ln34_1_fu_698_p1,
        dout => mul_ln34_1_fu_698_p2);

    mul_21ns_32s_52_1_1_U44 : component joint_search_hls_mul_21ns_32s_52_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 21,
        din1_WIDTH => 32,
        dout_WIDTH => 52)
    port map (
        din0 => mul_ln36_fu_702_p0,
        din1 => sext_ln36_1_fu_1151_p0,
        dout => mul_ln36_fu_702_p2);

    mul_21ns_32s_52_1_1_U45 : component joint_search_hls_mul_21ns_32s_52_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 21,
        din1_WIDTH => 32,
        dout_WIDTH => 52)
    port map (
        din0 => mul_ln37_fu_706_p0,
        din1 => sext_ln36_3_fu_1176_p0,
        dout => mul_ln37_fu_706_p2);

    mul_32s_32ns_48_1_1_U46 : component joint_search_hls_mul_32s_32ns_48_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 48)
    port map (
        din0 => delta_fu_1046_p2,
        din1 => predicted_fu_710_p1,
        dout => predicted_fu_710_p2);

    sparsemux_33_4_32_1_1_U47 : component joint_search_hls_sparsemux_33_4_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "0000",
        din0_WIDTH => 32,
        CASE1 => "0001",
        din1_WIDTH => 32,
        CASE2 => "0010",
        din2_WIDTH => 32,
        CASE3 => "0011",
        din3_WIDTH => 32,
        CASE4 => "0100",
        din4_WIDTH => 32,
        CASE5 => "0101",
        din5_WIDTH => 32,
        CASE6 => "0110",
        din6_WIDTH => 32,
        CASE7 => "0111",
        din7_WIDTH => 32,
        CASE8 => "1000",
        din8_WIDTH => 32,
        CASE9 => "1001",
        din9_WIDTH => 32,
        CASE10 => "1010",
        din10_WIDTH => 32,
        CASE11 => "1011",
        din11_WIDTH => 32,
        CASE12 => "1100",
        din12_WIDTH => 32,
        CASE13 => "1101",
        din13_WIDTH => 32,
        CASE14 => "1110",
        din14_WIDTH => 32,
        CASE15 => "1111",
        din15_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 4,
        dout_WIDTH => 32)
    port map (
        din0 => distance,
        din1 => distance_1,
        din2 => distance_2,
        din3 => distance_3,
        din4 => distance_4,
        din5 => distance_5,
        din6 => distance_6,
        din7 => distance_7,
        din8 => distance_8,
        din9 => distance_9,
        din10 => distance_10,
        din11 => distance_11,
        din12 => distance_12,
        din13 => distance_13,
        din14 => distance_14,
        din15 => distance_15,
        def => tmp_4_fu_927_p33,
        sel => tmp_4_fu_927_p34,
        dout => tmp_4_fu_927_p35);

    sparsemux_31_4_32_1_1_U48 : component joint_search_hls_sparsemux_31_4_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "0001",
        din0_WIDTH => 32,
        CASE1 => "0010",
        din1_WIDTH => 32,
        CASE2 => "0011",
        din2_WIDTH => 32,
        CASE3 => "0100",
        din3_WIDTH => 32,
        CASE4 => "0101",
        din4_WIDTH => 32,
        CASE5 => "0110",
        din5_WIDTH => 32,
        CASE6 => "0111",
        din6_WIDTH => 32,
        CASE7 => "1000",
        din7_WIDTH => 32,
        CASE8 => "1001",
        din8_WIDTH => 32,
        CASE9 => "1010",
        din9_WIDTH => 32,
        CASE10 => "1011",
        din10_WIDTH => 32,
        CASE11 => "1100",
        din11_WIDTH => 32,
        CASE12 => "1101",
        din12_WIDTH => 32,
        CASE13 => "1110",
        din13_WIDTH => 32,
        CASE14 => "1111",
        din14_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 4,
        dout_WIDTH => 32)
    port map (
        din0 => distance_1,
        din1 => distance_2,
        din2 => distance_3,
        din3 => distance_4,
        din4 => distance_5,
        din5 => distance_6,
        din6 => distance_7,
        din7 => distance_8,
        din8 => distance_9,
        din9 => distance_10,
        din10 => distance_11,
        din11 => distance_12,
        din12 => distance_13,
        din13 => distance_14,
        din14 => distance_15,
        def => tmp_5_fu_993_p31,
        sel => tmp_5_fu_993_p32,
        dout => tmp_5_fu_993_p33);

    sparsemux_25_4_64_1_1_U49 : component joint_search_hls_sparsemux_25_4_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "0000",
        din0_WIDTH => 64,
        CASE1 => "0001",
        din1_WIDTH => 64,
        CASE2 => "0010",
        din2_WIDTH => 64,
        CASE3 => "0011",
        din3_WIDTH => 64,
        CASE4 => "0100",
        din4_WIDTH => 64,
        CASE5 => "0101",
        din5_WIDTH => 64,
        CASE6 => "0110",
        din6_WIDTH => 64,
        CASE7 => "0111",
        din7_WIDTH => 64,
        CASE8 => "1000",
        din8_WIDTH => 64,
        CASE9 => "1001",
        din9_WIDTH => 64,
        CASE10 => "1010",
        din10_WIDTH => 64,
        CASE11 => "1011",
        din11_WIDTH => 64,
        def_WIDTH => 64,
        sel_WIDTH => 4,
        dout_WIDTH => 64)
    port map (
        din0 => real_11_fu_254,
        din1 => real_10_fu_258,
        din2 => real_9_fu_262,
        din3 => real_8_fu_266,
        din4 => real_7_fu_270,
        din5 => real_6_fu_274,
        din6 => real_5_fu_278,
        din7 => real_4_fu_282,
        din8 => real_3_fu_286,
        din9 => real_2_fu_290,
        din10 => real_1_fu_294,
        din11 => real_fu_298,
        def => tmp_6_fu_1313_p25,
        sel => o_slot_reg_2026_pp0_iter4_reg,
        dout => tmp_6_fu_1313_p27);

    sparsemux_25_4_64_1_1_U50 : component joint_search_hls_sparsemux_25_4_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "0000",
        din0_WIDTH => 64,
        CASE1 => "0001",
        din1_WIDTH => 64,
        CASE2 => "0010",
        din2_WIDTH => 64,
        CASE3 => "0011",
        din3_WIDTH => 64,
        CASE4 => "0100",
        din4_WIDTH => 64,
        CASE5 => "0101",
        din5_WIDTH => 64,
        CASE6 => "0110",
        din6_WIDTH => 64,
        CASE7 => "0111",
        din7_WIDTH => 64,
        CASE8 => "1000",
        din8_WIDTH => 64,
        CASE9 => "1001",
        din9_WIDTH => 64,
        CASE10 => "1010",
        din10_WIDTH => 64,
        CASE11 => "1011",
        din11_WIDTH => 64,
        def_WIDTH => 64,
        sel_WIDTH => 4,
        dout_WIDTH => 64)
    port map (
        din0 => imag_11_fu_302,
        din1 => imag_10_fu_306,
        din2 => imag_9_fu_310,
        din3 => imag_8_fu_314,
        din4 => imag_7_fu_318,
        din5 => imag_6_fu_322,
        din6 => imag_5_fu_326,
        din7 => imag_4_fu_330,
        din8 => imag_3_fu_334,
        din9 => imag_2_fu_338,
        din10 => imag_1_fu_342,
        din11 => imag_fu_346,
        def => tmp_9_fu_1473_p25,
        sel => o_slot_reg_2026_pp0_iter4_reg,
        dout => tmp_9_fu_1473_p27);

    flow_control_loop_pipe_sequential_init_U : component joint_search_hls_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready_sig,
        ap_done => ap_done_sig,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    i_3_fu_242_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln26_fu_852_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_3_fu_242 <= add_ln26_fu_858_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_3_fu_242 <= ap_const_lv31_0;
                end if;
            end if; 
        end if;
    end process;

    imag_10_fu_306_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_10_fu_306 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred496_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_10_fu_306 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_11_fu_302_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_11_fu_302 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred484_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_11_fu_302 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_1_fu_342_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_1_fu_342 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred604_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_1_fu_342 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_2_fu_338_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_2_fu_338 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred592_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_2_fu_338 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_3_fu_334_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_3_fu_334 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred580_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_3_fu_334 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_4_fu_330_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_4_fu_330 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred568_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_4_fu_330 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_5_fu_326_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_5_fu_326 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred556_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_5_fu_326 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_6_fu_322_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_6_fu_322 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred544_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_6_fu_322 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_7_fu_318_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_7_fu_318 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred532_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_7_fu_318 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_8_fu_314_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_8_fu_314 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred520_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_8_fu_314 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_9_fu_310_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_9_fu_310 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred508_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_9_fu_310 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    imag_fu_346_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    imag_fu_346 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred635_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    imag_fu_346 <= imag_12_fu_1528_p2;
                end if;
            end if; 
        end if;
    end process;

    real_10_fu_258_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_10_fu_258 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred496_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_10_fu_258 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_11_fu_254_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_11_fu_254 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred484_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_11_fu_254 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_1_fu_294_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_1_fu_294 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred604_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_1_fu_294 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_2_fu_290_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_2_fu_290 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred592_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_2_fu_290 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_3_fu_286_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_3_fu_286 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred580_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_3_fu_286 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_4_fu_282_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_4_fu_282 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred568_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_4_fu_282 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_5_fu_278_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_5_fu_278 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred556_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_5_fu_278 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_6_fu_274_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_6_fu_274 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred544_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_6_fu_274 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_7_fu_270_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_7_fu_270 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred532_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_7_fu_270 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_8_fu_266_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_8_fu_266 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred520_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_8_fu_266 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_9_fu_262_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_9_fu_262 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred508_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_9_fu_262 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    real_fu_298_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    real_fu_298 <= ap_const_lv64_0;
                elsif (((ap_predicate_pred635_state6 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    real_fu_298 <= real_12_fu_1368_p2;
                end if;
            end if; 
        end if;
    end process;

    sum0_fu_246_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    sum0_fu_246 <= ap_const_lv64_0;
                elsif (((o_group_reg_2022_pp0_iter4_reg = ap_const_lv2_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    sum0_fu_246 <= sum0_1_fu_1266_p2;
                end if;
            end if; 
        end if;
    end process;

    sum1_fu_250_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    sum1_fu_250 <= ap_const_lv64_0;
                elsif (((o_group_reg_2022_pp0_iter4_reg = ap_const_lv2_1) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
                    sum1_fu_250 <= sum1_1_fu_1252_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                angle2_reg_2052 <= mul_ln34_1_fu_698_p2(41 downto 30);
                angle_reg_2047 <= mul_ln34_fu_693_p2(40 downto 20);
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                    ap_predicate_pred484_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_0));
                    ap_predicate_pred496_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_1));
                    ap_predicate_pred508_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_2));
                    ap_predicate_pred520_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_3));
                    ap_predicate_pred532_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_4));
                    ap_predicate_pred544_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_5));
                    ap_predicate_pred556_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_6));
                    ap_predicate_pred568_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_7));
                    ap_predicate_pred580_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_8));
                    ap_predicate_pred592_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_9));
                    ap_predicate_pred604_state6 <= (not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)) and (o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_A));
                    ap_predicate_pred635_state6 <= (not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_A)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_9)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_8)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_7)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_6)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_5)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_4)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_3)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_2)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_1)) and not((o_slot_reg_2026_pp0_iter3_reg = ap_const_lv4_0)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_1)) and not((o_group_reg_2022_pp0_iter3_reg = ap_const_lv2_0)));
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
                trunc_ln_reg_2042 <= predicted_fu_710_p2(47 downto 16);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                icmp_ln26_reg_2008 <= icmp_ln26_fu_852_p2;
                icmp_ln26_reg_2008_pp0_iter1_reg <= icmp_ln26_reg_2008;
                o_group_reg_2022 <= obs_q0(73 downto 72);
                o_phase_reg_2017 <= o_phase_fu_874_p1;
                o_slot_reg_2026 <= obs_q0(77 downto 74);
                tmp_2_reg_2037 <= obs_q0(63 downto 32);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    SEARCH_COS_address0 <= zext_ln35_1_fu_1131_p1(12 - 1 downto 0);
    SEARCH_COS_address1 <= zext_ln35_fu_1126_p1(12 - 1 downto 0);

    SEARCH_COS_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            SEARCH_COS_ce0_local <= ap_const_logic_1;
        else 
            SEARCH_COS_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    SEARCH_COS_ce1_local_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            SEARCH_COS_ce1_local <= ap_const_logic_1;
        else 
            SEARCH_COS_ce1_local <= ap_const_logic_0;
        end if; 
    end process;

    a_fu_1079_p4 <= phase_fu_1071_p2(31 downto 20);
    add_ln26_fu_858_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i) + unsigned(ap_const_lv31_1));
    add_ln37_fu_1220_p1 <= SEARCH_COS_q0;
    add_ln37_fu_1220_p2 <= std_logic_vector(signed(sext_ln37_fu_1216_p1) + signed(add_ln37_fu_1220_p1));
    angle_fu_1100_p4 <= mul_ln34_fu_693_p2(40 downto 20);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln26_fu_852_p2)
    begin
        if (((icmp_ln26_fu_852_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_loop_exit_ready_pp0_iter4_reg, ap_done_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5)
    begin
        if (((ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;
    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, i_3_fu_242, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i <= ap_const_lv31_0;
        else 
            ap_sig_allocacmp_i <= i_3_fu_242;
        end if; 
    end process;

    delta_fu_1046_p2 <= std_logic_vector(unsigned(tmp_4_fu_927_p35) - unsigned(tmp_5_fu_993_p33));
    fraction_fu_1075_p1 <= phase_fu_1071_p2(20 - 1 downto 0);
    icmp_ln26_fu_852_p2 <= "1" when (ap_sig_allocacmp_i = count) else "0";
    im_fu_1240_p2 <= std_logic_vector(unsigned(add_ln37_fu_1220_p2) - unsigned(sext_ln37_1_fu_1236_p1));
    imag_10_out <= imag_10_fu_306;

    imag_10_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_10_out_ap_vld <= ap_const_logic_1;
        else 
            imag_10_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_11_out <= imag_11_fu_302;

    imag_11_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_11_out_ap_vld <= ap_const_logic_1;
        else 
            imag_11_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_12_fu_1528_p2 <= std_logic_vector(unsigned(tmp_9_fu_1473_p27) + unsigned(sext_ln39_1_fu_1470_p1));
    imag_1_out <= imag_1_fu_342;

    imag_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_1_out_ap_vld <= ap_const_logic_1;
        else 
            imag_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_2_out <= imag_2_fu_338;

    imag_2_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_2_out_ap_vld <= ap_const_logic_1;
        else 
            imag_2_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_3_out <= imag_3_fu_334;

    imag_3_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_3_out_ap_vld <= ap_const_logic_1;
        else 
            imag_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_4_out <= imag_4_fu_330;

    imag_4_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_4_out_ap_vld <= ap_const_logic_1;
        else 
            imag_4_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_5_out <= imag_5_fu_326;

    imag_5_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_5_out_ap_vld <= ap_const_logic_1;
        else 
            imag_5_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_6_out <= imag_6_fu_322;

    imag_6_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_6_out_ap_vld <= ap_const_logic_1;
        else 
            imag_6_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_7_out <= imag_7_fu_318;

    imag_7_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_7_out_ap_vld <= ap_const_logic_1;
        else 
            imag_7_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_8_out <= imag_8_fu_314;

    imag_8_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_8_out_ap_vld <= ap_const_logic_1;
        else 
            imag_8_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_9_out <= imag_9_fu_310;

    imag_9_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_9_out_ap_vld <= ap_const_logic_1;
        else 
            imag_9_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    imag_out <= imag_fu_346;

    imag_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            imag_out_ap_vld <= ap_const_logic_1;
        else 
            imag_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    mul_ln34_1_fu_698_p0 <= zext_ln34_3_fu_1110_p1(21 - 1 downto 0);
    mul_ln34_1_fu_698_p1 <= zext_ln34_3_fu_1110_p1(21 - 1 downto 0);
    mul_ln34_fu_693_p0 <= mul_ln34_fu_693_p00(20 - 1 downto 0);
    mul_ln34_fu_693_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(fraction_fu_1075_p1),41));
    mul_ln34_fu_693_p1 <= ap_const_lv41_1921FB(22 - 1 downto 0);
    mul_ln36_1_fu_685_p0 <= zext_ln34_4_fu_1141_p1(12 - 1 downto 0);
    mul_ln36_fu_702_p0 <= zext_ln34_2_fu_1136_p1(21 - 1 downto 0);
    mul_ln37_1_fu_689_p0 <= zext_ln34_4_fu_1141_p1(12 - 1 downto 0);
    mul_ln37_fu_706_p0 <= zext_ln34_2_fu_1136_p1(21 - 1 downto 0);
    o_phase_fu_874_p1 <= obs_q0(32 - 1 downto 0);
    obs_address0 <= zext_ln19_fu_864_p1(11 - 1 downto 0);
    obs_ce0 <= obs_ce0_local;

    obs_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            obs_ce0_local <= ap_const_logic_1;
        else 
            obs_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    phase_fu_1071_p2 <= std_logic_vector(unsigned(o_phase_reg_2017_pp0_iter2_reg) - unsigned(trunc_ln_reg_2042));
    predicted_fu_710_p1 <= predicted_fu_710_p10(32 - 1 downto 0);
    predicted_fu_710_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_2_reg_2037),48));
    r18_PAIRS_address0 <= zext_ln29_fu_908_p1(7 - 1 downto 0);

    r18_PAIRS_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_PAIRS_ce0_local <= ap_const_logic_1;
        else 
            r18_PAIRS_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    re_fu_1200_p2 <= std_logic_vector(unsigned(sub_ln36_fu_1170_p2) - unsigned(sext_ln36_5_fu_1196_p1));
    real_10_out <= real_10_fu_258;

    real_10_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_10_out_ap_vld <= ap_const_logic_1;
        else 
            real_10_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_11_out <= real_11_fu_254;

    real_11_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_11_out_ap_vld <= ap_const_logic_1;
        else 
            real_11_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_12_fu_1368_p2 <= std_logic_vector(unsigned(tmp_6_fu_1313_p27) + unsigned(sext_ln39_fu_1246_p1));
    real_1_out <= real_1_fu_294;

    real_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_1_out_ap_vld <= ap_const_logic_1;
        else 
            real_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_2_out <= real_2_fu_290;

    real_2_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_2_out_ap_vld <= ap_const_logic_1;
        else 
            real_2_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_3_out <= real_3_fu_286;

    real_3_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_3_out_ap_vld <= ap_const_logic_1;
        else 
            real_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_4_out <= real_4_fu_282;

    real_4_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_4_out_ap_vld <= ap_const_logic_1;
        else 
            real_4_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_5_out <= real_5_fu_278;

    real_5_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_5_out_ap_vld <= ap_const_logic_1;
        else 
            real_5_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_6_out <= real_6_fu_274;

    real_6_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_6_out_ap_vld <= ap_const_logic_1;
        else 
            real_6_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_7_out <= real_7_fu_270;

    real_7_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_7_out_ap_vld <= ap_const_logic_1;
        else 
            real_7_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_8_out <= real_8_fu_266;

    real_8_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_8_out_ap_vld <= ap_const_logic_1;
        else 
            real_8_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_9_out <= real_9_fu_262;

    real_9_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_9_out_ap_vld <= ap_const_logic_1;
        else 
            real_9_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    real_out <= real_fu_298;

    real_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            real_out_ap_vld <= ap_const_logic_1;
        else 
            real_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    sext_ln36_1_fu_1151_p0 <= SEARCH_COS_q0;
        sext_ln36_2_fu_1166_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln1_fu_1156_p4),32));

    sext_ln36_3_fu_1176_p0 <= SEARCH_COS_q1;
    sext_ln36_4_fu_1181_p0 <= SEARCH_COS_q1;
        sext_ln36_5_fu_1196_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln36_1_fu_1186_p4),32));

    sext_ln36_fu_1146_p0 <= SEARCH_COS_q0;
        sext_ln37_1_fu_1236_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln37_1_fu_1226_p4),32));

        sext_ln37_fu_1216_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln2_fu_1206_p4),32));

        sext_ln39_1_fu_1470_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(im_reg_2072),64));

        sext_ln39_fu_1246_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(re_reg_2067),64));

    si_fu_1089_p2 <= std_logic_vector(unsigned(a_fu_1079_p4) + unsigned(ap_const_lv12_C00));
    sub_ln36_fu_1170_p0 <= SEARCH_COS_q1;
    sub_ln36_fu_1170_p2 <= std_logic_vector(signed(sub_ln36_fu_1170_p0) - signed(sext_ln36_2_fu_1166_p1));
    sum0_1_fu_1266_p2 <= std_logic_vector(unsigned(sum0_fu_246) + unsigned(sext_ln39_fu_1246_p1));
    sum0_out <= sum0_fu_246;

    sum0_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            sum0_out_ap_vld <= ap_const_logic_1;
        else 
            sum0_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    sum1_1_fu_1252_p2 <= std_logic_vector(unsigned(sum1_fu_250) + unsigned(sext_ln39_fu_1246_p1));
    sum1_out <= sum1_fu_250;

    sum1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln26_reg_2008_pp0_iter3_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_2008_pp0_iter3_reg = ap_const_lv1_1))) then 
            sum1_out_ap_vld <= ap_const_logic_1;
        else 
            sum1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_4_fu_927_p33 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_4_fu_927_p34 <= r18_PAIRS_q0(4 - 1 downto 0);
    tmp_5_fu_993_p31 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_5_fu_993_p32 <= r18_PAIRS_q0(7 downto 4);
    tmp_6_fu_1313_p25 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_9_fu_1473_p25 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_s_fu_898_p4 <= obs_q0(70 downto 64);
    trunc_ln1_fu_1156_p4 <= mul_ln36_fu_702_p2(51 downto 30);
    trunc_ln2_fu_1206_p4 <= mul_ln37_fu_706_p2(51 downto 30);
    trunc_ln36_1_fu_1186_p4 <= mul_ln36_1_fu_685_p2(43 downto 31);
    trunc_ln37_1_fu_1226_p4 <= mul_ln37_1_fu_689_p2(43 downto 31);
    zext_ln19_fu_864_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i),64));
    zext_ln29_fu_908_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_898_p4),64));
    zext_ln34_2_fu_1136_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(angle_reg_2047),52));
    zext_ln34_3_fu_1110_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(angle_fu_1100_p4),42));
    zext_ln34_4_fu_1141_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(angle2_reg_2052),44));
    zext_ln35_1_fu_1131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(si_fu_1089_p2),64));
    zext_ln35_fu_1126_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(a_fu_1079_p4),64));
end behav;
