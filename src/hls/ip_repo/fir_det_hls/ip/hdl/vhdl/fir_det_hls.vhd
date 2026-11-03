                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_det_hls is
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


architecture behav of fir_det_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fir_det_hls_fir_det_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.265500,HLS_SYN_LAT=212,HLS_SYN_TPT=none,HLS_SYN_MEM=9,HLS_SYN_DSP=0,HLS_SYN_FF=1416,HLS_SYN_LUT=2488,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (8 downto 0) := "000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (8 downto 0) := "000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (8 downto 0) := "000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (8 downto 0) := "000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (8 downto 0) := "000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (8 downto 0) := "001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (8 downto 0) := "010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv385_lc_1 : STD_LOGIC_VECTOR (384 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv11_34 : STD_LOGIC_VECTOR (10 downto 0) := "00000110100";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv5_5 : STD_LOGIC_VECTOR (4 downto 0) := "00101";
    constant ap_const_lv53_200000 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000001000000000000000000000";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_2D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101101";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv31_7F800000 : STD_LOGIC_VECTOR (30 downto 0) := "1111111100000000000000000000000";
    constant ap_const_lv24_7FFFFF : STD_LOGIC_VECTOR (23 downto 0) := "011111111111111111111111";
    constant ap_const_lv24_800000 : STD_LOGIC_VECTOR (23 downto 0) := "100000000000000000000000";
    constant ap_const_lv32_198 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000110011000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal wr : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal history_ce0 : STD_LOGIC;
    signal history_q0 : STD_LOGIC_VECTOR (191 downto 0);
    signal history_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal next_r : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal phase : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal wr_load_reg_969 : STD_LOGIC_VECTOR (8 downto 0);
    signal count_load_reg_975 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln38_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln38_reg_981 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln58_2_cast_fu_217_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_idle : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7 : STD_LOGIC_VECTOR (52 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7_ap_vld : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0 : STD_LOGIC;
    signal grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln37_fu_190_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln60_fu_899_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal add_ln60_1_fu_910_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln58_fu_249_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln58_fu_889_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal result_preg : STD_LOGIC_VECTOR (384 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal tmp_8_fu_880_p3 : STD_LOGIC_VECTOR (384 downto 0);
    signal history_we1_local : STD_LOGIC;
    signal trunc_ln67_fu_181_p1 : STD_LOGIC_VECTOR (191 downto 0);
    signal history_ce1_local : STD_LOGIC;
    signal zext_ln58_fu_213_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal mul_ln58_fu_229_p0 : STD_LOGIC_VECTOR (4 downto 0);
    signal mul_ln58_fu_229_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal mul_ln58_fu_229_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal tmp_10_fu_235_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln58_1_fu_245_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_261_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln55_fu_291_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_1_fu_307_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln1_fu_297_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_fu_317_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_1_fu_323_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_fu_347_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_fu_339_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_fu_329_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_1_fu_361_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_2_fu_377_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_2_fu_367_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_2_fu_387_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_3_fu_393_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_1_fu_417_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_2_fu_409_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_2_fu_399_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_2_fu_431_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_3_fu_447_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_4_fu_437_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_4_fu_457_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_5_fu_463_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_2_fu_487_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_4_fu_479_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_4_fu_469_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_3_fu_501_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_4_fu_517_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_6_fu_507_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_6_fu_527_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_7_fu_533_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_3_fu_557_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_6_fu_549_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_6_fu_539_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_4_fu_571_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_5_fu_587_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_8_fu_577_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_8_fu_597_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_9_fu_603_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_4_fu_627_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_8_fu_619_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_8_fu_609_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_5_fu_641_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_6_fu_657_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_s_fu_647_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_10_fu_667_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_11_fu_673_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_5_fu_697_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_10_fu_689_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_10_fu_679_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_6_fu_711_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_7_fu_727_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_1_fu_717_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_12_fu_737_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_13_fu_743_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_6_fu_767_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_12_fu_759_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_12_fu_749_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal add_ln55_7_fu_781_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tmp_9_fu_797_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln55_3_fu_787_p4 : STD_LOGIC_VECTOR (30 downto 0);
    signal icmp_ln55_14_fu_807_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln55_15_fu_813_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln55_7_fu_837_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_14_fu_829_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_14_fu_819_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_15_fu_843_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_13_fu_773_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_11_fu_703_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_9_fu_633_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_7_fu_563_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_5_fu_493_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_3_fu_423_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal s_1_fu_353_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal tmp_fu_851_p9 : STD_LOGIC_VECTOR (191 downto 0);
    signal icmp_ln57_fu_871_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln57_fu_876_p1 : STD_LOGIC_VECTOR (383 downto 0);
    signal grp_fu_261_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_fu_261_ap_start : STD_LOGIC;
    signal grp_fu_261_ap_done : STD_LOGIC;
    signal grp_fu_261_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal mul_ln58_fu_229_p00 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        wr_load : IN STD_LOGIC_VECTOR (8 downto 0);
        zext_ln45 : IN STD_LOGIC_VECTOR (2 downto 0);
        p_out : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out_ap_vld : OUT STD_LOGIC;
        p_out1 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out1_ap_vld : OUT STD_LOGIC;
        p_out2 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out2_ap_vld : OUT STD_LOGIC;
        p_out3 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out3_ap_vld : OUT STD_LOGIC;
        p_out4 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out4_ap_vld : OUT STD_LOGIC;
        p_out5 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out5_ap_vld : OUT STD_LOGIC;
        p_out6 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out6_ap_vld : OUT STD_LOGIC;
        p_out7 : OUT STD_LOGIC_VECTOR (52 downto 0);
        p_out7_ap_vld : OUT STD_LOGIC;
        history_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        history_ce0 : OUT STD_LOGIC;
        history_q0 : IN STD_LOGIC_VECTOR (191 downto 0) );
    end component;


    component fir_det_hls_mul_5ns_7ns_11_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (4 downto 0);
        din1 : IN STD_LOGIC_VECTOR (6 downto 0);
        dout : OUT STD_LOGIC_VECTOR (10 downto 0) );
    end component;


    component fir_det_hls_urem_5ns_4ns_3_9_seq_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        done : OUT STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (4 downto 0);
        din1 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (2 downto 0) );
    end component;


    component fir_det_hls_history_RAM_S2P_BRAM_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (191 downto 0);
        address1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce1 : IN STD_LOGIC;
        we1 : IN STD_LOGIC;
        d1 : IN STD_LOGIC_VECTOR (191 downto 0) );
    end component;



begin
    history_U : component fir_det_hls_history_RAM_S2P_BRAM_1R1W
    generic map (
        DataWidth => 192,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0,
        ce0 => history_ce0,
        q0 => history_q0,
        address1 => history_address1,
        ce1 => history_ce1_local,
        we1 => history_we1_local,
        d1 => trunc_ln67_fu_181_p1);

    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163 : component fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start,
        ap_done => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done,
        ap_idle => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_idle,
        ap_ready => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready,
        wr_load => wr_load_reg_969,
        zext_ln45 => phase,
        p_out => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out,
        p_out_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out_ap_vld,
        p_out1 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1,
        p_out1_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1_ap_vld,
        p_out2 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2,
        p_out2_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2_ap_vld,
        p_out3 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3,
        p_out3_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3_ap_vld,
        p_out4 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4,
        p_out4_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4_ap_vld,
        p_out5 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5,
        p_out5_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5_ap_vld,
        p_out6 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6,
        p_out6_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6_ap_vld,
        p_out7 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7,
        p_out7_ap_vld => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7_ap_vld,
        history_address0 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0,
        history_ce0 => grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0,
        history_q0 => history_q0);

    mul_5ns_7ns_11_1_1_U22 : component fir_det_hls_mul_5ns_7ns_11_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 5,
        din1_WIDTH => 7,
        dout_WIDTH => 11)
    port map (
        din0 => mul_ln58_fu_229_p0,
        din1 => mul_ln58_fu_229_p1,
        dout => mul_ln58_fu_229_p2);

    urem_5ns_4ns_3_9_seq_1_U23 : component fir_det_hls_urem_5ns_4ns_3_9_seq_1
    generic map (
        ID => 1,
        NUM_STAGE => 9,
        din0_WIDTH => 5,
        din1_WIDTH => 4,
        dout_WIDTH => 3)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        start => grp_fu_261_ap_start,
        done => grp_fu_261_ap_done,
        din0 => zext_ln58_2_cast_fu_217_p3,
        din1 => grp_fu_261_p1,
        ce => grp_fu_261_ce,
        dout => grp_fu_261_p2);





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
                if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                    count <= add_ln60_1_fu_910_p2;
                end if; 
            end if;
        end if;
    end process;


    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready = ap_const_logic_1)) then 
                    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= ap_const_logic_0;
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
                if (((icmp_ln38_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    next_r <= add_ln58_fu_249_p2;
                end if; 
            end if;
        end if;
    end process;


    phase_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                phase <= ap_const_lv3_0;
            else
                if (((icmp_ln38_reg_981 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
                    phase <= trunc_ln58_fu_889_p1;
                end if; 
            end if;
        end if;
    end process;


    result_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                result_preg(0) <= '0';
                result_preg(1) <= '0';
                result_preg(2) <= '0';
                result_preg(3) <= '0';
                result_preg(4) <= '0';
                result_preg(5) <= '0';
                result_preg(6) <= '0';
                result_preg(7) <= '0';
                result_preg(8) <= '0';
                result_preg(9) <= '0';
                result_preg(10) <= '0';
                result_preg(11) <= '0';
                result_preg(12) <= '0';
                result_preg(13) <= '0';
                result_preg(14) <= '0';
                result_preg(15) <= '0';
                result_preg(16) <= '0';
                result_preg(17) <= '0';
                result_preg(18) <= '0';
                result_preg(19) <= '0';
                result_preg(20) <= '0';
                result_preg(21) <= '0';
                result_preg(22) <= '0';
                result_preg(23) <= '0';
                result_preg(24) <= '0';
                result_preg(25) <= '0';
                result_preg(26) <= '0';
                result_preg(27) <= '0';
                result_preg(28) <= '0';
                result_preg(29) <= '0';
                result_preg(30) <= '0';
                result_preg(31) <= '0';
                result_preg(32) <= '0';
                result_preg(33) <= '0';
                result_preg(34) <= '0';
                result_preg(35) <= '0';
                result_preg(36) <= '0';
                result_preg(37) <= '0';
                result_preg(38) <= '0';
                result_preg(39) <= '0';
                result_preg(40) <= '0';
                result_preg(41) <= '0';
                result_preg(42) <= '0';
                result_preg(43) <= '0';
                result_preg(44) <= '0';
                result_preg(45) <= '0';
                result_preg(46) <= '0';
                result_preg(47) <= '0';
                result_preg(48) <= '0';
                result_preg(49) <= '0';
                result_preg(50) <= '0';
                result_preg(51) <= '0';
                result_preg(52) <= '0';
                result_preg(53) <= '0';
                result_preg(54) <= '0';
                result_preg(55) <= '0';
                result_preg(56) <= '0';
                result_preg(57) <= '0';
                result_preg(58) <= '0';
                result_preg(59) <= '0';
                result_preg(60) <= '0';
                result_preg(61) <= '0';
                result_preg(62) <= '0';
                result_preg(63) <= '0';
                result_preg(64) <= '0';
                result_preg(65) <= '0';
                result_preg(66) <= '0';
                result_preg(67) <= '0';
                result_preg(68) <= '0';
                result_preg(69) <= '0';
                result_preg(70) <= '0';
                result_preg(71) <= '0';
                result_preg(72) <= '0';
                result_preg(73) <= '0';
                result_preg(74) <= '0';
                result_preg(75) <= '0';
                result_preg(76) <= '0';
                result_preg(77) <= '0';
                result_preg(78) <= '0';
                result_preg(79) <= '0';
                result_preg(80) <= '0';
                result_preg(81) <= '0';
                result_preg(82) <= '0';
                result_preg(83) <= '0';
                result_preg(84) <= '0';
                result_preg(85) <= '0';
                result_preg(86) <= '0';
                result_preg(87) <= '0';
                result_preg(88) <= '0';
                result_preg(89) <= '0';
                result_preg(90) <= '0';
                result_preg(91) <= '0';
                result_preg(92) <= '0';
                result_preg(93) <= '0';
                result_preg(94) <= '0';
                result_preg(95) <= '0';
                result_preg(96) <= '0';
                result_preg(97) <= '0';
                result_preg(98) <= '0';
                result_preg(99) <= '0';
                result_preg(100) <= '0';
                result_preg(101) <= '0';
                result_preg(102) <= '0';
                result_preg(103) <= '0';
                result_preg(104) <= '0';
                result_preg(105) <= '0';
                result_preg(106) <= '0';
                result_preg(107) <= '0';
                result_preg(108) <= '0';
                result_preg(109) <= '0';
                result_preg(110) <= '0';
                result_preg(111) <= '0';
                result_preg(112) <= '0';
                result_preg(113) <= '0';
                result_preg(114) <= '0';
                result_preg(115) <= '0';
                result_preg(116) <= '0';
                result_preg(117) <= '0';
                result_preg(118) <= '0';
                result_preg(119) <= '0';
                result_preg(120) <= '0';
                result_preg(121) <= '0';
                result_preg(122) <= '0';
                result_preg(123) <= '0';
                result_preg(124) <= '0';
                result_preg(125) <= '0';
                result_preg(126) <= '0';
                result_preg(127) <= '0';
                result_preg(128) <= '0';
                result_preg(129) <= '0';
                result_preg(130) <= '0';
                result_preg(131) <= '0';
                result_preg(132) <= '0';
                result_preg(133) <= '0';
                result_preg(134) <= '0';
                result_preg(135) <= '0';
                result_preg(136) <= '0';
                result_preg(137) <= '0';
                result_preg(138) <= '0';
                result_preg(139) <= '0';
                result_preg(140) <= '0';
                result_preg(141) <= '0';
                result_preg(142) <= '0';
                result_preg(143) <= '0';
                result_preg(144) <= '0';
                result_preg(145) <= '0';
                result_preg(146) <= '0';
                result_preg(147) <= '0';
                result_preg(148) <= '0';
                result_preg(149) <= '0';
                result_preg(150) <= '0';
                result_preg(151) <= '0';
                result_preg(152) <= '0';
                result_preg(153) <= '0';
                result_preg(154) <= '0';
                result_preg(155) <= '0';
                result_preg(156) <= '0';
                result_preg(157) <= '0';
                result_preg(158) <= '0';
                result_preg(159) <= '0';
                result_preg(160) <= '0';
                result_preg(161) <= '0';
                result_preg(162) <= '0';
                result_preg(163) <= '0';
                result_preg(164) <= '0';
                result_preg(165) <= '0';
                result_preg(166) <= '0';
                result_preg(167) <= '0';
                result_preg(168) <= '0';
                result_preg(169) <= '0';
                result_preg(170) <= '0';
                result_preg(171) <= '0';
                result_preg(172) <= '0';
                result_preg(173) <= '0';
                result_preg(174) <= '0';
                result_preg(175) <= '0';
                result_preg(176) <= '0';
                result_preg(177) <= '0';
                result_preg(178) <= '0';
                result_preg(179) <= '0';
                result_preg(180) <= '0';
                result_preg(181) <= '0';
                result_preg(182) <= '0';
                result_preg(183) <= '0';
                result_preg(184) <= '0';
                result_preg(185) <= '0';
                result_preg(186) <= '0';
                result_preg(187) <= '0';
                result_preg(188) <= '0';
                result_preg(189) <= '0';
                result_preg(190) <= '0';
                result_preg(191) <= '0';
                result_preg(384) <= '0';
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                                        result_preg(191 downto 0) <= tmp_8_fu_880_p3(191 downto 0);                    result_preg(384) <= tmp_8_fu_880_p3(384);
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    result_preg(0) <= '0';
                    result_preg(1) <= '0';
                    result_preg(2) <= '0';
                    result_preg(3) <= '0';
                    result_preg(4) <= '0';
                    result_preg(5) <= '0';
                    result_preg(6) <= '0';
                    result_preg(7) <= '0';
                    result_preg(8) <= '0';
                    result_preg(9) <= '0';
                    result_preg(10) <= '0';
                    result_preg(11) <= '0';
                    result_preg(12) <= '0';
                    result_preg(13) <= '0';
                    result_preg(14) <= '0';
                    result_preg(15) <= '0';
                    result_preg(16) <= '0';
                    result_preg(17) <= '0';
                    result_preg(18) <= '0';
                    result_preg(19) <= '0';
                    result_preg(20) <= '0';
                    result_preg(21) <= '0';
                    result_preg(22) <= '0';
                    result_preg(23) <= '0';
                    result_preg(24) <= '0';
                    result_preg(25) <= '0';
                    result_preg(26) <= '0';
                    result_preg(27) <= '0';
                    result_preg(28) <= '0';
                    result_preg(29) <= '0';
                    result_preg(30) <= '0';
                    result_preg(31) <= '0';
                    result_preg(32) <= '0';
                    result_preg(33) <= '0';
                    result_preg(34) <= '0';
                    result_preg(35) <= '0';
                    result_preg(36) <= '0';
                    result_preg(37) <= '0';
                    result_preg(38) <= '0';
                    result_preg(39) <= '0';
                    result_preg(40) <= '0';
                    result_preg(41) <= '0';
                    result_preg(42) <= '0';
                    result_preg(43) <= '0';
                    result_preg(44) <= '0';
                    result_preg(45) <= '0';
                    result_preg(46) <= '0';
                    result_preg(47) <= '0';
                    result_preg(48) <= '0';
                    result_preg(49) <= '0';
                    result_preg(50) <= '0';
                    result_preg(51) <= '0';
                    result_preg(52) <= '0';
                    result_preg(53) <= '0';
                    result_preg(54) <= '0';
                    result_preg(55) <= '0';
                    result_preg(56) <= '0';
                    result_preg(57) <= '0';
                    result_preg(58) <= '0';
                    result_preg(59) <= '0';
                    result_preg(60) <= '0';
                    result_preg(61) <= '0';
                    result_preg(62) <= '0';
                    result_preg(63) <= '0';
                    result_preg(64) <= '0';
                    result_preg(65) <= '0';
                    result_preg(66) <= '0';
                    result_preg(67) <= '0';
                    result_preg(68) <= '0';
                    result_preg(69) <= '0';
                    result_preg(70) <= '0';
                    result_preg(71) <= '0';
                    result_preg(72) <= '0';
                    result_preg(73) <= '0';
                    result_preg(74) <= '0';
                    result_preg(75) <= '0';
                    result_preg(76) <= '0';
                    result_preg(77) <= '0';
                    result_preg(78) <= '0';
                    result_preg(79) <= '0';
                    result_preg(80) <= '0';
                    result_preg(81) <= '0';
                    result_preg(82) <= '0';
                    result_preg(83) <= '0';
                    result_preg(84) <= '0';
                    result_preg(85) <= '0';
                    result_preg(86) <= '0';
                    result_preg(87) <= '0';
                    result_preg(88) <= '0';
                    result_preg(89) <= '0';
                    result_preg(90) <= '0';
                    result_preg(91) <= '0';
                    result_preg(92) <= '0';
                    result_preg(93) <= '0';
                    result_preg(94) <= '0';
                    result_preg(95) <= '0';
                    result_preg(96) <= '0';
                    result_preg(97) <= '0';
                    result_preg(98) <= '0';
                    result_preg(99) <= '0';
                    result_preg(100) <= '0';
                    result_preg(101) <= '0';
                    result_preg(102) <= '0';
                    result_preg(103) <= '0';
                    result_preg(104) <= '0';
                    result_preg(105) <= '0';
                    result_preg(106) <= '0';
                    result_preg(107) <= '0';
                    result_preg(108) <= '0';
                    result_preg(109) <= '0';
                    result_preg(110) <= '0';
                    result_preg(111) <= '0';
                    result_preg(112) <= '0';
                    result_preg(113) <= '0';
                    result_preg(114) <= '0';
                    result_preg(115) <= '0';
                    result_preg(116) <= '0';
                    result_preg(117) <= '0';
                    result_preg(118) <= '0';
                    result_preg(119) <= '0';
                    result_preg(120) <= '0';
                    result_preg(121) <= '0';
                    result_preg(122) <= '0';
                    result_preg(123) <= '0';
                    result_preg(124) <= '0';
                    result_preg(125) <= '0';
                    result_preg(126) <= '0';
                    result_preg(127) <= '0';
                    result_preg(128) <= '0';
                    result_preg(129) <= '0';
                    result_preg(130) <= '0';
                    result_preg(131) <= '0';
                    result_preg(132) <= '0';
                    result_preg(133) <= '0';
                    result_preg(134) <= '0';
                    result_preg(135) <= '0';
                    result_preg(136) <= '0';
                    result_preg(137) <= '0';
                    result_preg(138) <= '0';
                    result_preg(139) <= '0';
                    result_preg(140) <= '0';
                    result_preg(141) <= '0';
                    result_preg(142) <= '0';
                    result_preg(143) <= '0';
                    result_preg(144) <= '0';
                    result_preg(145) <= '0';
                    result_preg(146) <= '0';
                    result_preg(147) <= '0';
                    result_preg(148) <= '0';
                    result_preg(149) <= '0';
                    result_preg(150) <= '0';
                    result_preg(151) <= '0';
                    result_preg(152) <= '0';
                    result_preg(153) <= '0';
                    result_preg(154) <= '0';
                    result_preg(155) <= '0';
                    result_preg(156) <= '0';
                    result_preg(157) <= '0';
                    result_preg(158) <= '0';
                    result_preg(159) <= '0';
                    result_preg(160) <= '0';
                    result_preg(161) <= '0';
                    result_preg(162) <= '0';
                    result_preg(163) <= '0';
                    result_preg(164) <= '0';
                    result_preg(165) <= '0';
                    result_preg(166) <= '0';
                    result_preg(167) <= '0';
                    result_preg(168) <= '0';
                    result_preg(169) <= '0';
                    result_preg(170) <= '0';
                    result_preg(171) <= '0';
                    result_preg(172) <= '0';
                    result_preg(173) <= '0';
                    result_preg(174) <= '0';
                    result_preg(175) <= '0';
                    result_preg(176) <= '0';
                    result_preg(177) <= '0';
                    result_preg(178) <= '0';
                    result_preg(179) <= '0';
                    result_preg(180) <= '0';
                    result_preg(181) <= '0';
                    result_preg(182) <= '0';
                    result_preg(183) <= '0';
                    result_preg(184) <= '0';
                    result_preg(185) <= '0';
                    result_preg(186) <= '0';
                    result_preg(187) <= '0';
                    result_preg(188) <= '0';
                    result_preg(189) <= '0';
                    result_preg(190) <= '0';
                    result_preg(191) <= '0';
                    result_preg(384) <= '0';
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
                if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                    wr <= add_ln60_fu_899_p2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                count_load_reg_975 <= count;
                icmp_ln38_reg_981 <= icmp_ln38_fu_203_p2;
                wr_load_reg_969 <= wr;
            end if;
        end if;
    end process;
    result_preg(383 downto 192) <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln38_fu_203_p2, grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((icmp_ln38_fu_203_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                elsif (((icmp_ln38_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXX";
        end case;
    end process;
    add_ln55_1_fu_361_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6) + unsigned(ap_const_lv53_200000));
    add_ln55_2_fu_431_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5) + unsigned(ap_const_lv53_200000));
    add_ln55_3_fu_501_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4) + unsigned(ap_const_lv53_200000));
    add_ln55_4_fu_571_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3) + unsigned(ap_const_lv53_200000));
    add_ln55_5_fu_641_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2) + unsigned(ap_const_lv53_200000));
    add_ln55_6_fu_711_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1) + unsigned(ap_const_lv53_200000));
    add_ln55_7_fu_781_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out) + unsigned(ap_const_lv53_200000));
    add_ln55_fu_291_p2 <= std_logic_vector(unsigned(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7) + unsigned(ap_const_lv53_200000));
    add_ln58_fu_249_p2 <= std_logic_vector(unsigned(count) + unsigned(zext_ln58_1_fu_245_p1));
    add_ln60_1_fu_910_p2 <= std_logic_vector(unsigned(count_load_reg_975) + unsigned(ap_const_lv32_1));
    add_ln60_fu_899_p2 <= std_logic_vector(unsigned(wr_load_reg_969) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done)
    begin
        if ((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start <= grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg;

    grp_fu_261_ap_start_assign_proc : process(ap_start, ap_CS_fsm_state1, icmp_ln38_fu_203_p2)
    begin
        if (((icmp_ln38_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            grp_fu_261_ap_start <= ap_const_logic_1;
        else 
            grp_fu_261_ap_start <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_261_ce <= ap_const_logic_1;
    grp_fu_261_p1 <= ap_const_lv5_5(4 - 1 downto 0);
    history_address1 <= zext_ln37_fu_190_p1(9 - 1 downto 0);

    history_ce0_assign_proc : process(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            history_ce0 <= grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0;
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

    icmp_ln38_fu_203_p2 <= "1" when (count = next_r) else "0";
    icmp_ln55_10_fu_667_p2 <= "1" when (signed(tmp_6_fu_657_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_11_fu_673_p2 <= "1" when (signed(trunc_ln55_s_fu_647_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_12_fu_737_p2 <= "1" when (signed(tmp_7_fu_727_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_13_fu_743_p2 <= "1" when (signed(trunc_ln55_1_fu_717_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_14_fu_807_p2 <= "1" when (signed(tmp_9_fu_797_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_15_fu_813_p2 <= "1" when (signed(trunc_ln55_3_fu_787_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_1_fu_323_p2 <= "1" when (signed(trunc_ln1_fu_297_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_2_fu_387_p2 <= "1" when (signed(tmp_2_fu_377_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_3_fu_393_p2 <= "1" when (signed(trunc_ln55_2_fu_367_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_4_fu_457_p2 <= "1" when (signed(tmp_3_fu_447_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_5_fu_463_p2 <= "1" when (signed(trunc_ln55_4_fu_437_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_6_fu_527_p2 <= "1" when (signed(tmp_4_fu_517_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_7_fu_533_p2 <= "1" when (signed(trunc_ln55_6_fu_507_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_8_fu_597_p2 <= "1" when (signed(tmp_5_fu_587_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln55_9_fu_603_p2 <= "1" when (signed(trunc_ln55_8_fu_577_p4) < signed(ap_const_lv31_7F800000)) else "0";
    icmp_ln55_fu_317_p2 <= "1" when (signed(tmp_1_fu_307_p4) > signed(ap_const_lv8_0)) else "0";
    icmp_ln57_fu_871_p2 <= "1" when (unsigned(count_load_reg_975) > unsigned(ap_const_lv32_198)) else "0";
    mul_ln58_fu_229_p0 <= mul_ln58_fu_229_p00(5 - 1 downto 0);
    mul_ln58_fu_229_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln58_2_cast_fu_217_p3),11));
    mul_ln58_fu_229_p1 <= ap_const_lv11_34(7 - 1 downto 0);
    or_ln55_1_fu_417_p2 <= (icmp_ln55_3_fu_393_p2 or icmp_ln55_2_fu_387_p2);
    or_ln55_2_fu_487_p2 <= (icmp_ln55_5_fu_463_p2 or icmp_ln55_4_fu_457_p2);
    or_ln55_3_fu_557_p2 <= (icmp_ln55_7_fu_533_p2 or icmp_ln55_6_fu_527_p2);
    or_ln55_4_fu_627_p2 <= (icmp_ln55_9_fu_603_p2 or icmp_ln55_8_fu_597_p2);
    or_ln55_5_fu_697_p2 <= (icmp_ln55_11_fu_673_p2 or icmp_ln55_10_fu_667_p2);
    or_ln55_6_fu_767_p2 <= (icmp_ln55_13_fu_743_p2 or icmp_ln55_12_fu_737_p2);
    or_ln55_7_fu_837_p2 <= (icmp_ln55_15_fu_813_p2 or icmp_ln55_14_fu_807_p2);
    or_ln55_fu_347_p2 <= (icmp_ln55_fu_317_p2 or icmp_ln55_1_fu_323_p2);

    result_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state4, result_preg, tmp_8_fu_880_p3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            result <= tmp_8_fu_880_p3;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            result <= ap_const_lv385_lc_1;
        else 
            result <= result_preg;
        end if; 
    end process;

    s_10_fu_679_p4 <= add_ln55_5_fu_641_p2(45 downto 22);
    s_11_fu_703_p3 <= 
        select_ln55_10_fu_689_p3 when (or_ln55_5_fu_697_p2(0) = '1') else 
        s_10_fu_679_p4;
    s_12_fu_749_p4 <= add_ln55_6_fu_711_p2(45 downto 22);
    s_13_fu_773_p3 <= 
        select_ln55_12_fu_759_p3 when (or_ln55_6_fu_767_p2(0) = '1') else 
        s_12_fu_749_p4;
    s_14_fu_819_p4 <= add_ln55_7_fu_781_p2(45 downto 22);
    s_15_fu_843_p3 <= 
        select_ln55_14_fu_829_p3 when (or_ln55_7_fu_837_p2(0) = '1') else 
        s_14_fu_819_p4;
    s_1_fu_353_p3 <= 
        select_ln55_fu_339_p3 when (or_ln55_fu_347_p2(0) = '1') else 
        s_fu_329_p4;
    s_2_fu_399_p4 <= add_ln55_1_fu_361_p2(45 downto 22);
    s_3_fu_423_p3 <= 
        select_ln55_2_fu_409_p3 when (or_ln55_1_fu_417_p2(0) = '1') else 
        s_2_fu_399_p4;
    s_4_fu_469_p4 <= add_ln55_2_fu_431_p2(45 downto 22);
    s_5_fu_493_p3 <= 
        select_ln55_4_fu_479_p3 when (or_ln55_2_fu_487_p2(0) = '1') else 
        s_4_fu_469_p4;
    s_6_fu_539_p4 <= add_ln55_3_fu_501_p2(45 downto 22);
    s_7_fu_563_p3 <= 
        select_ln55_6_fu_549_p3 when (or_ln55_3_fu_557_p2(0) = '1') else 
        s_6_fu_539_p4;
    s_8_fu_609_p4 <= add_ln55_4_fu_571_p2(45 downto 22);
    s_9_fu_633_p3 <= 
        select_ln55_8_fu_619_p3 when (or_ln55_4_fu_627_p2(0) = '1') else 
        s_8_fu_609_p4;
    s_fu_329_p4 <= add_ln55_fu_291_p2(45 downto 22);
    select_ln55_10_fu_689_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_10_fu_667_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_12_fu_759_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_12_fu_737_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_14_fu_829_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_14_fu_807_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_2_fu_409_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_2_fu_387_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_4_fu_479_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_4_fu_457_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_6_fu_549_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_6_fu_527_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_8_fu_619_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_8_fu_597_p2(0) = '1') else 
        ap_const_lv24_800000;
    select_ln55_fu_339_p3 <= 
        ap_const_lv24_7FFFFF when (icmp_ln55_fu_317_p2(0) = '1') else 
        ap_const_lv24_800000;
    tmp_10_fu_235_p4 <= mul_ln58_fu_229_p2(10 downto 8);
    tmp_1_fu_307_p4 <= add_ln55_fu_291_p2(52 downto 45);
    tmp_2_fu_377_p4 <= add_ln55_1_fu_361_p2(52 downto 45);
    tmp_3_fu_447_p4 <= add_ln55_2_fu_431_p2(52 downto 45);
    tmp_4_fu_517_p4 <= add_ln55_3_fu_501_p2(52 downto 45);
    tmp_5_fu_587_p4 <= add_ln55_4_fu_571_p2(52 downto 45);
    tmp_6_fu_657_p4 <= add_ln55_5_fu_641_p2(52 downto 45);
    tmp_7_fu_727_p4 <= add_ln55_6_fu_711_p2(52 downto 45);
    tmp_8_fu_880_p3 <= (icmp_ln57_fu_871_p2 & zext_ln57_fu_876_p1);
    tmp_9_fu_797_p4 <= add_ln55_7_fu_781_p2(52 downto 45);
    tmp_fu_851_p9 <= (((((((s_15_fu_843_p3 & s_13_fu_773_p3) & s_11_fu_703_p3) & s_9_fu_633_p3) & s_7_fu_563_p3) & s_5_fu_493_p3) & s_3_fu_423_p3) & s_1_fu_353_p3);
    trunc_ln1_fu_297_p4 <= add_ln55_fu_291_p2(52 downto 22);
    trunc_ln55_1_fu_717_p4 <= add_ln55_6_fu_711_p2(52 downto 22);
    trunc_ln55_2_fu_367_p4 <= add_ln55_1_fu_361_p2(52 downto 22);
    trunc_ln55_3_fu_787_p4 <= add_ln55_7_fu_781_p2(52 downto 22);
    trunc_ln55_4_fu_437_p4 <= add_ln55_2_fu_431_p2(52 downto 22);
    trunc_ln55_6_fu_507_p4 <= add_ln55_3_fu_501_p2(52 downto 22);
    trunc_ln55_8_fu_577_p4 <= add_ln55_4_fu_571_p2(52 downto 22);
    trunc_ln55_s_fu_647_p4 <= add_ln55_5_fu_641_p2(52 downto 22);
    trunc_ln58_fu_889_p1 <= grp_fu_261_p2(3 - 1 downto 0);
    trunc_ln67_fu_181_p1 <= samples(192 - 1 downto 0);
    zext_ln37_fu_190_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(wr),64));
    zext_ln57_fu_876_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_851_p9),384));
    zext_ln58_1_fu_245_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_10_fu_235_p4),32));
    zext_ln58_2_cast_fu_217_p3 <= (ap_const_lv1_1 & zext_ln58_fu_213_p1);
    zext_ln58_fu_213_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(phase),4));
end behav;
