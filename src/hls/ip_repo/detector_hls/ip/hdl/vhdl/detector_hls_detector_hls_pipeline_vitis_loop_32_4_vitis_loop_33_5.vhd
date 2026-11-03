                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5 is
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
end;


architecture behav of detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv82_0 : STD_LOGIC_VECTOR (81 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv12_918 : STD_LOGIC_VECTOR (11 downto 0) := "100100011000";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv7_61 : STD_LOGIC_VECTOR (6 downto 0) := "1100001";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_51 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001010001";
    constant ap_const_lv32_4D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001101";
    constant ap_const_lv52_F800000000000 : STD_LOGIC_VECTOR (51 downto 0) := "1111100000000000000000000000000000000000000000000000";
    constant ap_const_lv7_42 : STD_LOGIC_VECTOR (6 downto 0) := "1000010";
    constant ap_const_lv12_61 : STD_LOGIC_VECTOR (11 downto 0) := "000001100001";

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
    signal icmp_ln32_fu_176_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_DCT_address0 : STD_LOGIC_VECTOR (11 downto 0);
    signal r18_DCT_q0 : STD_LOGIC_VECTOR (28 downto 0);
    signal invalid_reg_131 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln32_reg_435 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln32_reg_435_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln32_reg_435_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln32_reg_435_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln32_reg_435_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_fu_194_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_439 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_439_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_439_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_439_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_439_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln32_fu_200_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln32_reg_445 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln32_reg_445_pp0_iter1_reg : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln32_reg_445_pp0_iter2_reg : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln32_2_fu_214_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln32_2_reg_451 : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln32_2_reg_451_pp0_iter1_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln32_2_reg_451_pp0_iter2_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln32_2_reg_451_pp0_iter3_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal select_ln32_2_reg_451_pp0_iter4_reg : STD_LOGIC_VECTOR (4 downto 0);
    signal icmp_ln33_1_fu_232_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_1_reg_461 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_1_reg_461_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_1_reg_461_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_1_reg_461_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_1_reg_461_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal prod_fu_143_p2 : STD_LOGIC_VECTOR (75 downto 0);
    signal prod_reg_480 : STD_LOGIC_VECTOR (75 downto 0);
    signal select_ln32_3_fu_293_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter4_stage0 : STD_LOGIC;
    signal ap_loop_init : STD_LOGIC;
    signal zext_ln33_fu_256_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln35_fu_260_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln37_fu_377_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal invalid_1_fu_350_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal acc_fu_70 : STD_LOGIC_VECTOR (81 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal acc_1_fu_306_p2 : STD_LOGIC_VECTOR (81 downto 0);
    signal i_3_fu_74 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal add_ln33_fu_226_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_sig_allocacmp_i_3_load : STD_LOGIC_VECTOR (6 downto 0);
    signal k_fu_78 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal ap_sig_allocacmp_k_load : STD_LOGIC_VECTOR (4 downto 0);
    signal indvar_flatten_fu_82 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    signal add_ln32_fu_182_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_allocacmp_indvar_flatten_load : STD_LOGIC_VECTOR (11 downto 0);
    signal raw_ce0_local : STD_LOGIC;
    signal r18_DCT_ce0_local : STD_LOGIC;
    signal features_we0_local : STD_LOGIC;
    signal features_ce0_local : STD_LOGIC;
    signal add_ln32_1_fu_208_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fu_393_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal x_fu_264_p2 : STD_LOGIC_VECTOR (47 downto 0);
    signal sext_ln35_2_fu_303_p1 : STD_LOGIC_VECTOR (81 downto 0);
    signal select_ln32_1_fu_286_p3 : STD_LOGIC_VECTOR (81 downto 0);
    signal tmp_fu_322_p4 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln37_1_fu_312_p4 : STD_LOGIC_VECTOR (51 downto 0);
    signal icmp_ln37_1_fu_338_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln37_fu_332_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln37_fu_344_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln32_fu_300_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln37_fu_367_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sext_ln37_fu_373_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_393_p0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_393_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fu_393_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal grp_fu_393_p10 : STD_LOGIC_VECTOR (11 downto 0);
    signal grp_fu_393_p20 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component detector_hls_mul_48s_29s_76_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (47 downto 0);
        din1 : IN STD_LOGIC_VECTOR (28 downto 0);
        dout : OUT STD_LOGIC_VECTOR (75 downto 0) );
    end component;


    component detector_hls_mac_muladd_7ns_5ns_7ns_12_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (6 downto 0);
        din1 : IN STD_LOGIC_VECTOR (4 downto 0);
        din2 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_r18_DCT_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (11 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (28 downto 0) );
    end component;


    component detector_hls_flow_control_loop_pipe_sequential_init IS
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
    r18_DCT_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_r18_DCT_ROM_AUTO_1R
    generic map (
        DataWidth => 29,
        AddressRange => 2328,
        AddressWidth => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_DCT_address0,
        ce0 => r18_DCT_ce0_local,
        q0 => r18_DCT_q0);

    mul_48s_29s_76_1_1_U14 : component detector_hls_mul_48s_29s_76_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 48,
        din1_WIDTH => 29,
        dout_WIDTH => 76)
    port map (
        din0 => x_fu_264_p2,
        din1 => r18_DCT_q0,
        dout => prod_fu_143_p2);

    mac_muladd_7ns_5ns_7ns_12_4_1_U15 : component detector_hls_mac_muladd_7ns_5ns_7ns_12_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 7,
        din1_WIDTH => 5,
        din2_WIDTH => 7,
        dout_WIDTH => 12)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_393_p0,
        din1 => grp_fu_393_p1,
        din2 => grp_fu_393_p2,
        ce => ap_const_logic_1,
        dout => grp_fu_393_p3);

    flow_control_loop_pipe_sequential_init_U : component detector_hls_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter4_stage0)) then 
                    ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    acc_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    acc_fu_70 <= ap_const_lv82_0;
                elsif (((ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (icmp_ln32_reg_435_pp0_iter4_reg = ap_const_lv1_0))) then 
                    acc_fu_70 <= acc_1_fu_306_p2;
                end if;
            end if; 
        end if;
    end process;

    i_3_fu_74_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln32_fu_176_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_3_fu_74 <= add_ln33_fu_226_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_3_fu_74 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln32_fu_176_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    indvar_flatten_fu_82 <= add_ln32_fu_182_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_82 <= ap_const_lv12_0;
                end if;
            end if; 
        end if;
    end process;

    invalid_reg_131_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                invalid_reg_131 <= ap_const_lv1_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (icmp_ln32_reg_435_pp0_iter4_reg = ap_const_lv1_0))) then 
                invalid_reg_131 <= select_ln32_3_fu_293_p3;
            end if; 
        end if;
    end process;

    k_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln32_fu_176_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    k_fu_78 <= select_ln32_2_fu_214_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    k_fu_78 <= ap_const_lv5_0;
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
                icmp_ln32_reg_435 <= icmp_ln32_fu_176_p2;
                icmp_ln32_reg_435_pp0_iter1_reg <= icmp_ln32_reg_435;
                icmp_ln33_1_reg_461 <= icmp_ln33_1_fu_232_p2;
                icmp_ln33_1_reg_461_pp0_iter1_reg <= icmp_ln33_1_reg_461;
                icmp_ln33_reg_439 <= icmp_ln33_fu_194_p2;
                icmp_ln33_reg_439_pp0_iter1_reg <= icmp_ln33_reg_439;
                select_ln32_2_reg_451 <= select_ln32_2_fu_214_p3;
                select_ln32_2_reg_451_pp0_iter1_reg <= select_ln32_2_reg_451;
                select_ln32_reg_445 <= select_ln32_fu_200_p3;
                select_ln32_reg_445_pp0_iter1_reg <= select_ln32_reg_445;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                icmp_ln32_reg_435_pp0_iter2_reg <= icmp_ln32_reg_435_pp0_iter1_reg;
                icmp_ln32_reg_435_pp0_iter3_reg <= icmp_ln32_reg_435_pp0_iter2_reg;
                icmp_ln32_reg_435_pp0_iter4_reg <= icmp_ln32_reg_435_pp0_iter3_reg;
                icmp_ln33_1_reg_461_pp0_iter2_reg <= icmp_ln33_1_reg_461_pp0_iter1_reg;
                icmp_ln33_1_reg_461_pp0_iter3_reg <= icmp_ln33_1_reg_461_pp0_iter2_reg;
                icmp_ln33_1_reg_461_pp0_iter4_reg <= icmp_ln33_1_reg_461_pp0_iter3_reg;
                icmp_ln33_reg_439_pp0_iter2_reg <= icmp_ln33_reg_439_pp0_iter1_reg;
                icmp_ln33_reg_439_pp0_iter3_reg <= icmp_ln33_reg_439_pp0_iter2_reg;
                icmp_ln33_reg_439_pp0_iter4_reg <= icmp_ln33_reg_439_pp0_iter3_reg;
                prod_reg_480 <= prod_fu_143_p2;
                select_ln32_2_reg_451_pp0_iter2_reg <= select_ln32_2_reg_451_pp0_iter1_reg;
                select_ln32_2_reg_451_pp0_iter3_reg <= select_ln32_2_reg_451_pp0_iter2_reg;
                select_ln32_2_reg_451_pp0_iter4_reg <= select_ln32_2_reg_451_pp0_iter3_reg;
                select_ln32_reg_445_pp0_iter2_reg <= select_ln32_reg_445_pp0_iter1_reg;
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
    acc_1_fu_306_p2 <= std_logic_vector(signed(sext_ln35_2_fu_303_p1) + signed(select_ln32_1_fu_286_p3));
    add_ln32_1_fu_208_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_k_load) + unsigned(ap_const_lv5_1));
    add_ln32_fu_182_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten_load) + unsigned(ap_const_lv12_1));
    add_ln33_fu_226_p2 <= std_logic_vector(unsigned(select_ln32_fu_200_p3) + unsigned(ap_const_lv7_1));
    add_ln37_fu_367_p2 <= std_logic_vector(unsigned(zext_ln32_fu_300_p1) + unsigned(ap_const_lv7_42));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln32_fu_176_p2)
    begin
        if (((icmp_ln32_fu_176_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_exit_pp0_iter4_stage0_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_subdone, icmp_ln32_reg_435_pp0_iter3_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1) and (icmp_ln32_reg_435_pp0_iter3_reg = ap_const_lv1_1))) then 
            ap_condition_exit_pp0_iter4_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter4_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter4_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter4_reg = ap_const_logic_1))) then 
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


    ap_sig_allocacmp_i_3_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_loop_init, ap_block_pp0_stage0, i_3_fu_74)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_3_load <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_i_3_load <= i_3_fu_74;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_loop_init, ap_block_pp0_stage0, indvar_flatten_fu_82)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_indvar_flatten_load <= ap_const_lv12_0;
        else 
            ap_sig_allocacmp_indvar_flatten_load <= indvar_flatten_fu_82;
        end if; 
    end process;


    ap_sig_allocacmp_k_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_loop_init, ap_block_pp0_stage0, k_fu_78)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_k_load <= ap_const_lv5_0;
        else 
            ap_sig_allocacmp_k_load <= k_fu_78;
        end if; 
    end process;

    features_address0 <= zext_ln37_fu_377_p1(8 - 1 downto 0);
    features_ce0 <= features_ce0_local;

    features_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter5, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1))) then 
            features_ce0_local <= ap_const_logic_1;
        else 
            features_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    features_d0 <= acc_1_fu_306_p2(77 downto 30);
    features_we0 <= features_we0_local;

    features_we0_local_assign_proc : process(ap_enable_reg_pp0_iter5, ap_block_pp0_stage0_11001, icmp_ln33_1_reg_461_pp0_iter4_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (icmp_ln33_1_reg_461_pp0_iter4_reg = ap_const_lv1_1))) then 
            features_we0_local <= ap_const_logic_1;
        else 
            features_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_393_p0 <= ap_const_lv12_61(7 - 1 downto 0);
    grp_fu_393_p1 <= grp_fu_393_p10(5 - 1 downto 0);
    grp_fu_393_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln32_2_fu_214_p3),12));
    grp_fu_393_p2 <= grp_fu_393_p20(7 - 1 downto 0);
    grp_fu_393_p20 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln32_reg_445_pp0_iter1_reg),12));
    icmp_ln32_fu_176_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten_load = ap_const_lv12_918) else "0";
    icmp_ln33_1_fu_232_p2 <= "1" when (add_ln33_fu_226_p2 = ap_const_lv7_61) else "0";
    icmp_ln33_fu_194_p2 <= "1" when (ap_sig_allocacmp_i_3_load = ap_const_lv7_61) else "0";
    icmp_ln37_1_fu_338_p2 <= "1" when (signed(trunc_ln37_1_fu_312_p4) < signed(ap_const_lv52_F800000000000)) else "0";
    icmp_ln37_fu_332_p2 <= "1" when (signed(tmp_fu_322_p4) > signed(ap_const_lv5_0)) else "0";
    invalid_1_fu_350_p2 <= (select_ln32_3_fu_293_p3 or or_ln37_fu_344_p2);

    invalid_21_out_o_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter5, invalid_21_out_i, icmp_ln32_reg_435_pp0_iter4_reg, ap_loop_init, ap_block_pp0_stage0, invalid_1_fu_350_p2)
    begin
        if ((ap_const_boolean_0 = ap_block_pp0_stage0)) then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                invalid_21_out_o <= "X";
            elsif (((ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (icmp_ln32_reg_435_pp0_iter4_reg = ap_const_lv1_0))) then 
                invalid_21_out_o <= invalid_1_fu_350_p2;
            else 
                invalid_21_out_o <= invalid_21_out_i;
            end if;
        else 
            invalid_21_out_o <= invalid_21_out_i;
        end if; 
    end process;


    invalid_21_out_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter5, ap_block_pp0_stage0_11001, icmp_ln32_reg_435_pp0_iter4_reg, ap_loop_init)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter5 = ap_const_logic_1) and (icmp_ln32_reg_435_pp0_iter4_reg = ap_const_lv1_0)))) then 
            invalid_21_out_o_ap_vld <= ap_const_logic_1;
        else 
            invalid_21_out_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    or_ln37_fu_344_p2 <= (icmp_ln37_fu_332_p2 or icmp_ln37_1_fu_338_p2);
    r18_DCT_address0 <= zext_ln35_fu_260_p1(12 - 1 downto 0);

    r18_DCT_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            r18_DCT_ce0_local <= ap_const_logic_1;
        else 
            r18_DCT_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    raw_address0 <= zext_ln33_fu_256_p1(7 - 1 downto 0);
    raw_ce0 <= raw_ce0_local;

    raw_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            raw_ce0_local <= ap_const_logic_1;
        else 
            raw_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    select_ln32_1_fu_286_p3 <= 
        ap_const_lv82_0 when (icmp_ln33_reg_439_pp0_iter4_reg(0) = '1') else 
        acc_fu_70;
    select_ln32_2_fu_214_p3 <= 
        add_ln32_1_fu_208_p2 when (icmp_ln33_fu_194_p2(0) = '1') else 
        ap_sig_allocacmp_k_load;
    select_ln32_3_fu_293_p3 <= 
        invalid_21_out_i when (icmp_ln33_reg_439_pp0_iter4_reg(0) = '1') else 
        invalid_reg_131;
    select_ln32_fu_200_p3 <= 
        ap_const_lv7_0 when (icmp_ln33_fu_194_p2(0) = '1') else 
        ap_sig_allocacmp_i_3_load;
        sext_ln35_2_fu_303_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(prod_reg_480),82));

        sext_ln37_fu_373_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln37_fu_367_p2),8));

    tmp_fu_322_p4 <= acc_1_fu_306_p2(81 downto 77);
    trunc_ln37_1_fu_312_p4 <= acc_1_fu_306_p2(81 downto 30);
    x_fu_264_p2 <= std_logic_vector(unsigned(raw_q0) - unsigned(conv3_i12_i3167));
    zext_ln32_fu_300_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln32_2_reg_451_pp0_iter4_reg),7));
    zext_ln33_fu_256_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln32_reg_445_pp0_iter2_reg),64));
    zext_ln35_fu_260_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_393_p3),64));
    zext_ln37_fu_377_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln37_fu_373_p1),64));
end behav;
