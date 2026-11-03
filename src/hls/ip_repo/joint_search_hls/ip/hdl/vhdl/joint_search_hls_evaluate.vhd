                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_evaluate is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (31 downto 0);
    y : IN STD_LOGIC_VECTOR (31 downto 0);
    z : IN STD_LOGIC_VECTOR (31 downto 0);
    obs_address0 : OUT STD_LOGIC_VECTOR (10 downto 0);
    obs_ce0 : OUT STD_LOGIC;
    obs_q0 : IN STD_LOGIC_VECTOR (77 downto 0);
    count : IN STD_LOGIC_VECTOR (30 downto 0);
    baseline_two : IN STD_LOGIC_VECTOR (0 downto 0);
    reciprocal_0_0_val : IN STD_LOGIC_VECTOR (31 downto 0);
    reciprocal_0_1_val : IN STD_LOGIC_VECTOR (31 downto 0);
    reciprocal_0_2_val : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (63 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (63 downto 0);
    ap_return_3 : OUT STD_LOGIC_VECTOR (63 downto 0) );
end;


architecture behav of joint_search_hls_evaluate is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal sg_0_assign_1_reg_267 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal sg_1_assign_1_reg_273 : STD_LOGIC_VECTOR (63 downto 0);
    signal sg_2_assign_1_reg_279 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_118_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal v1_reg_285 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal v2_fu_122_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal v2_reg_290 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_s_fu_154_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_s_reg_295 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln55_1_fu_174_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln55_1_reg_300 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_candidate_score_fu_96_ap_start : STD_LOGIC;
    signal grp_candidate_score_fu_96_ap_done : STD_LOGIC;
    signal grp_candidate_score_fu_96_ap_idle : STD_LOGIC;
    signal grp_candidate_score_fu_96_ap_ready : STD_LOGIC;
    signal grp_candidate_score_fu_96_obs_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_candidate_score_fu_96_obs_ce0 : STD_LOGIC;
    signal grp_candidate_score_fu_96_ap_return_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_fu_96_ap_return_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_fu_96_ap_return_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_candidate_score_fu_96_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_fu_118_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_118_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln54_1_fu_138_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln54_fu_182_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal v2_fu_122_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln55_2_fu_148_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_fu_164_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln55_1_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_197_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln55_fu_187_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln55_fu_207_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln55_2_fu_214_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_return_0_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_return_1_preg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_return_2_preg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_return_3_preg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal v2_fu_122_p10 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_candidate_score IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        cx : IN STD_LOGIC_VECTOR (31 downto 0);
        cy : IN STD_LOGIC_VECTOR (31 downto 0);
        cz : IN STD_LOGIC_VECTOR (31 downto 0);
        obs_address0 : OUT STD_LOGIC_VECTOR (10 downto 0);
        obs_ce0 : OUT STD_LOGIC;
        obs_q0 : IN STD_LOGIC_VECTOR (77 downto 0);
        count : IN STD_LOGIC_VECTOR (30 downto 0);
        baseline_two : IN STD_LOGIC_VECTOR (0 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (63 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component joint_search_hls_mul_64s_32ns_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin
    grp_candidate_score_fu_96 : component joint_search_hls_candidate_score
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_candidate_score_fu_96_ap_start,
        ap_done => grp_candidate_score_fu_96_ap_done,
        ap_idle => grp_candidate_score_fu_96_ap_idle,
        ap_ready => grp_candidate_score_fu_96_ap_ready,
        cx => x,
        cy => y,
        cz => z,
        obs_address0 => grp_candidate_score_fu_96_obs_address0,
        obs_ce0 => grp_candidate_score_fu_96_obs_ce0,
        obs_q0 => obs_q0,
        count => count,
        baseline_two => baseline_two,
        ap_return_0 => grp_candidate_score_fu_96_ap_return_0,
        ap_return_1 => grp_candidate_score_fu_96_ap_return_1,
        ap_return_2 => grp_candidate_score_fu_96_ap_return_2);

    mul_64s_32ns_64_1_1_U120 : component joint_search_hls_mul_64s_32ns_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 64,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => grp_fu_118_p0,
        din1 => grp_fu_118_p1,
        dout => grp_fu_118_p2);

    mul_64s_32ns_64_1_1_U121 : component joint_search_hls_mul_64s_32ns_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 64,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => sg_2_assign_1_reg_279,
        din1 => v2_fu_122_p1,
        dout => v2_fu_122_p2);





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


    ap_return_0_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_0_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_return_0_preg <= select_ln55_2_fu_214_p3;
                end if; 
            end if;
        end if;
    end process;


    ap_return_1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_1_preg <= ap_const_lv64_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_return_1_preg <= sg_0_assign_1_reg_267;
                end if; 
            end if;
        end if;
    end process;


    ap_return_2_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_2_preg <= ap_const_lv64_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_return_2_preg <= sg_1_assign_1_reg_273;
                end if; 
            end if;
        end if;
    end process;


    ap_return_3_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_3_preg <= ap_const_lv64_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    ap_return_3_preg <= sg_2_assign_1_reg_279;
                end if; 
            end if;
        end if;
    end process;


    grp_candidate_score_fu_96_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_candidate_score_fu_96_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_candidate_score_fu_96_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_candidate_score_fu_96_ap_ready = ap_const_logic_1)) then 
                    grp_candidate_score_fu_96_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                select_ln55_1_reg_300 <= select_ln55_1_fu_174_p3;
                tmp_s_reg_295 <= v2_fu_122_p2(51 downto 20);
                v1_reg_285 <= grp_fu_118_p2;
                v2_reg_290 <= v2_fu_122_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                sg_0_assign_1_reg_267 <= grp_candidate_score_fu_96_ap_return_0;
                sg_1_assign_1_reg_273 <= grp_candidate_score_fu_96_ap_return_1;
                sg_2_assign_1_reg_279 <= grp_candidate_score_fu_96_ap_return_2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, grp_candidate_score_fu_96_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_candidate_score_fu_96_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_candidate_score_fu_96_ap_done)
    begin
        if ((grp_candidate_score_fu_96_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_0_assign_proc : process(ap_CS_fsm_state4, select_ln55_2_fu_214_p3, ap_return_0_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_return_0 <= select_ln55_2_fu_214_p3;
        else 
            ap_return_0 <= ap_return_0_preg;
        end if; 
    end process;


    ap_return_1_assign_proc : process(sg_0_assign_1_reg_267, ap_CS_fsm_state4, ap_return_1_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_return_1 <= sg_0_assign_1_reg_267;
        else 
            ap_return_1 <= ap_return_1_preg;
        end if; 
    end process;


    ap_return_2_assign_proc : process(sg_1_assign_1_reg_273, ap_CS_fsm_state4, ap_return_2_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_return_2 <= sg_1_assign_1_reg_273;
        else 
            ap_return_2 <= ap_return_2_preg;
        end if; 
    end process;


    ap_return_3_assign_proc : process(sg_2_assign_1_reg_279, ap_CS_fsm_state4, ap_return_3_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_return_3 <= sg_2_assign_1_reg_279;
        else 
            ap_return_3 <= ap_return_3_preg;
        end if; 
    end process;

    grp_candidate_score_fu_96_ap_start <= grp_candidate_score_fu_96_ap_start_reg;

    grp_fu_118_p0_assign_proc : process(sg_0_assign_1_reg_267, sg_1_assign_1_reg_273, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_118_p0 <= sg_0_assign_1_reg_267;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_118_p0 <= sg_1_assign_1_reg_273;
        else 
            grp_fu_118_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_118_p1_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, zext_ln54_1_fu_138_p1, zext_ln54_fu_182_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_fu_118_p1 <= zext_ln54_fu_182_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            grp_fu_118_p1 <= zext_ln54_1_fu_138_p1(32 - 1 downto 0);
        else 
            grp_fu_118_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    icmp_ln55_1_fu_192_p2 <= "1" when (signed(grp_fu_118_p2) < signed(v2_reg_290)) else "0";
    icmp_ln55_2_fu_148_p2 <= "1" when (signed(grp_fu_118_p2) < signed(v2_fu_122_p2)) else "0";
    icmp_ln55_fu_187_p2 <= "1" when (signed(grp_fu_118_p2) < signed(v1_reg_285)) else "0";
    obs_address0 <= grp_candidate_score_fu_96_obs_address0;
    obs_ce0 <= grp_candidate_score_fu_96_obs_ce0;
    select_ln55_1_fu_174_p3 <= 
        tmp_1_fu_164_p4 when (icmp_ln55_2_fu_148_p2(0) = '1') else 
        tmp_s_fu_154_p4;
    select_ln55_2_fu_214_p3 <= 
        select_ln55_fu_207_p3 when (icmp_ln55_fu_187_p2(0) = '1') else 
        select_ln55_1_reg_300;
    select_ln55_fu_207_p3 <= 
        tmp_fu_197_p4 when (icmp_ln55_1_fu_192_p2(0) = '1') else 
        tmp_s_reg_295;
    tmp_1_fu_164_p4 <= grp_fu_118_p2(51 downto 20);
    tmp_fu_197_p4 <= grp_fu_118_p2(51 downto 20);
    tmp_s_fu_154_p4 <= v2_fu_122_p2(51 downto 20);
    v2_fu_122_p1 <= v2_fu_122_p10(32 - 1 downto 0);
    v2_fu_122_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(reciprocal_0_2_val),64));
    zext_ln54_1_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(reciprocal_0_1_val),64));
    zext_ln54_fu_182_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(reciprocal_0_0_val),64));
end behav;
