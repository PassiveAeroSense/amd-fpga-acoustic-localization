                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sqrt_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    value_r : IN STD_LOGIC_VECTOR (63 downto 0);
    result : OUT STD_LOGIC_VECTOR (95 downto 0) );
end;


architecture behav of sqrt_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "sqrt_hls_sqrt_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=9.878000,HLS_SYN_LAT=35,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=172,HLS_SYN_LUT=590,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal value_r_read_reg_71 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_isqrt_fu_41_ap_start : STD_LOGIC;
    signal grp_isqrt_fu_41_ap_done : STD_LOGIC;
    signal grp_isqrt_fu_41_ap_idle : STD_LOGIC;
    signal grp_isqrt_fu_41_ap_ready : STD_LOGIC;
    signal grp_isqrt_fu_41_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_isqrt_fu_41_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal mul_ln75_fu_47_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln75_fu_51_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln75_fu_47_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln75_fu_47_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln75_fu_57_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component sqrt_hls_isqrt IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        x : IN STD_LOGIC_VECTOR (63 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component sqrt_hls_mul_32ns_32ns_64_1_1 IS
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
    grp_isqrt_fu_41 : component sqrt_hls_isqrt
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_isqrt_fu_41_ap_start,
        ap_done => grp_isqrt_fu_41_ap_done,
        ap_idle => grp_isqrt_fu_41_ap_idle,
        ap_ready => grp_isqrt_fu_41_ap_ready,
        x => value_r_read_reg_71,
        ap_return => grp_isqrt_fu_41_ap_return);

    mul_32ns_32ns_64_1_1_U2 : component sqrt_hls_mul_32ns_32ns_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => mul_ln75_fu_47_p0,
        din1 => mul_ln75_fu_47_p1,
        dout => mul_ln75_fu_47_p2);





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


    grp_isqrt_fu_41_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_isqrt_fu_41_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_isqrt_fu_41_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_isqrt_fu_41_ap_ready = ap_const_logic_1)) then 
                    grp_isqrt_fu_41_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                value_r_read_reg_71 <= value_r;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_isqrt_fu_41_ap_done, ap_CS_fsm_state2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_isqrt_fu_41_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
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


    ap_ST_fsm_state2_blk_assign_proc : process(grp_isqrt_fu_41_ap_done)
    begin
        if ((grp_isqrt_fu_41_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(grp_isqrt_fu_41_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_isqrt_fu_41_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
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


    ap_ready_assign_proc : process(grp_isqrt_fu_41_ap_done, ap_CS_fsm_state2)
    begin
        if (((grp_isqrt_fu_41_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_isqrt_fu_41_ap_start <= grp_isqrt_fu_41_ap_start_reg;
    mul_ln75_fu_47_p0 <= zext_ln75_fu_51_p1(32 - 1 downto 0);
    mul_ln75_fu_47_p1 <= zext_ln75_fu_51_p1(32 - 1 downto 0);
    result <= (sub_ln75_fu_57_p2 & grp_isqrt_fu_41_ap_return);
    sub_ln75_fu_57_p2 <= std_logic_vector(unsigned(value_r_read_reg_71) - unsigned(mul_ln75_fu_47_p2));
    zext_ln75_fu_51_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_isqrt_fu_41_ap_return),64));
end behav;
