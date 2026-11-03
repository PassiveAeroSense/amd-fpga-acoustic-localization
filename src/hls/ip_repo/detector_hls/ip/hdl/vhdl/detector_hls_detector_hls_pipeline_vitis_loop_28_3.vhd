                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls_detector_hls_Pipeline_VITIS_LOOP_28_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    zext_ln27_1 : IN STD_LOGIC_VECTOR (6 downto 0);
    raw_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    raw_ce0 : OUT STD_LOGIC;
    raw_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
    s_out : OUT STD_LOGIC_VECTOR (51 downto 0);
    s_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of detector_hls_detector_hls_Pipeline_VITIS_LOOP_28_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv52_0 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_5 : STD_LOGIC_VECTOR (3 downto 0) := "0101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv7_60 : STD_LOGIC_VECTOR (6 downto 0) := "1100000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";

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
    signal icmp_ln28_fu_97_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal zext_ln28_fu_147_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal s_fu_46 : STD_LOGIC_VECTOR (51 downto 0) := "0000000000000000000000000000000000000000000000000000";
    signal s_1_fu_170_p2 : STD_LOGIC_VECTOR (51 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal j_fu_50 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal j_3_fu_152_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_j_2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal raw_ce0_local : STD_LOGIC;
    signal icmp_ln28_fu_97_p0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln28_fu_103_p0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln28_fu_103_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln27_1_cast_fu_80_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal at_fu_107_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_fu_117_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln28_fu_113_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal at_1_fu_125_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal icmp_ln28_1_fu_133_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal at_2_fu_139_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal j_3_fu_152_p0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sext_ln28_1_fu_166_p1 : STD_LOGIC_VECTOR (51 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

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


    j_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln28_fu_97_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    j_fu_50 <= j_3_fu_152_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_50 <= ap_const_lv4_C;
                end if;
            end if; 
        end if;
    end process;

    s_fu_46_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    s_fu_46 <= ap_const_lv52_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    s_fu_46 <= s_1_fu_170_p2;
                end if;
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
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln28_fu_97_p2)
    begin
        if (((icmp_ln28_fu_97_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_sig_allocacmp_j_2_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, j_fu_50)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_j_2 <= ap_const_lv4_C;
        else 
            ap_sig_allocacmp_j_2 <= j_fu_50;
        end if; 
    end process;

    at_1_fu_125_p3 <= 
        ap_const_lv7_0 when (tmp_fu_117_p3(0) = '1') else 
        trunc_ln28_fu_113_p1;
    at_2_fu_139_p3 <= 
        ap_const_lv7_60 when (icmp_ln28_1_fu_133_p2(0) = '1') else 
        at_1_fu_125_p3;
    at_fu_107_p2 <= std_logic_vector(signed(sext_ln28_fu_103_p1) + signed(zext_ln27_1_cast_fu_80_p1));
    icmp_ln28_1_fu_133_p2 <= "1" when (unsigned(at_1_fu_125_p3) > unsigned(ap_const_lv7_60)) else "0";
    icmp_ln28_fu_97_p0 <= ap_sig_allocacmp_j_2;
    icmp_ln28_fu_97_p2 <= "1" when (icmp_ln28_fu_97_p0 = ap_const_lv4_5) else "0";
    j_3_fu_152_p0 <= ap_sig_allocacmp_j_2;
    j_3_fu_152_p2 <= std_logic_vector(signed(j_3_fu_152_p0) + signed(ap_const_lv4_1));
    raw_address0 <= zext_ln28_fu_147_p1(7 - 1 downto 0);
    raw_ce0 <= raw_ce0_local;

    raw_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            raw_ce0_local <= ap_const_logic_1;
        else 
            raw_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    s_1_fu_170_p2 <= std_logic_vector(signed(sext_ln28_1_fu_166_p1) + signed(s_fu_46));
    s_out <= s_fu_46;

    s_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln28_fu_97_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln28_fu_97_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            s_out_ap_vld <= ap_const_logic_1;
        else 
            s_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln28_1_fu_166_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(raw_q0),52));

    sext_ln28_fu_103_p0 <= ap_sig_allocacmp_j_2;
        sext_ln28_fu_103_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln28_fu_103_p0),8));

    tmp_fu_117_p3 <= at_fu_107_p2(7 downto 7);
    trunc_ln28_fu_113_p1 <= at_fu_107_p2(7 - 1 downto 0);
    zext_ln27_1_cast_fu_80_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln27_1),8));
    zext_ln28_fu_147_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(at_2_fu_139_p3),64));
end behav;
