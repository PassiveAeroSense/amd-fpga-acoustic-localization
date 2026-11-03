                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity power_db_hls_power_db is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    value_r : IN STD_LOGIC_VECTOR (63 downto 0);
    exponent : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (47 downto 0) );
end;


architecture behav of power_db_hls_power_db is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv48_FED400000000 : STD_LOGIC_VECTOR (47 downto 0) := "111111101101010000000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_B17218 : STD_LOGIC_VECTOR (31 downto 0) := "00000000101100010111001000011000";
    constant ap_const_lv64_B17217F8 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000010110001011100100001011111111000";
    constant ap_const_lv78_115F2CED4 : STD_LOGIC_VECTOR (77 downto 0) := "000000000000000000000000000000000000000000000100010101111100101100111011010100";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_FFFFFFE1 : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111100001";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv33_2B : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000101011";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv12_FFF : STD_LOGIC_VECTOR (11 downto 0) := "111111111111";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv24_B17218 : STD_LOGIC_VECTOR (23 downto 0) := "101100010111001000011000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_32 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110010";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_4D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001101";
    constant ap_const_lv48_0 : STD_LOGIC_VECTOR (47 downto 0) := "000000000000000000000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal r18_LN_LUT_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal r18_LN_LUT_q0 : STD_LOGIC_VECTOR (23 downto 0);
    signal r18_LN_LUT_address1 : STD_LOGIC_VECTOR (11 downto 0);
    signal r18_LN_LUT_q1 : STD_LOGIC_VECTOR (23 downto 0);
    signal icmp_ln44_fu_166_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln44_reg_526 : STD_LOGIC_VECTOR (0 downto 0);
    signal xx_1_fu_296_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal xx_1_reg_530 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal add_ln53_fu_312_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal add_ln53_reg_537 : STD_LOGIC_VECTOR (32 downto 0);
    signal frac_fu_369_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal frac_reg_545 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal icmp_ln50_fu_378_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln50_reg_555 : STD_LOGIC_VECTOR (0 downto 0);
    signal l0_reg_565 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal mul_ln52_fu_151_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln52_reg_570 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1_reg_575 : STD_LOGIC_VECTOR (31 downto 0);
    signal ln_fu_480_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ln_reg_580 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_idle : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out_ap_vld : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_idle : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready : STD_LOGIC;
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out_ap_vld : STD_LOGIC;
    signal ap_phi_mux_agg_result_0_phi_fu_127_p4 : STD_LOGIC_VECTOR (47 downto 0);
    signal agg_result_0_reg_123 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal zext_ln50_fu_373_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln50_2_fu_390_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal r18_LN_LUT_ce1_local : STD_LOGIC;
    signal r18_LN_LUT_ce0_local : STD_LOGIC;
    signal mul_ln51_fu_147_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln51_fu_147_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal mul_ln52_fu_151_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln52_fu_151_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal mul_ln53_fu_156_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal p_fu_161_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal icmp_ln46_fu_175_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln46_fu_181_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln46_fu_181_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln46_fu_187_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln46_fu_191_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln46_fu_200_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln46_fu_200_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln46_1_fu_214_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln46_fu_218_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln46_1_fu_227_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln46_2_fu_233_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln46_1_fu_237_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_fu_206_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln46_fu_175_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln46_fu_246_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln46_fu_252_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal lx_fu_266_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal lx_fu_266_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal lx_fu_266_p6 : STD_LOGIC_VECTOR (32 downto 0);
    signal lx_fu_266_p7 : STD_LOGIC_VECTOR (32 downto 0);
    signal lx_fu_266_p8 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_fu_266_p9 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln47_fu_286_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xx_fu_292_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln53_1_fu_308_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln53_1_fu_308_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal sext_ln53_fu_305_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln49_fu_321_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln49_1_fu_340_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_fu_327_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal lshr_ln49_fu_346_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln49_fu_335_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln49_fu_351_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal idx_fu_359_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln50_fu_384_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal l1_1_fu_399_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal zext_ln50_4_fu_406_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal zext_ln50_3_fu_395_p1 : STD_LOGIC_VECTOR (24 downto 0);
    signal sub_ln51_fu_410_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal sext_ln51_fu_416_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln51_fu_147_p2 : STD_LOGIC_VECTOR (50 downto 0);
    signal zext_ln50_1_fu_445_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln52_1_fu_448_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln53_fu_156_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal neglog_fu_453_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln_fu_468_p3 : STD_LOGIC_VECTOR (39 downto 0);
    signal add_ln53_1_fu_462_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln53_fu_476_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_fu_161_p2 : STD_LOGIC_VECTOR (77 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (47 downto 0) := "000000000000000000000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal mul_ln51_fu_147_p00 : STD_LOGIC_VECTOR (50 downto 0);
    signal mul_ln51_fu_147_p10 : STD_LOGIC_VECTOR (50 downto 0);
    signal lx_fu_266_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_fu_266_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_fu_266_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component power_db_hls_power_db_Pipeline_VITIS_LOOP_45_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        value_r : IN STD_LOGIC_VECTOR (63 downto 0);
        leading_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        leading_out_ap_vld : OUT STD_LOGIC );
    end component;


    component power_db_hls_power_db_Pipeline_VITIS_LOOP_48_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        xx_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        lead_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        lead_out_ap_vld : OUT STD_LOGIC );
    end component;


    component power_db_hls_mul_32ns_19ns_51_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (18 downto 0);
        dout : OUT STD_LOGIC_VECTOR (50 downto 0) );
    end component;


    component power_db_hls_mul_32s_25ns_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (24 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component power_db_hls_mul_33s_33ns_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (32 downto 0);
        din1 : IN STD_LOGIC_VECTOR (32 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component power_db_hls_mul_64s_34ns_78_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (33 downto 0);
        dout : OUT STD_LOGIC_VECTOR (77 downto 0) );
    end component;


    component power_db_hls_sparsemux_7_2_33_1_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (32 downto 0);
        din1 : IN STD_LOGIC_VECTOR (32 downto 0);
        din2 : IN STD_LOGIC_VECTOR (32 downto 0);
        def : IN STD_LOGIC_VECTOR (32 downto 0);
        sel : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (32 downto 0) );
    end component;


    component power_db_hls_power_db_r18_LN_LUT_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (23 downto 0);
        address1 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;



begin
    r18_LN_LUT_U : component power_db_hls_power_db_r18_LN_LUT_ROM_AUTO_1R
    generic map (
        DataWidth => 24,
        AddressRange => 4096,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_LN_LUT_address0,
        ce0 => r18_LN_LUT_ce0_local,
        q0 => r18_LN_LUT_q0,
        address1 => r18_LN_LUT_address1,
        ce1 => r18_LN_LUT_ce1_local,
        q1 => r18_LN_LUT_q1);

    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134 : component power_db_hls_power_db_Pipeline_VITIS_LOOP_45_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start,
        ap_done => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done,
        ap_idle => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_idle,
        ap_ready => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready,
        value_r => value_r,
        leading_out => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out,
        leading_out_ap_vld => grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out_ap_vld);

    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141 : component power_db_hls_power_db_Pipeline_VITIS_LOOP_48_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start,
        ap_done => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done,
        ap_idle => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_idle,
        ap_ready => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready,
        xx_1 => xx_1_reg_530,
        lead_out => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out,
        lead_out_ap_vld => grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out_ap_vld);

    mul_32ns_19ns_51_1_1_U9 : component power_db_hls_mul_32ns_19ns_51_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 19,
        dout_WIDTH => 51)
    port map (
        din0 => mul_ln51_fu_147_p0,
        din1 => mul_ln51_fu_147_p1,
        dout => mul_ln51_fu_147_p2);

    mul_32s_25ns_32_1_1_U10 : component power_db_hls_mul_32s_25ns_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 25,
        dout_WIDTH => 32)
    port map (
        din0 => mul_ln52_fu_151_p0,
        din1 => mul_ln52_fu_151_p1,
        dout => mul_ln52_fu_151_p2);

    mul_33s_33ns_64_1_1_U11 : component power_db_hls_mul_33s_33ns_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 33,
        din1_WIDTH => 33,
        dout_WIDTH => 64)
    port map (
        din0 => add_ln53_reg_537,
        din1 => mul_ln53_fu_156_p1,
        dout => mul_ln53_fu_156_p2);

    mul_64s_34ns_78_1_1_U12 : component power_db_hls_mul_64s_34ns_78_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 64,
        din1_WIDTH => 34,
        dout_WIDTH => 78)
    port map (
        din0 => ln_reg_580,
        din1 => p_fu_161_p1,
        dout => p_fu_161_p2);

    sparsemux_7_2_33_1_1_U13 : component power_db_hls_sparsemux_7_2_33_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "10",
        din0_WIDTH => 33,
        CASE1 => "01",
        din1_WIDTH => 33,
        CASE2 => "00",
        din2_WIDTH => 33,
        def_WIDTH => 33,
        sel_WIDTH => 2,
        dout_WIDTH => 33)
    port map (
        din0 => lx_fu_266_p2,
        din1 => lx_fu_266_p4,
        din2 => lx_fu_266_p6,
        def => lx_fu_266_p7,
        sel => lx_fu_266_p8,
        dout => lx_fu_266_p9);





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


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv48_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    ap_return_preg <= ap_phi_mux_agg_result_0_phi_fu_127_p4;
                end if; 
            end if;
        end if;
    end process;


    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln44_fu_166_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready = ap_const_logic_1)) then 
                    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready = ap_const_logic_1)) then 
                    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    agg_result_0_reg_123_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln44_fu_166_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                agg_result_0_reg_123 <= ap_const_lv48_FED400000000;
            elsif (((icmp_ln44_reg_526 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
                agg_result_0_reg_123 <= p_fu_161_p2(77 downto 30);
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                add_ln53_reg_537 <= add_ln53_fu_312_p2;
                xx_1_reg_530 <= xx_1_fu_296_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                frac_reg_545 <= frac_fu_369_p1;
                icmp_ln50_reg_555 <= icmp_ln50_fu_378_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln44_reg_526 <= icmp_ln44_fu_166_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                l0_reg_565 <= r18_LN_LUT_q1;
                mul_ln52_reg_570 <= mul_ln52_fu_151_p2;
                trunc_ln1_reg_575 <= mul_ln51_fu_147_p2(50 downto 19);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                ln_reg_580 <= ln_fu_480_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln44_fu_166_p2, grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done, grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((icmp_ln44_fu_166_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                elsif (((icmp_ln44_fu_166_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    add_ln46_fu_181_p0 <= grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;
    add_ln46_fu_181_p2 <= std_logic_vector(signed(add_ln46_fu_181_p0) + signed(ap_const_lv32_FFFFFFE1));
    add_ln50_fu_384_p2 <= std_logic_vector(unsigned(idx_fu_359_p4) + unsigned(ap_const_lv12_1));
    add_ln53_1_fu_462_p2 <= std_logic_vector(unsigned(mul_ln53_fu_156_p2) + unsigned(ap_const_lv64_B17217F8));
    add_ln53_fu_312_p2 <= std_logic_vector(signed(sext_ln53_1_fu_308_p1) + signed(sext_ln53_fu_305_p1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done)
    begin
        if ((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done)
    begin
        if ((grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state8)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
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


    ap_phi_mux_agg_result_0_phi_fu_127_p4_assign_proc : process(icmp_ln44_reg_526, agg_result_0_reg_123, ap_CS_fsm_state8, p_fu_161_p2)
    begin
        if (((icmp_ln44_reg_526 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state8))) then 
            ap_phi_mux_agg_result_0_phi_fu_127_p4 <= p_fu_161_p2(77 downto 30);
        else 
            ap_phi_mux_agg_result_0_phi_fu_127_p4 <= agg_result_0_reg_123;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_agg_result_0_phi_fu_127_p4, ap_CS_fsm_state8, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            ap_return <= ap_phi_mux_agg_result_0_phi_fu_127_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    frac_fu_369_p1 <= select_ln49_fu_351_p3(19 - 1 downto 0);
    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start <= grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg;
    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start <= grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg;
    icmp_ln44_fu_166_p2 <= "1" when (value_r = ap_const_lv64_0) else "0";
    icmp_ln46_fu_175_p0 <= grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;
    icmp_ln46_fu_175_p2 <= "1" when (signed(icmp_ln46_fu_175_p0) > signed(ap_const_lv32_1E)) else "0";
    icmp_ln47_fu_286_p2 <= "1" when (unsigned(lx_fu_266_p9) < unsigned(ap_const_lv33_2B)) else "0";
    icmp_ln50_fu_378_p2 <= "1" when (idx_fu_359_p4 = ap_const_lv12_FFF) else "0";
    idx_fu_359_p4 <= select_ln49_fu_351_p3(30 downto 19);
    l1_1_fu_399_p3 <= 
        ap_const_lv24_B17218 when (icmp_ln50_reg_555(0) = '1') else 
        r18_LN_LUT_q0;
    ln_fu_480_p2 <= std_logic_vector(unsigned(add_ln53_1_fu_462_p2) - unsigned(zext_ln53_fu_476_p1));
    lshr_ln46_1_fu_237_p2 <= std_logic_vector(shift_right(unsigned(value_r),to_integer(unsigned('0' & zext_ln46_2_fu_233_p1(31-1 downto 0)))));
    lshr_ln46_fu_191_p2 <= std_logic_vector(shift_right(unsigned(value_r),to_integer(unsigned('0' & zext_ln46_fu_187_p1(31-1 downto 0)))));
    lshr_ln49_fu_346_p2 <= std_logic_vector(shift_right(unsigned(xx_1_reg_530),to_integer(unsigned('0' & sub_ln49_1_fu_340_p2(31-1 downto 0)))));
    lx_fu_266_p2 <= lshr_ln46_fu_191_p2(33 - 1 downto 0);
    lx_fu_266_p4 <= shl_ln46_fu_218_p2(33 - 1 downto 0);
    lx_fu_266_p6 <= lshr_ln46_1_fu_237_p2(33 - 1 downto 0);
    lx_fu_266_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    lx_fu_266_p8 <= (icmp_ln46_fu_175_p2 & xor_ln46_fu_252_p2);
    mul_ln51_fu_147_p0 <= mul_ln51_fu_147_p00(32 - 1 downto 0);
    mul_ln51_fu_147_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln51_fu_416_p1),51));
    mul_ln51_fu_147_p1 <= mul_ln51_fu_147_p10(19 - 1 downto 0);
    mul_ln51_fu_147_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(frac_reg_545),51));
    mul_ln52_fu_151_p0 <= std_logic_vector(unsigned(ap_const_lv32_20) - unsigned(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out));
    mul_ln52_fu_151_p1 <= ap_const_lv32_B17218(25 - 1 downto 0);
    mul_ln53_fu_156_p1 <= ap_const_lv64_B17217F8(33 - 1 downto 0);
    neglog_fu_453_p2 <= std_logic_vector(unsigned(sub_ln52_1_fu_448_p2) - unsigned(trunc_ln1_reg_575));
    or_ln46_fu_246_p2 <= (tmp_fu_206_p3 or icmp_ln46_fu_175_p2);
    p_fu_161_p1 <= ap_const_lv78_115F2CED4(34 - 1 downto 0);
    r18_LN_LUT_address0 <= zext_ln50_2_fu_390_p1(12 - 1 downto 0);
    r18_LN_LUT_address1 <= zext_ln50_fu_373_p1(12 - 1 downto 0);

    r18_LN_LUT_ce0_local_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            r18_LN_LUT_ce0_local <= ap_const_logic_1;
        else 
            r18_LN_LUT_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    r18_LN_LUT_ce1_local_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            r18_LN_LUT_ce1_local <= ap_const_logic_1;
        else 
            r18_LN_LUT_ce1_local <= ap_const_logic_0;
        end if; 
    end process;

    select_ln49_fu_351_p3 <= 
        lshr_ln49_fu_346_p2 when (tmp_1_fu_327_p3(0) = '1') else 
        shl_ln49_fu_335_p2;
        sext_ln51_fu_416_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sub_ln51_fu_410_p2),32));

    sext_ln53_1_fu_308_p0 <= grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;
        sext_ln53_1_fu_308_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln53_1_fu_308_p0),33));

        sext_ln53_fu_305_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(exponent),33));

    shl_ln46_fu_218_p2 <= std_logic_vector(shift_left(unsigned(value_r),to_integer(unsigned('0' & zext_ln46_1_fu_214_p1(31-1 downto 0)))));
    shl_ln49_fu_335_p2 <= std_logic_vector(shift_left(unsigned(xx_1_reg_530),to_integer(unsigned('0' & sub_ln49_fu_321_p2(31-1 downto 0)))));
    shl_ln_fu_468_p3 <= (neglog_fu_453_p2 & ap_const_lv8_0);
    sub_ln46_1_fu_227_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(sub_ln46_fu_200_p2));
    sub_ln46_fu_200_p1 <= grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;
    sub_ln46_fu_200_p2 <= std_logic_vector(unsigned(ap_const_lv32_1F) - unsigned(sub_ln46_fu_200_p1));
    sub_ln49_1_fu_340_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(sub_ln49_fu_321_p2));
    sub_ln49_fu_321_p2 <= std_logic_vector(unsigned(ap_const_lv32_1F) - unsigned(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out));
    sub_ln51_fu_410_p2 <= std_logic_vector(unsigned(zext_ln50_4_fu_406_p1) - unsigned(zext_ln50_3_fu_395_p1));
    sub_ln52_1_fu_448_p2 <= std_logic_vector(unsigned(mul_ln52_reg_570) - unsigned(zext_ln50_1_fu_445_p1));
    tmp_1_fu_327_p3 <= sub_ln49_fu_321_p2(31 downto 31);
    tmp_fu_206_p3 <= sub_ln46_fu_200_p2(31 downto 31);
    xor_ln46_fu_252_p2 <= (or_ln46_fu_246_p2 xor ap_const_lv1_1);
    xx_1_fu_296_p3 <= 
        ap_const_lv32_2B when (icmp_ln47_fu_286_p2(0) = '1') else 
        xx_fu_292_p1;
    xx_fu_292_p1 <= lx_fu_266_p9(32 - 1 downto 0);
    zext_ln46_1_fu_214_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln46_fu_200_p2),64));
    zext_ln46_2_fu_233_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sub_ln46_1_fu_227_p2),64));
    zext_ln46_fu_187_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln46_fu_181_p2),64));
    zext_ln50_1_fu_445_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(l0_reg_565),32));
    zext_ln50_2_fu_390_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln50_fu_384_p2),64));
    zext_ln50_3_fu_395_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r18_LN_LUT_q1),25));
    zext_ln50_4_fu_406_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(l1_1_fu_399_p3),25));
    zext_ln50_fu_373_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(idx_fu_359_p4),64));
    zext_ln53_fu_476_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_468_p3),64));
end behav;
