                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    chosen_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    chosen_ce0 : OUT STD_LOGIC;
    chosen_we0 : OUT STD_LOGIC;
    chosen_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    blocked_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    blocked_ce0 : OUT STD_LOGIC;
    blocked_we0 : OUT STD_LOGIC;
    blocked_d0 : OUT STD_LOGIC_VECTOR (0 downto 0);
    blocked_q0 : IN STD_LOGIC_VECTOR (0 downto 0);
    blocked_address1 : OUT STD_LOGIC_VECTOR (8 downto 0);
    blocked_ce1 : OUT STD_LOGIC;
    blocked_we1 : OUT STD_LOGIC;
    blocked_d1 : OUT STD_LOGIC_VECTOR (0 downto 0);
    weights_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    weights_ce0 : OUT STD_LOGIC;
    weights_q0 : IN STD_LOGIC_VECTOR (19 downto 0) );
end;


architecture behav of joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv9_1FF : STD_LOGIC_VECTOR (8 downto 0) := "111111111";
    constant ap_const_lv32_109 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100001001";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal add_ln83_fu_117_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln83_reg_196 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal trunc_ln84_fu_130_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln84_reg_201 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln88_1_fu_157_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln88_1_reg_209 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln83_fu_111_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln83_fu_123_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln88_1_fu_135_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln88_fu_152_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln88_fu_140_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln88_2_fu_168_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal s_fu_38 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal chosen_we0_local : STD_LOGIC;
    signal chosen_ce0_local : STD_LOGIC;
    signal blocked_we1_local : STD_LOGIC;
    signal blocked_ce1_local : STD_LOGIC;
    signal blocked_we0_local : STD_LOGIC;
    signal blocked_ce0_local : STD_LOGIC;
    signal blocked_address0_local : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln88_fu_146_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln88_1_fu_163_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5 IS
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
    end component;



begin
    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready,
        blocked_address0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0,
        blocked_ce0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0,
        blocked_q0 => blocked_q0,
        weights_address0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0,
        weights_ce0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0,
        weights_q0 => weights_q0,
        bf_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out,
        bf_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out_ap_vld);





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


    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln83_fu_111_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    s_fu_38_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                s_fu_38 <= ap_const_lv4_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                s_fu_38 <= add_ln83_reg_196;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln83_reg_196 <= add_ln83_fu_117_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                icmp_ln88_1_reg_209 <= icmp_ln88_1_fu_157_p2;
                trunc_ln84_reg_201 <= trunc_ln84_fu_130_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done, icmp_ln83_fu_111_p2, ap_CS_fsm_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln83_fu_111_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    add_ln83_fu_117_p2 <= std_logic_vector(unsigned(s_fu_38) + unsigned(ap_const_lv4_1));
    add_ln88_1_fu_163_p2 <= std_logic_vector(unsigned(trunc_ln84_reg_201) + unsigned(ap_const_lv9_1));
    add_ln88_fu_146_p2 <= std_logic_vector(unsigned(trunc_ln84_fu_130_p1) + unsigned(ap_const_lv9_1FF));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done)
    begin
        if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln83_fu_111_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((icmp_ln83_fu_111_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln83_fu_111_p2)
    begin
        if (((icmp_ln83_fu_111_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    blocked_address0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0, ap_CS_fsm_state3, blocked_address0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            blocked_address0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0;
        else 
            blocked_address0 <= blocked_address0_local;
        end if; 
    end process;


    blocked_address0_local_assign_proc : process(ap_CS_fsm_state4, zext_ln88_fu_152_p1, zext_ln88_2_fu_168_p1, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            blocked_address0_local <= zext_ln88_2_fu_168_p1(9 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            blocked_address0_local <= zext_ln88_fu_152_p1(9 - 1 downto 0);
        else 
            blocked_address0_local <= "XXXXXXXXX";
        end if; 
    end process;

    blocked_address1 <= zext_ln88_1_fu_135_p1(9 - 1 downto 0);

    blocked_ce0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0, ap_CS_fsm_state3, blocked_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            blocked_ce0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0;
        else 
            blocked_ce0 <= blocked_ce0_local;
        end if; 
    end process;


    blocked_ce0_local_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            blocked_ce0_local <= ap_const_logic_1;
        else 
            blocked_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    blocked_ce1 <= blocked_ce1_local;

    blocked_ce1_local_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            blocked_ce1_local <= ap_const_logic_1;
        else 
            blocked_ce1_local <= ap_const_logic_0;
        end if; 
    end process;

    blocked_d0 <= ap_const_lv1_1;
    blocked_d1 <= ap_const_lv1_1;
    blocked_we0 <= blocked_we0_local;

    blocked_we0_local_assign_proc : process(ap_CS_fsm_state4, icmp_ln88_1_reg_209, icmp_ln88_fu_140_p2, ap_CS_fsm_state5)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln88_fu_140_p2 = ap_const_lv1_1)) or ((icmp_ln88_1_reg_209 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5)))) then 
            blocked_we0_local <= ap_const_logic_1;
        else 
            blocked_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    blocked_we1 <= blocked_we1_local;

    blocked_we1_local_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            blocked_we1_local <= ap_const_logic_1;
        else 
            blocked_we1_local <= ap_const_logic_0;
        end if; 
    end process;

    chosen_address0 <= zext_ln83_fu_123_p1(4 - 1 downto 0);
    chosen_ce0 <= chosen_ce0_local;

    chosen_ce0_local_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            chosen_ce0_local <= ap_const_logic_1;
        else 
            chosen_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    chosen_d0 <= trunc_ln84_fu_130_p1;
    chosen_we0 <= chosen_we0_local;

    chosen_we0_local_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            chosen_we0_local <= ap_const_logic_1;
        else 
            chosen_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg;
    icmp_ln83_fu_111_p2 <= "1" when (s_fu_38 = ap_const_lv4_C) else "0";
    icmp_ln88_1_fu_157_p2 <= "1" when (signed(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out) < signed(ap_const_lv32_109)) else "0";
    icmp_ln88_fu_140_p2 <= "1" when (signed(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out) > signed(ap_const_lv32_0)) else "0";
    trunc_ln84_fu_130_p1 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out(9 - 1 downto 0);
    weights_address0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0;
    weights_ce0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0;
    zext_ln83_fu_123_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(s_fu_38),64));
    zext_ln88_1_fu_135_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out),64));
    zext_ln88_2_fu_168_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln88_1_fu_163_p2),64));
    zext_ln88_fu_152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln88_fu_146_p2),64));
end behav;
