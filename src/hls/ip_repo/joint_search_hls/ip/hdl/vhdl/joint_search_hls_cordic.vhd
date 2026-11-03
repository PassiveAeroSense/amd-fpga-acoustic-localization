                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_cordic is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    vx : IN STD_LOGIC_VECTOR (31 downto 0);
    vy : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of joint_search_hls_cordic is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv33_0 : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000000000";
    constant ap_const_lv32_9B7812AF : STD_LOGIC_VECTOR (31 downto 0) := "10011011011110000001001010101111";
    constant ap_const_lv32_6487ED51 : STD_LOGIC_VECTOR (31 downto 0) := "01100100100001111110110101010001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal z_1_ph_fu_90_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_1_ph_reg_126 : STD_LOGIC_VECTOR (31 downto 0);
    signal yy_ph_fu_99_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal yy_ph_reg_131 : STD_LOGIC_VECTOR (32 downto 0);
    signal xx_ph_fu_108_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal xx_ph_reg_136 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_idle : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal z_1_loc_fu_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal sext_ln29_fu_58_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln29_fu_58_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_50_fu_74_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_50_fu_74_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_50_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal z_fu_82_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal y_fu_68_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal x_fu_62_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        z_1_ph_cast : IN STD_LOGIC_VECTOR (31 downto 0);
        yy_ph_cast : IN STD_LOGIC_VECTOR (32 downto 0);
        zext_ln31_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        z_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        z_1_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40 : component joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start,
        ap_done => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done,
        ap_idle => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_idle,
        ap_ready => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready,
        z_1_ph_cast => z_1_ph_reg_126,
        yy_ph_cast => yy_ph_reg_131,
        zext_ln31_1 => xx_ph_reg_136,
        z_1_out => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out,
        z_1_out_ap_vld => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld);





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


    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready = ap_const_logic_1)) then 
                    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                xx_ph_reg_136 <= xx_ph_fu_108_p3;
                yy_ph_reg_131 <= yy_ph_fu_99_p3;
                z_1_ph_reg_126 <= z_1_ph_fu_90_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                z_1_loc_fu_24 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
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


    ap_ST_fsm_state2_blk_assign_proc : process(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done)
    begin
        if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done = ap_const_logic_0)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= z_1_loc_fu_24;
    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg;
    sext_ln29_fu_58_p0 <= vy;
        sext_ln29_fu_58_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln29_fu_58_p0),33));

    tmp_50_fu_74_p1 <= vy;
    tmp_50_fu_74_p3 <= tmp_50_fu_74_p1(31 downto 31);
    tmp_fu_50_p3 <= vx(31 downto 31);
    x_fu_62_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(vx));
    xx_ph_fu_108_p3 <= 
        x_fu_62_p2 when (tmp_fu_50_p3(0) = '1') else 
        vx;
    y_fu_68_p2 <= std_logic_vector(unsigned(ap_const_lv33_0) - unsigned(sext_ln29_fu_58_p1));
    yy_ph_fu_99_p3 <= 
        y_fu_68_p2 when (tmp_fu_50_p3(0) = '1') else 
        sext_ln29_fu_58_p1;
    z_1_ph_fu_90_p3 <= 
        z_fu_82_p3 when (tmp_fu_50_p3(0) = '1') else 
        ap_const_lv32_0;
    z_fu_82_p3 <= 
        ap_const_lv32_9B7812AF when (tmp_50_fu_74_p3(0) = '1') else 
        ap_const_lv32_6487ED51;
end behav;
