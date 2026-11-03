                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    raw_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    raw_ce0 : OUT STD_LOGIC;
    raw_we0 : OUT STD_LOGIC;
    raw_d0 : OUT STD_LOGIC_VECTOR (47 downto 0);
    bands_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    bands_ce0 : OUT STD_LOGIC;
    bands_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
    features_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    features_ce0 : OUT STD_LOGIC;
    features_we0 : OUT STD_LOGIC;
    features_d0 : OUT STD_LOGIC_VECTOR (47 downto 0);
    sum_out : OUT STD_LOGIC_VECTOR (54 downto 0);
    sum_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv55_0 : STD_LOGIC_VECTOR (54 downto 0) := "0000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv7_61 : STD_LOGIC_VECTOR (6 downto 0) := "1100001";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";

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
    signal icmp_ln22_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal zext_ln22_fu_131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln22_reg_181 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal sum_fu_50 : STD_LOGIC_VECTOR (54 downto 0) := "0000000000000000000000000000000000000000000000000000000";
    signal sum_1_fu_148_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_54 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal add_ln22_fu_125_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_sig_allocacmp_i_4 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal bands_ce0_local : STD_LOGIC;
    signal raw_we0_local : STD_LOGIC;
    signal raw_ce0_local : STD_LOGIC;
    signal features_we0_local : STD_LOGIC;
    signal features_ce0_local : STD_LOGIC;
    signal sext_ln24_fu_144_p0 : STD_LOGIC_VECTOR (47 downto 0);
    signal sext_ln24_fu_144_p1 : STD_LOGIC_VECTOR (54 downto 0);
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


    i_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln22_fu_119_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_54 <= add_ln22_fu_125_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_54 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;

    sum_fu_50_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    sum_fu_50 <= ap_const_lv55_0;
                elsif ((ap_enable_reg_pp0_iter1 = ap_const_logic_1)) then 
                    sum_fu_50 <= sum_1_fu_148_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    zext_ln22_reg_181(6 downto 0) <= zext_ln22_fu_131_p1(6 downto 0);
            end if;
        end if;
    end process;
    zext_ln22_reg_181(63 downto 7) <= "000000000000000000000000000000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln22_fu_125_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_4) + unsigned(ap_const_lv7_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln22_fu_119_p2)
    begin
        if (((icmp_ln22_fu_119_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_sig_allocacmp_i_4_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_54)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i_4 <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_i_4 <= i_fu_54;
        end if; 
    end process;

    bands_address0 <= zext_ln22_fu_131_p1(7 - 1 downto 0);
    bands_ce0 <= bands_ce0_local;

    bands_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            bands_ce0_local <= ap_const_logic_1;
        else 
            bands_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    features_address0 <= zext_ln22_reg_181(8 - 1 downto 0);
    features_ce0 <= features_ce0_local;

    features_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            features_ce0_local <= ap_const_logic_1;
        else 
            features_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    features_d0 <= bands_q0;
    features_we0 <= features_we0_local;

    features_we0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            features_we0_local <= ap_const_logic_1;
        else 
            features_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln22_fu_119_p2 <= "1" when (ap_sig_allocacmp_i_4 = ap_const_lv7_61) else "0";
    raw_address0 <= zext_ln22_reg_181(7 - 1 downto 0);
    raw_ce0 <= raw_ce0_local;

    raw_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            raw_ce0_local <= ap_const_logic_1;
        else 
            raw_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    raw_d0 <= bands_q0;
    raw_we0 <= raw_we0_local;

    raw_we0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            raw_we0_local <= ap_const_logic_1;
        else 
            raw_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    sext_ln24_fu_144_p0 <= bands_q0;
        sext_ln24_fu_144_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln24_fu_144_p0),55));

    sum_1_fu_148_p2 <= std_logic_vector(signed(sext_ln24_fu_144_p1) + signed(sum_fu_50));
    sum_out <= sum_fu_50;

    sum_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln22_fu_119_p2, ap_loop_exit_ready, ap_block_pp0_stage0_11001)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (icmp_ln22_fu_119_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            sum_out_ap_vld <= ap_const_logic_1;
        else 
            sum_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln22_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_4),64));
end behav;
