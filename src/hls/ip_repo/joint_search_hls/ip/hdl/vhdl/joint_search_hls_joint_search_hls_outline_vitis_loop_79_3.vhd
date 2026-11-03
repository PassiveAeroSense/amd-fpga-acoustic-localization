                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    trace_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    trace_ce0 : OUT STD_LOGIC;
    trace_q0 : IN STD_LOGIC_VECTOR (39 downto 0);
    trace_address1 : OUT STD_LOGIC_VECTOR (8 downto 0);
    trace_ce1 : OUT STD_LOGIC;
    trace_q1 : IN STD_LOGIC_VECTOR (39 downto 0);
    weights_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    weights_ce0 : OUT STD_LOGIC;
    weights_we0 : OUT STD_LOGIC;
    weights_d0 : OUT STD_LOGIC_VECTOR (19 downto 0);
    grp_udiv_fu_2193_p_din1 : OUT STD_LOGIC_VECTOR (55 downto 0);
    grp_udiv_fu_2193_p_din2 : OUT STD_LOGIC_VECTOR (41 downto 0);
    grp_udiv_fu_2193_p_dout0 : IN STD_LOGIC_VECTOR (63 downto 0);
    grp_udiv_fu_2193_p_start : OUT STD_LOGIC;
    grp_udiv_fu_2193_p_ready : IN STD_LOGIC;
    grp_udiv_fu_2193_p_done : IN STD_LOGIC;
    grp_udiv_fu_2193_p_idle : IN STD_LOGIC );
end;


architecture behav of joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3 is 
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
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv9_10A : STD_LOGIC_VECTOR (8 downto 0) := "100001010";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv9_6 : STD_LOGIC_VECTOR (8 downto 0) := "000000110";
    constant ap_const_lv9_1FA : STD_LOGIC_VECTOR (8 downto 0) := "111111010";
    constant ap_const_lv9_103 : STD_LOGIC_VECTOR (8 downto 0) := "100000011";
    constant ap_const_lv9_109 : STD_LOGIC_VECTOR (8 downto 0) := "100001001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv9_EB : STD_LOGIC_VECTOR (8 downto 0) := "011101011";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv41_1 : STD_LOGIC_VECTOR (40 downto 0) := "00000000000000000000000000000000000000001";
    constant ap_const_lv64_A000 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000001010000000000000";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv44_0 : STD_LOGIC_VECTOR (43 downto 0) := "00000000000000000000000000000000000000000000";
    constant ap_const_lv20_FFFFF : STD_LOGIC_VECTOR (19 downto 0) := "11111111111111111111";
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal f_reg_307 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal zext_ln79_fu_138_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln79_reg_320 : STD_LOGIC_VECTOR (63 downto 0);
    signal trace_load_reg_330 : STD_LOGIC_VECTOR (39 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln81_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln81_reg_345 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln81_1_fu_209_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln81_1_reg_350 : STD_LOGIC_VECTOR (0 downto 0);
    signal n_fu_214_p3 : STD_LOGIC_VECTOR (55 downto 0);
    signal n_reg_355 : STD_LOGIC_VECTOR (55 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal zext_ln80_4_fu_242_p1 : STD_LOGIC_VECTOR (41 downto 0);
    signal zext_ln80_4_reg_360 : STD_LOGIC_VECTOR (41 downto 0);
    signal grp_udiv_fu_112_ap_done : STD_LOGIC;
    signal grp_udiv_fu_112_ap_ready : STD_LOGIC;
    signal grp_udiv_fu_112_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal icmp_ln79_fu_126_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln80_fu_166_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln80_2_fu_189_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal f_1_fu_62 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal add_ln79_fu_132_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal trace_ce0_local : STD_LOGIC;
    signal trace_address0_local : STD_LOGIC_VECTOR (8 downto 0);
    signal trace_ce1_local : STD_LOGIC;
    signal weights_we0_local : STD_LOGIC;
    signal select_ln81_1_fu_291_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal weights_ce0_local : STD_LOGIC;
    signal icmp_ln80_fu_148_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln80_fu_153_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln80_fu_158_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal icmp_ln80_1_fu_171_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln80_1_fu_176_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln80_1_fu_181_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_fu_194_p4 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln80_3_fu_226_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal add_ln80_2_fu_230_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal zext_ln80_1_fu_222_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal d_fu_236_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal icmp_ln81_2_fu_247_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln81_fu_253_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_fu_263_p4 : STD_LOGIC_VECTOR (43 downto 0);
    signal icmp_ln81_3_fu_273_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln81_fu_279_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal and_ln81_1_fu_258_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln81_fu_283_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_udiv IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        n : IN STD_LOGIC_VECTOR (55 downto 0);
        d : IN STD_LOGIC_VECTOR (41 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin




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


    grp_udiv_fu_112_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_udiv_fu_112_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_udiv_fu_112_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_udiv_fu_112_ap_ready = ap_const_logic_1)) then 
                    grp_udiv_fu_112_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    f_1_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                f_1_fu_62 <= ap_const_lv9_0;
            elsif (((icmp_ln79_fu_126_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                f_1_fu_62 <= add_ln79_fu_132_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                f_reg_307 <= f_1_fu_62;
                    zext_ln79_reg_320(8 downto 0) <= zext_ln79_fu_138_p1(8 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                icmp_ln81_1_reg_350 <= icmp_ln81_1_fu_209_p2;
                icmp_ln81_reg_345 <= icmp_ln81_fu_203_p2;
                trace_load_reg_330 <= trace_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                    n_reg_355(55 downto 16) <= n_fu_214_p3(55 downto 16);
                    zext_ln80_4_reg_360(40 downto 0) <= zext_ln80_4_fu_242_p1(40 downto 0);
            end if;
        end if;
    end process;
    zext_ln79_reg_320(63 downto 9) <= "0000000000000000000000000000000000000000000000000000000";
    n_reg_355(15 downto 0) <= "0000000000000000";
    zext_ln80_4_reg_360(41) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_udiv_fu_112_ap_done, ap_CS_fsm_state5, icmp_ln79_fu_126_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln79_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_udiv_fu_112_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    add_ln79_fu_132_p2 <= std_logic_vector(unsigned(f_1_fu_62) + unsigned(ap_const_lv9_1));
    add_ln80_1_fu_176_p2 <= std_logic_vector(unsigned(f_reg_307) + unsigned(ap_const_lv9_6));
    add_ln80_2_fu_230_p2 <= std_logic_vector(unsigned(zext_ln80_3_fu_226_p1) + unsigned(ap_const_lv41_1));
    add_ln80_fu_153_p2 <= std_logic_vector(unsigned(f_reg_307) + unsigned(ap_const_lv9_1FA));
    and_ln81_1_fu_258_p2 <= (icmp_ln81_reg_345 and and_ln81_fu_253_p2);
    and_ln81_fu_253_p2 <= (icmp_ln81_2_fu_247_p2 and icmp_ln81_1_reg_350);
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
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_udiv_fu_112_ap_done)
    begin
        if ((grp_udiv_fu_112_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln79_fu_126_p2)
    begin
        if ((((icmp_ln79_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln79_fu_126_p2)
    begin
        if (((icmp_ln79_fu_126_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    d_fu_236_p2 <= std_logic_vector(unsigned(add_ln80_2_fu_230_p2) + unsigned(zext_ln80_1_fu_222_p1));
    grp_udiv_fu_112_ap_done <= grp_udiv_fu_2193_p_done;
    grp_udiv_fu_112_ap_ready <= grp_udiv_fu_2193_p_ready;
    grp_udiv_fu_2193_p_din1 <= n_reg_355;
    grp_udiv_fu_2193_p_din2 <= zext_ln80_4_reg_360;
    grp_udiv_fu_2193_p_start <= grp_udiv_fu_112_ap_start_reg;
    icmp_ln79_fu_126_p2 <= "1" when (f_1_fu_62 = ap_const_lv9_10A) else "0";
    icmp_ln80_1_fu_171_p2 <= "1" when (unsigned(f_reg_307) > unsigned(ap_const_lv9_103)) else "0";
    icmp_ln80_fu_148_p2 <= "1" when (unsigned(f_reg_307) < unsigned(ap_const_lv9_6)) else "0";
    icmp_ln81_1_fu_209_p2 <= "1" when (unsigned(f_reg_307) < unsigned(ap_const_lv9_EB)) else "0";
    icmp_ln81_2_fu_247_p2 <= "1" when (unsigned(grp_udiv_fu_2193_p_dout0) > unsigned(ap_const_lv64_A000)) else "0";
    icmp_ln81_3_fu_273_p2 <= "0" when (tmp_9_fu_263_p4 = ap_const_lv44_0) else "1";
    icmp_ln81_fu_203_p2 <= "0" when (tmp_fu_194_p4 = ap_const_lv6_0) else "1";
    n_fu_214_p3 <= (trace_load_reg_330 & ap_const_lv16_0);
    select_ln80_1_fu_181_p3 <= 
        ap_const_lv9_109 when (icmp_ln80_1_fu_171_p2(0) = '1') else 
        add_ln80_1_fu_176_p2;
    select_ln80_fu_158_p3 <= 
        ap_const_lv9_0 when (icmp_ln80_fu_148_p2(0) = '1') else 
        add_ln80_fu_153_p2;
    select_ln81_1_fu_291_p3 <= 
        select_ln81_fu_283_p3 when (and_ln81_1_fu_258_p2(0) = '1') else 
        ap_const_lv20_0;
    select_ln81_fu_283_p3 <= 
        ap_const_lv20_FFFFF when (icmp_ln81_3_fu_273_p2(0) = '1') else 
        trunc_ln81_fu_279_p1;
    tmp_9_fu_263_p4 <= grp_udiv_fu_2193_p_dout0(63 downto 20);
    tmp_fu_194_p4 <= f_reg_307(8 downto 3);
    trace_address0 <= trace_address0_local;

    trace_address0_local_assign_proc : process(ap_CS_fsm_state2, zext_ln79_fu_138_p1, ap_CS_fsm_state3, zext_ln80_2_fu_189_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            trace_address0_local <= zext_ln80_2_fu_189_p1(9 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            trace_address0_local <= zext_ln79_fu_138_p1(9 - 1 downto 0);
        else 
            trace_address0_local <= "XXXXXXXXX";
        end if; 
    end process;

    trace_address1 <= zext_ln80_fu_166_p1(9 - 1 downto 0);
    trace_ce0 <= trace_ce0_local;

    trace_ce0_local_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            trace_ce0_local <= ap_const_logic_1;
        else 
            trace_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    trace_ce1 <= trace_ce1_local;

    trace_ce1_local_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            trace_ce1_local <= ap_const_logic_1;
        else 
            trace_ce1_local <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln81_fu_279_p1 <= grp_udiv_fu_2193_p_dout0(20 - 1 downto 0);
    weights_address0 <= zext_ln79_reg_320(9 - 1 downto 0);
    weights_ce0 <= weights_ce0_local;

    weights_ce0_local_assign_proc : process(grp_udiv_fu_112_ap_done, ap_CS_fsm_state5)
    begin
        if (((grp_udiv_fu_112_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            weights_ce0_local <= ap_const_logic_1;
        else 
            weights_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    weights_d0 <= select_ln81_1_fu_291_p3;
    weights_we0 <= weights_we0_local;

    weights_we0_local_assign_proc : process(grp_udiv_fu_112_ap_done, ap_CS_fsm_state5)
    begin
        if (((grp_udiv_fu_112_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            weights_we0_local <= ap_const_logic_1;
        else 
            weights_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln79_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(f_1_fu_62),64));
    zext_ln80_1_fu_222_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trace_q1),41));
    zext_ln80_2_fu_189_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln80_1_fu_181_p3),64));
    zext_ln80_3_fu_226_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trace_q0),41));
    zext_ln80_4_fu_242_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(d_fu_236_p2),42));
    zext_ln80_fu_166_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln80_fu_158_p3),64));
end behav;
