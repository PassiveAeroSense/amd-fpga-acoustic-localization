                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    z_4_ph : IN STD_LOGIC_VECTOR (31 downto 0);
    yy_ph_cast : IN STD_LOGIC_VECTOR (40 downto 0);
    sext_ln31 : IN STD_LOGIC_VECTOR (40 downto 0);
    mode : IN STD_LOGIC_VECTOR (0 downto 0);
    xor_ln25 : IN STD_LOGIC_VECTOR (0 downto 0);
    z_3_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    z_3_out_ap_vld : OUT STD_LOGIC;
    yy_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    yy_out_ap_vld : OUT STD_LOGIC;
    xx_out : OUT STD_LOGIC_VECTOR (43 downto 0);
    xx_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv5_1F : STD_LOGIC_VECTOR (4 downto 0) := "11111";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln31_fu_195_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_CORDIC_ATAN_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal r18_CORDIC_ATAN_q0 : STD_LOGIC_VECTOR (28 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_1_reg_487 : STD_LOGIC_VECTOR (4 downto 0);
    signal icmp_ln31_reg_492 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln31_fu_207_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal x_fu_80 : STD_LOGIC_VECTOR (43 downto 0) := "00000000000000000000000000000000000000000000";
    signal x_4_fu_356_p11 : STD_LOGIC_VECTOR (43 downto 0);
    signal sext_ln31_cast_fu_160_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal y_fu_84 : STD_LOGIC_VECTOR (43 downto 0) := "00000000000000000000000000000000000000000000";
    signal y_4_fu_380_p11 : STD_LOGIC_VECTOR (43 downto 0);
    signal yy_ph_cast_cast_fu_164_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal z_fu_88 : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000000000";
    signal z_4_fu_404_p11 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_4_ph_cast_fu_168_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal i_fu_92 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal add_ln31_fu_201_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_sig_allocacmp_i_1 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal r18_CORDIC_ATAN_ce0_local : STD_LOGIC;
    signal zext_ln35_1_fu_236_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal tmp_fu_249_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_263_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal shr_i42325_fu_283_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal ashr_ln35_fu_239_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal zext_ln35_fu_245_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal ashr_ln35_1_fu_277_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal xor_ln34_fu_257_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln35_fu_271_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln34_fu_331_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln35_fu_336_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln34_1_fu_341_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal x_4_fu_356_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal x_2_fu_307_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal x_4_fu_356_p8 : STD_LOGIC_VECTOR (43 downto 0);
    signal x_4_fu_356_p9 : STD_LOGIC_VECTOR (43 downto 0);
    signal sel_tmp5_fu_346_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal y_2_fu_295_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal y_3_fu_313_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal y_4_fu_380_p9 : STD_LOGIC_VECTOR (43 downto 0);
    signal z_2_fu_301_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_3_fu_319_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_4_fu_404_p9 : STD_LOGIC_VECTOR (32 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal x_4_fu_356_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal x_4_fu_356_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal x_4_fu_356_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal x_4_fu_356_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal y_4_fu_380_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal y_4_fu_380_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal y_4_fu_380_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal y_4_fu_380_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_fu_404_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_fu_404_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_fu_404_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_fu_404_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component cordic_hls_sparsemux_9_3_44_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (2 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (2 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (2 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (2 downto 0);
        din3_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (43 downto 0);
        din1 : IN STD_LOGIC_VECTOR (43 downto 0);
        din2 : IN STD_LOGIC_VECTOR (43 downto 0);
        din3 : IN STD_LOGIC_VECTOR (43 downto 0);
        def : IN STD_LOGIC_VECTOR (43 downto 0);
        sel : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (43 downto 0) );
    end component;


    component cordic_hls_sparsemux_9_3_33_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (2 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (2 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (2 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (2 downto 0);
        din3_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (32 downto 0);
        din1 : IN STD_LOGIC_VECTOR (32 downto 0);
        din2 : IN STD_LOGIC_VECTOR (32 downto 0);
        din3 : IN STD_LOGIC_VECTOR (32 downto 0);
        def : IN STD_LOGIC_VECTOR (32 downto 0);
        sel : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (32 downto 0) );
    end component;


    component cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (28 downto 0) );
    end component;


    component cordic_hls_flow_control_loop_pipe_sequential_init IS
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
    r18_CORDIC_ATAN_U : component cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R
    generic map (
        DataWidth => 29,
        AddressRange => 31,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_CORDIC_ATAN_address0,
        ce0 => r18_CORDIC_ATAN_ce0_local,
        q0 => r18_CORDIC_ATAN_q0);

    sparsemux_9_3_44_1_1_U1 : component cordic_hls_sparsemux_9_3_44_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "100",
        din0_WIDTH => 44,
        CASE1 => "010",
        din1_WIDTH => 44,
        CASE2 => "001",
        din2_WIDTH => 44,
        CASE3 => "000",
        din3_WIDTH => 44,
        def_WIDTH => 44,
        sel_WIDTH => 3,
        dout_WIDTH => 44)
    port map (
        din0 => x_4_fu_356_p2,
        din1 => x_2_fu_307_p2,
        din2 => x_2_fu_307_p2,
        din3 => x_4_fu_356_p8,
        def => x_4_fu_356_p9,
        sel => sel_tmp5_fu_346_p4,
        dout => x_4_fu_356_p11);

    sparsemux_9_3_44_1_1_U2 : component cordic_hls_sparsemux_9_3_44_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "100",
        din0_WIDTH => 44,
        CASE1 => "010",
        din1_WIDTH => 44,
        CASE2 => "001",
        din2_WIDTH => 44,
        CASE3 => "000",
        din3_WIDTH => 44,
        def_WIDTH => 44,
        sel_WIDTH => 3,
        dout_WIDTH => 44)
    port map (
        din0 => y_2_fu_295_p2,
        din1 => y_3_fu_313_p2,
        din2 => y_3_fu_313_p2,
        din3 => y_2_fu_295_p2,
        def => y_4_fu_380_p9,
        sel => sel_tmp5_fu_346_p4,
        dout => y_4_fu_380_p11);

    sparsemux_9_3_33_1_1_U3 : component cordic_hls_sparsemux_9_3_33_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "100",
        din0_WIDTH => 33,
        CASE1 => "010",
        din1_WIDTH => 33,
        CASE2 => "001",
        din2_WIDTH => 33,
        CASE3 => "000",
        din3_WIDTH => 33,
        def_WIDTH => 33,
        sel_WIDTH => 3,
        dout_WIDTH => 33)
    port map (
        din0 => z_2_fu_301_p2,
        din1 => z_3_fu_319_p2,
        din2 => z_3_fu_319_p2,
        din3 => z_2_fu_301_p2,
        def => z_4_fu_404_p9,
        sel => sel_tmp5_fu_346_p4,
        dout => z_4_fu_404_p11);

    flow_control_loop_pipe_sequential_init_U : component cordic_hls_flow_control_loop_pipe_sequential_init
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
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


    ap_loop_exit_ready_pp0_iter1_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if (((ap_loop_exit_ready = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                end if;
            end if; 
        end if;
    end process;

    i_fu_92_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln31_fu_195_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_92 <= add_ln31_fu_201_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_92 <= ap_const_lv5_0;
                end if;
            end if; 
        end if;
    end process;

    x_fu_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    x_fu_80 <= sext_ln31_cast_fu_160_p1;
                elsif (((icmp_ln31_reg_492 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    x_fu_80 <= x_4_fu_356_p11;
                end if;
            end if; 
        end if;
    end process;

    y_fu_84_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    y_fu_84 <= yy_ph_cast_cast_fu_164_p1;
                elsif (((icmp_ln31_reg_492 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    y_fu_84 <= y_4_fu_380_p11;
                end if;
            end if; 
        end if;
    end process;

    z_fu_88_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    z_fu_88 <= z_4_ph_cast_fu_168_p1;
                elsif (((icmp_ln31_reg_492 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    z_fu_88 <= z_4_fu_404_p11;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                i_1_reg_487 <= ap_sig_allocacmp_i_1;
                icmp_ln31_reg_492 <= icmp_ln31_fu_195_p2;
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
    add_ln31_fu_201_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_1) + unsigned(ap_const_lv5_1));
    and_ln34_1_fu_341_p2 <= (tmp_fu_249_p3 and mode);
    and_ln34_fu_331_p2 <= (xor_ln34_fu_257_p2 and mode);
    and_ln35_fu_336_p2 <= (xor_ln35_fu_271_p2 and xor_ln25);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln31_fu_195_p2)
    begin
        if (((icmp_ln31_fu_195_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready_pp0_iter1_reg, ap_done_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_i_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_92)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i_1 <= ap_const_lv5_0;
        else 
            ap_sig_allocacmp_i_1 <= i_fu_92;
        end if; 
    end process;

    ashr_ln35_1_fu_277_p2 <= std_logic_vector(shift_right(signed(y_fu_84),to_integer(unsigned('0' & zext_ln35_1_fu_236_p1(31-1 downto 0)))));
    ashr_ln35_fu_239_p2 <= std_logic_vector(shift_right(signed(x_fu_80),to_integer(unsigned('0' & zext_ln35_1_fu_236_p1(31-1 downto 0)))));
    icmp_ln31_fu_195_p2 <= "1" when (ap_sig_allocacmp_i_1 = ap_const_lv5_1F) else "0";
    r18_CORDIC_ATAN_address0 <= zext_ln31_fu_207_p1(5 - 1 downto 0);

    r18_CORDIC_ATAN_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_CORDIC_ATAN_ce0_local <= ap_const_logic_1;
        else 
            r18_CORDIC_ATAN_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    sel_tmp5_fu_346_p4 <= ((and_ln34_fu_331_p2 & and_ln35_fu_336_p2) & and_ln34_1_fu_341_p2);
        sext_ln31_cast_fu_160_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln31),44));

    shr_i42325_fu_283_p2 <= std_logic_vector(shift_right(unsigned(y_fu_84),to_integer(unsigned('0' & zext_ln35_1_fu_236_p1(31-1 downto 0)))));
    tmp_1_fu_263_p3 <= z_fu_88(32 downto 32);
    tmp_fu_249_p3 <= y_fu_84(43 downto 43);
    x_2_fu_307_p2 <= std_logic_vector(unsigned(x_fu_80) - unsigned(ashr_ln35_1_fu_277_p2));
    x_4_fu_356_p2 <= std_logic_vector(unsigned(x_fu_80) + unsigned(shr_i42325_fu_283_p2));
    x_4_fu_356_p8 <= std_logic_vector(unsigned(x_fu_80) + unsigned(ashr_ln35_1_fu_277_p2));
    x_4_fu_356_p9 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    xor_ln34_fu_257_p2 <= (tmp_fu_249_p3 xor ap_const_lv1_1);
    xor_ln35_fu_271_p2 <= (tmp_1_fu_263_p3 xor ap_const_lv1_1);
    xx_out <= x_fu_80;

    xx_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln31_reg_492, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((icmp_ln31_reg_492 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
            xx_out_ap_vld <= ap_const_logic_1;
        else 
            xx_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    y_2_fu_295_p2 <= std_logic_vector(unsigned(y_fu_84) - unsigned(ashr_ln35_fu_239_p2));
    y_3_fu_313_p2 <= std_logic_vector(unsigned(ashr_ln35_fu_239_p2) + unsigned(y_fu_84));
    y_4_fu_380_p9 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    yy_out <= y_fu_84(32 - 1 downto 0);

    yy_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln31_reg_492, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((icmp_ln31_reg_492 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
            yy_out_ap_vld <= ap_const_logic_1;
        else 
            yy_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        yy_ph_cast_cast_fu_164_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(yy_ph_cast),44));

    z_2_fu_301_p2 <= std_logic_vector(unsigned(z_fu_88) + unsigned(zext_ln35_fu_245_p1));
    z_3_fu_319_p2 <= std_logic_vector(unsigned(z_fu_88) - unsigned(zext_ln35_fu_245_p1));
    z_3_out <= z_fu_88(32 - 1 downto 0);

    z_3_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, icmp_ln31_reg_492, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((icmp_ln31_reg_492 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
            z_3_out_ap_vld <= ap_const_logic_1;
        else 
            z_3_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    z_4_fu_404_p9 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        z_4_ph_cast_fu_168_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(z_4_ph),33));

    zext_ln31_fu_207_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_1),64));
    zext_ln35_1_fu_236_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_1_reg_487),44));
    zext_ln35_fu_245_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r18_CORDIC_ATAN_q0),33));
end behav;
