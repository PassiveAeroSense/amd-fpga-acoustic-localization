                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cordic_hls_cordic is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mode : IN STD_LOGIC_VECTOR (0 downto 0);
    vx : IN STD_LOGIC_VECTOR (39 downto 0);
    vy : IN STD_LOGIC_VECTOR (39 downto 0);
    angle : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (135 downto 0) );
end;


architecture behav of cordic_hls_cordic is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv70_26DD3B6A : STD_LOGIC_VECTOR (69 downto 0) := "0000000000000000000000000000000000000000100110110111010011101101101010";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_3243F6A9 : STD_LOGIC_VECTOR (31 downto 0) := "00110010010000111111011010101001";
    constant ap_const_lv41_0 : STD_LOGIC_VECTOR (40 downto 0) := "00000000000000000000000000000000000000000";
    constant ap_const_lv32_9B7812AF : STD_LOGIC_VECTOR (31 downto 0) := "10011011011110000001001010101111";
    constant ap_const_lv32_6487ED51 : STD_LOGIC_VECTOR (31 downto 0) := "01100100100001111110110101010001";
    constant ap_const_lv32_CDBC0957 : STD_LOGIC_VECTOR (31 downto 0) := "11001101101111000000100101010111";
    constant ap_const_lv41_1FFD922C496 : STD_LOGIC_VECTOR (40 downto 0) := "11111111111011001001000101100010010010110";
    constant ap_const_lv41_26DD3B6A : STD_LOGIC_VECTOR (40 downto 0) := "00000000000100110110111010011101101101010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_45 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000101";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal xor_ln25_fu_238_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln25_reg_403 : STD_LOGIC_VECTOR (0 downto 0);
    signal z_4_ph_fu_261_p11 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_4_ph_reg_408 : STD_LOGIC_VECTOR (31 downto 0);
    signal yy_ph_fu_294_p9 : STD_LOGIC_VECTOR (40 downto 0);
    signal yy_ph_reg_413 : STD_LOGIC_VECTOR (40 downto 0);
    signal xx_ph_fu_315_p11 : STD_LOGIC_VECTOR (40 downto 0);
    signal xx_ph_reg_418 : STD_LOGIC_VECTOR (40 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_idle : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out : STD_LOGIC_VECTOR (43 downto 0);
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out_ap_vld : STD_LOGIC;
    signal grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal z_3_loc_fu_88 : STD_LOGIC_VECTOR (31 downto 0);
    signal yy_loc_fu_84 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal product_fu_131_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_fu_136_p1 : STD_LOGIC_VECTOR (39 downto 0);
    signal sext_ln29_fu_144_p0 : STD_LOGIC_VECTOR (39 downto 0);
    signal sext_ln30_fu_148_p0 : STD_LOGIC_VECTOR (39 downto 0);
    signal sext_ln29_fu_144_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal sext_ln30_fu_148_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_2_fu_170_p1 : STD_LOGIC_VECTOR (39 downto 0);
    signal tmp_2_fu_170_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln30_1_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal z_5_fu_198_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_136_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln29_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln30_fu_152_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln29_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln29_1_fu_232_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln30_fu_245_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal z_4_ph_fu_261_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_4_ph_fu_261_p6 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_4_ph_fu_261_p8 : STD_LOGIC_VECTOR (31 downto 0);
    signal z_4_ph_fu_261_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal sel_tmp1_fu_251_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal yy_ph_fu_294_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal yy_ph_fu_294_p7 : STD_LOGIC_VECTOR (40 downto 0);
    signal yy_ph_fu_294_p8 : STD_LOGIC_VECTOR (1 downto 0);
    signal xx_ph_fu_315_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal xx_ph_fu_315_p8 : STD_LOGIC_VECTOR (40 downto 0);
    signal xx_ph_fu_315_p9 : STD_LOGIC_VECTOR (40 downto 0);
    signal sext_ln37_fu_349_p0 : STD_LOGIC_VECTOR (43 downto 0);
    signal trunc_ln38_fu_354_p0 : STD_LOGIC_VECTOR (43 downto 0);
    signal product_fu_131_p2 : STD_LOGIC_VECTOR (69 downto 0);
    signal trunc_ln38_3_fu_358_p4 : STD_LOGIC_VECTOR (39 downto 0);
    signal trunc_ln38_fu_354_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal z_4_ph_fu_261_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_ph_fu_261_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_ph_fu_261_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal z_4_ph_fu_261_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal yy_ph_fu_294_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal yy_ph_fu_294_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal yy_ph_fu_294_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal xx_ph_fu_315_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal xx_ph_fu_315_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal xx_ph_fu_315_p5 : STD_LOGIC_VECTOR (2 downto 0);
    signal xx_ph_fu_315_p7 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        z_4_ph : IN STD_LOGIC_VECTOR (31 downto 0);
        yy_ph_cast : IN STD_LOGIC_VECTOR (40 downto 0);
        sext_ln31 : IN STD_LOGIC_VECTOR (40 downto 0);
        mode : IN STD_LOGIC_VECTOR (0 downto 0);
        xor_ln25 : IN STD_LOGIC_VECTOR (0 downto 0);
        z_3_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        z_3_out_ap_vld : OUT STD_LOGIC;
        yy_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        yy_out_ap_vld : OUT STD_LOGIC;
        xx_out : OUT STD_LOGIC_VECTOR (43 downto 0);
        xx_out_ap_vld : OUT STD_LOGIC );
    end component;


    component cordic_hls_mul_44s_31ns_70_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (43 downto 0);
        din1 : IN STD_LOGIC_VECTOR (30 downto 0);
        dout : OUT STD_LOGIC_VECTOR (69 downto 0) );
    end component;


    component cordic_hls_sparsemux_9_3_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (2 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (2 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (2 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (2 downto 0);
        din3_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        din3 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component cordic_hls_sparsemux_7_2_41_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (1 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (1 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (1 downto 0);
        din2_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (40 downto 0);
        din1 : IN STD_LOGIC_VECTOR (40 downto 0);
        din2 : IN STD_LOGIC_VECTOR (40 downto 0);
        def : IN STD_LOGIC_VECTOR (40 downto 0);
        sel : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (40 downto 0) );
    end component;


    component cordic_hls_sparsemux_9_3_41_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        CASE0 : STD_LOGIC_VECTOR (2 downto 0);
        din0_WIDTH : INTEGER;
        CASE1 : STD_LOGIC_VECTOR (2 downto 0);
        din1_WIDTH : INTEGER;
        CASE2 : STD_LOGIC_VECTOR (2 downto 0);
        din2_WIDTH : INTEGER;
        CASE3 : STD_LOGIC_VECTOR (2 downto 0);
        din3_WIDTH : INTEGER;
        def_WIDTH : INTEGER;
        sel_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (40 downto 0);
        din1 : IN STD_LOGIC_VECTOR (40 downto 0);
        din2 : IN STD_LOGIC_VECTOR (40 downto 0);
        din3 : IN STD_LOGIC_VECTOR (40 downto 0);
        def : IN STD_LOGIC_VECTOR (40 downto 0);
        sel : IN STD_LOGIC_VECTOR (2 downto 0);
        dout : OUT STD_LOGIC_VECTOR (40 downto 0) );
    end component;



begin
    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116 : component cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start,
        ap_done => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done,
        ap_idle => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_idle,
        ap_ready => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready,
        z_4_ph => z_4_ph_reg_408,
        yy_ph_cast => yy_ph_reg_413,
        sext_ln31 => xx_ph_reg_418,
        mode => mode,
        xor_ln25 => xor_ln25_reg_403,
        z_3_out => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out,
        z_3_out_ap_vld => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld,
        yy_out => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out,
        yy_out_ap_vld => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld,
        xx_out => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out,
        xx_out_ap_vld => grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out_ap_vld);

    mul_44s_31ns_70_1_1_U15 : component cordic_hls_mul_44s_31ns_70_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 44,
        din1_WIDTH => 31,
        dout_WIDTH => 70)
    port map (
        din0 => sext_ln37_fu_349_p0,
        din1 => product_fu_131_p1,
        dout => product_fu_131_p2);

    sparsemux_9_3_32_1_1_U16 : component cordic_hls_sparsemux_9_3_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "100",
        din0_WIDTH => 32,
        CASE1 => "010",
        din1_WIDTH => 32,
        CASE2 => "001",
        din2_WIDTH => 32,
        CASE3 => "000",
        din3_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 3,
        dout_WIDTH => 32)
    port map (
        din0 => z_4_ph_fu_261_p2,
        din1 => ap_const_lv32_0,
        din2 => z_4_ph_fu_261_p6,
        din3 => z_4_ph_fu_261_p8,
        def => z_4_ph_fu_261_p9,
        sel => sel_tmp1_fu_251_p4,
        dout => z_4_ph_fu_261_p11);

    sparsemux_7_2_41_1_1_U17 : component cordic_hls_sparsemux_7_2_41_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "10",
        din0_WIDTH => 41,
        CASE1 => "01",
        din1_WIDTH => 41,
        CASE2 => "00",
        din2_WIDTH => 41,
        def_WIDTH => 41,
        sel_WIDTH => 2,
        dout_WIDTH => 41)
    port map (
        din0 => yy_ph_fu_294_p2,
        din1 => ap_const_lv41_0,
        din2 => sext_ln30_fu_148_p1,
        def => yy_ph_fu_294_p7,
        sel => yy_ph_fu_294_p8,
        dout => yy_ph_fu_294_p9);

    sparsemux_9_3_41_1_1_U18 : component cordic_hls_sparsemux_9_3_41_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "100",
        din0_WIDTH => 41,
        CASE1 => "010",
        din1_WIDTH => 41,
        CASE2 => "001",
        din2_WIDTH => 41,
        CASE3 => "000",
        din3_WIDTH => 41,
        def_WIDTH => 41,
        sel_WIDTH => 3,
        dout_WIDTH => 41)
    port map (
        din0 => xx_ph_fu_315_p2,
        din1 => sext_ln29_fu_144_p1,
        din2 => ap_const_lv41_1FFD922C496,
        din3 => xx_ph_fu_315_p8,
        def => xx_ph_fu_315_p9,
        sel => sel_tmp1_fu_251_p4,
        dout => xx_ph_fu_315_p11);





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


    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready = ap_const_logic_1)) then 
                    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                xor_ln25_reg_403 <= xor_ln25_fu_238_p2;
                xx_ph_reg_418 <= xx_ph_fu_315_p11;
                yy_ph_reg_413 <= yy_ph_fu_294_p9;
                z_4_ph_reg_408 <= z_4_ph_fu_261_p11;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                yy_loc_fu_84 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                z_3_loc_fu_88 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
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
    and_ln29_1_fu_232_p2 <= (xor_ln29_fu_226_p2 and mode);
    and_ln29_fu_220_p2 <= (tmp_fu_136_p3 and mode);
    and_ln30_fu_245_p2 <= (xor_ln25_fu_238_p2 and icmp_ln30_fu_152_p2);
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


    ap_ST_fsm_state2_blk_assign_proc : process(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done)
    begin
        if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done = ap_const_logic_0)) then 
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

    ap_return <= (((trunc_ln38_3_fu_358_p4 & yy_loc_fu_84) & trunc_ln38_fu_354_p1) & z_3_loc_fu_88);
    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg;
    icmp_ln30_1_fu_192_p2 <= "1" when (signed(angle) < signed(ap_const_lv32_CDBC0957)) else "0";
    icmp_ln30_fu_152_p2 <= "1" when (signed(angle) > signed(ap_const_lv32_3243F6A9)) else "0";
    product_fu_131_p1 <= ap_const_lv70_26DD3B6A(31 - 1 downto 0);
    sel_tmp1_fu_251_p4 <= ((and_ln29_fu_220_p2 & and_ln29_1_fu_232_p2) & and_ln30_fu_245_p2);
    sext_ln29_fu_144_p0 <= vx;
        sext_ln29_fu_144_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln29_fu_144_p0),41));

    sext_ln30_fu_148_p0 <= vy;
        sext_ln30_fu_148_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln30_fu_148_p0),41));

    sext_ln37_fu_349_p0 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out;
    tmp_2_fu_170_p1 <= vy;
    tmp_2_fu_170_p3 <= tmp_2_fu_170_p1(39 downto 39);
    tmp_fu_136_p1 <= vx;
    tmp_fu_136_p3 <= tmp_fu_136_p1(39 downto 39);
    trunc_ln38_3_fu_358_p4 <= product_fu_131_p2(69 downto 30);
    trunc_ln38_fu_354_p0 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out;
    trunc_ln38_fu_354_p1 <= trunc_ln38_fu_354_p0(32 - 1 downto 0);
    xor_ln25_fu_238_p2 <= (mode xor ap_const_lv1_1);
    xor_ln29_fu_226_p2 <= (tmp_fu_136_p3 xor ap_const_lv1_1);
    xx_ph_fu_315_p2 <= std_logic_vector(unsigned(ap_const_lv41_0) - unsigned(sext_ln29_fu_144_p1));
    xx_ph_fu_315_p8 <= 
        ap_const_lv41_1FFD922C496 when (icmp_ln30_1_fu_192_p2(0) = '1') else 
        ap_const_lv41_26DD3B6A;
    xx_ph_fu_315_p9 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    yy_ph_fu_294_p2 <= std_logic_vector(unsigned(ap_const_lv41_0) - unsigned(sext_ln30_fu_148_p1));
    yy_ph_fu_294_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    yy_ph_fu_294_p8 <= (and_ln29_fu_220_p2 & xor_ln25_fu_238_p2);
    z_4_ph_fu_261_p2 <= 
        ap_const_lv32_9B7812AF when (tmp_2_fu_170_p3(0) = '1') else 
        ap_const_lv32_6487ED51;
    z_4_ph_fu_261_p6 <= std_logic_vector(unsigned(angle) + unsigned(ap_const_lv32_9B7812AF));
    z_4_ph_fu_261_p8 <= 
        z_5_fu_198_p2 when (icmp_ln30_1_fu_192_p2(0) = '1') else 
        angle;
    z_4_ph_fu_261_p9 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    z_5_fu_198_p2 <= std_logic_vector(unsigned(angle) + unsigned(ap_const_lv32_6487ED51));
end behav;
