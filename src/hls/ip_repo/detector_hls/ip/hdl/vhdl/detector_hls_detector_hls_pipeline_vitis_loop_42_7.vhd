                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7 is
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
end;


architecture behav of detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal r18_NODE_LEAF_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_LEAF_q0 : STD_LOGIC_VECTOR (0 downto 0);
    signal r18_NODE_FEAT_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_FEAT_q0 : STD_LOGIC_VECTOR (7 downto 0);
    signal r18_NODE_LEFT_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_LEFT_q0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_RIGHT_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_RIGHT_q0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_THR_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_THR_q0 : STD_LOGIC_VECTOR (37 downto 0);
    signal node_2_in_reg_149 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln43_fu_177_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln43_reg_250 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal r18_NODE_LEAF_load_reg_263 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal r18_NODE_LEFT_load_reg_287 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal r18_NODE_RIGHT_load_reg_292 : STD_LOGIC_VECTOR (10 downto 0);
    signal r18_NODE_THR_load_reg_302 : STD_LOGIC_VECTOR (37 downto 0);
    signal tmp_fu_204_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_307 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln46_fu_232_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal ap_predicate_tran5to6_state4 : BOOLEAN;
    signal ap_condition_pp0_flush_enable : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_phi_mux_node_2_in_phi_fu_153_p4 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_phi_mux_UnifiedRetVal_phi_fu_164_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal UnifiedRetVal_reg_160 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal zext_ln46_fu_189_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal depth_fu_54 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal trunc_ln42_fu_200_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal r18_NODE_LEAF_ce0_local : STD_LOGIC;
    signal r18_NODE_FEAT_ce0_local : STD_LOGIC;
    signal r18_NODE_LEFT_ce0_local : STD_LOGIC;
    signal r18_NODE_RIGHT_ce0_local : STD_LOGIC;
    signal r18_NODE_THR_ce0_local : STD_LOGIC;
    signal features_ce0_local : STD_LOGIC;
    signal zext_ln31_fu_185_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal depth_1_fu_194_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal sext_ln46_fu_217_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal icmp_ln46_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln46_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_exit_tran_regpp0 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEAF_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_FEAT_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEFT_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (10 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_RIGHT_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (10 downto 0) );
    end component;


    component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_THR_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (37 downto 0) );
    end component;



begin
    r18_NODE_LEAF_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEAF_ROM_AUTO_1R
    generic map (
        DataWidth => 1,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_NODE_LEAF_address0,
        ce0 => r18_NODE_LEAF_ce0_local,
        q0 => r18_NODE_LEAF_q0);

    r18_NODE_FEAT_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_FEAT_ROM_AUTO_1R
    generic map (
        DataWidth => 8,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_NODE_FEAT_address0,
        ce0 => r18_NODE_FEAT_ce0_local,
        q0 => r18_NODE_FEAT_q0);

    r18_NODE_LEFT_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEFT_ROM_AUTO_1R
    generic map (
        DataWidth => 11,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_NODE_LEFT_address0,
        ce0 => r18_NODE_LEFT_ce0_local,
        q0 => r18_NODE_LEFT_q0);

    r18_NODE_RIGHT_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_RIGHT_ROM_AUTO_1R
    generic map (
        DataWidth => 11,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_NODE_RIGHT_address0,
        ce0 => r18_NODE_RIGHT_ce0_local,
        q0 => r18_NODE_RIGHT_q0);

    r18_NODE_THR_U : component detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_THR_ROM_AUTO_1R
    generic map (
        DataWidth => 38,
        AddressRange => 1560,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_NODE_THR_address0,
        ce0 => r18_NODE_THR_ce0_local,
        q0 => r18_NODE_THR_q0);





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


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_const_logic_1;
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
                if ((((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                    ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_164_p4;
                end if; 
            end if;
        end if;
    end process;


    UnifiedRetVal_reg_160_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                UnifiedRetVal_reg_160 <= ap_const_lv1_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                UnifiedRetVal_reg_160 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    ap_exit_tran_regpp0_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone))) then
                if ((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_1)) then 
                    ap_exit_tran_regpp0(0) <= '1';
                elsif ((ap_predicate_tran5to6_state4 = ap_const_boolean_1)) then 
                    ap_exit_tran_regpp0(0) <= '0';
                end if;
            end if; 
        end if;
    end process;

    depth_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                depth_fu_54 <= ap_const_lv5_0;
            elsif (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                depth_fu_54 <= trunc_ln42_fu_200_p1;
            end if; 
        end if;
    end process;

    node_2_in_reg_149_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (tmp_reg_307 = ap_const_lv1_0))) then 
                node_2_in_reg_149 <= select_ln46_fu_232_p3;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                node_2_in_reg_149 <= r18_ROOTS_load;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                r18_NODE_LEAF_load_reg_263 <= r18_NODE_LEAF_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then
                r18_NODE_LEFT_load_reg_287 <= r18_NODE_LEFT_q0;
                r18_NODE_RIGHT_load_reg_292 <= r18_NODE_RIGHT_q0;
                r18_NODE_THR_load_reg_302 <= r18_NODE_THR_q0;
                tmp_reg_307 <= depth_1_fu_194_p2(5 downto 5);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    zext_ln43_reg_250(10 downto 0) <= zext_ln43_fu_177_p1(10 downto 0);
            end if;
        end if;
    end process;
    zext_ln43_reg_250(63 downto 11) <= "00000000000000000000000000000000000000000000000000000";
    ap_exit_tran_regpp0(1) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage2_subdone, ap_block_pp0_stage0_subdone, ap_exit_tran_regpp0, ap_block_pp0_stage1_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_exit_tran_regpp0 = ap_const_lv2_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_exit_tran_regpp0 = ap_const_lv2_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);
    ap_CS_fsm_state7 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_flush_enable_assign_proc : process(r18_NODE_LEAF_load_reg_263, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, ap_predicate_tran5to6_state4)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2) and ((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_1) or (ap_predicate_tran5to6_state4 = ap_const_boolean_1)))) then 
            ap_condition_pp0_flush_enable <= ap_const_logic_1;
        else 
            ap_condition_pp0_flush_enable <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_UnifiedRetVal_phi_fu_164_p4_assign_proc : process(r18_NODE_LEAF_load_reg_263, UnifiedRetVal_reg_160, ap_CS_fsm_state6)
    begin
        if (((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_phi_mux_UnifiedRetVal_phi_fu_164_p4 <= ap_const_lv1_0;
        else 
            ap_phi_mux_UnifiedRetVal_phi_fu_164_p4 <= UnifiedRetVal_reg_160;
        end if; 
    end process;


    ap_phi_mux_node_2_in_phi_fu_153_p4_assign_proc : process(node_2_in_reg_149, ap_CS_fsm_pp0_stage0, r18_NODE_LEAF_load_reg_263, tmp_reg_307, select_ln46_fu_232_p3, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (tmp_reg_307 = ap_const_lv1_0))) then 
            ap_phi_mux_node_2_in_phi_fu_153_p4 <= select_ln46_fu_232_p3;
        else 
            ap_phi_mux_node_2_in_phi_fu_153_p4 <= node_2_in_reg_149;
        end if; 
    end process;


    ap_predicate_tran5to6_state4_assign_proc : process(r18_NODE_LEAF_load_reg_263, tmp_fu_204_p3)
    begin
                ap_predicate_tran5to6_state4 <= ((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (tmp_fu_204_p3 = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_UnifiedRetVal_phi_fu_164_p4, ap_CS_fsm_state6, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_return <= ap_phi_mux_UnifiedRetVal_phi_fu_164_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    depth_1_fu_194_p2 <= std_logic_vector(unsigned(zext_ln31_fu_185_p1) + unsigned(ap_const_lv6_1));
    features_address0 <= zext_ln46_fu_189_p1(8 - 1 downto 0);
    features_ce0 <= features_ce0_local;

    features_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter0_reg, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            features_ce0_local <= ap_const_logic_1;
        else 
            features_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln46_fu_220_p2 <= "1" when (signed(sext_ln46_fu_217_p1) < signed(features_q0)) else "0";
    node_2_in_out <= node_2_in_reg_149;

    node_2_in_out_ap_vld_assign_proc : process(r18_NODE_LEAF_load_reg_263, ap_CS_fsm_state7, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state7) or ((r18_NODE_LEAF_load_reg_263 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6)))) then 
            node_2_in_out_ap_vld <= ap_const_logic_1;
        else 
            node_2_in_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    r18_NODE_FEAT_address0 <= zext_ln43_reg_250(11 - 1 downto 0);

    r18_NODE_FEAT_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_NODE_FEAT_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_FEAT_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_NODE_LEAF_address0 <= zext_ln43_fu_177_p1(11 - 1 downto 0);

    r18_NODE_LEAF_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_NODE_LEAF_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_LEAF_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_NODE_LEFT_address0 <= zext_ln43_reg_250(11 - 1 downto 0);

    r18_NODE_LEFT_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_NODE_LEFT_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_LEFT_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_NODE_RIGHT_address0 <= zext_ln43_reg_250(11 - 1 downto 0);

    r18_NODE_RIGHT_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_NODE_RIGHT_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_RIGHT_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_NODE_THR_address0 <= zext_ln43_reg_250(11 - 1 downto 0);

    r18_NODE_THR_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0_reg, ap_block_pp0_stage1_11001)
    begin
        if (((ap_enable_reg_pp0_iter0_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            r18_NODE_THR_ce0_local <= ap_const_logic_1;
        else 
            r18_NODE_THR_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    select_ln46_fu_232_p3 <= 
        r18_NODE_LEFT_load_reg_287 when (xor_ln46_fu_226_p2(0) = '1') else 
        r18_NODE_RIGHT_load_reg_292;
        sext_ln46_fu_217_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(r18_NODE_THR_load_reg_302),48));

    tmp_fu_204_p3 <= depth_1_fu_194_p2(5 downto 5);
    trunc_ln42_fu_200_p1 <= depth_1_fu_194_p2(5 - 1 downto 0);
    xor_ln46_fu_226_p2 <= (icmp_ln46_fu_220_p2 xor ap_const_lv1_1);
    zext_ln31_fu_185_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(depth_fu_54),6));
    zext_ln43_fu_177_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_node_2_in_phi_fu_153_p4),64));
    zext_ln46_fu_189_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r18_NODE_FEAT_q0),64));
end behav;
