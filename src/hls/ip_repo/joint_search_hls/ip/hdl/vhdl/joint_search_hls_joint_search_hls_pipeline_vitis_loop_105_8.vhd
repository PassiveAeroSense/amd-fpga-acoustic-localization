                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mask : IN STD_LOGIC_VECTOR (11 downto 0);
    frequencies_out : OUT STD_LOGIC_VECTOR (3 downto 0);
    frequencies_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln105_fu_68_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal i_fu_34 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal i_5_fu_74_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i_4 : STD_LOGIC_VECTOR (3 downto 0);
    signal frequencies_fu_38 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal frequencies_1_fu_99_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_frequencies_load : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_fu_87_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_87_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln105_1_fu_95_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal tmp_fu_87_p0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1 IS
    generic (
        DATAWIDTH : INTEGER;
        ADDRWIDTH : INTEGER );
    port (
        din : IN STD_LOGIC_VECTOR (11 downto 0);
        sel : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
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
    bitselect_1ns_12ns_32ns_1_1_1_U35 : component joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1
    generic map (
        DATAWIDTH => 12,
        ADDRWIDTH => 32)
    port map (
        din => mask,
        sel => tmp_fu_87_p2,
        dout => tmp_fu_87_p3);

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
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    frequencies_fu_38_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln105_fu_68_p2 = ap_const_lv1_0)) then 
                    frequencies_fu_38 <= frequencies_1_fu_99_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    frequencies_fu_38 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;

    i_fu_34_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln105_fu_68_p2 = ap_const_lv1_0)) then 
                    i_fu_34 <= i_5_fu_74_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_34 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_block_state1_pp0_stage0_iter0)
    begin
        if ((ap_const_boolean_1 = ap_block_state1_pp0_stage0_iter0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start_int = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln105_fu_68_p2)
    begin
        if (((icmp_ln105_fu_68_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;
    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0)
    begin
        if (((ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_frequencies_load_assign_proc : process(ap_CS_fsm_state1, ap_loop_init, frequencies_fu_38)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_frequencies_load <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_frequencies_load <= frequencies_fu_38;
        end if; 
    end process;


    ap_sig_allocacmp_i_4_assign_proc : process(ap_CS_fsm_state1, i_fu_34, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_sig_allocacmp_i_4 <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_i_4 <= i_fu_34;
        end if; 
    end process;

    frequencies_1_fu_99_p2 <= std_logic_vector(unsigned(zext_ln105_1_fu_95_p1) + unsigned(ap_sig_allocacmp_frequencies_load));
    frequencies_out <= frequencies_fu_38;

    frequencies_out_ap_vld_assign_proc : process(ap_CS_fsm_state1, ap_block_state1_pp0_stage0_iter0, icmp_ln105_fu_68_p2, ap_loop_exit_ready)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln105_fu_68_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_state1_pp0_stage0_iter0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            frequencies_out_ap_vld <= ap_const_logic_1;
        else 
            frequencies_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    i_5_fu_74_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_4) + unsigned(ap_const_lv4_1));
    icmp_ln105_fu_68_p2 <= "1" when (ap_sig_allocacmp_i_4 = ap_const_lv4_C) else "0";
    tmp_fu_87_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_4),32));
    zext_ln105_1_fu_95_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_87_p3),4));
end behav;
