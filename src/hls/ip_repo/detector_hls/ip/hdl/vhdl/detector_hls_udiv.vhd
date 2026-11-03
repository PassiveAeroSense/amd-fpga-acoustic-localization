                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector_hls_udiv is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    n : IN STD_LOGIC_VECTOR (53 downto 0);
    d_val : IN STD_LOGIC_VECTOR (5 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (47 downto 0) );
end;


architecture behav of detector_hls_udiv is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv7_3F : STD_LOGIC_VECTOR (6 downto 0) := "0111111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";

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
    signal tmp_fu_102_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal zext_ln15_fu_68_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln15_reg_233 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal conv_i4_cast5_cast_cast_fu_76_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal conv_i4_cast5_cast_cast_reg_238 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln19_fu_80_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln19_reg_243 : STD_LOGIC_VECTOR (63 downto 0);
    signal rem_fu_44 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal rem_1_fu_167_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal q_fu_48 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal q_1_fu_175_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_fu_52 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    signal i_3_fu_183_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal conv_i4_cast5_cast_fu_72_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln19_1_fu_116_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_fu_120_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln21_fu_127_p1 : STD_LOGIC_VECTOR (62 downto 0);
    signal rem_2_fu_131_p3 : STD_LOGIC_VECTOR (64 downto 0);
    signal rem_2_cast3_fu_139_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln21_fu_147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal rem_3_fu_152_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal q_2_fu_157_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal tmp_1_fu_120_p0 : STD_LOGIC_VECTOR (0 downto 0);
    signal q_2_fu_157_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component detector_hls_bitselect_1ns_64ns_32ns_1_1_1 IS
    generic (
        DATAWIDTH : INTEGER;
        ADDRWIDTH : INTEGER );
    port (
        din : IN STD_LOGIC_VECTOR (63 downto 0);
        sel : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component detector_hls_bitset_64ns_64ns_32ns_1s_64_1_1 IS
    generic (
        DATAWIDTH : INTEGER;
        ADDRWIDTH : INTEGER );
    port (
        din : IN STD_LOGIC_VECTOR (63 downto 0);
        sel : IN STD_LOGIC_VECTOR (31 downto 0);
        value : IN STD_LOGIC_VECTOR (0 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
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
    bitselect_1ns_64ns_32ns_1_1_1_U5 : component detector_hls_bitselect_1ns_64ns_32ns_1_1_1
    generic map (
        DATAWIDTH => 64,
        ADDRWIDTH => 32)
    port map (
        din => zext_ln15_reg_233,
        sel => zext_ln19_1_fu_116_p1,
        dout => tmp_1_fu_120_p3);

    bitset_64ns_64ns_32ns_1s_64_1_1_U6 : component detector_hls_bitset_64ns_64ns_32ns_1s_64_1_1
    generic map (
        DATAWIDTH => 64,
        ADDRWIDTH => 32)
    port map (
        din => q_fu_48,
        sel => zext_ln19_1_fu_116_p1,
        value => ap_const_lv1_1,
        dout => q_2_fu_157_p4);

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
                    i_fu_52 <= ap_const_lv7_3F;
                elsif (((tmp_fu_102_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_52 <= i_3_fu_183_p2;
                end if;
            end if; 
        end if;
    end process;

    q_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    q_fu_48 <= ap_const_lv64_0;
                elsif (((tmp_fu_102_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    q_fu_48 <= q_1_fu_175_p3;
                end if;
            end if; 
        end if;
    end process;

    rem_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    rem_fu_44 <= ap_const_lv64_0;
                elsif (((tmp_fu_102_p3 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    rem_fu_44 <= rem_1_fu_167_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    conv_i4_cast5_cast_cast_reg_238(6 downto 0) <= conv_i4_cast5_cast_cast_fu_76_p1(6 downto 0);
                    zext_ln15_reg_233(53 downto 0) <= zext_ln15_fu_68_p1(53 downto 0);
                    zext_ln19_reg_243(6 downto 0) <= zext_ln19_fu_80_p1(6 downto 0);
            end if;
        end if;
    end process;
    zext_ln15_reg_233(63 downto 54) <= "0000000000";
    conv_i4_cast5_cast_cast_reg_238(64 downto 7) <= "0000000000000000000000000000000000000000000000000000000000";
    zext_ln19_reg_243(63 downto 7) <= "000000000000000000000000000000000000000000000000000000000";

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
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, tmp_fu_102_p3)
    begin
        if (((tmp_fu_102_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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

    ap_return <= q_fu_48(48 - 1 downto 0);
    conv_i4_cast5_cast_cast_fu_76_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(conv_i4_cast5_cast_fu_72_p1),65));
        conv_i4_cast5_cast_fu_72_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(d_val),7));

    i_3_fu_183_p2 <= std_logic_vector(unsigned(i_fu_52) + unsigned(ap_const_lv7_7F));
    icmp_ln21_fu_147_p2 <= "1" when (unsigned(rem_2_fu_131_p3) < unsigned(conv_i4_cast5_cast_cast_reg_238)) else "0";
    q_1_fu_175_p3 <= 
        q_fu_48 when (icmp_ln21_fu_147_p2(0) = '1') else 
        q_2_fu_157_p4;
    rem_1_fu_167_p3 <= 
        rem_2_cast3_fu_139_p3 when (icmp_ln21_fu_147_p2(0) = '1') else 
        rem_3_fu_152_p2;
    rem_2_cast3_fu_139_p3 <= (trunc_ln21_fu_127_p1 & tmp_1_fu_120_p3);
    rem_2_fu_131_p3 <= (rem_fu_44 & tmp_1_fu_120_p3);
    rem_3_fu_152_p2 <= std_logic_vector(unsigned(rem_2_cast3_fu_139_p3) - unsigned(zext_ln19_reg_243));
    tmp_fu_102_p3 <= i_fu_52(6 downto 6);
    trunc_ln21_fu_127_p1 <= rem_fu_44(63 - 1 downto 0);
    zext_ln15_fu_68_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(n),64));
    zext_ln19_1_fu_116_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_52),32));
    zext_ln19_fu_80_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(conv_i4_cast5_cast_fu_72_p1),64));
end behav;
