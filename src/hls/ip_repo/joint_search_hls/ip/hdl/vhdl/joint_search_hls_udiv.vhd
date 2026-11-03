                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_udiv is
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
end;


architecture behav of joint_search_hls_udiv is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv42_0 : STD_LOGIC_VECTOR (41 downto 0) := "000000000000000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal icmp_ln18_fu_54_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln18_reg_81 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start : STD_LOGIC;
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done : STD_LOGIC;
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_idle : STD_LOGIC;
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready : STD_LOGIC;
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out_ap_vld : STD_LOGIC;
    signal ap_phi_mux_agg_result_0_phi_fu_36_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal agg_result_0_reg_32 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_return_preg : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_udiv_Pipeline_VITIS_LOOP_19_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        zext_ln16 : IN STD_LOGIC_VECTOR (55 downto 0);
        conv_i4_cast_cast : IN STD_LOGIC_VECTOR (41 downto 0);
        conv_i4_cast : IN STD_LOGIC_VECTOR (41 downto 0);
        q_out : OUT STD_LOGIC_VECTOR (63 downto 0);
        q_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43 : component joint_search_hls_udiv_Pipeline_VITIS_LOOP_19_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start,
        ap_done => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done,
        ap_idle => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_idle,
        ap_ready => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready,
        zext_ln16 => n,
        conv_i4_cast_cast => d,
        conv_i4_cast => d,
        q_out => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out,
        q_out_ap_vld => grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out_ap_vld);





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


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv64_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_return_preg <= ap_phi_mux_agg_result_0_phi_fu_36_p4;
                end if; 
            end if;
        end if;
    end process;


    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (icmp_ln18_fu_54_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready = ap_const_logic_1)) then 
                    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    agg_result_0_reg_32_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln18_reg_81 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                agg_result_0_reg_32 <= grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out;
            elsif (((ap_start = ap_const_logic_1) and (icmp_ln18_fu_54_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                agg_result_0_reg_32 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln18_reg_81 <= icmp_ln18_fu_54_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln18_fu_54_p2, grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (icmp_ln18_fu_54_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                elsif (((ap_start = ap_const_logic_1) and (icmp_ln18_fu_54_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done)
    begin
        if ((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
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


    ap_phi_mux_agg_result_0_phi_fu_36_p4_assign_proc : process(icmp_ln18_reg_81, grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out, agg_result_0_reg_32, ap_CS_fsm_state3)
    begin
        if (((icmp_ln18_reg_81 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_phi_mux_agg_result_0_phi_fu_36_p4 <= grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out;
        else 
            ap_phi_mux_agg_result_0_phi_fu_36_p4 <= agg_result_0_reg_32;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_agg_result_0_phi_fu_36_p4, ap_CS_fsm_state3, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_return <= ap_phi_mux_agg_result_0_phi_fu_36_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start <= grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg;
    icmp_ln18_fu_54_p2 <= "1" when (d = ap_const_lv42_0) else "0";
end behav;
