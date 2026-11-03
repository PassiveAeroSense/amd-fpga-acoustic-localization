                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    seeds_x : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_x_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_x_2 : IN STD_LOGIC_VECTOR (31 downto 0);
    sext_ln116 : IN STD_LOGIC_VECTOR (15 downto 0);
    seeds_y : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_y_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_y_2 : IN STD_LOGIC_VECTOR (31 downto 0);
    sext_ln116_1 : IN STD_LOGIC_VECTOR (15 downto 0);
    seeds_z : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_z_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_z_2 : IN STD_LOGIC_VECTOR (31 downto 0);
    sext_ln116_2 : IN STD_LOGIC_VECTOR (15 downto 0);
    seeds_score : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_score_1 : IN STD_LOGIC_VECTOR (31 downto 0);
    seeds_score_2 : IN STD_LOGIC_VECTOR (31 downto 0);
    near_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    near_out_ap_vld : OUT STD_LOGIC;
    worst_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    worst_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_FFFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "11111111111111111111111111111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_80000001 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000001";
    constant ap_const_lv64_3D090 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000111101000010010000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln120_fu_232_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal sext_ln116_2_cast_fu_202_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_2_cast_reg_532 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_1_cast_fu_206_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_1_cast_reg_537 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_cast_fu_210_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_cast_reg_542 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln122_fu_190_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_reg_550 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_1_fu_194_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_1_reg_555 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_2_fu_198_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_2_reg_560 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln123_fu_352_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln123_reg_565 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln123_fu_358_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln123_reg_570 : STD_LOGIC_VECTOR (31 downto 0);
    signal worst_fu_74 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal worst_1_fu_385_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal near_fu_78 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal near_4_fu_426_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal near_1_fu_82 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal add_ln120_fu_238_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal mul_ln122_fu_190_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln122_fu_317_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_fu_190_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln122_1_fu_194_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln122_1_fu_323_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_1_fu_194_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln122_2_fu_198_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln122_2_fu_329_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln122_2_fu_198_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_251_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_251_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_6_fu_273_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_6_fu_273_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_7_fu_295_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_7_fu_295_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal dx_fu_268_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal dy_fu_290_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal dz_fu_312_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_fu_335_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_fu_335_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_3_fu_362_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_3_fu_362_p8 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_3_fu_362_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln124_fu_379_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln122_fu_406_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal dd_fu_410_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln123_1_fu_415_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln123_fu_421_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal tmp_5_fu_251_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_5_fu_251_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_5_fu_251_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_6_fu_273_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_6_fu_273_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_6_fu_273_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_7_fu_295_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_7_fu_295_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_7_fu_295_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_1_fu_335_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_1_fu_335_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_1_fu_335_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_3_fu_362_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_3_fu_362_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_3_fu_362_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_mul_32s_32s_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component joint_search_hls_sparsemux_7_2_32_1_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
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
    mul_32s_32s_64_1_1_U132 : component joint_search_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln122_fu_190_p0,
        din1 => mul_ln122_fu_190_p1,
        dout => mul_ln122_fu_190_p2);

    mul_32s_32s_64_1_1_U133 : component joint_search_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln122_1_fu_194_p0,
        din1 => mul_ln122_1_fu_194_p1,
        dout => mul_ln122_1_fu_194_p2);

    mul_32s_32s_64_1_1_U134 : component joint_search_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln122_2_fu_198_p0,
        din1 => mul_ln122_2_fu_198_p1,
        dout => mul_ln122_2_fu_198_p2);

    sparsemux_7_2_32_1_1_U135 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_x,
        din1 => seeds_x_1,
        din2 => seeds_x_2,
        def => tmp_5_fu_251_p7,
        sel => near_1_fu_82,
        dout => tmp_5_fu_251_p9);

    sparsemux_7_2_32_1_1_U136 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_y,
        din1 => seeds_y_1,
        din2 => seeds_y_2,
        def => tmp_6_fu_273_p7,
        sel => near_1_fu_82,
        dout => tmp_6_fu_273_p9);

    sparsemux_7_2_32_1_1_U137 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_z,
        din1 => seeds_z_1,
        din2 => seeds_z_2,
        def => tmp_7_fu_295_p7,
        sel => near_1_fu_82,
        dout => tmp_7_fu_295_p9);

    sparsemux_7_2_32_1_1_U138 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_score,
        din1 => seeds_score_1,
        din2 => seeds_score_2,
        def => tmp_1_fu_335_p7,
        sel => near_1_fu_82,
        dout => tmp_1_fu_335_p9);

    sparsemux_7_2_32_1_1_U139 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_score,
        din1 => seeds_score_1,
        din2 => seeds_score_2,
        def => tmp_3_fu_362_p7,
        sel => tmp_3_fu_362_p8,
        dout => tmp_3_fu_362_p9);

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
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
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
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    near_1_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    near_1_fu_82 <= ap_const_lv2_0;
                elsif (((icmp_ln120_fu_232_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    near_1_fu_82 <= add_ln120_fu_238_p2;
                end if;
            end if; 
        end if;
    end process;

    near_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    near_fu_78 <= ap_const_lv32_FFFFFFFF;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    near_fu_78 <= near_4_fu_426_p3;
                end if;
            end if; 
        end if;
    end process;

    worst_fu_74_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    worst_fu_74 <= ap_const_lv32_0;
                elsif (((icmp_ln120_fu_232_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    worst_fu_74 <= worst_1_fu_385_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln123_reg_565 <= icmp_ln123_fu_352_p2;
                mul_ln122_1_reg_555 <= mul_ln122_1_fu_194_p2;
                mul_ln122_2_reg_560 <= mul_ln122_2_fu_198_p2;
                mul_ln122_reg_550 <= mul_ln122_fu_190_p2;
                sext_ln116_1_cast_reg_537 <= sext_ln116_1_cast_fu_206_p1;
                sext_ln116_2_cast_reg_532 <= sext_ln116_2_cast_fu_202_p1;
                sext_ln116_cast_reg_542 <= sext_ln116_cast_fu_210_p1;
                    zext_ln123_reg_570(1 downto 0) <= zext_ln123_fu_358_p1(1 downto 0);
            end if;
        end if;
    end process;
    zext_ln123_reg_570(31 downto 2) <= "000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln120_fu_238_p2 <= std_logic_vector(unsigned(near_1_fu_82) + unsigned(ap_const_lv2_1));
    add_ln122_fu_406_p2 <= std_logic_vector(unsigned(mul_ln122_reg_550) + unsigned(mul_ln122_2_reg_560));
    and_ln123_fu_421_p2 <= (icmp_ln123_reg_565 and icmp_ln123_1_fu_415_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln120_fu_232_p2)
    begin
        if (((icmp_ln120_fu_232_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;
    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    dd_fu_410_p2 <= std_logic_vector(unsigned(add_ln122_fu_406_p2) + unsigned(mul_ln122_1_reg_555));
    dx_fu_268_p2 <= std_logic_vector(signed(sext_ln116_cast_reg_542) - signed(tmp_5_fu_251_p9));
    dy_fu_290_p2 <= std_logic_vector(signed(sext_ln116_1_cast_reg_537) - signed(tmp_6_fu_273_p9));
    dz_fu_312_p2 <= std_logic_vector(signed(sext_ln116_2_cast_reg_532) - signed(tmp_7_fu_295_p9));
    icmp_ln120_fu_232_p2 <= "1" when (near_1_fu_82 = ap_const_lv2_3) else "0";
    icmp_ln123_1_fu_415_p2 <= "1" when (signed(dd_fu_410_p2) < signed(ap_const_lv64_3D090)) else "0";
    icmp_ln123_fu_352_p2 <= "0" when (tmp_1_fu_335_p9 = ap_const_lv32_80000001) else "1";
    icmp_ln124_fu_379_p2 <= "1" when (signed(tmp_1_fu_335_p9) < signed(tmp_3_fu_362_p9)) else "0";
    mul_ln122_1_fu_194_p0 <= sext_ln122_1_fu_323_p1(32 - 1 downto 0);
    mul_ln122_1_fu_194_p1 <= sext_ln122_1_fu_323_p1(32 - 1 downto 0);
    mul_ln122_2_fu_198_p0 <= sext_ln122_2_fu_329_p1(32 - 1 downto 0);
    mul_ln122_2_fu_198_p1 <= sext_ln122_2_fu_329_p1(32 - 1 downto 0);
    mul_ln122_fu_190_p0 <= sext_ln122_fu_317_p1(32 - 1 downto 0);
    mul_ln122_fu_190_p1 <= sext_ln122_fu_317_p1(32 - 1 downto 0);
    near_4_fu_426_p3 <= 
        zext_ln123_reg_570 when (and_ln123_fu_421_p2(0) = '1') else 
        near_fu_78;
    near_out <= near_fu_78;

    near_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln120_fu_232_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln120_fu_232_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            near_out_ap_vld <= ap_const_logic_1;
        else 
            near_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln116_1_cast_fu_206_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln116_1),32));

        sext_ln116_2_cast_fu_202_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln116_2),32));

        sext_ln116_cast_fu_210_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln116),32));

        sext_ln122_1_fu_323_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(dy_fu_290_p2),64));

        sext_ln122_2_fu_329_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(dz_fu_312_p2),64));

        sext_ln122_fu_317_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(dx_fu_268_p2),64));

    tmp_1_fu_335_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_3_fu_362_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_3_fu_362_p8 <= worst_fu_74(2 - 1 downto 0);
    tmp_5_fu_251_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_6_fu_273_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_7_fu_295_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    worst_1_fu_385_p3 <= 
        zext_ln123_fu_358_p1 when (icmp_ln124_fu_379_p2(0) = '1') else 
        worst_fu_74;
    worst_out <= worst_fu_74;

    worst_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln120_fu_232_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln120_fu_232_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            worst_out_ap_vld <= ap_const_logic_1;
        else 
            worst_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln123_fu_358_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(near_1_fu_82),32));
end behav;
