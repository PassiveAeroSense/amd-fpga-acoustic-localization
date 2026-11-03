                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fft4096_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    data_address0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    data_ce0 : OUT STD_LOGIC;
    data_we0 : OUT STD_LOGIC;
    data_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
    data_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    data_address1 : OUT STD_LOGIC_VECTOR (11 downto 0);
    data_ce1 : OUT STD_LOGIC;
    data_we1 : OUT STD_LOGIC;
    data_d1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    data_q1 : IN STD_LOGIC_VECTOR (63 downto 0);
    overflow : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of fft4096_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fft4096_hls_fft4096_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=12.625750,HLS_SYN_LAT=49159,HLS_SYN_TPT=none,HLS_SYN_MEM=8,HLS_SYN_DSP=0,HLS_SYN_FF=650,HLS_SYN_LUT=1605,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv11_7FF : STD_LOGIC_VECTOR (10 downto 0) := "11111111111";
    constant ap_const_lv12_800 : STD_LOGIC_VECTOR (11 downto 0) := "100000000000";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv4_B : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv15_1 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    constant ap_const_lv15_5FFF : STD_LOGIC_VECTOR (14 downto 0) := "101111111111111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv32_21 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100001";
    constant ap_const_lv36_80000000 : STD_LOGIC_VECTOR (35 downto 0) := "000010000000000000000000000000000000";
    constant ap_const_lv32_23 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100011";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv33_180000000 : STD_LOGIC_VECTOR (32 downto 0) := "110000000000000000000000000000000";
    constant ap_const_lv32_7FFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "01111111111111111111111111111111";
    constant ap_const_lv32_80000000 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal icmp_ln9_fu_415_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage1 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg : STD_LOGIC;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg : STD_LOGIC;
    signal ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_delayed : STD_LOGIC;
    signal r18_TW_R_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_TW_R_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal r18_TW_I_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_TW_I_q0 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln118_reg_184 : STD_LOGIC_VECTOR (0 downto 0);
    signal stage3_load_reg_962 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal stage_17_load_reg_967 : STD_LOGIC_VECTOR (3 downto 0);
    signal stage_2_fu_251_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal stage_2_reg_972 : STD_LOGIC_VECTOR (3 downto 0);
    signal half_fu_267_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal half_reg_977 : STD_LOGIC_VECTOR (11 downto 0);
    signal j_fu_291_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal j_reg_982 : STD_LOGIC_VECTOR (10 downto 0);
    signal lshr_ln14_fu_297_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal lshr_ln14_reg_987 : STD_LOGIC_VECTOR (12 downto 0);
    signal icmp_ln11_fu_315_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln11_reg_992 : STD_LOGIC_VECTOR (0 downto 0);
    signal data_addr_reg_997 : STD_LOGIC_VECTOR (11 downto 0);
    signal data_addr_reg_997_pp0_iter1_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal data_addr_1_reg_1002 : STD_LOGIC_VECTOR (11 downto 0);
    signal data_addr_1_reg_1002_pp0_iter1_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal data_addr_1_reg_1002_pp0_iter2_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal icmp_ln9_reg_1017 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln9_reg_1017_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln9_reg_1017_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ar_fu_426_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ar_reg_1021 : STD_LOGIC_VECTOR (31 downto 0);
    signal ai_reg_1026 : STD_LOGIC_VECTOR (31 downto 0);
    signal br_fu_438_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal br_reg_1031 : STD_LOGIC_VECTOR (31 downto 0);
    signal bi_fu_442_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bi_reg_1036 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln17_2_fu_455_p1 : STD_LOGIC_VECTOR (61 downto 0);
    signal sext_ln17_2_reg_1041 : STD_LOGIC_VECTOR (61 downto 0);
    signal sext_ln17_5_fu_465_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal sext_ln17_5_reg_1046 : STD_LOGIC_VECTOR (62 downto 0);
    signal trunc_ln3_reg_1051 : STD_LOGIC_VECTOR (32 downto 0);
    signal trunc_ln19_2_reg_1056 : STD_LOGIC_VECTOR (32 downto 0);
    signal ov_fu_718_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ov_reg_1061 : STD_LOGIC_VECTOR (0 downto 0);
    signal ov_reg_1061_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal u_fu_832_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln41_5_fu_887_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_5_reg_1072 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_7_fu_919_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_7_reg_1077 : STD_LOGIC_VECTOR (31 downto 0);
    signal v_fu_927_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_icmp_ln118_phi_fu_187_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_phi_mux_ov_15_phi_fu_198_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_loop_init_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_init_pp0_iter2_reg : STD_LOGIC;
    signal zext_ln15_fu_393_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal zext_ln15_1_fu_398_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln16_fu_403_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal indvar_flatten2_fu_110 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    signal add_ln9_fu_409_p2 : STD_LOGIC_VECTOR (14 downto 0);
    signal stage3_fu_114 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal ap_sig_allocacmp_stage3_load : STD_LOGIC_VECTOR (3 downto 0);
    signal k4_fu_118 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    signal k_fu_303_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_allocacmp_k4_load : STD_LOGIC_VECTOR (11 downto 0);
    signal stage_17_fu_122 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal stage_fu_309_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_stage_17_load : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal data_ce1_local : STD_LOGIC;
    signal data_address1_local : STD_LOGIC_VECTOR (11 downto 0);
    signal data_ce0_local : STD_LOGIC;
    signal data_address0_local : STD_LOGIC_VECTOR (11 downto 0);
    signal data_we1_local : STD_LOGIC;
    signal data_we0_local : STD_LOGIC;
    signal r18_TW_R_ce0_local : STD_LOGIC;
    signal r18_TW_I_ce0_local : STD_LOGIC;
    signal grp_fu_206_p0 : STD_LOGIC_VECTOR (30 downto 0);
    signal grp_fu_206_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln17_4_fu_460_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal sext_ln17_fu_490_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal grp_fu_210_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_210_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln17_1_fu_450_p1 : STD_LOGIC_VECTOR (61 downto 0);
    signal sext_ln17_3_fu_494_p1 : STD_LOGIC_VECTOR (61 downto 0);
    signal zext_ln9_1_fu_263_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln10_fu_273_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal select_ln9_fu_243_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln11_fu_287_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal sub_fu_277_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln11_1_fu_283_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln9_fu_259_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal stage_1_mid1_fu_339_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln9_1_fu_344_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal sub8_fu_355_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal stage_1_cast_fu_351_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal shl_ln14_fu_367_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln14_fu_372_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln14_fu_364_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal a_fu_376_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln11_fu_360_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal b_fu_382_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal t_fu_387_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_210_p2 : STD_LOGIC_VECTOR (61 downto 0);
    signal sext_ln18_fu_470_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal grp_fu_206_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal tr_fu_474_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal sext_ln18_1_fu_498_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal ti_fu_502_p2 : STD_LOGIC_VECTOR (62 downto 0);
    signal sext_ln19_1_fu_521_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sext_ln19_fu_518_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal add_ln19_fu_524_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal tmp_fu_530_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal sext_ln19_4_fu_547_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sext_ln19_3_fu_544_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal add_ln19_1_fu_550_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal tmp_1_fu_556_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln20_fu_570_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal tmp_2_fu_576_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln20_1_fu_590_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal sext_ln19_2_fu_540_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal add_ln21_fu_606_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_4_fu_612_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln20_fu_566_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal add_ln21_1_fu_628_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_5_fu_634_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln20_1_fu_586_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal add_ln21_2_fu_650_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_6_fu_656_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_7_fu_672_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_3_fu_596_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln21_3_fu_682_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln21_fu_622_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln21_2_fu_666_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln21_4_fu_688_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln21_1_fu_700_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln21_1_fu_644_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln21_2_fu_706_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln21_fu_694_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln21_3_fu_712_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_724_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln41_fu_734_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_1_fu_740_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_fu_764_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_fu_756_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln5_fu_746_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_9_fu_778_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln41_2_fu_788_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_3_fu_794_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_1_fu_818_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_2_fu_810_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln41_1_fu_800_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_3_fu_824_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_1_fu_770_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_10_fu_841_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln41_4_fu_851_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_5_fu_857_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_2_fu_881_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_4_fu_873_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln41_2_fu_863_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln41_3_fu_913_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_6_fu_905_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln41_3_fu_895_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_idle_pp0_1to3 : STD_LOGIC;
    signal ap_block_pp0 : BOOLEAN;
    signal ap_enable_operation_62 : BOOLEAN;
    signal ap_enable_state2_pp0_iter0_stage1 : BOOLEAN;
    signal ap_enable_operation_75 : BOOLEAN;
    signal ap_enable_state3_pp0_iter1_stage0 : BOOLEAN;
    signal ap_enable_operation_157 : BOOLEAN;
    signal ap_enable_state5_pp0_iter2_stage0 : BOOLEAN;
    signal ap_enable_operation_158 : BOOLEAN;
    signal ap_enable_state6_pp0_iter2_stage1 : BOOLEAN;
    signal ap_enable_operation_160 : BOOLEAN;
    signal ap_enable_state7_pp0_iter3_stage0 : BOOLEAN;
    signal ap_enable_operation_164 : BOOLEAN;
    signal ap_enable_state8_pp0_iter3_stage1 : BOOLEAN;
    signal ap_enable_operation_65 : BOOLEAN;
    signal ap_enable_operation_76 : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_condition_771 : BOOLEAN;
    signal ap_condition_775 : BOOLEAN;
    signal ap_condition_782 : BOOLEAN;
    signal ap_condition_121 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component fft4096_hls_mul_31s_32s_63_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (30 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (62 downto 0) );
    end component;


    component fft4096_hls_mul_32s_32s_62_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (61 downto 0) );
    end component;


    component fft4096_hls_r18_TW_R_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fft4096_hls_r18_TW_I_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (30 downto 0) );
    end component;


    component fft4096_hls_flow_control_loop_delay_pipe IS
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
        ap_done_int : IN STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_loop_exit_ready_delayed : IN STD_LOGIC );
    end component;



begin
    r18_TW_R_U : component fft4096_hls_r18_TW_R_ROM_AUTO_1R
    generic map (
        DataWidth => 32,
        AddressRange => 2048,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_TW_R_address0,
        ce0 => r18_TW_R_ce0_local,
        q0 => r18_TW_R_q0);

    r18_TW_I_U : component fft4096_hls_r18_TW_I_ROM_AUTO_1R
    generic map (
        DataWidth => 31,
        AddressRange => 2048,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_TW_I_address0,
        ce0 => r18_TW_I_ce0_local,
        q0 => r18_TW_I_q0);

    mul_31s_32s_63_1_1_U1 : component fft4096_hls_mul_31s_32s_63_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 31,
        din1_WIDTH => 32,
        dout_WIDTH => 63)
    port map (
        din0 => grp_fu_206_p0,
        din1 => grp_fu_206_p1,
        dout => grp_fu_206_p2);

    mul_32s_32s_62_1_1_U2 : component fft4096_hls_mul_32s_32s_62_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 62)
    port map (
        din0 => grp_fu_210_p0,
        din1 => grp_fu_210_p1,
        dout => grp_fu_210_p2);

    flow_control_loop_delay_pipe_U : component fft4096_hls_flow_control_loop_delay_pipe
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => ap_start,
        ap_ready => ap_ready_sig,
        ap_done => ap_done_sig,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage1,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int,
        ap_continue => ap_const_logic_1,
        ap_loop_exit_ready_delayed => ap_loop_exit_ready_delayed);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter3_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) then
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_0))) then 
                    ap_loop_exit_ready_pp0_iter3_reg <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage1_11001)) then 
                    ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                end if;
            end if; 
        end if;
    end process;

    icmp_ln118_reg_184_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if ((ap_const_boolean_1 = ap_condition_782)) then 
                    icmp_ln118_reg_184 <= icmp_ln11_reg_992;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_init = ap_const_logic_1))) then 
                    icmp_ln118_reg_184 <= ap_const_lv1_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten2_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                indvar_flatten2_fu_110 <= ap_const_lv15_0;
            elsif (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                indvar_flatten2_fu_110 <= add_ln9_fu_409_p2;
            end if; 
        end if;
    end process;

    k4_fu_118_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_121)) then
                k4_fu_118 <= k_fu_303_p2;
            end if;
        end if;
    end process;

    stage3_fu_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_121)) then
                stage3_fu_114 <= stage_2_fu_251_p3;
            end if;
        end if;
    end process;

    stage_17_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_121)) then
                stage_17_fu_122 <= stage_fu_309_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ai_reg_1026 <= data_q1(63 downto 32);
                ar_reg_1021 <= ar_fu_426_p1;
                bi_reg_1036 <= data_q0(63 downto 32);
                br_reg_1031 <= br_fu_438_p1;
                half_reg_977 <= half_fu_267_p2;
                j_reg_982 <= j_fu_291_p2;
                lshr_ln14_reg_987 <= lshr_ln14_fu_297_p2;
                ov_reg_1061_pp0_iter3_reg <= ov_reg_1061;
                select_ln41_5_reg_1072 <= select_ln41_5_fu_887_p3;
                select_ln41_7_reg_1077 <= select_ln41_7_fu_919_p3;
                sext_ln17_2_reg_1041 <= sext_ln17_2_fu_455_p1;
                sext_ln17_5_reg_1046 <= sext_ln17_5_fu_465_p1;
                stage3_load_reg_962 <= ap_sig_allocacmp_stage3_load;
                stage_17_load_reg_967 <= ap_sig_allocacmp_stage_17_load;
                stage_2_reg_972 <= stage_2_fu_251_p3;
                trunc_ln3_reg_1051 <= tr_fu_474_p2(62 downto 30);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg <= ap_condition_exit_pp0_iter0_stage1;
                ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg <= ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg;
                ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg <= ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                ap_loop_init_pp0_iter1_reg <= ap_loop_init;
                ap_loop_init_pp0_iter2_reg <= ap_loop_init_pp0_iter1_reg;
                data_addr_1_reg_1002 <= zext_ln15_1_fu_398_p1(12 - 1 downto 0);
                data_addr_1_reg_1002_pp0_iter1_reg <= data_addr_1_reg_1002;
                data_addr_1_reg_1002_pp0_iter2_reg <= data_addr_1_reg_1002_pp0_iter1_reg;
                data_addr_reg_997 <= zext_ln15_fu_393_p1(12 - 1 downto 0);
                data_addr_reg_997_pp0_iter1_reg <= data_addr_reg_997;
                icmp_ln9_reg_1017 <= icmp_ln9_fu_415_p2;
                icmp_ln9_reg_1017_pp0_iter1_reg <= icmp_ln9_reg_1017;
                icmp_ln9_reg_1017_pp0_iter2_reg <= icmp_ln9_reg_1017_pp0_iter1_reg;
                trunc_ln19_2_reg_1056 <= ti_fu_502_p2(62 downto 30);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln11_reg_992 <= icmp_ln11_fu_315_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ov_reg_1061 <= ov_fu_718_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to3, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to3 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    a_fu_376_p2 <= std_logic_vector(unsigned(trunc_ln14_fu_372_p1) + unsigned(zext_ln14_fu_364_p1));
    add_ln19_1_fu_550_p2 <= std_logic_vector(signed(sext_ln19_4_fu_547_p1) + signed(sext_ln19_3_fu_544_p1));
    add_ln19_fu_524_p2 <= std_logic_vector(signed(sext_ln19_1_fu_521_p1) + signed(sext_ln19_fu_518_p1));
    add_ln21_1_fu_628_p2 <= std_logic_vector(signed(sext_ln20_fu_566_p1) + signed(ap_const_lv36_80000000));
    add_ln21_2_fu_650_p2 <= std_logic_vector(signed(sext_ln20_1_fu_586_p1) + signed(ap_const_lv36_80000000));
    add_ln21_fu_606_p2 <= std_logic_vector(signed(sext_ln19_2_fu_540_p1) + signed(ap_const_lv36_80000000));
    add_ln9_fu_409_p2 <= std_logic_vector(unsigned(indvar_flatten2_fu_110) + unsigned(ap_const_lv15_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);

    ap_block_pp0_assign_proc : process(ap_CS_fsm, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone)
    begin
                ap_block_pp0 <= (((ap_ST_fsm_pp0_stage1 = ap_CS_fsm) and (ap_const_boolean_1 = ap_block_pp0_stage1_subdone)) or ((ap_ST_fsm_pp0_stage0 = ap_CS_fsm) and (ap_const_boolean_1 = ap_block_pp0_stage0_subdone)));
    end process;

        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_121_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_121 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_771_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln9_reg_1017, ap_block_pp0_stage0)
    begin
                ap_condition_771 <= ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln9_reg_1017 = ap_const_lv1_0));
    end process;


    ap_condition_775_assign_proc : process(ap_enable_reg_pp0_iter3, icmp_ln9_reg_1017_pp0_iter2_reg, ap_block_pp0_stage0)
    begin
                ap_condition_775 <= ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (icmp_ln9_reg_1017_pp0_iter2_reg = ap_const_lv1_0));
    end process;


    ap_condition_782_assign_proc : process(ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, icmp_ln9_reg_1017)
    begin
                ap_condition_782 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln9_reg_1017 = ap_const_lv1_0));
    end process;


    ap_condition_exit_pp0_iter0_stage1_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_enable_reg_pp0_iter0_reg, icmp_ln9_fu_415_p2)
    begin
        if (((icmp_ln9_fu_415_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage1 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_loop_exit_ready_pp0_iter3_reg, ap_done_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter3_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

        ap_enable_operation_157 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_158 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_160 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_164 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_62 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_65 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_75 <= (ap_const_boolean_1 = ap_const_boolean_1);
        ap_enable_operation_76 <= (ap_const_boolean_1 = ap_const_boolean_1);
    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_enable_state2_pp0_iter0_stage1_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg)
    begin
                ap_enable_state2_pp0_iter0_stage1 <= ((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1));
    end process;


    ap_enable_state3_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1)
    begin
                ap_enable_state3_pp0_iter1_stage0 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_enable_state5_pp0_iter2_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2)
    begin
                ap_enable_state5_pp0_iter2_stage0 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_enable_state6_pp0_iter2_stage1_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1)
    begin
                ap_enable_state6_pp0_iter2_stage1 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1));
    end process;


    ap_enable_state7_pp0_iter3_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3)
    begin
                ap_enable_state7_pp0_iter3_stage0 <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_enable_state8_pp0_iter3_stage1_assign_proc : process(ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1)
    begin
                ap_enable_state8_pp0_iter3_stage1 <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1));
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to3_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0_1to3 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to3 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage1;

    ap_loop_exit_ready_delayed_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_loop_exit_ready_delayed <= ap_const_logic_1;
        else 
            ap_loop_exit_ready_delayed <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_icmp_ln118_phi_fu_187_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln11_reg_992, ap_loop_init, ap_condition_771)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_const_boolean_1 = ap_condition_771)) then 
                ap_phi_mux_icmp_ln118_phi_fu_187_p4 <= icmp_ln11_reg_992;
            elsif ((ap_loop_init = ap_const_logic_1)) then 
                ap_phi_mux_icmp_ln118_phi_fu_187_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_icmp_ln118_phi_fu_187_p4 <= icmp_ln11_reg_992;
            end if;
        else 
            ap_phi_mux_icmp_ln118_phi_fu_187_p4 <= icmp_ln11_reg_992;
        end if; 
    end process;


    ap_phi_mux_ov_15_phi_fu_198_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, ov_reg_1061, ap_loop_init_pp0_iter2_reg, ap_condition_775)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
            if ((ap_const_boolean_1 = ap_condition_775)) then 
                ap_phi_mux_ov_15_phi_fu_198_p4 <= ov_reg_1061;
            elsif ((ap_loop_init_pp0_iter2_reg = ap_const_logic_1)) then 
                ap_phi_mux_ov_15_phi_fu_198_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_ov_15_phi_fu_198_p4 <= ov_reg_1061;
            end if;
        else 
            ap_phi_mux_ov_15_phi_fu_198_p4 <= ov_reg_1061;
        end if; 
    end process;

    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_enable_reg_pp0_iter0_reg)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_allocacmp_k4_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_loop_init, ap_block_pp0_stage0, k4_fu_118)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_k4_load <= ap_const_lv12_0;
        else 
            ap_sig_allocacmp_k4_load <= k4_fu_118;
        end if; 
    end process;


    ap_sig_allocacmp_stage3_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_loop_init, ap_block_pp0_stage0, stage3_fu_114)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_stage3_load <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_stage3_load <= stage3_fu_114;
        end if; 
    end process;


    ap_sig_allocacmp_stage_17_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_loop_init, ap_block_pp0_stage0, stage_17_fu_122)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_stage_17_load <= ap_const_lv4_1;
        else 
            ap_sig_allocacmp_stage_17_load <= stage_17_fu_122;
        end if; 
    end process;

    ar_fu_426_p1 <= data_q1(32 - 1 downto 0);
    b_fu_382_p2 <= std_logic_vector(unsigned(a_fu_376_p2) + unsigned(half_reg_977));
    bi_fu_442_p3 <= data_q0(63 downto 32);
    br_fu_438_p1 <= data_q0(32 - 1 downto 0);
    data_address0 <= data_address0_local;

    data_address0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, data_addr_1_reg_1002_pp0_iter2_reg, ap_block_pp0_stage0, ap_block_pp0_stage1, zext_ln15_1_fu_398_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            data_address0_local <= data_addr_1_reg_1002_pp0_iter2_reg;
        elsif (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            data_address0_local <= zext_ln15_1_fu_398_p1(12 - 1 downto 0);
        else 
            data_address0_local <= "XXXXXXXXXXXX";
        end if; 
    end process;

    data_address1 <= data_address1_local;

    data_address1_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, data_addr_reg_997_pp0_iter1_reg, ap_block_pp0_stage0, zext_ln15_fu_393_p1, ap_block_pp0_stage1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            data_address1_local <= data_addr_reg_997_pp0_iter1_reg;
        elsif (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            data_address1_local <= zext_ln15_fu_393_p1(12 - 1 downto 0);
        else 
            data_address1_local <= "XXXXXXXXXXXX";
        end if; 
    end process;

    data_ce0 <= data_ce0_local;

    data_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            data_ce0_local <= ap_const_logic_1;
        else 
            data_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    data_ce1 <= data_ce1_local;

    data_ce1_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            data_ce1_local <= ap_const_logic_1;
        else 
            data_ce1_local <= ap_const_logic_0;
        end if; 
    end process;

    data_d0 <= v_fu_927_p3;
    data_d1 <= u_fu_832_p3;
    data_we0 <= data_we0_local;

    data_we0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            data_we0_local <= ap_const_logic_1;
        else 
            data_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    data_we1 <= data_we1_local;

    data_we1_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            data_we1_local <= ap_const_logic_1;
        else 
            data_we1_local <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_206_p0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, sext_ln17_5_fu_465_p1, sext_ln17_5_reg_1046, ap_block_pp0_stage0, ap_block_pp0_stage1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_206_p0 <= sext_ln17_5_reg_1046(31 - 1 downto 0);
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                grp_fu_206_p0 <= sext_ln17_5_fu_465_p1(31 - 1 downto 0);
            else 
                grp_fu_206_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_206_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_206_p1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0, ap_block_pp0_stage1, sext_ln17_4_fu_460_p1, sext_ln17_fu_490_p1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_206_p1 <= sext_ln17_fu_490_p1(32 - 1 downto 0);
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                grp_fu_206_p1 <= sext_ln17_4_fu_460_p1(32 - 1 downto 0);
            else 
                grp_fu_206_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_206_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_210_p0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, sext_ln17_2_fu_455_p1, sext_ln17_2_reg_1041, ap_block_pp0_stage0, ap_block_pp0_stage1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_210_p0 <= sext_ln17_2_reg_1041(32 - 1 downto 0);
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                grp_fu_210_p0 <= sext_ln17_2_fu_455_p1(32 - 1 downto 0);
            else 
                grp_fu_210_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_210_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_210_p1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0, ap_block_pp0_stage1, sext_ln17_1_fu_450_p1, sext_ln17_3_fu_494_p1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                grp_fu_210_p1 <= sext_ln17_3_fu_494_p1(32 - 1 downto 0);
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                grp_fu_210_p1 <= sext_ln17_1_fu_450_p1(32 - 1 downto 0);
            else 
                grp_fu_210_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_fu_210_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    half_fu_267_p2 <= std_logic_vector(shift_left(unsigned(ap_const_lv12_1),to_integer(unsigned('0' & zext_ln9_1_fu_263_p1(12-1 downto 0)))));
    icmp_ln11_fu_315_p2 <= "1" when (k_fu_303_p2 = ap_const_lv12_800) else "0";
    icmp_ln21_1_fu_644_p2 <= "0" when (tmp_5_fu_634_p4 = ap_const_lv4_0) else "1";
    icmp_ln21_2_fu_666_p2 <= "0" when (tmp_6_fu_656_p4 = ap_const_lv4_0) else "1";
    icmp_ln21_3_fu_682_p2 <= "1" when (tmp_7_fu_672_p4 = ap_const_lv2_1) else "0";
    icmp_ln21_4_fu_688_p2 <= "1" when (signed(tmp_3_fu_596_p4) < signed(ap_const_lv33_180000000)) else "0";
    icmp_ln21_fu_622_p2 <= "0" when (tmp_4_fu_612_p4 = ap_const_lv4_0) else "1";
    icmp_ln41_1_fu_740_p2 <= "1" when (signed(tmp_fu_530_p4) < signed(ap_const_lv33_180000000)) else "0";
    icmp_ln41_2_fu_788_p2 <= "1" when (tmp_9_fu_778_p4 = ap_const_lv2_1) else "0";
    icmp_ln41_3_fu_794_p2 <= "1" when (signed(tmp_1_fu_556_p4) < signed(ap_const_lv33_180000000)) else "0";
    icmp_ln41_4_fu_851_p2 <= "1" when (tmp_10_fu_841_p4 = ap_const_lv2_1) else "0";
    icmp_ln41_5_fu_857_p2 <= "1" when (signed(tmp_2_fu_576_p4) < signed(ap_const_lv33_180000000)) else "0";
    icmp_ln41_fu_734_p2 <= "1" when (tmp_8_fu_724_p4 = ap_const_lv2_1) else "0";
    icmp_ln9_fu_415_p2 <= "1" when (indvar_flatten2_fu_110 = ap_const_lv15_5FFF) else "0";
    j_fu_291_p2 <= (trunc_ln11_fu_287_p1 and sub_fu_277_p2);
    k_fu_303_p2 <= std_logic_vector(unsigned(select_ln9_fu_243_p3) + unsigned(ap_const_lv12_1));
    lshr_ln14_fu_297_p2 <= std_logic_vector(shift_right(unsigned(zext_ln11_1_fu_283_p1),to_integer(unsigned('0' & zext_ln9_fu_259_p1(13-1 downto 0)))));
    or_ln21_1_fu_700_p2 <= (icmp_ln21_4_fu_688_p2 or icmp_ln21_2_fu_666_p2);
    or_ln21_2_fu_706_p2 <= (or_ln21_1_fu_700_p2 or icmp_ln21_1_fu_644_p2);
    or_ln21_3_fu_712_p2 <= (or_ln21_fu_694_p2 or or_ln21_2_fu_706_p2);
    or_ln21_fu_694_p2 <= (icmp_ln21_fu_622_p2 or icmp_ln21_3_fu_682_p2);
    or_ln41_1_fu_818_p2 <= (icmp_ln41_3_fu_794_p2 or icmp_ln41_2_fu_788_p2);
    or_ln41_2_fu_881_p2 <= (icmp_ln41_5_fu_857_p2 or icmp_ln41_4_fu_851_p2);
    or_ln41_3_fu_913_p2 <= (icmp_ln21_4_fu_688_p2 or icmp_ln21_3_fu_682_p2);
    or_ln41_fu_764_p2 <= (icmp_ln41_fu_734_p2 or icmp_ln41_1_fu_740_p2);
    ov_fu_718_p2 <= (or_ln21_3_fu_712_p2 or ap_phi_mux_ov_15_phi_fu_198_p4);
    overflow <= ov_reg_1061_pp0_iter3_reg;
    r18_TW_I_address0 <= zext_ln16_fu_403_p1(11 - 1 downto 0);

    r18_TW_I_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_TW_I_ce0_local <= ap_const_logic_1;
        else 
            r18_TW_I_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_TW_R_address0 <= zext_ln16_fu_403_p1(11 - 1 downto 0);

    r18_TW_R_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_TW_R_ce0_local <= ap_const_logic_1;
        else 
            r18_TW_R_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    select_ln41_1_fu_770_p3 <= 
        select_ln41_fu_756_p3 when (or_ln41_fu_764_p2(0) = '1') else 
        trunc_ln5_fu_746_p4;
    select_ln41_2_fu_810_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln41_2_fu_788_p2(0) = '1') else 
        ap_const_lv32_80000000;
    select_ln41_3_fu_824_p3 <= 
        select_ln41_2_fu_810_p3 when (or_ln41_1_fu_818_p2(0) = '1') else 
        trunc_ln41_1_fu_800_p4;
    select_ln41_4_fu_873_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln41_4_fu_851_p2(0) = '1') else 
        ap_const_lv32_80000000;
    select_ln41_5_fu_887_p3 <= 
        select_ln41_4_fu_873_p3 when (or_ln41_2_fu_881_p2(0) = '1') else 
        trunc_ln41_2_fu_863_p4;
    select_ln41_6_fu_905_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln21_3_fu_682_p2(0) = '1') else 
        ap_const_lv32_80000000;
    select_ln41_7_fu_919_p3 <= 
        select_ln41_6_fu_905_p3 when (or_ln41_3_fu_913_p2(0) = '1') else 
        trunc_ln41_3_fu_895_p4;
    select_ln41_fu_756_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln41_fu_734_p2(0) = '1') else 
        ap_const_lv32_80000000;
    select_ln9_1_fu_344_p3 <= 
        stage_1_mid1_fu_339_p2 when (icmp_ln118_reg_184(0) = '1') else 
        stage_17_load_reg_967;
    select_ln9_fu_243_p3 <= 
        ap_const_lv12_0 when (ap_phi_mux_icmp_ln118_phi_fu_187_p4(0) = '1') else 
        ap_sig_allocacmp_k4_load;
        sext_ln17_1_fu_450_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(br_fu_438_p1),62));

        sext_ln17_2_fu_455_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r18_TW_R_q0),62));

        sext_ln17_3_fu_494_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(bi_reg_1036),62));

        sext_ln17_4_fu_460_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(bi_fu_442_p3),63));

        sext_ln17_5_fu_465_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r18_TW_I_q0),63));

        sext_ln17_fu_490_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(br_reg_1031),63));

        sext_ln18_1_fu_498_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(grp_fu_210_p2),63));

        sext_ln18_fu_470_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(grp_fu_210_p2),63));

        sext_ln19_1_fu_521_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln3_reg_1051),34));

        sext_ln19_2_fu_540_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_530_p4),36));

        sext_ln19_3_fu_544_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ai_reg_1026),34));

        sext_ln19_4_fu_547_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln19_2_reg_1056),34));

        sext_ln19_fu_518_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ar_reg_1021),34));

        sext_ln20_1_fu_586_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_2_fu_576_p4),36));

        sext_ln20_fu_566_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_1_fu_556_p4),36));

    shl_ln14_fu_367_p2 <= std_logic_vector(shift_left(unsigned(lshr_ln14_reg_987),to_integer(unsigned('0' & stage_1_cast_fu_351_p1(13-1 downto 0)))));
    stage_1_cast_fu_351_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln9_1_fu_344_p3),13));
    stage_1_mid1_fu_339_p2 <= std_logic_vector(unsigned(stage3_load_reg_962) + unsigned(ap_const_lv4_2));
    stage_2_fu_251_p3 <= 
        ap_sig_allocacmp_stage_17_load when (ap_phi_mux_icmp_ln118_phi_fu_187_p4(0) = '1') else 
        ap_sig_allocacmp_stage3_load;
    stage_fu_309_p2 <= std_logic_vector(unsigned(stage_2_fu_251_p3) + unsigned(ap_const_lv4_1));
    sub8_fu_355_p2 <= std_logic_vector(signed(ap_const_lv4_B) - signed(stage_2_reg_972));
    sub_fu_277_p2 <= std_logic_vector(unsigned(trunc_ln10_fu_273_p1) + unsigned(ap_const_lv11_7FF));
    sub_ln20_1_fu_590_p2 <= std_logic_vector(signed(sext_ln19_3_fu_544_p1) - signed(sext_ln19_4_fu_547_p1));
    sub_ln20_fu_570_p2 <= std_logic_vector(signed(sext_ln19_fu_518_p1) - signed(sext_ln19_1_fu_521_p1));
    t_fu_387_p2 <= std_logic_vector(shift_left(unsigned(zext_ln14_fu_364_p1),to_integer(unsigned('0' & zext_ln11_fu_360_p1(12-1 downto 0)))));
    ti_fu_502_p2 <= std_logic_vector(unsigned(grp_fu_206_p2) + unsigned(sext_ln18_1_fu_498_p1));
    tmp_10_fu_841_p4 <= sub_ln20_fu_570_p2(33 downto 32);
    tmp_1_fu_556_p4 <= add_ln19_1_fu_550_p2(33 downto 1);
    tmp_2_fu_576_p4 <= sub_ln20_fu_570_p2(33 downto 1);
    tmp_3_fu_596_p4 <= sub_ln20_1_fu_590_p2(33 downto 1);
    tmp_4_fu_612_p4 <= add_ln21_fu_606_p2(35 downto 32);
    tmp_5_fu_634_p4 <= add_ln21_1_fu_628_p2(35 downto 32);
    tmp_6_fu_656_p4 <= add_ln21_2_fu_650_p2(35 downto 32);
    tmp_7_fu_672_p4 <= sub_ln20_1_fu_590_p2(33 downto 32);
    tmp_8_fu_724_p4 <= add_ln19_fu_524_p2(33 downto 32);
    tmp_9_fu_778_p4 <= add_ln19_1_fu_550_p2(33 downto 32);
    tmp_fu_530_p4 <= add_ln19_fu_524_p2(33 downto 1);
    tr_fu_474_p2 <= std_logic_vector(signed(sext_ln18_fu_470_p1) - signed(grp_fu_206_p2));
    trunc_ln10_fu_273_p1 <= half_fu_267_p2(11 - 1 downto 0);
    trunc_ln11_fu_287_p1 <= select_ln9_fu_243_p3(11 - 1 downto 0);
    trunc_ln14_fu_372_p1 <= shl_ln14_fu_367_p2(12 - 1 downto 0);
    trunc_ln41_1_fu_800_p4 <= add_ln19_1_fu_550_p2(32 downto 1);
    trunc_ln41_2_fu_863_p4 <= sub_ln20_fu_570_p2(32 downto 1);
    trunc_ln41_3_fu_895_p4 <= sub_ln20_1_fu_590_p2(32 downto 1);
    trunc_ln5_fu_746_p4 <= add_ln19_fu_524_p2(32 downto 1);
    u_fu_832_p3 <= (select_ln41_3_fu_824_p3 & select_ln41_1_fu_770_p3);
    v_fu_927_p3 <= (select_ln41_7_reg_1077 & select_ln41_5_reg_1072);
    zext_ln11_1_fu_283_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln9_fu_243_p3),13));
    zext_ln11_fu_360_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub8_fu_355_p2),12));
    zext_ln14_fu_364_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_982),12));
    zext_ln15_1_fu_398_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(b_fu_382_p2),64));
    zext_ln15_fu_393_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(a_fu_376_p2),64));
    zext_ln16_fu_403_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(t_fu_387_p2),64));
    zext_ln9_1_fu_263_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(stage_2_fu_251_p3),12));
    zext_ln9_fu_259_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(stage_2_fu_251_p3),13));
end behav;
