                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    covariance_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    covariance_ce0 : OUT STD_LOGIC;
    covariance_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    trace_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    trace_ce0 : OUT STD_LOGIC;
    trace_we0 : OUT STD_LOGIC;
    trace_d0 : OUT STD_LOGIC_VECTOR (39 downto 0);
    blocked_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    blocked_ce0 : OUT STD_LOGIC;
    blocked_we0 : OUT STD_LOGIC;
    blocked_d0 : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv40_0 : STD_LOGIC_VECTOR (39 downto 0) := "0000000000000000000000000000000000000000";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv13_10A0 : STD_LOGIC_VECTOR (12 downto 0) := "1000010100000";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv5_10 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";

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
    signal icmp_ln72_fu_146_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln73_fu_164_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln73_reg_342 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln73_reg_342_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln73_1_fu_245_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln73_1_reg_352 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln73_1_reg_352_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal trace_addr_reg_356 : STD_LOGIC_VECTOR (8 downto 0);
    signal trace_addr_reg_356_pp0_iter1_reg : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln75_1_fu_234_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln72_fu_192_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sum_fu_68 : STD_LOGIC_VECTOR (39 downto 0) := "0000000000000000000000000000000000000000";
    signal sum_2_fu_296_p3 : STD_LOGIC_VECTOR (39 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal c_fu_72 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal add_ln73_fu_239_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_sig_allocacmp_c_load : STD_LOGIC_VECTOR (4 downto 0);
    signal f_fu_76 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal select_ln72_2_fu_184_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_allocacmp_f_load : STD_LOGIC_VECTOR (8 downto 0);
    signal indvar_flatten_fu_80 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    signal add_ln72_fu_152_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_sig_allocacmp_indvar_flatten_load : STD_LOGIC_VECTOR (12 downto 0);
    signal covariance_ce0_local : STD_LOGIC;
    signal blocked_we0_local : STD_LOGIC;
    signal blocked_ce0_local : STD_LOGIC;
    signal trace_we0_local : STD_LOGIC;
    signal trace_ce0_local : STD_LOGIC;
    signal add_ln72_1_fu_178_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_fu_206_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal p_shl_fu_198_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln73_fu_214_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal select_ln72_fu_170_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln73_1_fu_224_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln73_1_fu_218_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln75_fu_228_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal v_fu_276_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln72_1_fu_269_p3 : STD_LOGIC_VECTOR (39 downto 0);
    signal zext_ln75_fu_286_p1 : STD_LOGIC_VECTOR (39 downto 0);
    signal icmp_ln75_fu_280_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sum_1_fu_290_p2 : STD_LOGIC_VECTOR (39 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    c_fu_72_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln72_fu_146_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    c_fu_72 <= add_ln73_fu_239_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    c_fu_72 <= ap_const_lv5_0;
                end if;
            end if; 
        end if;
    end process;

    f_fu_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln72_fu_146_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    f_fu_76 <= select_ln72_2_fu_184_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    f_fu_76 <= ap_const_lv9_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln72_fu_146_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    indvar_flatten_fu_80 <= add_ln72_fu_152_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_80 <= ap_const_lv13_0;
                end if;
            end if; 
        end if;
    end process;

    sum_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    sum_fu_68 <= ap_const_lv40_0;
                elsif ((ap_enable_reg_pp0_iter2 = ap_const_logic_1)) then 
                    sum_fu_68 <= sum_2_fu_296_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                icmp_ln73_1_reg_352 <= icmp_ln73_1_fu_245_p2;
                icmp_ln73_1_reg_352_pp0_iter1_reg <= icmp_ln73_1_reg_352;
                icmp_ln73_reg_342 <= icmp_ln73_fu_164_p2;
                icmp_ln73_reg_342_pp0_iter1_reg <= icmp_ln73_reg_342;
                trace_addr_reg_356 <= zext_ln72_fu_192_p1(9 - 1 downto 0);
                trace_addr_reg_356_pp0_iter1_reg <= trace_addr_reg_356;
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
    add_ln72_1_fu_178_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_f_load) + unsigned(ap_const_lv9_1));
    add_ln72_fu_152_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten_load) + unsigned(ap_const_lv13_1));
    add_ln73_1_fu_218_p2 <= std_logic_vector(unsigned(p_shl_fu_198_p3) + unsigned(zext_ln73_fu_214_p1));
    add_ln73_fu_239_p2 <= std_logic_vector(unsigned(select_ln72_fu_170_p3) + unsigned(ap_const_lv5_1));
    add_ln75_fu_228_p2 <= std_logic_vector(unsigned(zext_ln73_1_fu_224_p1) + unsigned(add_ln73_1_fu_218_p2));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln72_fu_146_p2)
    begin
        if (((icmp_ln72_fu_146_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_sig_allocacmp_c_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, c_fu_72)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_c_load <= ap_const_lv5_0;
        else 
            ap_sig_allocacmp_c_load <= c_fu_72;
        end if; 
    end process;


    ap_sig_allocacmp_f_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, f_fu_76)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_f_load <= ap_const_lv9_0;
        else 
            ap_sig_allocacmp_f_load <= f_fu_76;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, indvar_flatten_fu_80)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_indvar_flatten_load <= ap_const_lv13_0;
        else 
            ap_sig_allocacmp_indvar_flatten_load <= indvar_flatten_fu_80;
        end if; 
    end process;

    blocked_address0 <= zext_ln72_fu_192_p1(9 - 1 downto 0);
    blocked_ce0 <= blocked_ce0_local;

    blocked_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            blocked_ce0_local <= ap_const_logic_1;
        else 
            blocked_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    blocked_d0 <= ap_const_lv1_0;
    blocked_we0 <= blocked_we0_local;

    blocked_we0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, icmp_ln72_fu_146_p2, ap_block_pp0_stage0_11001, icmp_ln73_1_fu_245_p2)
    begin
        if (((icmp_ln73_1_fu_245_p2 = ap_const_lv1_1) and (icmp_ln72_fu_146_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            blocked_we0_local <= ap_const_logic_1;
        else 
            blocked_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    covariance_address0 <= zext_ln75_1_fu_234_p1(16 - 1 downto 0);
    covariance_ce0 <= covariance_ce0_local;

    covariance_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            covariance_ce0_local <= ap_const_logic_1;
        else 
            covariance_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln72_fu_146_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten_load = ap_const_lv13_10A0) else "0";
    icmp_ln73_1_fu_245_p2 <= "1" when (add_ln73_fu_239_p2 = ap_const_lv5_10) else "0";
    icmp_ln73_fu_164_p2 <= "1" when (ap_sig_allocacmp_c_load = ap_const_lv5_10) else "0";
    icmp_ln75_fu_280_p2 <= "1" when (signed(v_fu_276_p1) > signed(ap_const_lv32_0)) else "0";
    p_shl_fu_198_p3 <= (select_ln72_2_fu_184_p3 & ap_const_lv7_0);
    select_ln72_1_fu_269_p3 <= 
        ap_const_lv40_0 when (icmp_ln73_reg_342_pp0_iter1_reg(0) = '1') else 
        sum_fu_68;
    select_ln72_2_fu_184_p3 <= 
        add_ln72_1_fu_178_p2 when (icmp_ln73_fu_164_p2(0) = '1') else 
        ap_sig_allocacmp_f_load;
    select_ln72_fu_170_p3 <= 
        ap_const_lv5_0 when (icmp_ln73_fu_164_p2(0) = '1') else 
        ap_sig_allocacmp_c_load;
    sum_1_fu_290_p2 <= std_logic_vector(unsigned(select_ln72_1_fu_269_p3) + unsigned(zext_ln75_fu_286_p1));
    sum_2_fu_296_p3 <= 
        sum_1_fu_290_p2 when (icmp_ln75_fu_280_p2(0) = '1') else 
        select_ln72_1_fu_269_p3;
    tmp_fu_206_p3 <= (select_ln72_2_fu_184_p3 & ap_const_lv3_0);
    trace_address0 <= trace_addr_reg_356_pp0_iter1_reg;
    trace_ce0 <= trace_ce0_local;

    trace_ce0_local_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            trace_ce0_local <= ap_const_logic_1;
        else 
            trace_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    trace_d0 <= sum_2_fu_296_p3;
    trace_we0 <= trace_we0_local;

    trace_we0_local_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001, icmp_ln73_1_reg_352_pp0_iter1_reg)
    begin
        if (((icmp_ln73_1_reg_352_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            trace_we0_local <= ap_const_logic_1;
        else 
            trace_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    v_fu_276_p1 <= covariance_q0(32 - 1 downto 0);
    zext_ln72_fu_192_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln72_2_fu_184_p3),64));
    zext_ln73_1_fu_224_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln72_fu_170_p3),16));
    zext_ln73_fu_214_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_206_p3),16));
    zext_ln75_1_fu_234_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln75_fu_228_p2),64));
    zext_ln75_fu_286_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(v_fu_276_p1),40));
end behav;
