                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_candidate_score is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    cx : IN STD_LOGIC_VECTOR (31 downto 0);
    cy : IN STD_LOGIC_VECTOR (31 downto 0);
    cz : IN STD_LOGIC_VECTOR (31 downto 0);
    obs_address0 : OUT STD_LOGIC_VECTOR (10 downto 0);
    obs_ce0 : OUT STD_LOGIC;
    obs_q0 : IN STD_LOGIC_VECTOR (77 downto 0);
    count : IN STD_LOGIC_VECTOR (30 downto 0);
    baseline_two : IN STD_LOGIC_VECTOR (0 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (63 downto 0) );
end;


architecture behav of joint_search_hls_candidate_score is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
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
    constant ap_const_lv4_B : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_D : STD_LOGIC_VECTOR (3 downto 0) := "1101";
    constant ap_const_lv4_E : STD_LOGIC_VECTOR (3 downto 0) := "1110";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv42_0 : STD_LOGIC_VECTOR (41 downto 0) := "000000000000000000000000000000000000000000";
    constant ap_const_lv5_10 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011010";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv10_20C : STD_LOGIC_VECTOR (9 downto 0) := "1000001100";
    constant ap_const_lv10_1F4 : STD_LOGIC_VECTOR (9 downto 0) := "0111110100";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal r18_MIC_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal r18_MIC_q0 : STD_LOGIC_VECTOR (26 downto 0);
    signal baseline_two_read_read_fu_312_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_413_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul21_reg_1257 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln14_fu_448_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln14_reg_1268 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal trunc_ln14_fu_533_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln14_reg_1372 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal dx_fu_593_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal dx_reg_1376 : STD_LOGIC_VECTOR (31 downto 0);
    signal dy_fu_603_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal dy_reg_1382 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln_fu_619_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln_reg_1388 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal r_reg_1474 : STD_LOGIC_VECTOR (57 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal v_reg_1479 : STD_LOGIC_VECTOR (57 downto 0);
    signal add_ln42_fu_948_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln42_reg_1484 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_idle : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0 : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out_ap_vld : STD_LOGIC;
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out_ap_vld : STD_LOGIC;
    signal grp_isqrt_fu_408_ap_start : STD_LOGIC;
    signal grp_isqrt_fu_408_ap_done : STD_LOGIC;
    signal grp_isqrt_fu_408_ap_idle : STD_LOGIC;
    signal grp_isqrt_fu_408_ap_ready : STD_LOGIC;
    signal grp_isqrt_fu_408_x : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_isqrt_fu_408_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln14_fu_442_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal grp_isqrt_fu_408_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal zext_ln14_fu_454_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_fu_132 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal distance_fu_136 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_1_fu_140 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_2_fu_144 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_3_fu_148 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_4_fu_152 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_5_fu_156 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_6_fu_160 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_7_fu_164 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_8_fu_168 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_9_fu_172 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_10_fu_176 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_11_fu_180 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_12_fu_184 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_13_fu_188 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_14_fu_192 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal distance_15_fu_196 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal cross_fu_304 : STD_LOGIC_VECTOR (41 downto 0) := "000000000000000000000000000000000000000000";
    signal cross_1_fu_967_p2 : STD_LOGIC_VECTOR (41 downto 0);
    signal icmp_ln42_fu_793_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_4_fu_308 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal add_ln42_1_fu_799_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r18_MIC_ce0_local : STD_LOGIC;
    signal grp_fu_413_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_413_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln42_fu_423_p0 : STD_LOGIC_VECTOR (57 downto 0);
    signal sext_ln42_fu_938_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln42_fu_423_p1 : STD_LOGIC_VECTOR (57 downto 0);
    signal mul_ln42_1_fu_427_p0 : STD_LOGIC_VECTOR (57 downto 0);
    signal sext_ln42_1_fu_943_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln42_1_fu_427_p1 : STD_LOGIC_VECTOR (57 downto 0);
    signal tmp_fu_536_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal sext_ln16_fu_550_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_51_fu_559_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln16_fu_568_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln16_fu_574_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln16_1_fu_582_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal sub_ln16_fu_554_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln16_1_fu_589_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln15_fu_546_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal sext_ln16_2_fu_599_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln17_1_fu_419_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln17_fu_608_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln17_1_fu_613_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_7_fu_805_p25 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_7_fu_805_p27 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_8_fu_859_p25 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_8_fu_859_p27 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln42_fu_918_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln42_1_fu_427_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln42_fu_423_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln1_fu_955_p3 : STD_LOGIC_VECTOR (37 downto 0);
    signal zext_ln42_1_fu_963_p1 : STD_LOGIC_VECTOR (41 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
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
    signal tmp_7_fu_805_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_805_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p5 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p7 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p9 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p11 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p13 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p15 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p17 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p19 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p21 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_8_fu_859_p23 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3 IS
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
    end component;


    component joint_search_hls_isqrt IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        x : IN STD_LOGIC_VECTOR (63 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_mul_32s_32s_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_mul_58s_58s_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (57 downto 0);
        din1 : IN STD_LOGIC_VECTOR (57 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
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


    component joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (26 downto 0) );
    end component;



begin
    r18_MIC_U : component joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R
    generic map (
        DataWidth => 27,
        AddressRange => 16,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_MIC_address0,
        ce0 => r18_MIC_ce0_local,
        q0 => r18_MIC_q0);

    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355 : component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start,
        ap_done => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done,
        ap_idle => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_idle,
        ap_ready => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready,
        count => count,
        obs_address0 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0,
        obs_ce0 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0,
        obs_q0 => obs_q0,
        distance => distance_fu_136,
        distance_1 => distance_1_fu_140,
        distance_2 => distance_2_fu_144,
        distance_3 => distance_3_fu_148,
        distance_4 => distance_4_fu_152,
        distance_5 => distance_5_fu_156,
        distance_6 => distance_6_fu_160,
        distance_7 => distance_7_fu_164,
        distance_8 => distance_8_fu_168,
        distance_9 => distance_9_fu_172,
        distance_10 => distance_10_fu_176,
        distance_11 => distance_11_fu_180,
        distance_12 => distance_12_fu_184,
        distance_13 => distance_13_fu_188,
        distance_14 => distance_14_fu_192,
        distance_15 => distance_15_fu_196,
        imag_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out,
        imag_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out_ap_vld,
        imag_1_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out,
        imag_1_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out_ap_vld,
        imag_2_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out,
        imag_2_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out_ap_vld,
        imag_3_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out,
        imag_3_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out_ap_vld,
        imag_4_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out,
        imag_4_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out_ap_vld,
        imag_5_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out,
        imag_5_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out_ap_vld,
        imag_6_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out,
        imag_6_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out_ap_vld,
        imag_7_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out,
        imag_7_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out_ap_vld,
        imag_8_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out,
        imag_8_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out_ap_vld,
        imag_9_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out,
        imag_9_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out_ap_vld,
        imag_10_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out,
        imag_10_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out_ap_vld,
        imag_11_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out,
        imag_11_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out_ap_vld,
        real_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out,
        real_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out_ap_vld,
        real_1_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out,
        real_1_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out_ap_vld,
        real_2_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out,
        real_2_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out_ap_vld,
        real_3_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out,
        real_3_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out_ap_vld,
        real_4_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out,
        real_4_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out_ap_vld,
        real_5_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out,
        real_5_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out_ap_vld,
        real_6_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out,
        real_6_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out_ap_vld,
        real_7_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out,
        real_7_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out_ap_vld,
        real_8_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out,
        real_8_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out_ap_vld,
        real_9_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out,
        real_9_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out_ap_vld,
        real_10_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out,
        real_10_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out_ap_vld,
        real_11_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out,
        real_11_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out_ap_vld,
        sum1_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out,
        sum1_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out_ap_vld,
        sum0_out => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out,
        sum0_out_ap_vld => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out_ap_vld);

    grp_isqrt_fu_408 : component joint_search_hls_isqrt
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_isqrt_fu_408_ap_start,
        ap_done => grp_isqrt_fu_408_ap_done,
        ap_idle => grp_isqrt_fu_408_ap_idle,
        ap_ready => grp_isqrt_fu_408_ap_ready,
        x => grp_isqrt_fu_408_x,
        ap_return => grp_isqrt_fu_408_ap_return);

    mul_32s_32s_32_1_1_U105 : component joint_search_hls_mul_32s_32s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => grp_fu_413_p0,
        din1 => grp_fu_413_p1,
        dout => grp_fu_413_p2);

    mul_32s_32s_32_1_1_U106 : component joint_search_hls_mul_32s_32s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => dx_reg_1376,
        din1 => dx_reg_1376,
        dout => mul_ln17_1_fu_419_p2);

    mul_58s_58s_64_1_1_U107 : component joint_search_hls_mul_58s_58s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 58,
        din1_WIDTH => 58,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln42_fu_423_p0,
        din1 => mul_ln42_fu_423_p1,
        dout => mul_ln42_fu_423_p2);

    mul_58s_58s_64_1_1_U108 : component joint_search_hls_mul_58s_58s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 58,
        din1_WIDTH => 58,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln42_1_fu_427_p0,
        din1 => mul_ln42_1_fu_427_p1,
        dout => mul_ln42_1_fu_427_p2);

    sparsemux_25_4_64_1_1_U109 : component joint_search_hls_sparsemux_25_4_64_1_1
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
        din0 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_11_out,
        din1 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_10_out,
        din2 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_9_out,
        din3 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_8_out,
        din4 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_7_out,
        din5 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_6_out,
        din6 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_5_out,
        din7 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_4_out,
        din8 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_3_out,
        din9 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_2_out,
        din10 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_1_out,
        din11 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_real_out,
        def => tmp_7_fu_805_p25,
        sel => i_4_fu_308,
        dout => tmp_7_fu_805_p27);

    sparsemux_25_4_64_1_1_U110 : component joint_search_hls_sparsemux_25_4_64_1_1
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
        din0 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_11_out,
        din1 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_10_out,
        din2 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_9_out,
        din3 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_8_out,
        din4 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_7_out,
        din5 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_6_out,
        din6 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_5_out,
        din7 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_4_out,
        din8 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_3_out,
        din9 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_2_out,
        din10 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_1_out,
        din11 => grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_imag_out,
        def => tmp_8_fu_859_p25,
        sel => i_4_fu_308,
        dout => tmp_8_fu_859_p27);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln14_fu_442_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_ready = ap_const_logic_1)) then 
                    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_isqrt_fu_408_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_isqrt_fu_408_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                    grp_isqrt_fu_408_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_isqrt_fu_408_ap_ready = ap_const_logic_1)) then 
                    grp_isqrt_fu_408_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    cross_fu_304_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln14_fu_442_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                cross_fu_304 <= ap_const_lv42_0;
            elsif (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then 
                cross_fu_304 <= cross_1_fu_967_p2;
            end if; 
        end if;
    end process;

    i_4_fu_308_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln14_fu_442_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i_4_fu_308 <= ap_const_lv4_0;
            elsif (((icmp_ln42_fu_793_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
                i_4_fu_308 <= add_ln42_1_fu_799_p2;
            end if; 
        end if;
    end process;

    i_fu_132_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_fu_132 <= ap_const_lv5_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                i_fu_132 <= add_ln14_reg_1268;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln14_reg_1268 <= add_ln14_fu_448_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then
                add_ln42_reg_1484 <= add_ln42_fu_948_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_A))) then
                distance_10_fu_176 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_B))) then
                distance_11_fu_180 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_C))) then
                distance_12_fu_184 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_D))) then
                distance_13_fu_188 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_E))) then
                distance_14_fu_192 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_F))) then
                distance_15_fu_196 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_1))) then
                distance_1_fu_140 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_2))) then
                distance_2_fu_144 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_3))) then
                distance_3_fu_148 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_4))) then
                distance_4_fu_152 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_5))) then
                distance_5_fu_156 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_6))) then
                distance_6_fu_160 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_7))) then
                distance_7_fu_164 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_8))) then
                distance_8_fu_168 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_9))) then
                distance_9_fu_172 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (trunc_ln14_reg_1372 = ap_const_lv4_0))) then
                distance_fu_136 <= grp_isqrt_fu_408_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                dx_reg_1376 <= dx_fu_593_p2;
                dy_reg_1382 <= dy_fu_603_p2;
                trunc_ln14_reg_1372 <= trunc_ln14_fu_533_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                mul21_reg_1257 <= grp_fu_413_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state9)) then
                r_reg_1474 <= tmp_7_fu_805_p27(63 downto 6);
                v_reg_1479 <= tmp_8_fu_859_p27(63 downto 6);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                    shl_ln_reg_1388(63 downto 32) <= shl_ln_fu_619_p3(63 downto 32);
            end if;
        end if;
    end process;
    shl_ln_reg_1388(31 downto 0) <= "00000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state9, grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done, grp_isqrt_fu_408_ap_done, icmp_ln14_fu_442_p2, ap_CS_fsm_state7, ap_CS_fsm_state5, ap_CS_fsm_state11, icmp_ln42_fu_793_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln14_fu_442_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                if (((icmp_ln42_fu_793_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                if (((grp_isqrt_fu_408_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state11;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    add_ln14_fu_448_p2 <= std_logic_vector(unsigned(i_fu_132) + unsigned(ap_const_lv5_1));
    add_ln17_1_fu_613_p2 <= std_logic_vector(unsigned(add_ln17_fu_608_p2) + unsigned(grp_fu_413_p2));
    add_ln17_fu_608_p2 <= std_logic_vector(unsigned(mul21_reg_1257) + unsigned(mul_ln17_1_fu_419_p2));
    add_ln42_1_fu_799_p2 <= std_logic_vector(unsigned(i_4_fu_308) + unsigned(ap_const_lv4_1));
    add_ln42_fu_948_p2 <= std_logic_vector(unsigned(mul_ln42_1_fu_427_p2) + unsigned(mul_ln42_fu_423_p2));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;

    ap_ST_fsm_state11_blk_assign_proc : process(grp_isqrt_fu_408_ap_done)
    begin
        if ((grp_isqrt_fu_408_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state11_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state11_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_isqrt_fu_408_ap_done)
    begin
        if ((grp_isqrt_fu_408_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;

    ap_ST_fsm_state7_blk_assign_proc : process(grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done)
    begin
        if ((grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state7_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state7_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state9, icmp_ln42_fu_793_p2)
    begin
        if ((((icmp_ln42_fu_793_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state9)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state9, icmp_ln42_fu_793_p2)
    begin
        if (((icmp_ln42_fu_793_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return_0 <= grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum0_out;
    ap_return_1 <= grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_sum1_out;
    ap_return_2 <= zext_ln42_fu_918_p1;
    baseline_two_read_read_fu_312_p2 <= baseline_two;
    cross_1_fu_967_p2 <= std_logic_vector(unsigned(zext_ln42_1_fu_963_p1) + unsigned(cross_fu_304));
    dx_fu_593_p2 <= std_logic_vector(unsigned(sub_ln16_fu_554_p2) - unsigned(sext_ln16_1_fu_589_p1));
    dy_fu_603_p2 <= std_logic_vector(unsigned(cy) - unsigned(sext_ln16_2_fu_599_p1));
    grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start <= grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_ap_start_reg;

    grp_fu_413_p0_assign_proc : process(ap_CS_fsm_state1, cz, dy_reg_1382, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_413_p0 <= dy_reg_1382;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_fu_413_p0 <= cz;
        else 
            grp_fu_413_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_413_p1_assign_proc : process(ap_CS_fsm_state1, cz, dy_reg_1382, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_413_p1 <= dy_reg_1382;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            grp_fu_413_p1 <= cz;
        else 
            grp_fu_413_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_isqrt_fu_408_ap_start <= grp_isqrt_fu_408_ap_start_reg;

    grp_isqrt_fu_408_x_assign_proc : process(shl_ln_reg_1388, add_ln42_reg_1484, ap_CS_fsm_state5, ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            grp_isqrt_fu_408_x <= add_ln42_reg_1484;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_isqrt_fu_408_x <= shl_ln_reg_1388;
        else 
            grp_isqrt_fu_408_x <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln14_fu_442_p2 <= "1" when (i_fu_132 = ap_const_lv5_10) else "0";
    icmp_ln16_fu_568_p2 <= "1" when (tmp_51_fu_559_p4 = ap_const_lv2_0) else "0";
    icmp_ln42_fu_793_p2 <= "1" when (i_4_fu_308 = ap_const_lv4_C) else "0";
    mul_ln42_1_fu_427_p0 <= sext_ln42_1_fu_943_p1(58 - 1 downto 0);
    mul_ln42_1_fu_427_p1 <= sext_ln42_1_fu_943_p1(58 - 1 downto 0);
    mul_ln42_fu_423_p0 <= sext_ln42_fu_938_p1(58 - 1 downto 0);
    mul_ln42_fu_423_p1 <= sext_ln42_fu_938_p1(58 - 1 downto 0);
    obs_address0 <= grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_address0;
    obs_ce0 <= grp_candidate_score_Pipeline_VITIS_LOOP_26_3_fu_355_obs_ce0;
    r18_MIC_address0 <= zext_ln14_fu_454_p1(4 - 1 downto 0);

    r18_MIC_ce0_local_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            r18_MIC_ce0_local <= ap_const_logic_1;
        else 
            r18_MIC_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    select_ln16_1_fu_582_p3 <= 
        select_ln16_fu_574_p3 when (baseline_two(0) = '1') else 
        ap_const_lv10_0;
    select_ln16_fu_574_p3 <= 
        ap_const_lv10_20C when (icmp_ln16_fu_568_p2(0) = '1') else 
        ap_const_lv10_1F4;
        sext_ln16_1_fu_589_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(select_ln16_1_fu_582_p3),32));

        sext_ln16_2_fu_599_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln15_fu_546_p1),32));

        sext_ln16_fu_550_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_536_p4),32));

        sext_ln42_1_fu_943_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v_reg_1479),64));

        sext_ln42_fu_938_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r_reg_1474),64));

    shl_ln1_fu_955_p3 <= (grp_isqrt_fu_408_ap_return & ap_const_lv6_0);
    shl_ln_fu_619_p3 <= (add_ln17_1_fu_613_p2 & ap_const_lv32_0);
    sub_ln16_fu_554_p2 <= std_logic_vector(unsigned(cx) - unsigned(sext_ln16_fu_550_p1));
    tmp_51_fu_559_p4 <= i_fu_132(4 downto 3);
    tmp_7_fu_805_p25 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_8_fu_859_p25 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_fu_536_p4 <= r18_MIC_q0(26 downto 16);
    trunc_ln14_fu_533_p1 <= i_fu_132(4 - 1 downto 0);
    trunc_ln15_fu_546_p1 <= r18_MIC_q0(16 - 1 downto 0);
    zext_ln14_fu_454_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_132),64));
    zext_ln42_1_fu_963_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln1_fu_955_p3),42));
    zext_ln42_fu_918_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cross_fu_304),64));
end behav;
