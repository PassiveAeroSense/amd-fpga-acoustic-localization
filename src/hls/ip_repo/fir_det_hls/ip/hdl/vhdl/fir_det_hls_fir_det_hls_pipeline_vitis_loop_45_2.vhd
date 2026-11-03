                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2 is
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
end;


architecture behav of fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv53_0 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_19A : STD_LOGIC_VECTOR (8 downto 0) := "110011010";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv12_7FF : STD_LOGIC_VECTOR (11 downto 0) := "011111111111";
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_47 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000111";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_77 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001110111";
    constant ap_const_lv32_78 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111000";
    constant ap_const_lv32_8F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010001111";
    constant ap_const_lv32_90 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010010000";
    constant ap_const_lv32_A7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010100111";
    constant ap_const_lv32_A8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010101000";
    constant ap_const_lv32_BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010111111";

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
    signal icmp_ln45_fu_316_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_DET_FIR_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_DET_FIR_q0 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln45_reg_746 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln45_reg_746_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln47_fu_372_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln47_reg_755 : STD_LOGIC_VECTOR (0 downto 0);
    signal co_1_fu_383_p3 : STD_LOGIC_VECTOR (21 downto 0);
    signal co_1_reg_765 : STD_LOGIC_VECTOR (21 downto 0);
    signal sample_fu_390_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_reg_770 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_1_reg_775 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_2_reg_780 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_3_reg_785 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_4_reg_790 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_5_reg_795 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_6_reg_800 : STD_LOGIC_VECTOR (23 downto 0);
    signal sample_7_reg_805 : STD_LOGIC_VECTOR (23 downto 0);
    signal prod_fu_232_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_reg_810 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_1_fu_236_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_1_reg_815 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_2_fu_240_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_2_reg_820 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_3_fu_244_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_3_reg_825 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_4_fu_248_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_4_reg_830 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_5_fu_252_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_5_reg_835 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_6_fu_256_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_6_reg_840 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_7_fu_260_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_7_reg_845 : STD_LOGIC_VECTOR (45 downto 0);
    signal zext_ln47_fu_338_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln47_1_fu_367_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_fu_102 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_fu_534_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal empty_12_fu_106 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_1_fu_543_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_13_fu_110 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_2_fu_552_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_14_fu_114 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_3_fu_561_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_15_fu_118 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_4_fu_570_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_16_fu_122 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_5_fu_579_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_17_fu_126 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_6_fu_588_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal empty_18_fu_130 : STD_LOGIC_VECTOR (52 downto 0) := "00000000000000000000000000000000000000000000000000000";
    signal add_ln50_7_fu_597_p2 : STD_LOGIC_VECTOR (52 downto 0);
    signal tap_fu_134 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal tap_2_fu_322_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_tap_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal history_ce0_local : STD_LOGIC;
    signal r18_DET_FIR_ce0_local : STD_LOGIC;
    signal prod_fu_232_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal sext_ln50_fu_464_p1 : STD_LOGIC_VECTOR (45 downto 0);
    signal prod_1_fu_236_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_2_fu_240_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_3_fu_244_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_4_fu_248_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_5_fu_252_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_6_fu_256_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal prod_7_fu_260_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal at_fu_332_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_fu_343_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln47_2_fu_351_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln45_1_fu_328_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln47_1_fu_355_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln45_cast_fu_264_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal add_ln47_fu_361_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal sext_ln50_2_fu_531_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_4_fu_540_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_6_fu_549_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_8_fu_558_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_10_fu_567_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_12_fu_576_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_14_fu_585_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal sext_ln50_16_fu_594_p1 : STD_LOGIC_VECTOR (52 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fir_det_hls_mul_24s_22s_46_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (23 downto 0);
        din1 : IN STD_LOGIC_VECTOR (21 downto 0);
        dout : OUT STD_LOGIC_VECTOR (45 downto 0) );
    end component;


    component fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2_r18_DET_FIR_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;


    component fir_det_hls_flow_control_loop_pipe_sequential_init IS
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
    r18_DET_FIR_U : component fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2_r18_DET_FIR_ROM_AUTO_1R
    generic map (
        DataWidth => 22,
        AddressRange => 2047,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_DET_FIR_address0,
        ce0 => r18_DET_FIR_ce0_local,
        q0 => r18_DET_FIR_q0);

    mul_24s_22s_46_1_1_U1 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_reg_770,
        din1 => prod_fu_232_p1,
        dout => prod_fu_232_p2);

    mul_24s_22s_46_1_1_U2 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_1_reg_775,
        din1 => prod_1_fu_236_p1,
        dout => prod_1_fu_236_p2);

    mul_24s_22s_46_1_1_U3 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_2_reg_780,
        din1 => prod_2_fu_240_p1,
        dout => prod_2_fu_240_p2);

    mul_24s_22s_46_1_1_U4 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_3_reg_785,
        din1 => prod_3_fu_244_p1,
        dout => prod_3_fu_244_p2);

    mul_24s_22s_46_1_1_U5 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_4_reg_790,
        din1 => prod_4_fu_248_p1,
        dout => prod_4_fu_248_p2);

    mul_24s_22s_46_1_1_U6 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_5_reg_795,
        din1 => prod_5_fu_252_p1,
        dout => prod_5_fu_252_p2);

    mul_24s_22s_46_1_1_U7 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_6_reg_800,
        din1 => prod_6_fu_256_p1,
        dout => prod_6_fu_256_p2);

    mul_24s_22s_46_1_1_U8 : component fir_det_hls_mul_24s_22s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 24,
        din1_WIDTH => 22,
        dout_WIDTH => 46)
    port map (
        din0 => sample_7_reg_805,
        din1 => prod_7_fu_260_p1,
        dout => prod_7_fu_260_p2);

    flow_control_loop_pipe_sequential_init_U : component fir_det_hls_flow_control_loop_pipe_sequential_init
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


    empty_12_fu_106_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_12_fu_106 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_12_fu_106 <= add_ln50_1_fu_543_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_13_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_13_fu_110 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_13_fu_110 <= add_ln50_2_fu_552_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_14_fu_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_14_fu_114 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_14_fu_114 <= add_ln50_3_fu_561_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_15_fu_118_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_15_fu_118 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_15_fu_118 <= add_ln50_4_fu_570_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_16_fu_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_16_fu_122 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_16_fu_122 <= add_ln50_5_fu_579_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_17_fu_126_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_17_fu_126 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_17_fu_126 <= add_ln50_6_fu_588_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_18_fu_130_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_18_fu_130 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_18_fu_130 <= add_ln50_7_fu_597_p2;
                end if;
            end if; 
        end if;
    end process;

    empty_fu_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    empty_fu_102 <= ap_const_lv53_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    empty_fu_102 <= add_ln50_fu_534_p2;
                end if;
            end if; 
        end if;
    end process;

    tap_fu_134_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln45_fu_316_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    tap_fu_134 <= tap_2_fu_322_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    tap_fu_134 <= ap_const_lv9_0;
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
                co_1_reg_765 <= co_1_fu_383_p3;
                icmp_ln45_reg_746 <= icmp_ln45_fu_316_p2;
                icmp_ln45_reg_746_pp0_iter1_reg <= icmp_ln45_reg_746;
                icmp_ln47_reg_755 <= icmp_ln47_fu_372_p2;
                sample_1_reg_775 <= history_q0(47 downto 24);
                sample_2_reg_780 <= history_q0(71 downto 48);
                sample_3_reg_785 <= history_q0(95 downto 72);
                sample_4_reg_790 <= history_q0(119 downto 96);
                sample_5_reg_795 <= history_q0(143 downto 120);
                sample_6_reg_800 <= history_q0(167 downto 144);
                sample_7_reg_805 <= history_q0(191 downto 168);
                sample_reg_770 <= sample_fu_390_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                prod_1_reg_815 <= prod_1_fu_236_p2;
                prod_2_reg_820 <= prod_2_fu_240_p2;
                prod_3_reg_825 <= prod_3_fu_244_p2;
                prod_4_reg_830 <= prod_4_fu_248_p2;
                prod_5_reg_835 <= prod_5_fu_252_p2;
                prod_6_reg_840 <= prod_6_fu_256_p2;
                prod_7_reg_845 <= prod_7_fu_260_p2;
                prod_reg_810 <= prod_fu_232_p2;
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
    add_ln47_1_fu_355_p2 <= std_logic_vector(unsigned(zext_ln47_2_fu_351_p1) + unsigned(zext_ln45_1_fu_328_p1));
    add_ln47_fu_361_p2 <= std_logic_vector(unsigned(add_ln47_1_fu_355_p2) + unsigned(zext_ln45_cast_fu_264_p1));
    add_ln50_1_fu_543_p2 <= std_logic_vector(signed(sext_ln50_4_fu_540_p1) + signed(empty_12_fu_106));
    add_ln50_2_fu_552_p2 <= std_logic_vector(signed(sext_ln50_6_fu_549_p1) + signed(empty_13_fu_110));
    add_ln50_3_fu_561_p2 <= std_logic_vector(signed(sext_ln50_8_fu_558_p1) + signed(empty_14_fu_114));
    add_ln50_4_fu_570_p2 <= std_logic_vector(signed(sext_ln50_10_fu_567_p1) + signed(empty_15_fu_118));
    add_ln50_5_fu_579_p2 <= std_logic_vector(signed(sext_ln50_12_fu_576_p1) + signed(empty_16_fu_122));
    add_ln50_6_fu_588_p2 <= std_logic_vector(signed(sext_ln50_14_fu_585_p1) + signed(empty_17_fu_126));
    add_ln50_7_fu_597_p2 <= std_logic_vector(signed(sext_ln50_16_fu_594_p1) + signed(empty_18_fu_130));
    add_ln50_fu_534_p2 <= std_logic_vector(signed(sext_ln50_2_fu_531_p1) + signed(empty_fu_102));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln45_fu_316_p2)
    begin
        if (((icmp_ln45_fu_316_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_sig_allocacmp_tap_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, tap_fu_134)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_tap_1 <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_tap_1 <= tap_fu_134;
        end if; 
    end process;

    at_fu_332_p2 <= std_logic_vector(unsigned(wr_load) - unsigned(ap_sig_allocacmp_tap_1));
    co_1_fu_383_p3 <= 
        r18_DET_FIR_q0 when (icmp_ln47_reg_755(0) = '1') else 
        ap_const_lv22_0;
    history_address0 <= zext_ln47_fu_338_p1(9 - 1 downto 0);
    history_ce0 <= history_ce0_local;

    history_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            history_ce0_local <= ap_const_logic_1;
        else 
            history_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln45_fu_316_p2 <= "1" when (ap_sig_allocacmp_tap_1 = ap_const_lv9_19A) else "0";
    icmp_ln47_fu_372_p2 <= "1" when (unsigned(add_ln47_fu_361_p2) < unsigned(ap_const_lv12_7FF)) else "0";
    p_out <= empty_18_fu_130;
    p_out1 <= empty_17_fu_126;

    p_out1_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out1_ap_vld <= ap_const_logic_1;
        else 
            p_out1_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out2 <= empty_16_fu_122;

    p_out2_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out2_ap_vld <= ap_const_logic_1;
        else 
            p_out2_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out3 <= empty_15_fu_118;

    p_out3_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out3_ap_vld <= ap_const_logic_1;
        else 
            p_out3_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out4 <= empty_14_fu_114;

    p_out4_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out4_ap_vld <= ap_const_logic_1;
        else 
            p_out4_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out5 <= empty_13_fu_110;

    p_out5_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out5_ap_vld <= ap_const_logic_1;
        else 
            p_out5_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out6 <= empty_12_fu_106;

    p_out6_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out6_ap_vld <= ap_const_logic_1;
        else 
            p_out6_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    p_out7 <= empty_fu_102;

    p_out7_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out7_ap_vld <= ap_const_logic_1;
        else 
            p_out7_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    p_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln45_reg_746_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (icmp_ln45_reg_746_pp0_iter1_reg = ap_const_lv1_1))) then 
            p_out_ap_vld <= ap_const_logic_1;
        else 
            p_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    prod_1_fu_236_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_2_fu_240_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_3_fu_244_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_4_fu_248_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_5_fu_252_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_6_fu_256_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_7_fu_260_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    prod_fu_232_p1 <= sext_ln50_fu_464_p1(22 - 1 downto 0);
    r18_DET_FIR_address0 <= zext_ln47_1_fu_367_p1(11 - 1 downto 0);

    r18_DET_FIR_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_DET_FIR_ce0_local <= ap_const_logic_1;
        else 
            r18_DET_FIR_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    sample_fu_390_p1 <= history_q0(24 - 1 downto 0);
        sext_ln50_10_fu_567_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_4_reg_830),53));

        sext_ln50_12_fu_576_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_5_reg_835),53));

        sext_ln50_14_fu_585_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_6_reg_840),53));

        sext_ln50_16_fu_594_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_7_reg_845),53));

        sext_ln50_2_fu_531_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_reg_810),53));

        sext_ln50_4_fu_540_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_1_reg_815),53));

        sext_ln50_6_fu_549_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_2_reg_820),53));

        sext_ln50_8_fu_558_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_3_reg_825),53));

        sext_ln50_fu_464_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(co_1_reg_765),46));

    tap_2_fu_322_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_tap_1) + unsigned(ap_const_lv9_1));
    tmp_fu_343_p3 <= (ap_sig_allocacmp_tap_1 & ap_const_lv2_0);
    zext_ln45_1_fu_328_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_tap_1),12));
    zext_ln45_cast_fu_264_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln45),12));
    zext_ln47_1_fu_367_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln47_fu_361_p2),64));
    zext_ln47_2_fu_351_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_343_p3),12));
    zext_ln47_fu_338_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(at_fu_332_p2),64));
end behav;
