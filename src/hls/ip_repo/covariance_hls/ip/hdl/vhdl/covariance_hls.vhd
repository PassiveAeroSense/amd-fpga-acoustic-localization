                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity covariance_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ar : IN STD_LOGIC_VECTOR (31 downto 0);
    ai : IN STD_LOGIC_VECTOR (31 downto 0);
    br : IN STD_LOGIC_VECTOR (31 downto 0);
    bi : IN STD_LOGIC_VECTOR (31 downto 0);
    oldr : IN STD_LOGIC_VECTOR (31 downto 0);
    oldi : IN STD_LOGIC_VECTOR (31 downto 0);
    shift_old : IN STD_LOGIC_VECTOR (5 downto 0);
    next_exp : IN STD_LOGIC_VECTOR (5 downto 0);
    result : OUT STD_LOGIC_VECTOR (64 downto 0) );
end;


architecture behav of covariance_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "covariance_hls_covariance_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=12.525344,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=131,HLS_SYN_LUT=1423,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv34_0 : STD_LOGIC_VECTOR (33 downto 0) := "0000000000000000000000000000000000";
    constant ap_const_lv65_1FFFFFFFF80000000 : STD_LOGIC_VECTOR (64 downto 0) := "11111111111111111111111111111111110000000000000000000000000000000";
    constant ap_const_lv32_7FFFFFFF : STD_LOGIC_VECTOR (31 downto 0) := "01111111111111111111111111111111";
    constant ap_const_lv32_80000000 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv33_0 : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000000000";
    constant ap_const_lv64_FFFFFFFF80000000 : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111110000000000000000000000000000000";
    constant ap_const_lv65_80000000 : STD_LOGIC_VECTOR (64 downto 0) := "00000000000000000000000000000000010000000000000000000000000000000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal rr_fu_173_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal rr_reg_374 : STD_LOGIC_VECTOR (64 downto 0);
    signal ri_fu_179_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ri_reg_379 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal p0_fu_125_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln107_1_fu_147_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p0_fu_125_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln107_fu_141_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p1_fu_129_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln107_3_fu_159_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p1_fu_129_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln107_2_fu_153_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p2_fu_133_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal p2_fu_133_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p3_fu_137_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal p3_fu_137_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p0_fu_125_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p1_fu_129_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln108_1_fu_169_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal sext_ln108_fu_165_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal p2_fu_133_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal p3_fu_137_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln109_fu_185_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ashr_ln109_fu_189_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln109_1_fu_199_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal ashr_ln109_1_fu_207_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal sext_ln109_fu_195_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal ashr_ln109_2_fu_218_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln109_2_fu_203_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ashr_ln109_3_fu_228_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln109_1_fu_224_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal nr_fu_212_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal tmp_1_fu_239_p4 : STD_LOGIC_VECTOR (33 downto 0);
    signal icmp_ln41_fu_249_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_1_fu_255_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_fu_273_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_fu_265_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln41_fu_261_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ni_fu_233_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_2_fu_287_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln41_2_fu_297_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln41_3_fu_303_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln41_1_fu_321_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_2_fu_313_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln41_1_fu_309_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln110_fu_335_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal tmp_3_fu_341_p4 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln110_fu_351_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln110_fu_357_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln41_3_fu_327_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln41_1_fu_279_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component covariance_hls_mul_32s_32s_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin
    mul_32s_32s_64_1_1_U1 : component covariance_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => p0_fu_125_p0,
        din1 => p0_fu_125_p1,
        dout => p0_fu_125_p2);

    mul_32s_32s_64_1_1_U2 : component covariance_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => p1_fu_129_p0,
        din1 => p1_fu_129_p1,
        dout => p1_fu_129_p2);

    mul_32s_32s_64_1_1_U3 : component covariance_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => p2_fu_133_p0,
        din1 => p2_fu_133_p1,
        dout => p2_fu_133_p2);

    mul_32s_32s_64_1_1_U4 : component covariance_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => p3_fu_137_p0,
        din1 => p3_fu_137_p1,
        dout => p3_fu_137_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                ri_reg_379 <= ri_fu_179_p2;
                rr_reg_374 <= rr_fu_173_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    add_ln110_fu_335_p2 <= std_logic_vector(unsigned(nr_fu_212_p2) + unsigned(ap_const_lv65_80000000));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ashr_ln109_1_fu_207_p2 <= std_logic_vector(shift_right(signed(rr_reg_374),to_integer(unsigned('0' & zext_ln109_1_fu_199_p1(31-1 downto 0)))));
    ashr_ln109_2_fu_218_p2 <= std_logic_vector(shift_right(signed(oldi),to_integer(unsigned('0' & zext_ln109_fu_185_p1(31-1 downto 0)))));
    ashr_ln109_3_fu_228_p2 <= std_logic_vector(shift_right(signed(ri_reg_379),to_integer(unsigned('0' & zext_ln109_2_fu_203_p1(31-1 downto 0)))));
    ashr_ln109_fu_189_p2 <= std_logic_vector(shift_right(signed(oldr),to_integer(unsigned('0' & zext_ln109_fu_185_p1(31-1 downto 0)))));
    icmp_ln110_fu_351_p2 <= "0" when (tmp_3_fu_341_p4 = ap_const_lv33_0) else "1";
    icmp_ln41_1_fu_255_p2 <= "1" when (signed(nr_fu_212_p2) < signed(ap_const_lv65_1FFFFFFFF80000000)) else "0";
    icmp_ln41_2_fu_297_p2 <= "1" when (signed(tmp_2_fu_287_p4) > signed(ap_const_lv33_0)) else "0";
    icmp_ln41_3_fu_303_p2 <= "1" when (signed(ni_fu_233_p2) < signed(ap_const_lv64_FFFFFFFF80000000)) else "0";
    icmp_ln41_fu_249_p2 <= "1" when (signed(tmp_1_fu_239_p4) > signed(ap_const_lv34_0)) else "0";
    ni_fu_233_p2 <= std_logic_vector(unsigned(ashr_ln109_3_fu_228_p2) + unsigned(sext_ln109_1_fu_224_p1));
    nr_fu_212_p2 <= std_logic_vector(unsigned(ashr_ln109_1_fu_207_p2) + unsigned(sext_ln109_fu_195_p1));
    or_ln110_fu_357_p2 <= (or_ln41_1_fu_321_p2 or icmp_ln110_fu_351_p2);
    or_ln41_1_fu_321_p2 <= (icmp_ln41_3_fu_303_p2 or icmp_ln41_2_fu_297_p2);
    or_ln41_fu_273_p2 <= (icmp_ln41_fu_249_p2 or icmp_ln41_1_fu_255_p2);
    p0_fu_125_p0 <= sext_ln107_1_fu_147_p1(32 - 1 downto 0);
    p0_fu_125_p1 <= sext_ln107_fu_141_p1(32 - 1 downto 0);
    p1_fu_129_p0 <= sext_ln107_3_fu_159_p1(32 - 1 downto 0);
    p1_fu_129_p1 <= sext_ln107_2_fu_153_p1(32 - 1 downto 0);
    p2_fu_133_p0 <= sext_ln107_1_fu_147_p1(32 - 1 downto 0);
    p2_fu_133_p1 <= sext_ln107_2_fu_153_p1(32 - 1 downto 0);
    p3_fu_137_p0 <= sext_ln107_3_fu_159_p1(32 - 1 downto 0);
    p3_fu_137_p1 <= sext_ln107_fu_141_p1(32 - 1 downto 0);
    result <= ((or_ln110_fu_357_p2 & select_ln41_3_fu_327_p3) & select_ln41_1_fu_279_p3);
    ri_fu_179_p2 <= std_logic_vector(unsigned(p2_fu_133_p2) - unsigned(p3_fu_137_p2));
    rr_fu_173_p2 <= std_logic_vector(signed(sext_ln108_1_fu_169_p1) + signed(sext_ln108_fu_165_p1));
    select_ln41_1_fu_279_p3 <= 
        select_ln41_fu_265_p3 when (or_ln41_fu_273_p2(0) = '1') else 
        trunc_ln41_fu_261_p1;
    select_ln41_2_fu_313_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln41_2_fu_297_p2(0) = '1') else 
        ap_const_lv32_80000000;
    select_ln41_3_fu_327_p3 <= 
        select_ln41_2_fu_313_p3 when (or_ln41_1_fu_321_p2(0) = '1') else 
        trunc_ln41_1_fu_309_p1;
    select_ln41_fu_265_p3 <= 
        ap_const_lv32_7FFFFFFF when (icmp_ln41_fu_249_p2(0) = '1') else 
        ap_const_lv32_80000000;
        sext_ln107_1_fu_147_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(br),64));

        sext_ln107_2_fu_153_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ai),64));

        sext_ln107_3_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(bi),64));

        sext_ln107_fu_141_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ar),64));

        sext_ln108_1_fu_169_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(p1_fu_129_p2),65));

        sext_ln108_fu_165_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(p0_fu_125_p2),65));

        sext_ln109_1_fu_224_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ashr_ln109_2_fu_218_p2),64));

        sext_ln109_fu_195_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ashr_ln109_fu_189_p2),65));

    tmp_1_fu_239_p4 <= nr_fu_212_p2(64 downto 31);
    tmp_2_fu_287_p4 <= ni_fu_233_p2(63 downto 31);
    tmp_3_fu_341_p4 <= add_ln110_fu_335_p2(64 downto 32);
    trunc_ln41_1_fu_309_p1 <= ni_fu_233_p2(32 - 1 downto 0);
    trunc_ln41_fu_261_p1 <= nr_fu_212_p2(32 - 1 downto 0);
    zext_ln109_1_fu_199_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(next_exp),65));
    zext_ln109_2_fu_203_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(next_exp),64));
    zext_ln109_fu_185_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shift_old),32));
end behav;
