                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    wr_load : IN STD_LOGIC_VECTOR (8 downto 0);
    p_out : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out_ap_vld : OUT STD_LOGIC;
    p_out1 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out1_ap_vld : OUT STD_LOGIC;
    p_out2 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out2_ap_vld : OUT STD_LOGIC;
    p_out3 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out3_ap_vld : OUT STD_LOGIC;
    p_out4 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out4_ap_vld : OUT STD_LOGIC;
    p_out5 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out5_ap_vld : OUT STD_LOGIC;
    p_out6 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out6_ap_vld : OUT STD_LOGIC;
    p_out7 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out7_ap_vld : OUT STD_LOGIC;
    p_out8 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out8_ap_vld : OUT STD_LOGIC;
    p_out9 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out9_ap_vld : OUT STD_LOGIC;
    p_out10 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out10_ap_vld : OUT STD_LOGIC;
    p_out11 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out11_ap_vld : OUT STD_LOGIC;
    p_out12 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out12_ap_vld : OUT STD_LOGIC;
    p_out13 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out13_ap_vld : OUT STD_LOGIC;
    p_out14 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out14_ap_vld : OUT STD_LOGIC;
    p_out15 : OUT STD_LOGIC_VECTOR (51 downto 0);
    p_out15_ap_vld : OUT STD_LOGIC;
    history_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    history_ce0 : OUT STD_LOGIC;
    history_q0 : IN STD_LOGIC_VECTOR (383 downto 0) );
end;


architecture behav of fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_17F : STD_LOGIC_VECTOR (8 downto 0) := "101111111";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_78 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111000";
    constant ap_const_lv32_90 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010010000";
    constant ap_const_lv32_A8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010101000";
    constant ap_const_lv32_C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011000000";
    constant ap_const_lv32_D8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011011000";
    constant ap_const_lv32_F0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011110000";
    constant ap_const_lv32_108 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100001000";
    constant ap_const_lv32_120 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100100000";
    constant ap_const_lv32_138 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100111000";
    constant ap_const_lv32_150 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101010000";
    constant ap_const_lv32_168 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101101000";

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
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln45_fu_472_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_LOC_FIR_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal r18_LOC_FIR_q0 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln45_reg_1183 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln45_reg_1183_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal co_reg_1197 : STD_LOGIC_VECTOR (20 downto 0);
    signal sample_fu_505_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_reg_1202 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_1_reg_1207 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_2_reg_1212 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_3_reg_1217 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_4_reg_1222 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_5_reg_1227 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_6_reg_1232 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_7_reg_1237 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_8_reg_1242 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_9_reg_1247 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_10_reg_1252 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_11_reg_1257 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_12_reg_1262 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_13_reg_1267 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_14_reg_1272 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_15_reg_1277 : STD_LOGIC_VECTOR (23 downto 0);
    signal prod_fu_320_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_reg_1282 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_1_fu_324_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_1_reg_1287 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_2_fu_328_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_2_reg_1292 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_3_fu_332_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_3_reg_1297 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_4_fu_336_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_4_reg_1302 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_5_fu_340_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_5_reg_1307 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_6_fu_344_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_6_reg_1312 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_7_fu_348_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_7_reg_1317 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_8_fu_352_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_8_reg_1322 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_9_fu_356_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_9_reg_1327 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_10_fu_360_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_10_reg_1332 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_11_fu_364_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_11_reg_1337 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_12_fu_368_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_12_reg_1342 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_13_fu_372_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_13_reg_1347 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_14_fu_376_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_14_reg_1352 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_15_fu_380_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_15_reg_1357 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln47_fu_495_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln45_fu_484_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_fu_108 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_fu_763_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal empty_10_fu_112 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_1_fu_772_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_11_fu_116 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_2_fu_781_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_12_fu_120 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_3_fu_790_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_13_fu_124 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_4_fu_799_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_14_fu_128 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_5_fu_808_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_15_fu_132 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_6_fu_817_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_16_fu_136 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_7_fu_826_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_17_fu_140 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_8_fu_835_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_18_fu_144 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_9_fu_844_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_19_fu_148 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_10_fu_853_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_20_fu_152 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_11_fu_862_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_21_fu_156 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_12_fu_871_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_22_fu_160 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_13_fu_880_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_23_fu_164 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_14_fu_889_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal empty_24_fu_168 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal add_ln50_15_fu_898_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tap_fu_172 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal tap_2_fu_478_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_tap_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal history_ce0_local : STD_LOGIC;
    signal r18_LOC_FIR_ce0_local : STD_LOGIC;
    signal prod_fu_320_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal sext_ln50_fu_629_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal prod_1_fu_324_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_2_fu_328_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_3_fu_332_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_4_fu_336_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_5_fu_340_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_6_fu_344_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_7_fu_348_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_8_fu_352_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_9_fu_356_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_10_fu_360_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_11_fu_364_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_12_fu_368_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_13_fu_372_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_14_fu_376_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal prod_15_fu_380_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal at_fu_489_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal sext_ln50_2_fu_760_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_4_fu_769_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_6_fu_778_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_8_fu_787_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_10_fu_796_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_12_fu_805_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_14_fu_814_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_16_fu_823_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_18_fu_832_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_20_fu_841_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_22_fu_850_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_24_fu_859_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_26_fu_868_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_28_fu_877_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_30_fu_886_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal sext_ln50_32_fu_895_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_loc_hls_mul_24s_21s_45_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (23 downto 0);
        din1 : IN STD_LOGIC_VECTOR (20 downto 0);
        dout : OUT STD_LOGIC_VECTOR (44 downto 0) );
    end component;


    component fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_r18_LOC_FIR_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (20 downto 0) );
    end component;


    component fir_loc_hls_flow_control_loop_pipe_sequential_init IS
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
    r18_LOC_FIR_U : component fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_r18_LOC_FIR_ROM_AUTO_1R
    generic map (
        DataWidth => 21,
        AddressRange => 383,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_LOC_FIR_address0,
        ce0 => r18_LOC_FIR_ce0_local,
        q0 => r18_LOC_FIR_q0);

    mul_24s_21s_45_1_1_U1 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_reg_1202,
        din1 => prod_fu_320_p1,
        dout => prod_fu_320_p2);

    mul_24s_21s_45_1_1_U2 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_1_reg_1207,
        din1 => prod_1_fu_324_p1,
        dout => prod_1_fu_324_p2);

    mul_24s_21s_45_1_1_U3 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_2_reg_1212,
        din1 => prod_2_fu_328_p1,
        dout => prod_2_fu_328_p2);

    mul_24s_21s_45_1_1_U4 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_3_reg_1217,
        din1 => prod_3_fu_332_p1,
        dout => prod_3_fu_332_p2);

    mul_24s_21s_45_1_1_U5 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_4_reg_1222,
        din1 => prod_4_fu_336_p1,
        dout => prod_4_fu_336_p2);

    mul_24s_21s_45_1_1_U6 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_5_reg_1227,
        din1 => prod_5_fu_340_p1,
        dout => prod_5_fu_340_p2);

    mul_24s_21s_45_1_1_U7 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_6_reg_1232,
        din1 => prod_6_fu_344_p1,
        dout => prod_6_fu_344_p2);

    mul_24s_21s_45_1_1_U8 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_7_reg_1237,
        din1 => prod_7_fu_348_p1,
        dout => prod_7_fu_348_p2);

    mul_24s_21s_45_1_1_U9 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_8_reg_1242,
        din1 => prod_8_fu_352_p1,
        dout => prod_8_fu_352_p2);

    mul_24s_21s_45_1_1_U10 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_9_reg_1247,
        din1 => prod_9_fu_356_p1,
        dout => prod_9_fu_356_p2);

    mul_24s_21s_45_1_1_U11 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_10_reg_1252,
        din1 => prod_10_fu_360_p1,
        dout => prod_10_fu_360_p2);

    mul_24s_21s_45_1_1_U12 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_11_reg_1257,
        din1 => prod_11_fu_364_p1,
        dout => prod_11_fu_364_p2);

    mul_24s_21s_45_1_1_U13 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_12_reg_1262,
        din1 => prod_12_fu_368_p1,
        dout => prod_12_fu_368_p2);

    mul_24s_21s_45_1_1_U14 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_13_reg_1267,
        din1 => prod_13_fu_372_p1,
        dout => prod_13_fu_372_p2);

    mul_24s_21s_45_1_1_U15 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_14_reg_1272,
        din1 => prod_14_fu_376_p1,
        dout => prod_14_fu_376_p2);

    mul_24s_21s_45_1_1_U16 : component fir_loc_hls_mul_24s_21s_45_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 21,
        dout_WIDTH => 45)
    port map (
        din0 => sample_15_reg_1277,
        din1 => prod_15_fu_380_p1,
        dout => prod_15_fu_380_p2);

    flow_control_loop_pipe_sequential_init_U : component fir_loc_hls_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
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


    empty_10_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_10_fu_112 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_10_fu_112 <= add_ln50_1_fu_772_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_11_fu_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_11_fu_116 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_11_fu_116 <= add_ln50_2_fu_781_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_12_fu_120_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_12_fu_120 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_12_fu_120 <= add_ln50_3_fu_790_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_13_fu_124_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_13_fu_124 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_13_fu_124 <= add_ln50_4_fu_799_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_14_fu_128_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_14_fu_128 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_14_fu_128 <= add_ln50_5_fu_808_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_15_fu_132_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_15_fu_132 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_15_fu_132 <= add_ln50_6_fu_817_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_16_fu_136_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_16_fu_136 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_16_fu_136 <= add_ln50_7_fu_826_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_17_fu_140_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_17_fu_140 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_17_fu_140 <= add_ln50_8_fu_835_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_18_fu_144_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_18_fu_144 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_18_fu_144 <= add_ln50_9_fu_844_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_19_fu_148_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_19_fu_148 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_19_fu_148 <= add_ln50_10_fu_853_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_20_fu_152_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_20_fu_152 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_20_fu_152 <= add_ln50_11_fu_862_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_21_fu_156_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_21_fu_156 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_21_fu_156 <= add_ln50_12_fu_871_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_22_fu_160_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_22_fu_160 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_22_fu_160 <= add_ln50_13_fu_880_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_23_fu_164_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_23_fu_164 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_23_fu_164 <= add_ln50_14_fu_889_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_24_fu_168_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_24_fu_168 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_24_fu_168 <= add_ln50_15_fu_898_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    empty_fu_108 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_fu_108 <= add_ln50_fu_763_p2;
                end if;
            end if; 
        end if;
    end process;

    tap_fu_172_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln45_fu_472_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    tap_fu_172 <= tap_2_fu_478_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    tap_fu_172 <= ap_const_lv9_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                co_reg_1197 <= r18_LOC_FIR_q0;
                icmp_ln45_reg_1183 <= icmp_ln45_fu_472_p2;
                icmp_ln45_reg_1183_pp0_iter1_reg <= icmp_ln45_reg_1183;
                sample_10_reg_1252 <= history_q0(263 downto 240);
                sample_11_reg_1257 <= history_q0(287 downto 264);
                sample_12_reg_1262 <= history_q0(311 downto 288);
                sample_13_reg_1267 <= history_q0(335 downto 312);
                sample_14_reg_1272 <= history_q0(359 downto 336);
                sample_15_reg_1277 <= history_q0(383 downto 360);
                sample_1_reg_1207 <= history_q0(47 downto 24);
                sample_2_reg_1212 <= history_q0(71 downto 48);
                sample_3_reg_1217 <= history_q0(95 downto 72);
                sample_4_reg_1222 <= history_q0(119 downto 96);
                sample_5_reg_1227 <= history_q0(143 downto 120);
                sample_6_reg_1232 <= history_q0(167 downto 144);
                sample_7_reg_1237 <= history_q0(191 downto 168);
                sample_8_reg_1242 <= history_q0(215 downto 192);
                sample_9_reg_1247 <= history_q0(239 downto 216);
                sample_reg_1202 <= sample_fu_505_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                prod_10_reg_1332 <= prod_10_fu_360_p2;
                prod_11_reg_1337 <= prod_11_fu_364_p2;
                prod_12_reg_1342 <= prod_12_fu_368_p2;
                prod_13_reg_1347 <= prod_13_fu_372_p2;
                prod_14_reg_1352 <= prod_14_fu_376_p2;
                prod_15_reg_1357 <= prod_15_fu_380_p2;
                prod_1_reg_1287 <= prod_1_fu_324_p2;
                prod_2_reg_1292 <= prod_2_fu_328_p2;
                prod_3_reg_1297 <= prod_3_fu_332_p2;
                prod_4_reg_1302 <= prod_4_fu_336_p2;
                prod_5_reg_1307 <= prod_5_fu_340_p2;
                prod_6_reg_1312 <= prod_6_fu_344_p2;
                prod_7_reg_1317 <= prod_7_fu_348_p2;
                prod_8_reg_1322 <= prod_8_fu_352_p2;
                prod_9_reg_1327 <= prod_9_fu_356_p2;
                prod_reg_1282 <= prod_fu_320_p2;
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
    add_ln50_10_fu_853_p2 <= std_logic_vector(signed(sext_ln50_22_fu_850_p1) + signed(empty_19_fu_148));
    add_ln50_11_fu_862_p2 <= std_logic_vector(signed(sext_ln50_24_fu_859_p1) + signed(empty_20_fu_152));
    add_ln50_12_fu_871_p2 <= std_logic_vector(signed(sext_ln50_26_fu_868_p1) + signed(empty_21_fu_156));
    add_ln50_13_fu_880_p2 <= std_logic_vector(signed(sext_ln50_28_fu_877_p1) + signed(empty_22_fu_160));
    add_ln50_14_fu_889_p2 <= std_logic_vector(signed(sext_ln50_30_fu_886_p1) + signed(empty_23_fu_164));
    add_ln50_15_fu_898_p2 <= std_logic_vector(signed(sext_ln50_32_fu_895_p1) + signed(empty_24_fu_168));
    add_ln50_1_fu_772_p2 <= std_logic_vector(signed(sext_ln50_4_fu_769_p1) + signed(empty_10_fu_112));
    add_ln50_2_fu_781_p2 <= std_logic_vector(signed(sext_ln50_6_fu_778_p1) + signed(empty_11_fu_116));
    add_ln50_3_fu_790_p2 <= std_logic_vector(signed(sext_ln50_8_fu_787_p1) + signed(empty_12_fu_120));
    add_ln50_4_fu_799_p2 <= std_logic_vector(signed(sext_ln50_10_fu_796_p1) + signed(empty_13_fu_124));
    add_ln50_5_fu_808_p2 <= std_logic_vector(signed(sext_ln50_12_fu_805_p1) + signed(empty_14_fu_128));
    add_ln50_6_fu_817_p2 <= std_logic_vector(signed(sext_ln50_14_fu_814_p1) + signed(empty_15_fu_132));
    add_ln50_7_fu_826_p2 <= std_logic_vector(signed(sext_ln50_16_fu_823_p1) + signed(empty_16_fu_136));
    add_ln50_8_fu_835_p2 <= std_logic_vector(signed(sext_ln50_18_fu_832_p1) + signed(empty_17_fu_140));
    add_ln50_9_fu_844_p2 <= std_logic_vector(signed(sext_ln50_20_fu_841_p1) + signed(empty_18_fu_144));
    add_ln50_fu_763_p2 <= std_logic_vector(signed(sext_ln50_2_fu_760_p1) + signed(empty_fu_108));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln45_fu_472_p2)
    begin
        if (((icmp_ln45_fu_472_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_loop_exit_ready_pp0_iter2_reg, ap_done_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

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


    ap_sig_allocacmp_tap_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, tap_fu_172)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_tap_1 <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_tap_1 <= tap_fu_172;
        end if; 
    end process;

    at_fu_489_p2 <= std_logic_vector(unsigned(wr_load) - unsigned(ap_sig_allocacmp_tap_1));
    history_address0 <= zext_ln47_fu_495_p1(9 - 1 downto 0);
    history_ce0 <= history_ce0_local;

    history_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            history_ce0_local <= ap_const_logic_1;
        else 
            history_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln45_fu_472_p2 <= "1" when (ap_sig_allocacmp_tap_1 = ap_const_lv9_17F) else "0";
    p_out <= empty_24_fu_168;
    p_out1 <= empty_23_fu_164;
    p_out10 <= empty_14_fu_128;

    p_out10_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out10_ap_vld <= ap_const_logic_1;
        else 
            p_out10_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out11 <= empty_13_fu_124;

    p_out11_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out11_ap_vld <= ap_const_logic_1;
        else 
            p_out11_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out12 <= empty_12_fu_120;

    p_out12_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out12_ap_vld <= ap_const_logic_1;
        else 
            p_out12_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out13 <= empty_11_fu_116;

    p_out13_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out13_ap_vld <= ap_const_logic_1;
        else 
            p_out13_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out14 <= empty_10_fu_112;

    p_out14_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out14_ap_vld <= ap_const_logic_1;
        else 
            p_out14_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out15 <= empty_fu_108;

    p_out15_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out15_ap_vld <= ap_const_logic_1;
        else 
            p_out15_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    p_out1_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out1_ap_vld <= ap_const_logic_1;
        else 
            p_out1_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out2 <= empty_22_fu_160;

    p_out2_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out2_ap_vld <= ap_const_logic_1;
        else 
            p_out2_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out3 <= empty_21_fu_156;

    p_out3_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out3_ap_vld <= ap_const_logic_1;
        else 
            p_out3_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out4 <= empty_20_fu_152;

    p_out4_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out4_ap_vld <= ap_const_logic_1;
        else 
            p_out4_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out5 <= empty_19_fu_148;

    p_out5_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out5_ap_vld <= ap_const_logic_1;
        else 
            p_out5_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out6 <= empty_18_fu_144;

    p_out6_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out6_ap_vld <= ap_const_logic_1;
        else 
            p_out6_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out7 <= empty_17_fu_140;

    p_out7_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out7_ap_vld <= ap_const_logic_1;
        else 
            p_out7_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out8 <= empty_16_fu_136;

    p_out8_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out8_ap_vld <= ap_const_logic_1;
        else 
            p_out8_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out9 <= empty_15_fu_132;

    p_out9_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out9_ap_vld <= ap_const_logic_1;
        else 
            p_out9_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    p_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_1183_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_1183_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out_ap_vld <= ap_const_logic_1;
        else 
            p_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    prod_10_fu_360_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_11_fu_364_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_12_fu_368_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_13_fu_372_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_14_fu_376_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_15_fu_380_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_1_fu_324_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_2_fu_328_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_3_fu_332_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_4_fu_336_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_5_fu_340_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_6_fu_344_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_7_fu_348_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_8_fu_352_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_9_fu_356_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    prod_fu_320_p1 <= sext_ln50_fu_629_p1(21 - 1 downto 0);
    r18_LOC_FIR_address0 <= zext_ln45_fu_484_p1(9 - 1 downto 0);

    r18_LOC_FIR_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_LOC_FIR_ce0_local <= ap_const_logic_1;
        else 
            r18_LOC_FIR_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    sample_fu_505_p1 <= history_q0(24 - 1 downto 0);
        sext_ln50_10_fu_796_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_4_reg_1302),52));

        sext_ln50_12_fu_805_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_5_reg_1307),52));

        sext_ln50_14_fu_814_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_6_reg_1312),52));

        sext_ln50_16_fu_823_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_7_reg_1317),52));

        sext_ln50_18_fu_832_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_8_reg_1322),52));

        sext_ln50_20_fu_841_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_9_reg_1327),52));

        sext_ln50_22_fu_850_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_10_reg_1332),52));

        sext_ln50_24_fu_859_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_11_reg_1337),52));

        sext_ln50_26_fu_868_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_12_reg_1342),52));

        sext_ln50_28_fu_877_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_13_reg_1347),52));

        sext_ln50_2_fu_760_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_reg_1282),52));

        sext_ln50_30_fu_886_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_14_reg_1352),52));

        sext_ln50_32_fu_895_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_15_reg_1357),52));

        sext_ln50_4_fu_769_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_1_reg_1287),52));

        sext_ln50_6_fu_778_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_2_reg_1292),52));

        sext_ln50_8_fu_787_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_3_reg_1297),52));

        sext_ln50_fu_629_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(co_reg_1197),45));

    tap_2_fu_478_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_tap_1) + unsigned(ap_const_lv9_1));
    zext_ln45_fu_484_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_tap_1),64));
    zext_ln47_fu_495_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(at_fu_489_p2),64));
end behav;
