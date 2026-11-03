                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    blocked_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    blocked_ce0 : OUT STD_LOGIC;
    blocked_q0 : IN STD_LOGIC_VECTOR (0 downto 0);
    weights_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    weights_ce0 : OUT STD_LOGIC;
    weights_q0 : IN STD_LOGIC_VECTOR (19 downto 0);
    bf_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    bf_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_10A : STD_LOGIC_VECTOR (8 downto 0) := "100001010";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";

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
    signal icmp_ln84_fu_95_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal f_1_reg_205 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal zext_ln84_fu_107_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal best_fu_32 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal best_1_fu_153_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal bf_fu_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal bf_1_fu_161_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal f_fu_40 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal add_ln84_fu_101_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_f_1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal blocked_ce0_local : STD_LOGIC;
    signal weights_ce0_local : STD_LOGIC;
    signal zext_ln86_fu_124_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln86_fu_128_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln86_1_fu_142_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln86_fu_134_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln86_1_fu_145_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    best_fu_32_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    best_fu_32 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    best_fu_32 <= best_1_fu_153_p3;
                end if;
            end if; 
        end if;
    end process;

    bf_fu_36_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    bf_fu_36 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    bf_fu_36 <= bf_1_fu_161_p3;
                end if;
            end if; 
        end if;
    end process;

    f_fu_40_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln84_fu_95_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    f_fu_40 <= add_ln84_fu_101_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    f_fu_40 <= ap_const_lv9_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                f_1_reg_205 <= ap_sig_allocacmp_f_1;
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
    add_ln84_fu_101_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_f_1) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln84_fu_95_p2)
    begin
        if (((icmp_ln84_fu_95_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
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
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_start_int = ap_const_logic_0))) then 
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


    ap_sig_allocacmp_f_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, f_fu_40)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_f_1 <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_f_1 <= f_fu_40;
        end if; 
    end process;

    best_1_fu_153_p3 <= 
        best_fu_32 when (blocked_q0(0) = '1') else 
        select_ln86_fu_134_p3;
    bf_1_fu_161_p3 <= 
        bf_fu_36 when (blocked_q0(0) = '1') else 
        select_ln86_1_fu_145_p3;
    bf_out <= bf_fu_36;

    bf_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln84_fu_95_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln84_fu_95_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            bf_out_ap_vld <= ap_const_logic_1;
        else 
            bf_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    blocked_address0 <= zext_ln84_fu_107_p1(9 - 1 downto 0);
    blocked_ce0 <= blocked_ce0_local;

    blocked_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            blocked_ce0_local <= ap_const_logic_1;
        else 
            blocked_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln84_fu_95_p2 <= "1" when (ap_sig_allocacmp_f_1 = ap_const_lv9_10A) else "0";
    icmp_ln86_fu_128_p2 <= "1" when (unsigned(zext_ln86_fu_124_p1) > unsigned(best_fu_32)) else "0";
    select_ln86_1_fu_145_p3 <= 
        zext_ln86_1_fu_142_p1 when (icmp_ln86_fu_128_p2(0) = '1') else 
        bf_fu_36;
    select_ln86_fu_134_p3 <= 
        zext_ln86_fu_124_p1 when (icmp_ln86_fu_128_p2(0) = '1') else 
        best_fu_32;
    weights_address0 <= zext_ln84_fu_107_p1(9 - 1 downto 0);
    weights_ce0 <= weights_ce0_local;

    weights_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            weights_ce0_local <= ap_const_logic_1;
        else 
            weights_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln84_fu_107_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_f_1),64));
    zext_ln86_1_fu_142_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(f_1_reg_205),32));
    zext_ln86_fu_124_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(weights_q0),32));
end behav;
