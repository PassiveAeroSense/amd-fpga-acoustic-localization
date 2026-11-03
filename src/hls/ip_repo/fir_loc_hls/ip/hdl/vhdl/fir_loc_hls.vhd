                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_loc_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    samples : IN STD_LOGIC_VECTOR (383 downto 0);
    result : OUT STD_LOGIC_VECTOR (384 downto 0) );
end;


architecture behav of fir_loc_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_loc_hls_fir_loc_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.978167,HLS_SYN_LAT=196,HLS_SYN_TPT=none,HLS_SYN_MEM=12,HLS_SYN_DSP=0,HLS_SYN_FF=2095,HLS_SYN_LUT=4297,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv385_lc_1 : STD_LOGIC_VECTOR (384 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv52_200000 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000001000000000000000000000";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv32_2D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101101";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv30_3F800000 : STD_LOGIC_VECTOR (29 downto 0) := "111111100000000000000000000000";
    constant ap_const_lv24_7FFFFF : STD_LOGIC_VECTOR (23 downto 0) := "011111111111111111111111";
    constant ap_const_lv24_800000 : STD_LOGIC_VECTOR (23 downto 0) := "100000000000000000000000";
    constant ap_const_lv32_17D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101111101";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal wr : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal history_ce0 : STD_LOGIC;
    signal history_q0 : STD_LOGIC_VECTOR (383 downto 0);
    signal history_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal next_r : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal wr_load_reg_1568 : STD_LOGIC_VECTOR (8 downto 0);
    signal count_load_reg_1574 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln38_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln38_reg_1580 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_idle : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15 : STD_LOGIC_VECTOR (51 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15_ap_vld : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0 : STD_LOGIC;
    signal grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln37_fu_207_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln60_fu_1450_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal add_ln60_1_fu_1461_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln58_fu_226_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_1411_p18 : STD_LOGIC_VECTOR (384 downto 0);
    signal history_we1_local : STD_LOGIC;
    signal history_ce1_local : STD_LOGIC;
    signal add_ln55_fu_286_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_1_fu_302_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln_fu_292_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_fu_312_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_1_fu_318_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_fu_342_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_fu_334_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_fu_324_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_1_fu_356_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_2_fu_372_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_2_fu_362_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_2_fu_382_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_3_fu_388_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_1_fu_412_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_2_fu_404_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_2_fu_394_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_2_fu_426_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_3_fu_442_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_4_fu_432_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_4_fu_452_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_5_fu_458_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_2_fu_482_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_4_fu_474_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_4_fu_464_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_3_fu_496_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_4_fu_512_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_6_fu_502_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_6_fu_522_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_7_fu_528_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_3_fu_552_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_6_fu_544_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_6_fu_534_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_4_fu_566_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_5_fu_582_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_8_fu_572_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_8_fu_592_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_9_fu_598_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_4_fu_622_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_8_fu_614_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_8_fu_604_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_5_fu_636_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_6_fu_652_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_s_fu_642_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_10_fu_662_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_11_fu_668_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_5_fu_692_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_10_fu_684_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_10_fu_674_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_6_fu_706_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_7_fu_722_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_1_fu_712_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_12_fu_732_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_13_fu_738_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_6_fu_762_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_12_fu_754_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_12_fu_744_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_7_fu_776_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_8_fu_792_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_3_fu_782_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_14_fu_802_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_15_fu_808_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_7_fu_832_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_14_fu_824_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_14_fu_814_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_8_fu_846_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_9_fu_862_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_5_fu_852_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_16_fu_872_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_17_fu_878_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_8_fu_902_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_16_fu_894_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_16_fu_884_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_9_fu_916_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_10_fu_932_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_7_fu_922_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_18_fu_942_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_19_fu_948_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_9_fu_972_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_18_fu_964_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_18_fu_954_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_10_fu_986_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_11_fu_1002_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_9_fu_992_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_20_fu_1012_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_21_fu_1018_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_10_fu_1042_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_20_fu_1034_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_20_fu_1024_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_11_fu_1056_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_12_fu_1072_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_10_fu_1062_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_22_fu_1082_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_23_fu_1088_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_11_fu_1112_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_22_fu_1104_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_22_fu_1094_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_12_fu_1126_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_13_fu_1142_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_11_fu_1132_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_24_fu_1152_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_25_fu_1158_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_12_fu_1182_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_24_fu_1174_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_24_fu_1164_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_13_fu_1196_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_14_fu_1212_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_12_fu_1202_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_26_fu_1222_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_27_fu_1228_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_13_fu_1252_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_26_fu_1244_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_26_fu_1234_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_14_fu_1266_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_15_fu_1282_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_13_fu_1272_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_28_fu_1292_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_29_fu_1298_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_14_fu_1322_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_28_fu_1314_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_28_fu_1304_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_15_fu_1336_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal tmp_16_fu_1352_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln55_14_fu_1342_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln55_30_fu_1362_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_31_fu_1368_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_15_fu_1392_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_30_fu_1384_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_30_fu_1374_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal icmp_ln57_fu_1406_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal s_31_fu_1398_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_29_fu_1328_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_27_fu_1258_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_25_fu_1188_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_23_fu_1118_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_21_fu_1048_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_19_fu_978_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_17_fu_908_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_15_fu_838_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_13_fu_768_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_11_fu_698_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_9_fu_628_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_7_fu_558_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_5_fu_488_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_3_fu_418_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_1_fu_348_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2 IS
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
    end component;


    component fir_loc_hls_history_RAM_S2P_BRAM_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (383 downto 0);
        address1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce1 : IN STD_LOGIC;
        we1 : IN STD_LOGIC;
        d1 : IN STD_LOGIC_VECTOR (383 downto 0) );
    end component;



begin
    history_U : component fir_loc_hls_history_RAM_S2P_BRAM_1R1W
    generic map (
        DataWidth => 384,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0,
        ce0 => history_ce0,
        q0 => history_q0,
        address1 => history_address1,
        ce1 => history_ce1_local,
        we1 => history_we1_local,
        d1 => samples);

    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178 : component fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start,
        ap_done => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done,
        ap_idle => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_idle,
        ap_ready => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready,
        wr_load => wr_load_reg_1568,
        p_out => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out,
        p_out_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out_ap_vld,
        p_out1 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1,
        p_out1_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1_ap_vld,
        p_out2 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2,
        p_out2_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2_ap_vld,
        p_out3 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3,
        p_out3_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3_ap_vld,
        p_out4 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4,
        p_out4_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4_ap_vld,
        p_out5 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5,
        p_out5_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5_ap_vld,
        p_out6 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6,
        p_out6_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6_ap_vld,
        p_out7 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7,
        p_out7_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7_ap_vld,
        p_out8 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8,
        p_out8_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8_ap_vld,
        p_out9 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9,
        p_out9_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9_ap_vld,
        p_out10 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10,
        p_out10_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10_ap_vld,
        p_out11 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11,
        p_out11_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11_ap_vld,
        p_out12 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12,
        p_out12_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12_ap_vld,
        p_out13 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13,
        p_out13_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13_ap_vld,
        p_out14 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14,
        p_out14_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14_ap_vld,
        p_out15 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15,
        p_out15_ap_vld => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15_ap_vld,
        history_address0 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0,
        history_ce0 => grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0,
        history_q0 => history_q0);





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


    count_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                count <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    count <= add_ln60_1_fu_1461_p2;
                end if; 
            end if;
        end if;
    end process;


    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready = ap_const_logic_1)) then 
                    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    next_r_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                next_r <= ap_const_lv32_0;
            else
                if (((icmp_ln38_fu_220_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    next_r <= add_ln58_fu_226_p2;
                end if; 
            end if;
        end if;
    end process;


    wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                wr <= ap_const_lv9_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    wr <= add_ln60_fu_1450_p2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                count_load_reg_1574 <= count;
                icmp_ln38_reg_1580 <= icmp_ln38_fu_220_p2;
                wr_load_reg_1568 <= wr;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln38_fu_220_p2, grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((icmp_ln38_fu_220_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                elsif (((icmp_ln38_fu_220_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln55_10_fu_986_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5) + unsigned(ap_const_lv52_200000));
    add_ln55_11_fu_1056_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4) + unsigned(ap_const_lv52_200000));
    add_ln55_12_fu_1126_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3) + unsigned(ap_const_lv52_200000));
    add_ln55_13_fu_1196_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2) + unsigned(ap_const_lv52_200000));
    add_ln55_14_fu_1266_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1) + unsigned(ap_const_lv52_200000));
    add_ln55_15_fu_1336_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out) + unsigned(ap_const_lv52_200000));
    add_ln55_1_fu_356_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14) + unsigned(ap_const_lv52_200000));
    add_ln55_2_fu_426_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13) + unsigned(ap_const_lv52_200000));
    add_ln55_3_fu_496_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12) + unsigned(ap_const_lv52_200000));
    add_ln55_4_fu_566_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11) + unsigned(ap_const_lv52_200000));
    add_ln55_5_fu_636_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10) + unsigned(ap_const_lv52_200000));
    add_ln55_6_fu_706_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9) + unsigned(ap_const_lv52_200000));
    add_ln55_7_fu_776_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8) + unsigned(ap_const_lv52_200000));
    add_ln55_8_fu_846_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7) + unsigned(ap_const_lv52_200000));
    add_ln55_9_fu_916_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6) + unsigned(ap_const_lv52_200000));
    add_ln55_fu_286_p2 <= std_logic_vector(unsigned(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15) + unsigned(ap_const_lv52_200000));
    add_ln58_fu_226_p2 <= std_logic_vector(unsigned(count) + unsigned(ap_const_lv32_1));
    add_ln60_1_fu_1461_p2 <= std_logic_vector(unsigned(count_load_reg_1574) + unsigned(ap_const_lv32_1));
    add_ln60_fu_1450_p2 <= std_logic_vector(unsigned(wr_load_reg_1568) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done)
    begin
        if ((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start <= grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg;
    history_address1 <= zext_ln37_fu_207_p1(9 - 1 downto 0);

    history_ce0_assign_proc : process(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            history_ce0 <= grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0;
        else 
            history_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    history_ce1_local_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            history_ce1_local <= ap_const_logic_1;
        else 
            history_ce1_local <= ap_const_logic_0;
        end if; 
    end process;


    history_we1_local_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            history_we1_local <= ap_const_logic_1;
        else 
            history_we1_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln38_fu_220_p2 <= "1" when (count = next_r) else "0";
    icmp_ln55_10_fu_662_p2 <= "1" when (signed(tmp_6_fu_652_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_11_fu_668_p2 <= "1" when (signed(trunc_ln55_s_fu_642_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_12_fu_732_p2 <= "1" when (signed(tmp_7_fu_722_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_13_fu_738_p2 <= "1" when (signed(trunc_ln55_1_fu_712_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_14_fu_802_p2 <= "1" when (signed(tmp_8_fu_792_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_15_fu_808_p2 <= "1" when (signed(trunc_ln55_3_fu_782_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_16_fu_872_p2 <= "1" when (signed(tmp_9_fu_862_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_17_fu_878_p2 <= "1" when (signed(trunc_ln55_5_fu_852_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_18_fu_942_p2 <= "1" when (signed(tmp_10_fu_932_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_19_fu_948_p2 <= "1" when (signed(trunc_ln55_7_fu_922_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_1_fu_318_p2 <= "1" when (signed(trunc_ln_fu_292_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_20_fu_1012_p2 <= "1" when (signed(tmp_11_fu_1002_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_21_fu_1018_p2 <= "1" when (signed(trunc_ln55_9_fu_992_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_22_fu_1082_p2 <= "1" when (signed(tmp_12_fu_1072_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_23_fu_1088_p2 <= "1" when (signed(trunc_ln55_10_fu_1062_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_24_fu_1152_p2 <= "1" when (signed(tmp_13_fu_1142_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_25_fu_1158_p2 <= "1" when (signed(trunc_ln55_11_fu_1132_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_26_fu_1222_p2 <= "1" when (signed(tmp_14_fu_1212_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_27_fu_1228_p2 <= "1" when (signed(trunc_ln55_12_fu_1202_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_28_fu_1292_p2 <= "1" when (signed(tmp_15_fu_1282_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_29_fu_1298_p2 <= "1" when (signed(trunc_ln55_13_fu_1272_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_2_fu_382_p2 <= "1" when (signed(tmp_2_fu_372_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_30_fu_1362_p2 <= "1" when (signed(tmp_16_fu_1352_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_31_fu_1368_p2 <= "1" when (signed(trunc_ln55_14_fu_1342_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_3_fu_388_p2 <= "1" when (signed(trunc_ln55_2_fu_362_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_4_fu_452_p2 <= "1" when (signed(tmp_3_fu_442_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_5_fu_458_p2 <= "1" when (signed(trunc_ln55_4_fu_432_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_6_fu_522_p2 <= "1" when (signed(tmp_4_fu_512_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_7_fu_528_p2 <= "1" when (signed(trunc_ln55_6_fu_502_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_8_fu_592_p2 <= "1" when (signed(tmp_5_fu_582_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln55_9_fu_598_p2 <= "1" when (signed(trunc_ln55_8_fu_572_p4) < signed(ap_const_lv30_3F800000)) else "0";
    icmp_ln55_fu_312_p2 <= "1" when (signed(tmp_1_fu_302_p4) > signed(ap_const_lv7_0)) else "0";
    icmp_ln57_fu_1406_p2 <= "1" when (unsigned(count_load_reg_1574) > unsigned(ap_const_lv32_17D)) else "0";
    or_ln55_10_fu_1042_p2 <= (icmp_ln55_21_fu_1018_p2 or icmp_ln55_20_fu_1012_p2);
    or_ln55_11_fu_1112_p2 <= (icmp_ln55_23_fu_1088_p2 or icmp_ln55_22_fu_1082_p2);
    or_ln55_12_fu_1182_p2 <= (icmp_ln55_25_fu_1158_p2 or icmp_ln55_24_fu_1152_p2);
    or_ln55_13_fu_1252_p2 <= (icmp_ln55_27_fu_1228_p2 or icmp_ln55_26_fu_1222_p2);
    or_ln55_14_fu_1322_p2 <= (icmp_ln55_29_fu_1298_p2 or icmp_ln55_28_fu_1292_p2);
    or_ln55_15_fu_1392_p2 <= (icmp_ln55_31_fu_1368_p2 or icmp_ln55_30_fu_1362_p2);
    or_ln55_1_fu_412_p2 <= (icmp_ln55_3_fu_388_p2 or icmp_ln55_2_fu_382_p2);
    or_ln55_2_fu_482_p2 <= (icmp_ln55_5_fu_458_p2 or icmp_ln55_4_fu_452_p2);
    or_ln55_3_fu_552_p2 <= (icmp_ln55_7_fu_528_p2 or icmp_ln55_6_fu_522_p2);
    or_ln55_4_fu_622_p2 <= (icmp_ln55_9_fu_598_p2 or icmp_ln55_8_fu_592_p2);
    or_ln55_5_fu_692_p2 <= (icmp_ln55_11_fu_668_p2 or icmp_ln55_10_fu_662_p2);
    or_ln55_6_fu_762_p2 <= (icmp_ln55_13_fu_738_p2 or icmp_ln55_12_fu_732_p2);
    or_ln55_7_fu_832_p2 <= (icmp_ln55_15_fu_808_p2 or icmp_ln55_14_fu_802_p2);
    or_ln55_8_fu_902_p2 <= (icmp_ln55_17_fu_878_p2 or icmp_ln55_16_fu_872_p2);
    or_ln55_9_fu_972_p2 <= (icmp_ln55_19_fu_948_p2 or icmp_ln55_18_fu_942_p2);
    or_ln55_fu_342_p2 <= (icmp_ln55_fu_312_p2 or icmp_ln55_1_fu_318_p2);

    result_assign_proc : process(ap_start, ap_CS_fsm_state1, icmp_ln38_reg_1580, ap_CS_fsm_state4, tmp_fu_1411_p18)
    begin
        if (((icmp_ln38_reg_1580 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            result <= tmp_fu_1411_p18;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            result <= ap_const_lv385_lc_1;
        else 
            result <= ap_const_lv385_lc_1;
        end if; 
    end process;

    s_10_fu_674_p4 <= add_ln55_5_fu_636_p2(45 downto 22);
    s_11_fu_698_p3 <= 
        select_ln55_10_fu_684_p3 when (or_ln55_5_fu_692_p2(0) = '1') else 
        s_10_fu_674_p4;
    s_12_fu_744_p4 <= add_ln55_6_fu_706_p2(45 downto 22);
    s_13_fu_768_p3 <= 
        select_ln55_12_fu_754_p3 when (or_ln55_6_fu_762_p2(0) = '1') else 
        s_12_fu_744_p4;
    s_14_fu_814_p4 <= add_ln55_7_fu_776_p2(45 downto 22);
    s_15_fu_838_p3 <= 
        select_ln55_14_fu_824_p3 when (or_ln55_7_fu_832_p2(0) = '1') else 
        s_14_fu_814_p4;
    s_16_fu_884_p4 <= add_ln55_8_fu_846_p2(45 downto 22);
    s_17_fu_908_p3 <= 
        select_ln55_16_fu_894_p3 when (or_ln55_8_fu_902_p2(0) = '1') else 
        s_16_fu_884_p4;
    s_18_fu_954_p4 <= add_ln55_9_fu_916_p2(45 downto 22);
    s_19_fu_978_p3 <= 
        select_ln55_18_fu_964_p3 when (or_ln55_9_fu_972_p2(0) = '1') else 
        s_18_fu_954_p4;
    s_1_fu_348_p3 <= 
        select_ln55_fu_334_p3 when (or_ln55_fu_342_p2(0) = '1') else 
        s_fu_324_p4;
    s_20_fu_1024_p4 <= add_ln55_10_fu_986_p2(45 downto 22);
    s_21_fu_1048_p3 <= 
        select_ln55_20_fu_1034_p3 when (or_ln55_10_fu_1042_p2(0) = '1') else 
        s_20_fu_1024_p4;
    s_22_fu_1094_p4 <= add_ln55_11_fu_1056_p2(45 downto 22);
    s_23_fu_1118_p3 <= 
        select_ln55_22_fu_1104_p3 when (or_ln55_11_fu_1112_p2(0) = '1') else 
        s_22_fu_1094_p4;
    s_24_fu_1164_p4 <= add_ln55_12_fu_1126_p2(45 downto 22);
    s_25_fu_1188_p3 <= 
        select_ln55_24_fu_1174_p3 when (or_ln55_12_fu_1182_p2(0) = '1') else 
        s_24_fu_1164_p4;
    s_26_fu_1234_p4 <= add_ln55_13_fu_1196_p2(45 downto 22);
    s_27_fu_1258_p3 <= 
        select_ln55_26_fu_1244_p3 when (or_ln55_13_fu_1252_p2(0) = '1') else 
        s_26_fu_1234_p4;
    s_28_fu_1304_p4 <= add_ln55_14_fu_1266_p2(45 downto 22);
    s_29_fu_1328_p3 <= 
        select_ln55_28_fu_1314_p3 when (or_ln55_14_fu_1322_p2(0) = '1') else 
        s_28_fu_1304_p4;
    s_2_fu_394_p4 <= add_ln55_1_fu_356_p2(45 downto 22);
    s_30_fu_1374_p4 <= add_ln55_15_fu_1336_p2(45 downto 22);
    s_31_fu_1398_p3 <= 
        select_ln55_30_fu_1384_p3 when (or_ln55_15_fu_1392_p2(0) = '1') else 
        s_30_fu_1374_p4;
    s_3_fu_418_p3 <= 
        select_ln55_2_fu_404_p3 when (or_ln55_1_fu_412_p2(0) = '1') else 
        s_2_fu_394_p4;
    s_4_fu_464_p4 <= add_ln55_2_fu_426_p2(45 downto 22);
    s_5_fu_488_p3 <= 
        select_ln55_4_fu_474_p3 when (or_ln55_2_fu_482_p2(0) = '1') else 
        s_4_fu_464_p4;
    s_6_fu_534_p4 <= add_ln55_3_fu_496_p2(45 downto 22);
    s_7_fu_558_p3 <= 
        select_ln55_6_fu_544_p3 when (or_ln55_3_fu_552_p2(0) = '1') else 
        s_6_fu_534_p4;
    s_8_fu_604_p4 <= add_ln55_4_fu_566_p2(45 downto 22);
    s_9_fu_628_p3 <= 
        select_ln55_8_fu_614_p3 when (or_ln55_4_fu_622_p2(0) = '1') else 
        s_8_fu_604_p4;
    s_fu_324_p4 <= add_ln55_fu_286_p2(45 downto 22);
    select_ln55_10_fu_684_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_10_fu_662_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_12_fu_754_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_12_fu_732_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_14_fu_824_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_14_fu_802_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_16_fu_894_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_16_fu_872_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_18_fu_964_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_18_fu_942_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_20_fu_1034_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_20_fu_1012_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_22_fu_1104_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_22_fu_1082_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_24_fu_1174_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_24_fu_1152_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_26_fu_1244_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_26_fu_1222_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_28_fu_1314_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_28_fu_1292_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_2_fu_404_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_2_fu_382_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_30_fu_1384_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_30_fu_1362_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_4_fu_474_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_4_fu_452_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_6_fu_544_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_6_fu_522_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_8_fu_614_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_8_fu_592_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_fu_334_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_fu_312_p2(0) = '1') else 
        ap_const_lv24_800000;
    tmp_10_fu_932_p4 <= add_ln55_9_fu_916_p2(51 downto 45);
    tmp_11_fu_1002_p4 <= add_ln55_10_fu_986_p2(51 downto 45);
    tmp_12_fu_1072_p4 <= add_ln55_11_fu_1056_p2(51 downto 45);
    tmp_13_fu_1142_p4 <= add_ln55_12_fu_1126_p2(51 downto 45);
    tmp_14_fu_1212_p4 <= add_ln55_13_fu_1196_p2(51 downto 45);
    tmp_15_fu_1282_p4 <= add_ln55_14_fu_1266_p2(51 downto 45);
    tmp_16_fu_1352_p4 <= add_ln55_15_fu_1336_p2(51 downto 45);
    tmp_1_fu_302_p4 <= add_ln55_fu_286_p2(51 downto 45);
    tmp_2_fu_372_p4 <= add_ln55_1_fu_356_p2(51 downto 45);
    tmp_3_fu_442_p4 <= add_ln55_2_fu_426_p2(51 downto 45);
    tmp_4_fu_512_p4 <= add_ln55_3_fu_496_p2(51 downto 45);
    tmp_5_fu_582_p4 <= add_ln55_4_fu_566_p2(51 downto 45);
    tmp_6_fu_652_p4 <= add_ln55_5_fu_636_p2(51 downto 45);
    tmp_7_fu_722_p4 <= add_ln55_6_fu_706_p2(51 downto 45);
    tmp_8_fu_792_p4 <= add_ln55_7_fu_776_p2(51 downto 45);
    tmp_9_fu_862_p4 <= add_ln55_8_fu_846_p2(51 downto 45);
    tmp_fu_1411_p18 <= ((((((((((((((((icmp_ln57_fu_1406_p2 & s_31_fu_1398_p3) & s_29_fu_1328_p3) & s_27_fu_1258_p3) & s_25_fu_1188_p3) & s_23_fu_1118_p3) & s_21_fu_1048_p3) & s_19_fu_978_p3) & s_17_fu_908_p3) & s_15_fu_838_p3) & s_13_fu_768_p3) & s_11_fu_698_p3) & s_9_fu_628_p3) & s_7_fu_558_p3) & s_5_fu_488_p3) & s_3_fu_418_p3) & s_1_fu_348_p3);
    trunc_ln55_10_fu_1062_p4 <= add_ln55_11_fu_1056_p2(51 downto 22);
    trunc_ln55_11_fu_1132_p4 <= add_ln55_12_fu_1126_p2(51 downto 22);
    trunc_ln55_12_fu_1202_p4 <= add_ln55_13_fu_1196_p2(51 downto 22);
    trunc_ln55_13_fu_1272_p4 <= add_ln55_14_fu_1266_p2(51 downto 22);
    trunc_ln55_14_fu_1342_p4 <= add_ln55_15_fu_1336_p2(51 downto 22);
    trunc_ln55_1_fu_712_p4 <= add_ln55_6_fu_706_p2(51 downto 22);
    trunc_ln55_2_fu_362_p4 <= add_ln55_1_fu_356_p2(51 downto 22);
    trunc_ln55_3_fu_782_p4 <= add_ln55_7_fu_776_p2(51 downto 22);
    trunc_ln55_4_fu_432_p4 <= add_ln55_2_fu_426_p2(51 downto 22);
    trunc_ln55_5_fu_852_p4 <= add_ln55_8_fu_846_p2(51 downto 22);
    trunc_ln55_6_fu_502_p4 <= add_ln55_3_fu_496_p2(51 downto 22);
    trunc_ln55_7_fu_922_p4 <= add_ln55_9_fu_916_p2(51 downto 22);
    trunc_ln55_8_fu_572_p4 <= add_ln55_4_fu_566_p2(51 downto 22);
    trunc_ln55_9_fu_992_p4 <= add_ln55_10_fu_986_p2(51 downto 22);
    trunc_ln55_s_fu_642_p4 <= add_ln55_5_fu_636_p2(51 downto 22);
    trunc_ln_fu_292_p4 <= add_ln55_fu_286_p2(51 downto 22);
    zext_ln37_fu_207_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(wr),64));
end behav;
