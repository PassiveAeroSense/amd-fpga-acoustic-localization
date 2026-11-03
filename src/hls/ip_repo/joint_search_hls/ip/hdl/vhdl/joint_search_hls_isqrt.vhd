                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_isqrt is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (63 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of joint_search_hls_isqrt is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv6_1F : STD_LOGIC_VECTOR (5 downto 0) := "011111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv6_3F : STD_LOGIC_VECTOR (5 downto 0) := "111111";

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
    signal tmp_fu_80_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal rem_02_fu_44 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal rem_5_fu_193_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal root_fu_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal select_ln11_fu_185_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_52 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    signal add_ln7_fu_201_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal shl_ln9_fu_98_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln9_fu_104_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal lshr_ln9_fu_108_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln9_fu_94_p1 : STD_LOGIC_VECTOR (61 downto 0);
    signal trunc_ln9_1_fu_113_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal trial_fu_133_p3 : STD_LOGIC_VECTOR (33 downto 0);
    signal rem_fu_125_p3 : STD_LOGIC_VECTOR (65 downto 0);
    signal zext_ln10_fu_141_p1 : STD_LOGIC_VECTOR (65 downto 0);
    signal icmp_ln11_fu_159_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln9_fu_117_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln10_1_fu_145_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln11_fu_149_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal xor_ln11_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln_fu_177_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln11_fu_153_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal rem_4_fu_171_p2 : STD_LOGIC_VECTOR (63 downto 0);
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


    i_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_52 <= ap_const_lv6_1F;
                elsif (((tmp_fu_80_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_52 <= add_ln7_fu_201_p2;
                end if;
            end if; 
        end if;
    end process;

    rem_02_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    rem_02_fu_44 <= ap_const_lv64_0;
                elsif (((tmp_fu_80_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    rem_02_fu_44 <= rem_5_fu_193_p3;
                end if;
            end if; 
        end if;
    end process;

    root_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    root_fu_48 <= ap_const_lv32_0;
                elsif (((tmp_fu_80_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    root_fu_48 <= select_ln11_fu_185_p3;
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
    add_ln7_fu_201_p2 <= std_logic_vector(unsigned(i_fu_52) + unsigned(ap_const_lv6_3F));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, tmp_fu_80_p3)
    begin
        if (((tmp_fu_80_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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

    ap_return <= root_fu_48;
    icmp_ln11_fu_159_p2 <= "1" when (unsigned(rem_fu_125_p3) < unsigned(zext_ln10_fu_141_p1)) else "0";
    lshr_ln9_fu_108_p2 <= std_logic_vector(shift_right(unsigned(x),to_integer(unsigned('0' & zext_ln9_fu_104_p1(31-1 downto 0)))));
    or_ln9_fu_117_p3 <= (trunc_ln9_fu_94_p1 & trunc_ln9_1_fu_113_p1);
    or_ln_fu_177_p3 <= (trunc_ln11_fu_149_p1 & ap_const_lv1_1);
    rem_4_fu_171_p2 <= std_logic_vector(unsigned(or_ln9_fu_117_p3) - unsigned(zext_ln10_1_fu_145_p1));
    rem_5_fu_193_p3 <= 
        rem_4_fu_171_p2 when (xor_ln11_fu_165_p2(0) = '1') else 
        or_ln9_fu_117_p3;
    rem_fu_125_p3 <= (rem_02_fu_44 & trunc_ln9_1_fu_113_p1);
    select_ln11_fu_185_p3 <= 
        or_ln_fu_177_p3 when (xor_ln11_fu_165_p2(0) = '1') else 
        shl_ln11_fu_153_p2;
    shl_ln11_fu_153_p2 <= std_logic_vector(shift_left(unsigned(root_fu_48),to_integer(unsigned('0' & ap_const_lv32_1(31-1 downto 0)))));
    shl_ln9_fu_98_p2 <= std_logic_vector(shift_left(unsigned(i_fu_52),to_integer(unsigned('0' & ap_const_lv6_1(6-1 downto 0)))));
    tmp_fu_80_p3 <= i_fu_52(5 downto 5);
    trial_fu_133_p3 <= (root_fu_48 & ap_const_lv2_1);
    trunc_ln11_fu_149_p1 <= root_fu_48(31 - 1 downto 0);
    trunc_ln9_1_fu_113_p1 <= lshr_ln9_fu_108_p2(2 - 1 downto 0);
    trunc_ln9_fu_94_p1 <= rem_02_fu_44(62 - 1 downto 0);
    xor_ln11_fu_165_p2 <= (icmp_ln11_fu_159_p2 xor ap_const_lv1_1);
    zext_ln10_1_fu_145_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trial_fu_133_p3),64));
    zext_ln10_fu_141_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trial_fu_133_p3),66));
    zext_ln9_fu_104_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln9_fu_98_p2),64));
end behav;
