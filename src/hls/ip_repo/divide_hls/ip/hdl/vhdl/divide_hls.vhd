                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divide_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    num : IN STD_LOGIC_VECTOR (63 downto 0);
    den : IN STD_LOGIC_VECTOR (63 downto 0);
    result : OUT STD_LOGIC_VECTOR (128 downto 0) );
end;


architecture behav of divide_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "divide_hls_divide_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=13.448000,HLS_SYN_LAT=35,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=399,HLS_SYN_LUT=636,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal den_read_reg_98 : STD_LOGIC_VECTOR (63 downto 0);
    signal num_read_reg_104 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln81_fu_77_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln81_reg_110 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_udiv_fu_64_ap_return : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_udiv_fu_64_ap_start : STD_LOGIC;
    signal grp_udiv_fu_64_ap_done : STD_LOGIC;
    signal grp_udiv_fu_64_ap_idle : STD_LOGIC;
    signal grp_udiv_fu_64_ap_ready : STD_LOGIC;
    signal q_0_reg_53 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_udiv_fu_64_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln81_fu_77_p0 : STD_LOGIC_VECTOR (63 downto 0);
    signal mul_ln81_fu_72_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal sub_ln81_fu_83_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component divide_hls_udiv IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        n : IN STD_LOGIC_VECTOR (63 downto 0);
        d : IN STD_LOGIC_VECTOR (63 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component divide_hls_mul_64s_64s_64_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (63 downto 0);
        din1 : IN STD_LOGIC_VECTOR (63 downto 0);
        dout : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin
    grp_udiv_fu_64 : component divide_hls_udiv
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_udiv_fu_64_ap_start,
        ap_done => grp_udiv_fu_64_ap_done,
        ap_idle => grp_udiv_fu_64_ap_idle,
        ap_ready => grp_udiv_fu_64_ap_ready,
        n => num_read_reg_104,
        d => den_read_reg_98,
        ap_return => grp_udiv_fu_64_ap_return);

    mul_64s_64s_64_1_1_U7 : component divide_hls_mul_64s_64s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 64,
        din1_WIDTH => 64,
        dout_WIDTH => 64)
    port map (
        din0 => q_0_reg_53,
        din1 => den_read_reg_98,
        dout => mul_ln81_fu_72_p2);





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


    grp_udiv_fu_64_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_udiv_fu_64_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln81_fu_77_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    grp_udiv_fu_64_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_udiv_fu_64_ap_ready = ap_const_logic_1)) then 
                    grp_udiv_fu_64_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    q_0_reg_53_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln81_fu_77_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                q_0_reg_53 <= ap_const_lv64_FFFFFFFFFFFFFFFF;
            elsif (((grp_udiv_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                q_0_reg_53 <= grp_udiv_fu_64_ap_return;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                den_read_reg_98 <= den;
                icmp_ln81_reg_110 <= icmp_ln81_fu_77_p2;
                num_read_reg_104 <= num;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln81_fu_77_p2, ap_CS_fsm_state2, grp_udiv_fu_64_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((icmp_ln81_fu_77_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                elsif (((icmp_ln81_fu_77_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_udiv_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
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


    ap_ST_fsm_state2_blk_assign_proc : process(grp_udiv_fu_64_ap_done)
    begin
        if ((grp_udiv_fu_64_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_udiv_fu_64_ap_start <= grp_udiv_fu_64_ap_start_reg;
    icmp_ln81_fu_77_p0 <= den;
    icmp_ln81_fu_77_p2 <= "1" when (icmp_ln81_fu_77_p0 = ap_const_lv64_0) else "0";
    result <= ((icmp_ln81_reg_110 & sub_ln81_fu_83_p2) & q_0_reg_53);
    sub_ln81_fu_83_p2 <= std_logic_vector(unsigned(num_read_reg_104) - unsigned(mul_ln81_fu_72_p2));
end behav;
