                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    covariance_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    covariance_ce0 : OUT STD_LOGIC;
    covariance_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    grid_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    grid_ce0 : OUT STD_LOGIC;
    grid_q0 : IN STD_LOGIC_VECTOR (47 downto 0);
    grid_count : IN STD_LOGIC_VECTOR (31 downto 0);
    horizontal_mm : IN STD_LOGIC_VECTOR (31 downto 0);
    vertical_mm : IN STD_LOGIC_VECTOR (31 downto 0);
    baseline_two : IN STD_LOGIC_VECTOR (0 downto 0);
    fast_mode : IN STD_LOGIC_VECTOR (0 downto 0);
    result : OUT STD_LOGIC_VECTOR (143 downto 0) );
end;


architecture behav of joint_search_hls is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "joint_search_hls_joint_search_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=14.224500,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=22,HLS_SYN_DSP=0,HLS_SYN_FF=14984,HLS_SYN_LUT=14931,HLS_VERSION=2024_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000001000000000000000000000";
    constant ap_ST_fsm_state23 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000010000000000000000000000";
    constant ap_ST_fsm_state24 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000100000000000000000000000";
    constant ap_ST_fsm_state25 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000001000000000000000000000000";
    constant ap_ST_fsm_state26 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000010000000000000000000000000";
    constant ap_ST_fsm_state27 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000100000000000000000000000000";
    constant ap_ST_fsm_state28 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000001000000000000000000000000000";
    constant ap_ST_fsm_state29 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000010000000000000000000000000000";
    constant ap_ST_fsm_state30 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000100000000000000000000000000000";
    constant ap_ST_fsm_state31 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000001000000000000000000000000000000";
    constant ap_ST_fsm_state32 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000010000000000000000000000000000000";
    constant ap_ST_fsm_state33 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000100000000000000000000000000000000";
    constant ap_ST_fsm_state34 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000001000000000000000000000000000000000";
    constant ap_ST_fsm_state35 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000010000000000000000000000000000000000";
    constant ap_ST_fsm_state36 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000100000000000000000000000000000000000";
    constant ap_ST_fsm_state37 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000001000000000000000000000000000000000000";
    constant ap_ST_fsm_state38 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000010000000000000000000000000000000000000";
    constant ap_ST_fsm_state39 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000100000000000000000000000000000000000000";
    constant ap_ST_fsm_state40 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000001000000000000000000000000000000000000000";
    constant ap_ST_fsm_state41 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000010000000000000000000000000000000000000000";
    constant ap_ST_fsm_state42 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000100000000000000000000000000000000000000000";
    constant ap_ST_fsm_state43 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000001000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state44 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000010000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state45 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000100000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state46 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000001000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state47 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000010000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state48 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000100000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state49 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000001000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state50 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000010000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state51 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000100000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state52 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000001000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state53 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000010000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state54 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000100000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state55 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000001000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state56 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000010000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state57 : STD_LOGIC_VECTOR (68 downto 0) := "000000000000100000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state58 : STD_LOGIC_VECTOR (68 downto 0) := "000000000001000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state59 : STD_LOGIC_VECTOR (68 downto 0) := "000000000010000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state60 : STD_LOGIC_VECTOR (68 downto 0) := "000000000100000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state61 : STD_LOGIC_VECTOR (68 downto 0) := "000000001000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state62 : STD_LOGIC_VECTOR (68 downto 0) := "000000010000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state63 : STD_LOGIC_VECTOR (68 downto 0) := "000000100000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state64 : STD_LOGIC_VECTOR (68 downto 0) := "000001000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state65 : STD_LOGIC_VECTOR (68 downto 0) := "000010000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state66 : STD_LOGIC_VECTOR (68 downto 0) := "000100000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state67 : STD_LOGIC_VECTOR (68 downto 0) := "001000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state68 : STD_LOGIC_VECTOR (68 downto 0) := "010000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_ST_fsm_state69 : STD_LOGIC_VECTOR (68 downto 0) := "100000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011011";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_3D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111101";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_31 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110001";
    constant ap_const_lv32_1C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011100";
    constant ap_const_lv32_3E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111110";
    constant ap_const_lv32_1D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011101";
    constant ap_const_lv32_32 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110010";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_12 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010010";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_16 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010110";
    constant ap_const_lv32_1A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011010";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_21 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100001";
    constant ap_const_lv32_24 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100100";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_2A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101010";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";
    constant ap_const_lv32_2E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101110";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_34 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110100";
    constant ap_const_lv32_35 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110101";
    constant ap_const_lv32_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110110";
    constant ap_const_lv32_39 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111001";
    constant ap_const_lv32_3A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111010";
    constant ap_const_lv32_3B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111011";
    constant ap_const_lv32_3C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111100";
    constant ap_const_lv32_41 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000001";
    constant ap_const_lv32_43 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000011";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv11_7D0 : STD_LOGIC_VECTOR (10 downto 0) := "11111010000";
    constant ap_const_lv11_3E8 : STD_LOGIC_VECTOR (10 downto 0) := "01111101000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv11_1F4 : STD_LOGIC_VECTOR (10 downto 0) := "00111110100";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv11_C8 : STD_LOGIC_VECTOR (10 downto 0) := "00011001000";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv11_64 : STD_LOGIC_VECTOR (10 downto 0) := "00001100100";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv18_0 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_42 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000010";
    constant ap_const_lv6_2C : STD_LOGIC_VECTOR (5 downto 0) := "101100";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv56_100000 : STD_LOGIC_VECTOR (55 downto 0) := "00000000000000000000000000000000000100000000000000000000";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_33 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110011";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv32_19 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011001";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_lv32_3E8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001111101000";
    constant ap_const_lv32_80000001 : STD_LOGIC_VECTOR (31 downto 0) := "10000000000000000000000000000001";
    constant ap_const_lv32_44 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000100";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv62_517CC1B7 : STD_LOGIC_VECTOR (61 downto 0) := "00000000000000000000000000000001010001011111001100000110110111";
    constant ap_const_lv93_68DB8BAC710D : STD_LOGIC_VECTOR (92 downto 0) := "000000000000000000000000000000000000000000000011010001101101110001011101011000111000100001101";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv16_10 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000010000";
    constant ap_const_lv7_78 : STD_LOGIC_VECTOR (6 downto 0) := "1111000";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv100_0 : STD_LOGIC_VECTOR (99 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv30_1 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000001";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv17_10000 : STD_LOGIC_VECTOR (16 downto 0) := "10000000000000000";
    constant ap_const_lv17_1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_const_lv4_6 : STD_LOGIC_VECTOR (3 downto 0) := "0110";
    constant ap_const_lv4_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_const_lv9_7D : STD_LOGIC_VECTOR (8 downto 0) := "001111101";
    constant ap_const_lv9_157 : STD_LOGIC_VECTOR (8 downto 0) := "101010111";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv29_0 : STD_LOGIC_VECTOR (28 downto 0) := "00000000000000000000000000000";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv11_19 : STD_LOGIC_VECTOR (10 downto 0) := "00000011001";
    constant ap_const_lv11_A : STD_LOGIC_VECTOR (10 downto 0) := "00000001010";
    constant ap_const_lv18_24A : STD_LOGIC_VECTOR (17 downto 0) := "000000001001001010";
    constant ap_const_lv18_29D : STD_LOGIC_VECTOR (17 downto 0) := "000000001010011101";
    constant ap_const_lv19_334 : STD_LOGIC_VECTOR (18 downto 0) := "0000000001100110100";
    constant ap_const_lv18_290 : STD_LOGIC_VECTOR (17 downto 0) := "000000001010010000";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv5_1E : STD_LOGIC_VECTOR (4 downto 0) := "11110";
    constant ap_const_lv7_5 : STD_LOGIC_VECTOR (6 downto 0) := "0000101";
    constant ap_const_lv6_7 : STD_LOGIC_VECTOR (5 downto 0) := "000111";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv9_6 : STD_LOGIC_VECTOR (8 downto 0) := "000000110";
    constant ap_const_lv9_4 : STD_LOGIC_VECTOR (8 downto 0) := "000000100";
    constant ap_const_lv6_24 : STD_LOGIC_VECTOR (5 downto 0) := "100100";
    constant ap_const_lv6_A : STD_LOGIC_VECTOR (5 downto 0) := "001010";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv46_3FFFFFFFEC78 : STD_LOGIC_VECTOR (45 downto 0) := "1111111111111111111111111111111110110001111000";
    constant ap_const_lv46_1388 : STD_LOGIC_VECTOR (45 downto 0) := "0000000000000000000000000000000001001110001000";
    constant ap_const_lv6_15 : STD_LOGIC_VECTOR (5 downto 0) := "010101";
    constant ap_const_lv32_2D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101101";
    constant ap_const_lv32_5B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011011";
    constant ap_const_lv93_0 : STD_LOGIC_VECTOR (92 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_299A0000 : STD_LOGIC_VECTOR (31 downto 0) := "00101001100110100000000000000000";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv32_23 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100011";
    constant ap_const_lv32_26 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100110";
    constant ap_const_lv14_2710 : STD_LOGIC_VECTOR (13 downto 0) := "10011100010000";
    constant ap_const_lv32_38 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111000";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (68 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal r18_PHASE_MM_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal r18_PHASE_MM_q0 : STD_LOGIC_VECTOR (25 downto 0);
    signal r18_PAIRS_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal r18_PAIRS_q0 : STD_LOGIC_VECTOR (7 downto 0);
    signal reg_2464 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state24 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state24 : signal is "none";
    signal ap_CS_fsm_state28 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state28 : signal is "none";
    signal ap_CS_fsm_state49 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state49 : signal is "none";
    signal ap_CS_fsm_state62 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state62 : signal is "none";
    signal reg_2469 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_2474 : STD_LOGIC_VECTOR (31 downto 0);
    signal reg_2479 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state25 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state25 : signal is "none";
    signal ap_CS_fsm_state50 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state50 : signal is "none";
    signal reg_2484 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state29 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state29 : signal is "none";
    signal ap_CS_fsm_state63 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state63 : signal is "none";
    signal reg_2488 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_2492 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_load_fu_2434_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_2496 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state30 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state30 : signal is "none";
    signal ap_CS_fsm_state51 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state51 : signal is "none";
    signal ap_CS_fsm_state64 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state64 : signal is "none";
    signal grp_load_fu_2440_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_2503 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_load_fu_2446_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal reg_2510 : STD_LOGIC_VECTOR (63 downto 0);
    signal fast_mode_read_reg_5396 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal baseline_two_read_reg_5406 : STD_LOGIC_VECTOR (0 downto 0);
    signal vertical_mm_read_reg_5411 : STD_LOGIC_VECTOR (31 downto 0);
    signal horizontal_mm_read_reg_5416 : STD_LOGIC_VECTOR (31 downto 0);
    signal grid_count_read_reg_5421 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln58_fu_2532_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal trunc_ln58_reg_5426 : STD_LOGIC_VECTOR (16 downto 0);
    signal s_reg_5431 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal s_2_fu_2545_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal s_2_reg_5439 : STD_LOGIC_VECTOR (3 downto 0);
    signal mask_load_reg_5449 : STD_LOGIC_VECTOR (11 downto 0);
    signal f_reg_5454 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal mul115_fu_2580_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal mul115_reg_5470 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal add116_fu_2586_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal add116_reg_5476 : STD_LOGIC_VECTOR (15 downto 0);
    signal tobool_fu_2592_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tobool_reg_5481 : STD_LOGIC_VECTOR (0 downto 0);
    signal s_1_cast51_fu_2598_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal s_1_cast51_reg_5486 : STD_LOGIC_VECTOR (31 downto 0);
    signal o_coefficient_reg_5491 : STD_LOGIC_VECTOR (25 downto 0);
    signal p_fu_2607_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_reg_5499 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal pair_reg_5514 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal add_ln95_1_fu_2668_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln95_1_reg_5525 : STD_LOGIC_VECTOR (15 downto 0);
    signal re_fu_2673_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal re_reg_5530 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal im_reg_5536 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln95_1_fu_2693_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln95_1_reg_5547 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal icmp_ln96_fu_2697_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln96_reg_5552 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln98_1_fu_2756_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln98_1_reg_5558 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal icmp_ln98_fu_2789_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln98_reg_5562 : STD_LOGIC_VECTOR (0 downto 0);
    signal o_group_fu_2825_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal o_group_reg_5566 : STD_LOGIC_VECTOR (1 downto 0);
    signal mask_1_fu_2895_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal mask_1_reg_5571 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln90_fu_2985_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln90_reg_5576 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state18 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state18 : signal is "none";
    signal trunc_ln106_fu_2992_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln106_reg_5585 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln106_fu_3004_p1 : STD_LOGIC_VECTOR (143 downto 0);
    signal g_2_reg_5623 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state19 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state19 : signal is "none";
    signal add_ln108_fu_3116_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln108_reg_5630 : STD_LOGIC_VECTOR (1 downto 0);
    signal sext_ln108_fu_3142_p1 : STD_LOGIC_VECTOR (41 downto 0);
    signal sext_ln108_reg_5635 : STD_LOGIC_VECTOR (41 downto 0);
    signal conv2_i_i_i1144_fu_3152_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal conv2_i_i_i1144_reg_5731 : STD_LOGIC_VECTOR (32 downto 0);
    signal conv_i_i1171_fu_3155_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal conv_i_i1171_reg_5738 : STD_LOGIC_VECTOR (64 downto 0);
    signal select_ln114_fu_3174_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal select_ln114_reg_5745 : STD_LOGIC_VECTOR (16 downto 0);
    signal n_2_fu_3277_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal n_2_reg_5753 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_CS_fsm_state21 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state21 : signal is "none";
    signal select_ln135_cast_cast_fu_3288_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln135_cast_cast_reg_5833 : STD_LOGIC_VECTOR (3 downto 0);
    signal zext_ln130_fu_3295_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln130_reg_5838 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln130_fu_3298_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln130_reg_5843 : STD_LOGIC_VECTOR (8 downto 0);
    signal cx_fu_3355_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal cx_reg_5848 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_state23 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state23 : signal is "none";
    signal sext_ln116_fu_3363_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_reg_5853 : STD_LOGIC_VECTOR (31 downto 0);
    signal cy_fu_3367_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal cy_reg_5861 : STD_LOGIC_VECTOR (15 downto 0);
    signal sext_ln116_1_fu_3375_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_1_reg_5866 : STD_LOGIC_VECTOR (31 downto 0);
    signal cz_fu_3379_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal cz_reg_5874 : STD_LOGIC_VECTOR (15 downto 0);
    signal sext_ln116_2_fu_3383_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln116_2_reg_5879 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln49_fu_3428_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln49_reg_5887 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_1_fu_3456_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_1_reg_5891 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_2_fu_3473_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_2_reg_5895 : STD_LOGIC_VECTOR (0 downto 0);
    signal seeds_x_load_reg_5899 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_x_1_load_reg_5904 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_x_2_load_reg_5909 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_y_load_reg_5914 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_y_1_load_reg_5919 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_y_2_load_reg_5924 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_z_load_reg_5929 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_z_1_load_reg_5934 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_z_2_load_reg_5939 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_score_load_reg_5944 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_score_1_load_reg_5950 : STD_LOGIC_VECTOR (31 downto 0);
    signal seeds_score_2_load_reg_5956 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_1_reg_5968 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state27 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state27 : signal is "none";
    signal by_1_reg_5973 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_1_reg_5978 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_2_reg_5983 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_1_reg_5989 : STD_LOGIC_VECTOR (63 downto 0);
    signal found_5_reg_5994 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_load304_reg_5999 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_load303_reg_6004 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_load302_reg_6009 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln130_fu_3619_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln130_reg_6017 : STD_LOGIC_VECTOR (1 downto 0);
    signal local_best_9_fu_3625_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_9_reg_6022 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln131_fu_3645_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln131_reg_6029 : STD_LOGIC_VECTOR (0 downto 0);
    signal lx_9_fu_3651_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_9_reg_6033 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_9_fu_3671_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_9_reg_6040 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_9_fu_3691_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_9_reg_6047 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln170_1_fu_3711_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_1_reg_6054 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_2_fu_3726_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_2_reg_6059 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_3_fu_3742_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_3_reg_6064 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_4_fu_3758_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_4_reg_6069 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln170_3_fu_3874_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal add_ln170_3_reg_6074 : STD_LOGIC_VECTOR (44 downto 0);
    signal add_ln170_7_fu_3990_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal add_ln170_7_reg_6079 : STD_LOGIC_VECTOR (44 downto 0);
    signal add_ln170_11_fu_4106_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal add_ln170_11_reg_6084 : STD_LOGIC_VECTOR (44 downto 0);
    signal icmp_ln134_fu_4127_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln134_reg_6089 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_2458_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_raw_11_reg_6093 : STD_LOGIC_VECTOR (63 downto 0);
    signal level_2_fu_4152_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal level_2_reg_6101 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state33 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state33 : signal is "none";
    signal zext_ln138_fu_4178_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal zext_ln138_reg_6109 : STD_LOGIC_VECTOR (13 downto 0);
    signal zext_ln138_1_fu_4182_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln138_1_reg_6115 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln141_fu_4186_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln141_reg_6120 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_CS_fsm_state34 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state34 : signal is "none";
    signal add_ln141_1_fu_4192_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln141_1_reg_6125 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln141_2_fu_4198_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal add_ln141_2_reg_6130 : STD_LOGIC_VECTOR (18 downto 0);
    signal add_ln141_3_fu_4204_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln141_3_reg_6135 : STD_LOGIC_VECTOR (17 downto 0);
    signal n_5_fu_4215_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal n_5_reg_6143 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state37 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state37 : signal is "none";
    signal grp_fu_5206_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cx_1_reg_6168 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_5213_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cz_1_reg_6177 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state40 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state40 : signal is "none";
    signal and_ln49_2_fu_4362_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln49_2_reg_6185 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_4287_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal urem_ln145_reg_6189 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state43 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state43 : signal is "none";
    signal ap_CS_fsm_state44 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state44 : signal is "none";
    signal grp_fu_5222_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cy_1_reg_6199 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state47 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state47 : signal is "none";
    signal icmp_ln49_4_fu_4422_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_4_reg_6208 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state48 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state48 : signal is "none";
    signal icmp_ln49_6_fu_4436_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_6_reg_6212 : STD_LOGIC_VECTOR (0 downto 0);
    signal lx_7_fu_4463_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_7_reg_6216 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_7_fu_4470_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_7_reg_6222 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_7_fu_4477_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_7_reg_6228 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_7_fu_4484_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_7_reg_6234 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln150_fu_4492_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln150_reg_6240 : STD_LOGIC_VECTOR (0 downto 0);
    signal best_raw_12_reg_6244 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln129_fu_4522_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state53 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state53 : signal is "none";
    signal select_ln129_1_fu_4542_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal level_3_fu_4556_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal level_3_reg_6262 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state54 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state54 : signal is "none";
    signal lx_10_cast_fu_4596_p1 : STD_LOGIC_VECTOR (45 downto 0);
    signal lx_10_cast_reg_6267 : STD_LOGIC_VECTOR (45 downto 0);
    signal conv576_cast_cast_fu_4608_p3 : STD_LOGIC_VECTOR (45 downto 0);
    signal conv576_cast_cast_reg_6272 : STD_LOGIC_VECTOR (45 downto 0);
    signal ly_10_cast_fu_4616_p1 : STD_LOGIC_VECTOR (45 downto 0);
    signal ly_10_cast_reg_6277 : STD_LOGIC_VECTOR (45 downto 0);
    signal select_ln162_fu_4628_p3 : STD_LOGIC_VECTOR (45 downto 0);
    signal select_ln162_reg_6282 : STD_LOGIC_VECTOR (45 downto 0);
    signal zext_ln162_fu_4640_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln162_reg_6287 : STD_LOGIC_VECTOR (12 downto 0);
    signal sext_ln158_fu_4644_p1 : STD_LOGIC_VECTOR (45 downto 0);
    signal sext_ln158_reg_6292 : STD_LOGIC_VECTOR (45 downto 0);
    signal ap_CS_fsm_state55 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state55 : signal is "none";
    signal add_ln160_fu_4713_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal add_ln160_reg_6305 : STD_LOGIC_VECTOR (45 downto 0);
    signal ap_CS_fsm_state58 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state58 : signal is "none";
    signal tmp_46_reg_6310 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln161_fu_4726_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal add_ln161_reg_6316 : STD_LOGIC_VECTOR (45 downto 0);
    signal tmp_47_reg_6321 : STD_LOGIC_VECTOR (0 downto 0);
    signal mul_ln162_fu_2293_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_ln162_reg_6327 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_ln160_1_fu_2318_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal mul_ln160_1_reg_6332 : STD_LOGIC_VECTOR (92 downto 0);
    signal ap_CS_fsm_state59 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state59 : signal is "none";
    signal tmp_10_cast_reg_6337 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln161_1_fu_2323_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal mul_ln161_1_reg_6343 : STD_LOGIC_VECTOR (92 downto 0);
    signal tmp_14_cast_reg_6348 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln162_1_fu_2328_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal mul_ln162_1_reg_6354 : STD_LOGIC_VECTOR (92 downto 0);
    signal tmp_48_reg_6359 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_18_cast_reg_6365 : STD_LOGIC_VECTOR (31 downto 0);
    signal cx_2_fu_4822_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cx_2_reg_6371 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state60 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state60 : signal is "none";
    signal cy_2_fu_4855_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cy_2_reg_6380 : STD_LOGIC_VECTOR (31 downto 0);
    signal cz_2_fu_4888_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal cz_2_reg_6389 : STD_LOGIC_VECTOR (31 downto 0);
    signal and_ln49_1_fu_4923_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln49_1_reg_6397 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_7_fu_4953_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_7_reg_6401 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state61 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state61 : signal is "none";
    signal icmp_ln49_8_fu_4967_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln49_8_reg_6405 : STD_LOGIC_VECTOR (0 downto 0);
    signal score_2_reg_6409 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_8_fu_4993_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_8_reg_6417 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_8_fu_5000_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_8_reg_6423 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_8_fu_5007_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_8_reg_6429 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_8_fu_5014_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_8_reg_6435 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln166_fu_5021_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln166_reg_6441 : STD_LOGIC_VECTOR (0 downto 0);
    signal best_raw_13_reg_6445 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln158_fu_5035_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln158_reg_6459 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_CS_fsm_state66 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state66 : signal is "none";
    signal tmp_s_fu_5192_p9 : STD_LOGIC_VECTOR (143 downto 0);
    signal ap_CS_fsm_state68 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state68 : signal is "none";
    signal trace_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal trace_ce0 : STD_LOGIC;
    signal trace_we0 : STD_LOGIC;
    signal trace_q0 : STD_LOGIC_VECTOR (39 downto 0);
    signal trace_ce1 : STD_LOGIC;
    signal trace_q1 : STD_LOGIC_VECTOR (39 downto 0);
    signal weights_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal weights_ce0 : STD_LOGIC;
    signal weights_we0 : STD_LOGIC;
    signal weights_q0 : STD_LOGIC_VECTOR (19 downto 0);
    signal blocked_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal blocked_ce0 : STD_LOGIC;
    signal blocked_we0 : STD_LOGIC;
    signal blocked_d0 : STD_LOGIC_VECTOR (0 downto 0);
    signal blocked_q0 : STD_LOGIC_VECTOR (0 downto 0);
    signal blocked_ce1 : STD_LOGIC;
    signal blocked_we1 : STD_LOGIC;
    signal chosen_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal chosen_ce0 : STD_LOGIC;
    signal chosen_we0 : STD_LOGIC;
    signal chosen_q0 : STD_LOGIC_VECTOR (8 downto 0);
    signal obs_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal obs_ce0 : STD_LOGIC;
    signal obs_q0 : STD_LOGIC_VECTOR (77 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out2 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0 : STD_LOGIC_VECTOR (39 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0 : STD_LOGIC_VECTOR (19 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1 : STD_LOGIC_VECTOR (55 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2 : STD_LOGIC_VECTOR (41 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1 : STD_LOGIC;
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0 : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out_ap_vld : STD_LOGIC;
    signal grp_cordic_fu_2185_ap_start : STD_LOGIC;
    signal grp_cordic_fu_2185_ap_done : STD_LOGIC;
    signal grp_cordic_fu_2185_ap_idle : STD_LOGIC;
    signal grp_cordic_fu_2185_ap_ready : STD_LOGIC;
    signal grp_cordic_fu_2185_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_udiv_fu_2193_ap_start : STD_LOGIC;
    signal grp_udiv_fu_2193_ap_done : STD_LOGIC;
    signal grp_udiv_fu_2193_ap_idle : STD_LOGIC;
    signal grp_udiv_fu_2193_ap_ready : STD_LOGIC;
    signal grp_udiv_fu_2193_n : STD_LOGIC_VECTOR (55 downto 0);
    signal grp_udiv_fu_2193_d : STD_LOGIC_VECTOR (41 downto 0);
    signal grp_udiv_fu_2193_ap_return : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_evaluate_fu_2200_ap_start : STD_LOGIC;
    signal grp_evaluate_fu_2200_ap_done : STD_LOGIC;
    signal grp_evaluate_fu_2200_ap_idle : STD_LOGIC;
    signal grp_evaluate_fu_2200_ap_ready : STD_LOGIC;
    signal grp_evaluate_fu_2200_x : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_evaluate_fu_2200_y : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_evaluate_fu_2200_z : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_evaluate_fu_2200_obs_address0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_evaluate_fu_2200_obs_ce0 : STD_LOGIC;
    signal grp_evaluate_fu_2200_ap_return_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_evaluate_fu_2200_ap_return_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_evaluate_fu_2200_ap_return_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_evaluate_fu_2200_ap_return_3 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_idle : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1_ap_vld : STD_LOGIC;
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2_ap_vld : STD_LOGIC;
    signal p_1_reg_763 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_CS_fsm_state16 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state16 : signal is "none";
    signal ap_predicate_op253_call_state16 : BOOLEAN;
    signal ap_block_state16_on_subcall_done : BOOLEAN;
    signal ap_phi_mux_p_ph_phi_fu_778_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_ph_reg_775 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state32 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state32 : signal is "none";
    signal ap_phi_mux_p_ph305_phi_fu_788_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_ph305_reg_785 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_p_ph306_phi_fu_798_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_ph306_reg_795 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_found_1_ph_phi_fu_808_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal found_1_ph_reg_805 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_best_raw_2_ph_phi_fu_819_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_raw_2_ph_reg_816 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_best_4_ph_phi_fu_829_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_4_ph_reg_826 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_bz_2_ph_phi_fu_839_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_2_ph_reg_836 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_by_2_ph_phi_fu_849_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_2_ph_reg_846 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_bx_2_ph_phi_fu_859_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_2_ph_reg_856 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_85_reg_866 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln141_fu_4210_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_86_reg_877 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_87_reg_888 : STD_LOGIC_VECTOR (63 downto 0);
    signal found_1_reg_899 : STD_LOGIC_VECTOR (0 downto 0);
    signal level_reg_910 : STD_LOGIC_VECTOR (2 downto 0);
    signal local_best_reg_921 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_reg_931 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_reg_941 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_reg_951 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_2_reg_961 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_4_reg_972 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_2_reg_983 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_2_reg_994 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_2_reg_1005 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_step_phi_fu_1019_p12 : STD_LOGIC_VECTOR (10 downto 0);
    signal icmp_ln136_fu_4147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_fu_4158_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln138_fu_4169_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal empty_88_reg_1038 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_empty_91_phi_fu_1277_p10 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_89_reg_1050 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_empty_92_phi_fu_1298_p10 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_90_reg_1062 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_empty_93_phi_fu_1319_p10 : STD_LOGIC_VECTOR (63 downto 0);
    signal found_3_reg_1074 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_found_4_phi_fu_1525_p10 : STD_LOGIC_VECTOR (0 downto 0);
    signal n_3_reg_1086 : STD_LOGIC_VECTOR (8 downto 0);
    signal local_best_2_reg_1097 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_local_best_3_phi_fu_1505_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_4_reg_1109 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_lz_3_phi_fu_1485_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_4_reg_1121 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_ly_3_phi_fu_1465_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_4_reg_1133 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_lx_3_phi_fu_1445_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_4_reg_1145 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_best_raw_5_phi_fu_1424_p10 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_6_reg_1157 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_best_7_phi_fu_1403_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_4_reg_1169 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_bz_5_phi_fu_1382_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_4_reg_1181 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_by_5_phi_fu_1361_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_4_reg_1193 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_bx_5_phi_fu_1340_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal phi_mul_reg_1205 : STD_LOGIC_VECTOR (17 downto 0);
    signal phi_mul74_reg_1216 : STD_LOGIC_VECTOR (18 downto 0);
    signal phi_mul76_reg_1227 : STD_LOGIC_VECTOR (17 downto 0);
    signal phi_mul78_reg_1238 : STD_LOGIC_VECTOR (17 downto 0);
    signal phi_urem_reg_1249 : STD_LOGIC_VECTOR (8 downto 0);
    signal phi_urem80_reg_1261 : STD_LOGIC_VECTOR (8 downto 0);
    signal empty_91_reg_1273 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_92_reg_1294 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_93_reg_1315 : STD_LOGIC_VECTOR (63 downto 0);
    signal bx_5_reg_1336 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_5_reg_1357 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_5_reg_1378 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_7_reg_1399 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_5_reg_1420 : STD_LOGIC_VECTOR (63 downto 0);
    signal lx_3_reg_1441 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_3_reg_1461 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_3_reg_1481 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_3_reg_1501 : STD_LOGIC_VECTOR (31 downto 0);
    signal found_4_reg_1521 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_94_reg_1543 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln158_fu_4697_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_95_reg_1554 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_96_reg_1565 : STD_LOGIC_VECTOR (63 downto 0);
    signal found_2_reg_1576 : STD_LOGIC_VECTOR (0 downto 0);
    signal level_1_reg_1587 : STD_LOGIC_VECTOR (1 downto 0);
    signal local_best_1_reg_1598 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_10_reg_1609 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_10_reg_1620 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_10_reg_1631 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_3_reg_1642 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_5_reg_1653 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_3_reg_1664 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_3_reg_1675 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_3_reg_1686 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_97_reg_1697 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln155_fu_4550_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state67 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state67 : signal is "none";
    signal empty_98_reg_1709 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_99_reg_1721 : STD_LOGIC_VECTOR (63 downto 0);
    signal n_4_reg_1733 : STD_LOGIC_VECTOR (5 downto 0);
    signal found_7_reg_1745 : STD_LOGIC_VECTOR (0 downto 0);
    signal local_best_5_reg_1757 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_6_reg_1769 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_6_reg_1781 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_6_reg_1793 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_8_reg_1805 : STD_LOGIC_VECTOR (63 downto 0);
    signal best_9_reg_1817 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_8_reg_1829 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_8_reg_1841 : STD_LOGIC_VECTOR (31 downto 0);
    signal bx_8_reg_1853 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_100_reg_1865 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_101_reg_1886 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_102_reg_1907 : STD_LOGIC_VECTOR (63 downto 0);
    signal bx_7_reg_1928 : STD_LOGIC_VECTOR (31 downto 0);
    signal by_7_reg_1949 : STD_LOGIC_VECTOR (31 downto 0);
    signal bz_7_reg_1970 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_8_reg_1991 : STD_LOGIC_VECTOR (31 downto 0);
    signal best_raw_7_reg_2012 : STD_LOGIC_VECTOR (63 downto 0);
    signal lx_5_reg_2033 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_5_reg_2053 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_5_reg_2073 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_4_reg_2093 : STD_LOGIC_VECTOR (31 downto 0);
    signal found_6_reg_2113 : STD_LOGIC_VECTOR (0 downto 0);
    signal result_local_0_reg_2136 : STD_LOGIC_VECTOR (143 downto 0);
    signal or_ln107_3_fu_3096_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg : STD_LOGIC := '0';
    signal groups_2_fu_430 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal groups_1_fu_426 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal groups_fu_422 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal empty_81_fu_418 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal empty_80_fu_414 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal empty_fu_410 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg : STD_LOGIC := '0';
    signal grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln90_fu_2539_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state17 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state17 : signal is "none";
    signal grp_cordic_fu_2185_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_udiv_fu_2193_ap_start_reg : STD_LOGIC := '0';
    signal icmp_ln108_fu_3110_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state20 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state20 : signal is "none";
    signal grp_evaluate_fu_2200_ap_start_reg : STD_LOGIC := '0';
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg : STD_LOGIC := '0';
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state31 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state31 : signal is "none";
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state52 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state52 : signal is "none";
    signal grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state65 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state65 : signal is "none";
    signal zext_ln90_fu_2551_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal idxprom140_fu_2556_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln92_fu_2613_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln92_fu_2601_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln94_fu_2627_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln95_fu_2663_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln95_1_fu_2685_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln101_fu_2959_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln116_fu_3283_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln114_fu_3272_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal o_slot_fu_398 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal mask_fu_402 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    signal count_fu_406 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal count_1_fu_2953_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal groups_6_fu_2887_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln130_fu_3613_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal groups_5_fu_2879_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal groups_4_fu_2871_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state26 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state26 : signal is "none";
    signal sg_fu_502 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_sig_allocacmp_sg_load_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_load_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_load : STD_LOGIC_VECTOR (63 downto 0);
    signal sg_1_fu_506 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_sig_allocacmp_sg_1_load_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_1_load_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_1_load : STD_LOGIC_VECTOR (63 downto 0);
    signal sg_2_fu_510 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_sig_allocacmp_sg_2_load_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_2_load_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_sig_allocacmp_sg_2_load : STD_LOGIC_VECTOR (63 downto 0);
    signal g_fu_514 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal reciprocal_idx53_val97_fu_518 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal reciprocal_fu_3246_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal reciprocal_idx54_val99_fu_522 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal reciprocal_idx55_val101_fu_526 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal n_fu_530 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    signal seeds_x_fu_534 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal icmp_ln127_fu_3522_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln126_fu_3501_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal seeds_x_1_fu_538 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_x_2_fu_542 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_y_fu_546 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_y_1_fu_550 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_y_2_fu_554 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_z_fu_558 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_z_1_fu_562 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_z_2_fu_566 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_score_fu_570 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_score_1_fu_574 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal seeds_score_2_fu_578 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal k_fu_582 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal bx_fu_586 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal by_fu_590 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal bz_fu_594 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal best_fu_598 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal best_raw_fu_602 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal found_fu_606 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal empty_82_fu_610 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal empty_83_fu_614 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal empty_84_fu_618 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal ap_CS_fsm_state69 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state69 : signal is "none";
    signal chosen_ce0_local : STD_LOGIC;
    signal weights_ce0_local : STD_LOGIC;
    signal r18_PHASE_MM_ce0_local : STD_LOGIC;
    signal r18_PAIRS_ce0_local : STD_LOGIC;
    signal covariance_ce0_local : STD_LOGIC;
    signal covariance_address0_local : STD_LOGIC_VECTOR (15 downto 0);
    signal obs_we0_local : STD_LOGIC;
    signal or_ln101_3_fu_2964_p8 : STD_LOGIC_VECTOR (77 downto 0);
    signal obs_ce0_local : STD_LOGIC;
    signal grid_ce0_local : STD_LOGIC;
    signal ap_CS_fsm_state22 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state22 : signal is "none";
    signal mul_ln160_fu_2285_p0 : STD_LOGIC_VECTOR (13 downto 0);
    signal zext_ln160_fu_4707_p1 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_ln160_fu_2285_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln161_fu_2289_p0 : STD_LOGIC_VECTOR (13 downto 0);
    signal mul_ln161_fu_2289_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln162_fu_2293_p0 : STD_LOGIC_VECTOR (13 downto 0);
    signal mul_ln162_fu_2293_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal pp_fu_2297_p0 : STD_LOGIC_VECTOR (30 downto 0);
    signal pp_fu_2297_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal hh_fu_2301_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv2_i_i61_i1109_fu_3147_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal hh_fu_2301_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_2305_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln97_fu_2741_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln48_fu_4398_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln48_2_fu_4929_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_2305_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_2309_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln97_1_fu_2746_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln48_1_fu_4403_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sext_ln48_3_fu_4934_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_2309_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal phase_fu_2313_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln160_1_fu_2318_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal mul_ln161_1_fu_2323_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal mul_ln162_1_fu_2328_p1 : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_fu_2452_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_13_fu_2569_p3 : STD_LOGIC_VECTOR (11 downto 0);
    signal p_shl1_fu_2562_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_shl261_fu_2576_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln92_1_fu_2618_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln94_fu_2622_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ia_fu_2640_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal ib_fu_2636_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal zext_ln93_fu_2650_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln95_fu_2658_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln93_1_fu_2654_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal aa_fu_2689_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_fu_2703_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln96_1_fu_2717_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln95_2_fu_2707_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal pa_1_fu_2711_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal pb_1_fu_2723_p3 : STD_LOGIC_VECTOR (30 downto 0);
    signal and_ln98_fu_2751_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_2305_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_2309_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln98_1_fu_2765_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln98_fu_2761_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal pp_fu_2297_p2 : STD_LOGIC_VECTOR (61 downto 0);
    signal lshr_ln_fu_2775_p4 : STD_LOGIC_VECTOR (60 downto 0);
    signal add_ln98_fu_2769_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln98_2_fu_2785_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal tmp_15_fu_2795_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_16_fu_2808_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln100_fu_2802_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln100_fu_2819_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln100_fu_2815_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_8_fu_2833_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_fu_2833_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln101_fu_2859_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln101_fu_2865_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal groups_3_fu_2853_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal phase_fu_2313_p2 : STD_LOGIC_VECTOR (61 downto 0);
    signal o_phase_fu_2943_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp2_fu_2996_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal tmp_fu_3014_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_10_fu_3030_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal tmp_11_fu_3046_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal tmp_12_fu_3062_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal icmp_ln107_fu_3008_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln107_1_fu_3024_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln107_3_fu_3056_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln107_4_fu_3072_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln107_1_fu_3084_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln107_2_fu_3040_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln107_2_fu_3090_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln107_fu_3078_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_fu_3122_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_9_fu_3122_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal hh_fu_2301_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_14_fu_3159_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal icmp103_fu_3168_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xx_fu_3387_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal xx_fu_3387_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal yy_fu_3393_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal yy_fu_3393_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_18_fu_3399_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln49_fu_3413_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln49_fu_3417_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_1_fu_3422_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_fu_3407_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xx_fu_3387_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln49_3_fu_3434_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal yy_fu_3393_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln49_4_fu_3442_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln49_1_fu_3446_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln49_fu_3438_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal add_ln49_fu_3450_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal or_ln49_fu_3461_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_ln49_1_fu_3467_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_41_fu_3485_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal k_3_fu_3493_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_3505_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_4_fu_3505_p8 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_3505_p9 : STD_LOGIC_VECTOR (31 downto 0);
    signal local_best_9_fu_3625_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal lx_9_fu_3651_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal ly_9_fu_3671_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal lz_9_fu_3691_p7 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_19_fu_3716_p4 : STD_LOGIC_VECTOR (28 downto 0);
    signal tmp_20_fu_3732_p4 : STD_LOGIC_VECTOR (28 downto 0);
    signal tmp_21_fu_3748_p4 : STD_LOGIC_VECTOR (28 downto 0);
    signal tmp_23_fu_3772_p3 : STD_LOGIC_VECTOR (42 downto 0);
    signal p_shl3_fu_3764_p3 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_2_fu_3780_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_24_fu_3790_p3 : STD_LOGIC_VECTOR (40 downto 0);
    signal add_ln170_fu_3784_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_4_fu_3798_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_25_fu_3808_p3 : STD_LOGIC_VECTOR (38 downto 0);
    signal add_ln170_1_fu_3802_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_6_fu_3816_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_26_fu_3826_p3 : STD_LOGIC_VECTOR (36 downto 0);
    signal sub_ln170_1_fu_3820_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_8_fu_3834_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_27_fu_3844_p3 : STD_LOGIC_VECTOR (34 downto 0);
    signal add_ln170_2_fu_3838_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_9_fu_3852_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_28_fu_3862_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln170_2_fu_3856_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_10_fu_3870_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_29_fu_3888_p3 : STD_LOGIC_VECTOR (42 downto 0);
    signal p_shl4_fu_3880_p3 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_11_fu_3896_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_30_fu_3906_p3 : STD_LOGIC_VECTOR (40 downto 0);
    signal add_ln170_4_fu_3900_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_12_fu_3914_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_31_fu_3924_p3 : STD_LOGIC_VECTOR (38 downto 0);
    signal add_ln170_5_fu_3918_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_13_fu_3932_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_32_fu_3942_p3 : STD_LOGIC_VECTOR (36 downto 0);
    signal sub_ln170_3_fu_3936_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_14_fu_3950_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_33_fu_3960_p3 : STD_LOGIC_VECTOR (34 downto 0);
    signal add_ln170_6_fu_3954_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_15_fu_3968_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_34_fu_3978_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln170_4_fu_3972_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_16_fu_3986_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_35_fu_4004_p3 : STD_LOGIC_VECTOR (42 downto 0);
    signal p_shl_fu_3996_p3 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_17_fu_4012_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_36_fu_4022_p3 : STD_LOGIC_VECTOR (40 downto 0);
    signal add_ln170_8_fu_4016_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_18_fu_4030_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_37_fu_4040_p3 : STD_LOGIC_VECTOR (38 downto 0);
    signal add_ln170_9_fu_4034_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_19_fu_4048_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_38_fu_4058_p3 : STD_LOGIC_VECTOR (36 downto 0);
    signal sub_ln170_5_fu_4052_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_20_fu_4066_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_39_fu_4076_p3 : STD_LOGIC_VECTOR (34 downto 0);
    signal add_ln170_10_fu_4070_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_21_fu_4084_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal tmp_40_fu_4094_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal sub_ln170_6_fu_4088_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_22_fu_4102_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln136_fu_4143_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln138_fu_4163_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_44_fu_4221_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal zext_ln144_fu_4231_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal grp_fu_4251_p0 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_4251_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln8_fu_4257_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal ix_1_fu_4267_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_fu_4287_p0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_fu_4287_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal ix_fu_4235_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal sext_ln143_fu_4273_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal ix_2_fu_4293_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln144_2_fu_4304_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln145_2_fu_4314_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal iz_fu_4308_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal iz_1_fu_4318_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal iz_2_fu_4324_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_45_fu_4335_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln49_2_fu_4348_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln49_3_fu_4351_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_3_fu_4356_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_2_fu_4342_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_4251_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln144_fu_4368_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal trunc_ln145_fu_4378_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal iy_fu_4372_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal iy_1_fu_4381_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal iy_2_fu_4387_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln49_4_fu_4408_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln49_5_fu_4412_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal add_ln49_2_fu_4416_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal or_ln49_2_fu_4427_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln49_4_fu_4431_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln149_fu_4457_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln129_fu_4516_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln129_fu_4510_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal icmp_ln129_1_fu_4536_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln129_1_fu_4530_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal icmp_ln156_fu_4562_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln156_1_fu_4568_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln156_fu_4582_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln156_fu_4574_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_42_fu_4600_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_43_fu_4620_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal step_1_fu_4588_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal sext_ln162_fu_4636_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln160_fu_4707_p0 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_fu_5229_p3 : STD_LOGIC_VECTOR (13 downto 0);
    signal mul_ln160_fu_2285_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal mul_ln161_fu_2289_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal add_ln162_fu_4767_p2 : STD_LOGIC_VECTOR (45 downto 0);
    signal sub_ln160_fu_4795_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal tmp_cast_fu_4800_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln160_fu_4810_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln160_1_fu_4816_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln161_fu_4828_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal tmp_13_cast_fu_4833_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln161_fu_4843_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln161_1_fu_4849_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln162_fu_4861_p2 : STD_LOGIC_VECTOR (92 downto 0);
    signal tmp_17_cast_fu_4866_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln162_1_fu_4876_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal sub_ln162_1_fu_4882_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_49_fu_4894_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal sext_ln49_1_fu_4908_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal icmp_ln49_5_fu_4912_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_5_fu_4917_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln49_4_fu_4902_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln49_3_fu_4943_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal zext_ln49_2_fu_4939_p1 : STD_LOGIC_VECTOR (64 downto 0);
    signal add_ln49_1_fu_4947_p2 : STD_LOGIC_VECTOR (64 downto 0);
    signal or_ln49_5_fu_4958_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln49_3_fu_4962_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln165_fu_4988_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_22_fu_5059_p3 : STD_LOGIC_VECTOR (43 downto 0);
    signal p_shl2_fu_5052_p3 : STD_LOGIC_VECTOR (44 downto 0);
    signal zext_ln170_fu_5067_p1 : STD_LOGIC_VECTOR (44 downto 0);
    signal sub_ln170_fu_5071_p2 : STD_LOGIC_VECTOR (44 downto 0);
    signal shl_ln_fu_5077_p3 : STD_LOGIC_VECTOR (60 downto 0);
    signal zext_ln170_1_fu_5085_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln170_1_fu_5094_p3 : STD_LOGIC_VECTOR (60 downto 0);
    signal zext_ln170_3_fu_5101_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln170_2_fu_5110_p3 : STD_LOGIC_VECTOR (60 downto 0);
    signal zext_ln170_5_fu_5117_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal shl_ln170_3_fu_5126_p3 : STD_LOGIC_VECTOR (60 downto 0);
    signal zext_ln170_7_fu_5133_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln170_fu_5041_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_1_fu_5147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_fu_5142_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_5_fu_5047_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_7_fu_5105_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_8_fu_5121_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_4_fu_5162_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_6_fu_5089_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_5_fu_5168_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_3_fu_5157_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_6_fu_5174_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_2_fu_5151_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln170_7_fu_5180_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln170_9_fu_5137_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal quality_fu_5186_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_5206_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state36 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state36 : signal is "none";
    signal grp_fu_5213_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state39 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state39 : signal is "none";
    signal grp_fu_5222_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_CS_fsm_state46 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state46 : signal is "none";
    signal grp_fu_5229_p0 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_CS_fsm_state57 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state57 : signal is "none";
    signal grp_fu_4251_ap_start : STD_LOGIC;
    signal grp_fu_4251_ap_done : STD_LOGIC;
    signal grp_fu_4287_ap_start : STD_LOGIC;
    signal grp_fu_4287_ap_done : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (68 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ST_fsm_state19_blk : STD_LOGIC;
    signal ap_ST_fsm_state20_blk : STD_LOGIC;
    signal ap_ST_fsm_state21_blk : STD_LOGIC;
    signal ap_ST_fsm_state22_blk : STD_LOGIC;
    signal ap_ST_fsm_state23_blk : STD_LOGIC;
    signal ap_ST_fsm_state24_blk : STD_LOGIC;
    signal ap_block_state25_on_subcall_done : BOOLEAN;
    signal ap_ST_fsm_state25_blk : STD_LOGIC;
    signal ap_ST_fsm_state26_blk : STD_LOGIC;
    signal ap_ST_fsm_state27_blk : STD_LOGIC;
    signal ap_ST_fsm_state28_blk : STD_LOGIC;
    signal ap_ST_fsm_state29_blk : STD_LOGIC;
    signal ap_ST_fsm_state30_blk : STD_LOGIC;
    signal ap_ST_fsm_state31_blk : STD_LOGIC;
    signal ap_ST_fsm_state32_blk : STD_LOGIC;
    signal ap_ST_fsm_state33_blk : STD_LOGIC;
    signal ap_ST_fsm_state34_blk : STD_LOGIC;
    signal ap_ST_fsm_state35_blk : STD_LOGIC;
    signal ap_ST_fsm_state36_blk : STD_LOGIC;
    signal ap_ST_fsm_state37_blk : STD_LOGIC;
    signal ap_ST_fsm_state38_blk : STD_LOGIC;
    signal ap_ST_fsm_state39_blk : STD_LOGIC;
    signal ap_ST_fsm_state40_blk : STD_LOGIC;
    signal ap_ST_fsm_state41_blk : STD_LOGIC;
    signal ap_ST_fsm_state42_blk : STD_LOGIC;
    signal ap_ST_fsm_state43_blk : STD_LOGIC;
    signal ap_ST_fsm_state44_blk : STD_LOGIC;
    signal ap_ST_fsm_state45_blk : STD_LOGIC;
    signal ap_ST_fsm_state46_blk : STD_LOGIC;
    signal ap_ST_fsm_state47_blk : STD_LOGIC;
    signal ap_ST_fsm_state48_blk : STD_LOGIC;
    signal ap_ST_fsm_state49_blk : STD_LOGIC;
    signal ap_ST_fsm_state50_blk : STD_LOGIC;
    signal ap_ST_fsm_state51_blk : STD_LOGIC;
    signal ap_ST_fsm_state52_blk : STD_LOGIC;
    signal ap_ST_fsm_state53_blk : STD_LOGIC;
    signal ap_ST_fsm_state54_blk : STD_LOGIC;
    signal ap_ST_fsm_state55_blk : STD_LOGIC;
    signal ap_ST_fsm_state56_blk : STD_LOGIC;
    signal ap_ST_fsm_state57_blk : STD_LOGIC;
    signal ap_ST_fsm_state58_blk : STD_LOGIC;
    signal ap_ST_fsm_state59_blk : STD_LOGIC;
    signal ap_ST_fsm_state60_blk : STD_LOGIC;
    signal ap_ST_fsm_state61_blk : STD_LOGIC;
    signal ap_ST_fsm_state62_blk : STD_LOGIC;
    signal ap_ST_fsm_state63_blk : STD_LOGIC;
    signal ap_ST_fsm_state64_blk : STD_LOGIC;
    signal ap_ST_fsm_state65_blk : STD_LOGIC;
    signal ap_ST_fsm_state66_blk : STD_LOGIC;
    signal ap_ST_fsm_state67_blk : STD_LOGIC;
    signal ap_ST_fsm_state68_blk : STD_LOGIC;
    signal ap_ST_fsm_state69_blk : STD_LOGIC;
    signal pp_fu_2297_p00 : STD_LOGIC_VECTOR (61 downto 0);
    signal pp_fu_2297_p10 : STD_LOGIC_VECTOR (61 downto 0);
    signal ap_condition_3537 : BOOLEAN;
    signal tmp_8_fu_2833_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_8_fu_2833_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_8_fu_2833_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal mask_1_fu_2895_p0 : STD_LOGIC_VECTOR (11 downto 0);
    signal tmp_9_fu_3122_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_9_fu_3122_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_9_fu_3122_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_3505_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_3505_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_4_fu_3505_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal local_best_9_fu_3625_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal local_best_9_fu_3625_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal local_best_9_fu_3625_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_9_fu_3651_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_9_fu_3651_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal lx_9_fu_3651_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal ly_9_fu_3671_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal ly_9_fu_3671_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal ly_9_fu_3671_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal lz_9_fu_3691_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal lz_9_fu_3691_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal lz_9_fu_3691_p5 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_joint_search_hls_Pipeline_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        groups_2_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        groups_2_out_ap_vld : OUT STD_LOGIC;
        groups_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        groups_1_out_ap_vld : OUT STD_LOGIC;
        groups_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        groups_out_ap_vld : OUT STD_LOGIC;
        p_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        p_out_ap_vld : OUT STD_LOGIC;
        p_out1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        p_out1_ap_vld : OUT STD_LOGIC;
        p_out2 : OUT STD_LOGIC_VECTOR (31 downto 0);
        p_out2_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        covariance_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
        covariance_ce0 : OUT STD_LOGIC;
        covariance_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        trace_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        trace_ce0 : OUT STD_LOGIC;
        trace_we0 : OUT STD_LOGIC;
        trace_d0 : OUT STD_LOGIC_VECTOR (39 downto 0);
        blocked_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        blocked_ce0 : OUT STD_LOGIC;
        blocked_we0 : OUT STD_LOGIC;
        blocked_d0 : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3 IS
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
    end component;


    component joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4 IS
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
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        mask : IN STD_LOGIC_VECTOR (11 downto 0);
        frequencies_out : OUT STD_LOGIC_VECTOR (3 downto 0);
        frequencies_out_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_cordic IS
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
    end component;


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


    component joint_search_hls_evaluate IS
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
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        seeds_x : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_x_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_x_2 : IN STD_LOGIC_VECTOR (31 downto 0);
        sext_ln116 : IN STD_LOGIC_VECTOR (15 downto 0);
        seeds_y : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_y_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_y_2 : IN STD_LOGIC_VECTOR (31 downto 0);
        sext_ln116_1 : IN STD_LOGIC_VECTOR (15 downto 0);
        seeds_z : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_z_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_z_2 : IN STD_LOGIC_VECTOR (31 downto 0);
        sext_ln116_2 : IN STD_LOGIC_VECTOR (15 downto 0);
        seeds_score : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_score_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        seeds_score_2 : IN STD_LOGIC_VECTOR (31 downto 0);
        near_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        near_out_ap_vld : OUT STD_LOGIC;
        worst_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        worst_out_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_134_14 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        empty_67 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty_68 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_load : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_1_load : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_2_load : IN STD_LOGIC_VECTOR (63 downto 0);
        p_out : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out_ap_vld : OUT STD_LOGIC;
        p_out1 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out1_ap_vld : OUT STD_LOGIC;
        p_out2 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out2_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_150_17 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        empty_65 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty_66 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_load_2 : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_1_load_2 : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_2_load_2 : IN STD_LOGIC_VECTOR (63 downto 0);
        p_out : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out_ap_vld : OUT STD_LOGIC;
        p_out1 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out1_ap_vld : OUT STD_LOGIC;
        p_out2 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out2_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_166_20 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        empty_63 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty_64 : IN STD_LOGIC_VECTOR (63 downto 0);
        empty : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_load_1 : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_1_load_1 : IN STD_LOGIC_VECTOR (63 downto 0);
        sg_2_load_1 : IN STD_LOGIC_VECTOR (63 downto 0);
        p_out : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out_ap_vld : OUT STD_LOGIC;
        p_out1 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out1_ap_vld : OUT STD_LOGIC;
        p_out2 : OUT STD_LOGIC_VECTOR (63 downto 0);
        p_out2_ap_vld : OUT STD_LOGIC );
    end component;


    component joint_search_hls_mul_14ns_32s_46_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (13 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (45 downto 0) );
    end component;


    component joint_search_hls_mul_31ns_31ns_62_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (30 downto 0);
        din1 : IN STD_LOGIC_VECTOR (30 downto 0);
        dout : OUT STD_LOGIC_VECTOR (61 downto 0) );
    end component;


    component joint_search_hls_mul_32ns_32ns_64_1_1 IS
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


    component joint_search_hls_mul_32s_32s_64_1_1 IS
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


    component joint_search_hls_mul_32s_32ns_62_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (61 downto 0) );
    end component;


    component joint_search_hls_mul_46s_48ns_93_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (45 downto 0);
        din1 : IN STD_LOGIC_VECTOR (47 downto 0);
        dout : OUT STD_LOGIC_VECTOR (92 downto 0) );
    end component;


    component joint_search_hls_sparsemux_7_2_32_1_1 IS
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
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        def : IN STD_LOGIC_VECTOR (31 downto 0);
        sel : IN STD_LOGIC_VECTOR (1 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_bitset_12ns_12ns_32ns_1s_12_1_1 IS
    generic (
        DATAWIDTH : INTEGER;
        ADDRWIDTH : INTEGER );
    port (
        din : IN STD_LOGIC_VECTOR (11 downto 0);
        sel : IN STD_LOGIC_VECTOR (31 downto 0);
        value : IN STD_LOGIC_VECTOR (0 downto 0);
        dout : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;


    component joint_search_hls_mul_16s_16s_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_urem_7ns_4ns_3_11_seq_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        done : OUT STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (6 downto 0);
        din1 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (2 downto 0) );
    end component;


    component joint_search_hls_urem_6ns_4ns_3_10_seq_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        done : OUT STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (5 downto 0);
        din1 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (2 downto 0) );
    end component;


    component joint_search_hls_mac_muladd_11ns_5s_32s_32_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (10 downto 0);
        din1 : IN STD_LOGIC_VECTOR (4 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_mac_muladd_11ns_3s_32s_32_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (10 downto 0);
        din1 : IN STD_LOGIC_VECTOR (2 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component joint_search_hls_mac_muladd_7ns_6s_14s_14_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (6 downto 0);
        din1 : IN STD_LOGIC_VECTOR (5 downto 0);
        din2 : IN STD_LOGIC_VECTOR (13 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (13 downto 0) );
    end component;


    component joint_search_hls_r18_PHASE_MM_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (25 downto 0) );
    end component;


    component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component joint_search_hls_trace_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (39 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (39 downto 0);
        address1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (39 downto 0) );
    end component;


    component joint_search_hls_weights_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (19 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (19 downto 0) );
    end component;


    component joint_search_hls_blocked_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (0 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (0 downto 0);
        address1 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce1 : IN STD_LOGIC;
        we1 : IN STD_LOGIC;
        d1 : IN STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component joint_search_hls_chosen_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (8 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (8 downto 0) );
    end component;


    component joint_search_hls_obs_RAM_1P_BRAM_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (77 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (77 downto 0) );
    end component;



begin
    r18_PHASE_MM_U : component joint_search_hls_r18_PHASE_MM_ROM_AUTO_1R
    generic map (
        DataWidth => 26,
        AddressRange => 266,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_PHASE_MM_address0,
        ce0 => r18_PHASE_MM_ce0_local,
        q0 => r18_PHASE_MM_q0);

    r18_PAIRS_U : component joint_search_hls_candidate_score_Pipeline_VITIS_LOOP_26_3_r18_PAIRS_ROM_AUTO_1R
    generic map (
        DataWidth => 8,
        AddressRange => 120,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => r18_PAIRS_address0,
        ce0 => r18_PAIRS_ce0_local,
        q0 => r18_PAIRS_q0);

    trace_U : component joint_search_hls_trace_RAM_AUTO_1R1W
    generic map (
        DataWidth => 40,
        AddressRange => 266,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => trace_address0,
        ce0 => trace_ce0,
        we0 => trace_we0,
        d0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0,
        q0 => trace_q0,
        address1 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1,
        ce1 => trace_ce1,
        q1 => trace_q1);

    weights_U : component joint_search_hls_weights_RAM_AUTO_1R1W
    generic map (
        DataWidth => 20,
        AddressRange => 266,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => weights_address0,
        ce0 => weights_ce0,
        we0 => weights_we0,
        d0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0,
        q0 => weights_q0);

    blocked_U : component joint_search_hls_blocked_RAM_AUTO_1R1W
    generic map (
        DataWidth => 1,
        AddressRange => 266,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => blocked_address0,
        ce0 => blocked_ce0,
        we0 => blocked_we0,
        d0 => blocked_d0,
        q0 => blocked_q0,
        address1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1,
        ce1 => blocked_ce1,
        we1 => blocked_we1,
        d1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1);

    chosen_U : component joint_search_hls_chosen_RAM_AUTO_1R1W
    generic map (
        DataWidth => 9,
        AddressRange => 12,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => chosen_address0,
        ce0 => chosen_ce0,
        we0 => chosen_we0,
        d0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0,
        q0 => chosen_q0);

    obs_U : component joint_search_hls_obs_RAM_1P_BRAM_1R1W
    generic map (
        DataWidth => 78,
        AddressRange => 1440,
        AddressWidth => 11)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => obs_address0,
        ce0 => obs_ce0,
        we0 => obs_we0_local,
        d0 => or_ln101_3_fu_2964_p8,
        q0 => obs_q0);

    grp_joint_search_hls_Pipeline_1_fu_2146 : component joint_search_hls_joint_search_hls_Pipeline_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_1_fu_2146_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_1_fu_2146_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_1_fu_2146_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready,
        groups_2_out => grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out,
        groups_2_out_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld,
        groups_1_out => grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out,
        groups_1_out_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld,
        groups_out => grp_joint_search_hls_Pipeline_1_fu_2146_groups_out,
        groups_out_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld,
        p_out => grp_joint_search_hls_Pipeline_1_fu_2146_p_out,
        p_out_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld,
        p_out1 => grp_joint_search_hls_Pipeline_1_fu_2146_p_out1,
        p_out1_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld,
        p_out2 => grp_joint_search_hls_Pipeline_1_fu_2146_p_out2,
        p_out2_ap_vld => grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready,
        covariance_address0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0,
        covariance_ce0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0,
        covariance_q0 => covariance_q0,
        trace_address0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0,
        trace_ce0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0,
        trace_we0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0,
        trace_d0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_d0,
        blocked_address0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0,
        blocked_ce0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0,
        blocked_we0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0,
        blocked_d0 => grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0);

    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166 : component joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start,
        ap_done => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done,
        ap_idle => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_idle,
        ap_ready => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready,
        trace_address0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0,
        trace_ce0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0,
        trace_q0 => trace_q0,
        trace_address1 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address1,
        trace_ce1 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1,
        trace_q1 => trace_q1,
        weights_address0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0,
        weights_ce0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0,
        weights_we0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0,
        weights_d0 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_d0,
        grp_udiv_fu_2193_p_din1 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1,
        grp_udiv_fu_2193_p_din2 => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2,
        grp_udiv_fu_2193_p_dout0 => grp_udiv_fu_2193_ap_return,
        grp_udiv_fu_2193_p_start => grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start,
        grp_udiv_fu_2193_p_ready => grp_udiv_fu_2193_ap_ready,
        grp_udiv_fu_2193_p_done => grp_udiv_fu_2193_ap_done,
        grp_udiv_fu_2193_p_idle => grp_udiv_fu_2193_ap_idle);

    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172 : component joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start,
        ap_done => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done,
        ap_idle => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_idle,
        ap_ready => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready,
        chosen_address0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0,
        chosen_ce0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0,
        chosen_we0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0,
        chosen_d0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_d0,
        blocked_address0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0,
        blocked_ce0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0,
        blocked_we0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0,
        blocked_d0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0,
        blocked_q0 => blocked_q0,
        blocked_address1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address1,
        blocked_ce1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1,
        blocked_we1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1,
        blocked_d1 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d1,
        weights_address0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0,
        weights_ce0 => grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0,
        weights_q0 => weights_q0);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready,
        mask => mask_load_reg_5449,
        frequencies_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out,
        frequencies_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out_ap_vld);

    grp_cordic_fu_2185 : component joint_search_hls_cordic
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_cordic_fu_2185_ap_start,
        ap_done => grp_cordic_fu_2185_ap_done,
        ap_idle => grp_cordic_fu_2185_ap_idle,
        ap_ready => grp_cordic_fu_2185_ap_ready,
        vx => re_reg_5530,
        vy => im_reg_5536,
        ap_return => grp_cordic_fu_2185_ap_return);

    grp_udiv_fu_2193 : component joint_search_hls_udiv
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_udiv_fu_2193_ap_start,
        ap_done => grp_udiv_fu_2193_ap_done,
        ap_idle => grp_udiv_fu_2193_ap_idle,
        ap_ready => grp_udiv_fu_2193_ap_ready,
        n => grp_udiv_fu_2193_n,
        d => grp_udiv_fu_2193_d,
        ap_return => grp_udiv_fu_2193_ap_return);

    grp_evaluate_fu_2200 : component joint_search_hls_evaluate
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_evaluate_fu_2200_ap_start,
        ap_done => grp_evaluate_fu_2200_ap_done,
        ap_idle => grp_evaluate_fu_2200_ap_idle,
        ap_ready => grp_evaluate_fu_2200_ap_ready,
        x => grp_evaluate_fu_2200_x,
        y => grp_evaluate_fu_2200_y,
        z => grp_evaluate_fu_2200_z,
        obs_address0 => grp_evaluate_fu_2200_obs_address0,
        obs_ce0 => grp_evaluate_fu_2200_obs_ce0,
        obs_q0 => obs_q0,
        count => trunc_ln90_reg_5576,
        baseline_two => baseline_two_read_reg_5406,
        reciprocal_0_0_val => reg_2464,
        reciprocal_0_1_val => reg_2469,
        reciprocal_0_2_val => reg_2474,
        ap_return_0 => grp_evaluate_fu_2200_ap_return_0,
        ap_return_1 => grp_evaluate_fu_2200_ap_return_1,
        ap_return_2 => grp_evaluate_fu_2200_ap_return_2,
        ap_return_3 => grp_evaluate_fu_2200_ap_return_3);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready,
        seeds_x => seeds_x_load_reg_5899,
        seeds_x_1 => seeds_x_1_load_reg_5904,
        seeds_x_2 => seeds_x_2_load_reg_5909,
        sext_ln116 => cx_reg_5848,
        seeds_y => seeds_y_load_reg_5914,
        seeds_y_1 => seeds_y_1_load_reg_5919,
        seeds_y_2 => seeds_y_2_load_reg_5924,
        sext_ln116_1 => cy_reg_5861,
        seeds_z => seeds_z_load_reg_5929,
        seeds_z_1 => seeds_z_1_load_reg_5934,
        seeds_z_2 => seeds_z_2_load_reg_5939,
        sext_ln116_2 => cz_reg_5874,
        seeds_score => seeds_score_load_reg_5944,
        seeds_score_1 => seeds_score_1_load_reg_5950,
        seeds_score_2 => seeds_score_2_load_reg_5956,
        near_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out,
        near_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out_ap_vld,
        worst_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out,
        worst_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out_ap_vld);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_134_14
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready,
        empty_67 => empty_84_fu_618,
        empty_68 => empty_83_fu_614,
        empty => empty_82_fu_610,
        sg_load => reg_2496,
        sg_1_load => reg_2503,
        sg_2_load => reg_2510,
        p_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out,
        p_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out_ap_vld,
        p_out1 => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1,
        p_out1_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1_ap_vld,
        p_out2 => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2,
        p_out2_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2_ap_vld);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_150_17
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready,
        empty_65 => empty_88_reg_1038,
        empty_66 => empty_89_reg_1050,
        empty => empty_90_reg_1062,
        sg_load_2 => reg_2496,
        sg_1_load_2 => reg_2503,
        sg_2_load_2 => reg_2510,
        p_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out,
        p_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out_ap_vld,
        p_out1 => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1,
        p_out1_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1_ap_vld,
        p_out2 => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2,
        p_out2_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2_ap_vld);

    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269 : component joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_166_20
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start,
        ap_done => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done,
        ap_idle => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_idle,
        ap_ready => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready,
        empty_63 => empty_97_reg_1697,
        empty_64 => empty_98_reg_1709,
        empty => empty_99_reg_1721,
        sg_load_1 => reg_2496,
        sg_1_load_1 => reg_2503,
        sg_2_load_1 => reg_2510,
        p_out => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out,
        p_out_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out_ap_vld,
        p_out1 => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1,
        p_out1_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1_ap_vld,
        p_out2 => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2,
        p_out2_ap_vld => grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2_ap_vld);

    mul_14ns_32s_46_1_1_U190 : component joint_search_hls_mul_14ns_32s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 14,
        din1_WIDTH => 32,
        dout_WIDTH => 46)
    port map (
        din0 => mul_ln160_fu_2285_p0,
        din1 => mul_ln160_fu_2285_p1,
        dout => mul_ln160_fu_2285_p2);

    mul_14ns_32s_46_1_1_U191 : component joint_search_hls_mul_14ns_32s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 14,
        din1_WIDTH => 32,
        dout_WIDTH => 46)
    port map (
        din0 => mul_ln161_fu_2289_p0,
        din1 => mul_ln161_fu_2289_p1,
        dout => mul_ln161_fu_2289_p2);

    mul_14ns_32s_46_1_1_U192 : component joint_search_hls_mul_14ns_32s_46_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 14,
        din1_WIDTH => 32,
        dout_WIDTH => 46)
    port map (
        din0 => mul_ln162_fu_2293_p0,
        din1 => mul_ln162_fu_2293_p1,
        dout => mul_ln162_fu_2293_p2);

    mul_31ns_31ns_62_1_1_U193 : component joint_search_hls_mul_31ns_31ns_62_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 31,
        din1_WIDTH => 31,
        dout_WIDTH => 62)
    port map (
        din0 => pp_fu_2297_p0,
        din1 => pp_fu_2297_p1,
        dout => pp_fu_2297_p2);

    mul_32ns_32ns_64_1_1_U194 : component joint_search_hls_mul_32ns_32ns_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => hh_fu_2301_p0,
        din1 => hh_fu_2301_p1,
        dout => hh_fu_2301_p2);

    mul_32s_32s_64_1_1_U195 : component joint_search_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => grp_fu_2305_p0,
        din1 => grp_fu_2305_p1,
        dout => grp_fu_2305_p2);

    mul_32s_32s_64_1_1_U196 : component joint_search_hls_mul_32s_32s_64_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 64)
    port map (
        din0 => grp_fu_2309_p0,
        din1 => grp_fu_2309_p1,
        dout => grp_fu_2309_p2);

    mul_32s_32ns_62_1_1_U197 : component joint_search_hls_mul_32s_32ns_62_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 62)
    port map (
        din0 => grp_cordic_fu_2185_ap_return,
        din1 => phase_fu_2313_p1,
        dout => phase_fu_2313_p2);

    mul_46s_48ns_93_1_1_U198 : component joint_search_hls_mul_46s_48ns_93_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 46,
        din1_WIDTH => 48,
        dout_WIDTH => 93)
    port map (
        din0 => add_ln160_reg_6305,
        din1 => mul_ln160_1_fu_2318_p1,
        dout => mul_ln160_1_fu_2318_p2);

    mul_46s_48ns_93_1_1_U199 : component joint_search_hls_mul_46s_48ns_93_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 46,
        din1_WIDTH => 48,
        dout_WIDTH => 93)
    port map (
        din0 => add_ln161_reg_6316,
        din1 => mul_ln161_1_fu_2323_p1,
        dout => mul_ln161_1_fu_2323_p2);

    mul_46s_48ns_93_1_1_U200 : component joint_search_hls_mul_46s_48ns_93_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 46,
        din1_WIDTH => 48,
        dout_WIDTH => 93)
    port map (
        din0 => add_ln162_fu_4767_p2,
        din1 => mul_ln162_1_fu_2328_p1,
        dout => mul_ln162_1_fu_2328_p2);

    sparsemux_7_2_32_1_1_U201 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => groups_fu_422,
        din1 => groups_1_fu_426,
        din2 => groups_2_fu_430,
        def => tmp_8_fu_2833_p7,
        sel => o_group_fu_2825_p3,
        dout => tmp_8_fu_2833_p9);

    bitset_12ns_12ns_32ns_1s_12_1_1_U202 : component joint_search_hls_bitset_12ns_12ns_32ns_1s_12_1_1
    generic map (
        DATAWIDTH => 12,
        ADDRWIDTH => 32)
    port map (
        din => mask_fu_402,
        sel => s_1_cast51_reg_5486,
        value => ap_const_lv1_1,
        dout => mask_1_fu_2895_p4);

    sparsemux_7_2_32_1_1_U203 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => groups_fu_422,
        din1 => groups_1_fu_426,
        din2 => groups_2_fu_430,
        def => tmp_9_fu_3122_p7,
        sel => g_fu_514,
        dout => tmp_9_fu_3122_p9);

    mul_16s_16s_32_1_1_U204 : component joint_search_hls_mul_16s_16s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        din0 => xx_fu_3387_p0,
        din1 => xx_fu_3387_p1,
        dout => xx_fu_3387_p2);

    mul_16s_16s_32_1_1_U205 : component joint_search_hls_mul_16s_16s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        din0 => yy_fu_3393_p0,
        din1 => yy_fu_3393_p1,
        dout => yy_fu_3393_p2);

    sparsemux_7_2_32_1_1_U206 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_score_load_reg_5944,
        din1 => seeds_score_1_load_reg_5950,
        din2 => seeds_score_2_load_reg_5956,
        def => tmp_4_fu_3505_p7,
        sel => tmp_4_fu_3505_p8,
        dout => tmp_4_fu_3505_p9);

    sparsemux_7_2_32_1_1_U207 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_score_fu_570,
        din1 => seeds_score_1_fu_574,
        din2 => seeds_score_2_fu_578,
        def => local_best_9_fu_3625_p7,
        sel => k_fu_582,
        dout => local_best_9_fu_3625_p9);

    sparsemux_7_2_32_1_1_U208 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_x_fu_534,
        din1 => seeds_x_1_fu_538,
        din2 => seeds_x_2_fu_542,
        def => lx_9_fu_3651_p7,
        sel => k_fu_582,
        dout => lx_9_fu_3651_p9);

    sparsemux_7_2_32_1_1_U209 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_y_fu_546,
        din1 => seeds_y_1_fu_550,
        din2 => seeds_y_2_fu_554,
        def => ly_9_fu_3671_p7,
        sel => k_fu_582,
        dout => ly_9_fu_3671_p9);

    sparsemux_7_2_32_1_1_U210 : component joint_search_hls_sparsemux_7_2_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        CASE0 => "00",
        din0_WIDTH => 32,
        CASE1 => "01",
        din1_WIDTH => 32,
        CASE2 => "10",
        din2_WIDTH => 32,
        def_WIDTH => 32,
        sel_WIDTH => 2,
        dout_WIDTH => 32)
    port map (
        din0 => seeds_z_fu_558,
        din1 => seeds_z_1_fu_562,
        din2 => seeds_z_2_fu_566,
        def => lz_9_fu_3691_p7,
        sel => k_fu_582,
        dout => lz_9_fu_3691_p9);

    urem_7ns_4ns_3_11_seq_1_U211 : component joint_search_hls_urem_7ns_4ns_3_11_seq_1
    generic map (
        ID => 1,
        NUM_STAGE => 11,
        din0_WIDTH => 7,
        din1_WIDTH => 4,
        dout_WIDTH => 3)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        start => grp_fu_4251_ap_start,
        done => grp_fu_4251_ap_done,
        din0 => grp_fu_4251_p0,
        din1 => grp_fu_4251_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_4251_p2);

    urem_6ns_4ns_3_10_seq_1_U212 : component joint_search_hls_urem_6ns_4ns_3_10_seq_1
    generic map (
        ID => 1,
        NUM_STAGE => 10,
        din0_WIDTH => 6,
        din1_WIDTH => 4,
        dout_WIDTH => 3)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        start => grp_fu_4287_ap_start,
        done => grp_fu_4287_ap_done,
        din0 => grp_fu_4287_p0,
        din1 => grp_fu_4287_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_4287_p2);

    mac_muladd_11ns_5s_32s_32_4_1_U213 : component joint_search_hls_mac_muladd_11ns_5s_32s_32_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 11,
        din1_WIDTH => 5,
        din2_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_5206_p0,
        din1 => ix_2_fu_4293_p3,
        din2 => lx_reg_951,
        ce => ap_const_logic_1,
        dout => grp_fu_5206_p3);

    mac_muladd_11ns_3s_32s_32_4_1_U214 : component joint_search_hls_mac_muladd_11ns_3s_32s_32_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 11,
        din1_WIDTH => 3,
        din2_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_5213_p0,
        din1 => iz_2_fu_4324_p3,
        din2 => lz_reg_931,
        ce => ap_const_logic_1,
        dout => grp_fu_5213_p3);

    mac_muladd_11ns_3s_32s_32_4_1_U215 : component joint_search_hls_mac_muladd_11ns_3s_32s_32_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 11,
        din1_WIDTH => 3,
        din2_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_5222_p0,
        din1 => iy_2_fu_4387_p3,
        din2 => ly_reg_941,
        ce => ap_const_logic_1,
        dout => grp_fu_5222_p3);

    mac_muladd_7ns_6s_14s_14_4_1_U216 : component joint_search_hls_mac_muladd_7ns_6s_14s_14_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 7,
        din1_WIDTH => 6,
        din2_WIDTH => 14,
        dout_WIDTH => 14)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        din0 => grp_fu_5229_p0,
        din1 => n_4_reg_1733,
        din2 => ap_const_lv14_2710,
        ce => ap_const_logic_1,
        dout => grp_fu_5229_p3);





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


    grp_cordic_fu_2185_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_cordic_fu_2185_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                    grp_cordic_fu_2185_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_cordic_fu_2185_ap_ready = ap_const_logic_1)) then 
                    grp_cordic_fu_2185_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_evaluate_fu_2200_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_evaluate_fu_2200_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state62) or (ap_const_logic_1 = ap_CS_fsm_state49) or (ap_const_logic_1 = ap_CS_fsm_state28) or (ap_const_logic_1 = ap_CS_fsm_state24))) then 
                    grp_evaluate_fu_2200_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_evaluate_fu_2200_ap_ready = ap_const_logic_1)) then 
                    grp_evaluate_fu_2200_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_1_fu_2146_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln90_fu_2539_p2 = ap_const_lv1_1))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state24)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln134_fu_4127_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= ap_const_logic_0;
            else
                if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_ready = ap_const_logic_1)) then 
                    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_udiv_fu_2193_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_udiv_fu_2193_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_0))) then 
                    grp_udiv_fu_2193_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_udiv_fu_2193_ap_ready = ap_const_logic_1)) then 
                    grp_udiv_fu_2193_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    best_4_ph_reg_826_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                best_4_ph_reg_826 <= local_best_9_reg_6022;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                best_4_ph_reg_826 <= best_fu_598;
            end if; 
        end if;
    end process;

    best_4_reg_972_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                best_4_reg_972 <= ap_phi_mux_best_4_ph_phi_fu_829_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                best_4_reg_972 <= best_6_reg_1157;
            end if; 
        end if;
    end process;

    best_5_reg_1653_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                best_5_reg_1653 <= best_4_reg_972;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                best_5_reg_1653 <= best_9_reg_1817;
            end if; 
        end if;
    end process;

    best_6_reg_1157_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                best_6_reg_1157 <= ap_phi_mux_best_7_phi_fu_1403_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                best_6_reg_1157 <= best_4_reg_972;
            end if; 
        end if;
    end process;

    best_7_reg_1399_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                best_7_reg_1399 <= reg_2479;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                best_7_reg_1399 <= best_6_reg_1157;
            end if; 
        end if;
    end process;

    best_8_reg_1991_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                best_8_reg_1991 <= score_2_reg_6409;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                best_8_reg_1991 <= best_9_reg_1817;
            end if; 
        end if;
    end process;

    best_9_reg_1817_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                best_9_reg_1817 <= best_8_reg_1991;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                best_9_reg_1817 <= best_5_reg_1653;
            end if; 
        end if;
    end process;

    best_fu_598_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                best_fu_598 <= ap_const_lv32_80000001;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                best_fu_598 <= best_5_reg_1653;
            end if; 
        end if;
    end process;

    best_raw_2_ph_reg_816_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                best_raw_2_ph_reg_816 <= best_raw_11_reg_6093;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                best_raw_2_ph_reg_816 <= best_raw_fu_602;
            end if; 
        end if;
    end process;

    best_raw_2_reg_961_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                best_raw_2_reg_961 <= ap_phi_mux_best_raw_2_ph_phi_fu_819_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                best_raw_2_reg_961 <= best_raw_4_reg_1145;
            end if; 
        end if;
    end process;

    best_raw_3_reg_1642_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                best_raw_3_reg_1642 <= best_raw_2_reg_961;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                best_raw_3_reg_1642 <= best_raw_8_reg_1805;
            end if; 
        end if;
    end process;

    best_raw_4_reg_1145_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                best_raw_4_reg_1145 <= ap_phi_mux_best_raw_5_phi_fu_1424_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                best_raw_4_reg_1145 <= best_raw_2_reg_961;
            end if; 
        end if;
    end process;

    best_raw_5_reg_1420_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                best_raw_5_reg_1420 <= best_raw_12_reg_6244;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                best_raw_5_reg_1420 <= best_raw_4_reg_1145;
            end if; 
        end if;
    end process;

    best_raw_7_reg_2012_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                best_raw_7_reg_2012 <= best_raw_13_reg_6445;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                best_raw_7_reg_2012 <= best_raw_8_reg_1805;
            end if; 
        end if;
    end process;

    best_raw_8_reg_1805_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                best_raw_8_reg_1805 <= best_raw_7_reg_2012;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                best_raw_8_reg_1805 <= best_raw_3_reg_1642;
            end if; 
        end if;
    end process;

    best_raw_fu_602_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                best_raw_fu_602 <= ap_const_lv64_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                best_raw_fu_602 <= best_raw_3_reg_1642;
            end if; 
        end if;
    end process;

    bx_2_ph_reg_856_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                bx_2_ph_reg_856 <= lx_9_reg_6033;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                bx_2_ph_reg_856 <= bx_fu_586;
            end if; 
        end if;
    end process;

    bx_2_reg_1005_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                bx_2_reg_1005 <= ap_phi_mux_bx_2_ph_phi_fu_859_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                bx_2_reg_1005 <= bx_4_reg_1193;
            end if; 
        end if;
    end process;

    bx_3_reg_1686_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                bx_3_reg_1686 <= bx_2_reg_1005;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                bx_3_reg_1686 <= bx_8_reg_1853;
            end if; 
        end if;
    end process;

    bx_4_reg_1193_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                bx_4_reg_1193 <= ap_phi_mux_bx_5_phi_fu_1340_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                bx_4_reg_1193 <= bx_2_reg_1005;
            end if; 
        end if;
    end process;

    bx_5_reg_1336_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                bx_5_reg_1336 <= cx_1_reg_6168;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                bx_5_reg_1336 <= bx_4_reg_1193;
            end if; 
        end if;
    end process;

    bx_7_reg_1928_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                bx_7_reg_1928 <= cx_2_reg_6371;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                bx_7_reg_1928 <= bx_8_reg_1853;
            end if; 
        end if;
    end process;

    bx_8_reg_1853_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                bx_8_reg_1853 <= bx_7_reg_1928;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                bx_8_reg_1853 <= bx_3_reg_1686;
            end if; 
        end if;
    end process;

    bx_fu_586_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                bx_fu_586 <= ap_const_lv32_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                bx_fu_586 <= bx_3_reg_1686;
            end if; 
        end if;
    end process;

    by_2_ph_reg_846_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                by_2_ph_reg_846 <= ly_9_reg_6040;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                by_2_ph_reg_846 <= by_fu_590;
            end if; 
        end if;
    end process;

    by_2_reg_994_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                by_2_reg_994 <= ap_phi_mux_by_2_ph_phi_fu_849_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                by_2_reg_994 <= by_4_reg_1181;
            end if; 
        end if;
    end process;

    by_3_reg_1675_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                by_3_reg_1675 <= by_2_reg_994;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                by_3_reg_1675 <= by_8_reg_1841;
            end if; 
        end if;
    end process;

    by_4_reg_1181_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                by_4_reg_1181 <= ap_phi_mux_by_5_phi_fu_1361_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                by_4_reg_1181 <= by_2_reg_994;
            end if; 
        end if;
    end process;

    by_5_reg_1357_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                by_5_reg_1357 <= cy_1_reg_6199;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                by_5_reg_1357 <= by_4_reg_1181;
            end if; 
        end if;
    end process;

    by_7_reg_1949_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                by_7_reg_1949 <= cy_2_reg_6380;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                by_7_reg_1949 <= by_8_reg_1841;
            end if; 
        end if;
    end process;

    by_8_reg_1841_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                by_8_reg_1841 <= by_7_reg_1949;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                by_8_reg_1841 <= by_3_reg_1675;
            end if; 
        end if;
    end process;

    by_fu_590_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                by_fu_590 <= ap_const_lv32_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                by_fu_590 <= by_3_reg_1675;
            end if; 
        end if;
    end process;

    bz_2_ph_reg_836_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                bz_2_ph_reg_836 <= lz_9_reg_6047;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                bz_2_ph_reg_836 <= bz_fu_594;
            end if; 
        end if;
    end process;

    bz_2_reg_983_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                bz_2_reg_983 <= ap_phi_mux_bz_2_ph_phi_fu_839_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                bz_2_reg_983 <= bz_4_reg_1169;
            end if; 
        end if;
    end process;

    bz_3_reg_1664_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                bz_3_reg_1664 <= bz_2_reg_983;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                bz_3_reg_1664 <= bz_8_reg_1829;
            end if; 
        end if;
    end process;

    bz_4_reg_1169_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                bz_4_reg_1169 <= ap_phi_mux_bz_5_phi_fu_1382_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                bz_4_reg_1169 <= bz_2_reg_983;
            end if; 
        end if;
    end process;

    bz_5_reg_1378_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                bz_5_reg_1378 <= cz_1_reg_6177;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                bz_5_reg_1378 <= bz_4_reg_1169;
            end if; 
        end if;
    end process;

    bz_7_reg_1970_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                bz_7_reg_1970 <= cz_2_reg_6389;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                bz_7_reg_1970 <= bz_8_reg_1829;
            end if; 
        end if;
    end process;

    bz_8_reg_1829_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                bz_8_reg_1829 <= bz_7_reg_1970;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                bz_8_reg_1829 <= bz_3_reg_1664;
            end if; 
        end if;
    end process;

    bz_fu_594_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                bz_fu_594 <= ap_const_lv32_3E8;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                bz_fu_594 <= bz_3_reg_1664;
            end if; 
        end if;
    end process;

    count_fu_406_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                count_fu_406 <= ap_const_lv32_0;
            elsif (((ap_const_boolean_0 = ap_block_state16_on_subcall_done) and (ap_const_lv1_1 = and_ln98_1_reg_5558) and (icmp_ln98_reg_5562 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state16))) then 
                count_fu_406 <= count_1_fu_2953_p2;
            end if; 
        end if;
    end process;

    empty_100_reg_1865_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                empty_100_reg_1865 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                empty_100_reg_1865 <= empty_97_reg_1697;
            end if; 
        end if;
    end process;

    empty_101_reg_1886_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                empty_101_reg_1886 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out1;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                empty_101_reg_1886 <= empty_98_reg_1709;
            end if; 
        end if;
    end process;

    empty_102_reg_1907_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                empty_102_reg_1907 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_p_out2;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                empty_102_reg_1907 <= empty_99_reg_1721;
            end if; 
        end if;
    end process;

    empty_80_fu_414_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                empty_80_fu_414 <= groups_5_fu_2879_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out1_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                empty_80_fu_414 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out1;
            end if; 
        end if;
    end process;

    empty_81_fu_418_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                empty_81_fu_418 <= groups_4_fu_2871_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                empty_81_fu_418 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out;
            end if; 
        end if;
    end process;

    empty_82_fu_610_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                empty_82_fu_610 <= ap_const_lv64_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                empty_82_fu_610 <= empty_96_reg_1565;
            end if; 
        end if;
    end process;

    empty_83_fu_614_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                empty_83_fu_614 <= ap_const_lv64_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                empty_83_fu_614 <= empty_95_reg_1554;
            end if; 
        end if;
    end process;

    empty_84_fu_618_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                empty_84_fu_618 <= ap_const_lv64_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                empty_84_fu_618 <= empty_94_reg_1543;
            end if; 
        end if;
    end process;

    empty_85_reg_866_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                empty_85_reg_866 <= ap_phi_mux_p_ph_phi_fu_778_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                empty_85_reg_866 <= empty_88_reg_1038;
            end if; 
        end if;
    end process;

    empty_86_reg_877_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                empty_86_reg_877 <= ap_phi_mux_p_ph305_phi_fu_788_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                empty_86_reg_877 <= empty_89_reg_1050;
            end if; 
        end if;
    end process;

    empty_87_reg_888_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                empty_87_reg_888 <= ap_phi_mux_p_ph306_phi_fu_798_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                empty_87_reg_888 <= empty_90_reg_1062;
            end if; 
        end if;
    end process;

    empty_88_reg_1038_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                empty_88_reg_1038 <= ap_phi_mux_empty_91_phi_fu_1277_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                empty_88_reg_1038 <= empty_85_reg_866;
            end if; 
        end if;
    end process;

    empty_89_reg_1050_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                empty_89_reg_1050 <= ap_phi_mux_empty_92_phi_fu_1298_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                empty_89_reg_1050 <= empty_86_reg_877;
            end if; 
        end if;
    end process;

    empty_90_reg_1062_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                empty_90_reg_1062 <= ap_phi_mux_empty_93_phi_fu_1319_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                empty_90_reg_1062 <= empty_87_reg_888;
            end if; 
        end if;
    end process;

    empty_91_reg_1273_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                empty_91_reg_1273 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                empty_91_reg_1273 <= empty_88_reg_1038;
            end if; 
        end if;
    end process;

    empty_92_reg_1294_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                empty_92_reg_1294 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                empty_92_reg_1294 <= empty_89_reg_1050;
            end if; 
        end if;
    end process;

    empty_93_reg_1315_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                empty_93_reg_1315 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                empty_93_reg_1315 <= empty_90_reg_1062;
            end if; 
        end if;
    end process;

    empty_94_reg_1543_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                empty_94_reg_1543 <= empty_85_reg_866;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                empty_94_reg_1543 <= empty_97_reg_1697;
            end if; 
        end if;
    end process;

    empty_95_reg_1554_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                empty_95_reg_1554 <= empty_86_reg_877;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                empty_95_reg_1554 <= empty_98_reg_1709;
            end if; 
        end if;
    end process;

    empty_96_reg_1565_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                empty_96_reg_1565 <= empty_87_reg_888;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                empty_96_reg_1565 <= empty_99_reg_1721;
            end if; 
        end if;
    end process;

    empty_97_reg_1697_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                empty_97_reg_1697 <= empty_100_reg_1865;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                empty_97_reg_1697 <= empty_94_reg_1543;
            end if; 
        end if;
    end process;

    empty_98_reg_1709_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                empty_98_reg_1709 <= empty_101_reg_1886;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                empty_98_reg_1709 <= empty_95_reg_1554;
            end if; 
        end if;
    end process;

    empty_99_reg_1721_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                empty_99_reg_1721 <= empty_102_reg_1907;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                empty_99_reg_1721 <= empty_96_reg_1565;
            end if; 
        end if;
    end process;

    empty_fu_410_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                empty_fu_410 <= groups_6_fu_2887_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_p_out2_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                empty_fu_410 <= grp_joint_search_hls_Pipeline_1_fu_2146_p_out2;
            end if; 
        end if;
    end process;

    found_1_ph_reg_805_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                found_1_ph_reg_805 <= ap_const_lv1_1;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                found_1_ph_reg_805 <= found_fu_606;
            end if; 
        end if;
    end process;

    found_1_reg_899_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                found_1_reg_899 <= ap_phi_mux_found_1_ph_phi_fu_808_p4;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                found_1_reg_899 <= found_3_reg_1074;
            end if; 
        end if;
    end process;

    found_2_reg_1576_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                found_2_reg_1576 <= found_1_reg_899;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                found_2_reg_1576 <= found_7_reg_1745;
            end if; 
        end if;
    end process;

    found_3_reg_1074_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                found_3_reg_1074 <= ap_phi_mux_found_4_phi_fu_1525_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                found_3_reg_1074 <= found_1_reg_899;
            end if; 
        end if;
    end process;

    found_4_reg_1521_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                found_4_reg_1521 <= ap_const_lv1_1;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                found_4_reg_1521 <= found_3_reg_1074;
            end if; 
        end if;
    end process;

    found_6_reg_2113_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                found_6_reg_2113 <= ap_const_lv1_1;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                found_6_reg_2113 <= found_7_reg_1745;
            end if; 
        end if;
    end process;

    found_7_reg_1745_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                found_7_reg_1745 <= found_6_reg_2113;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                found_7_reg_1745 <= found_2_reg_1576;
            end if; 
        end if;
    end process;

    found_fu_606_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                found_fu_606 <= ap_const_lv1_0;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_1))) then 
                found_fu_606 <= found_2_reg_1576;
            end if; 
        end if;
    end process;

    g_fu_514_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state18) and (or_ln107_3_fu_3096_p2 = ap_const_lv1_0))) then 
                g_fu_514 <= ap_const_lv2_0;
            elsif (((grp_udiv_fu_2193_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state20))) then 
                g_fu_514 <= add_ln108_reg_5630;
            end if; 
        end if;
    end process;

    groups_1_fu_426_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                groups_1_fu_426 <= groups_5_fu_2879_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                groups_1_fu_426 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_1_out;
            end if; 
        end if;
    end process;

    groups_2_fu_430_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                groups_2_fu_430 <= groups_4_fu_2871_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                groups_2_fu_430 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_2_out;
            end if; 
        end if;
    end process;

    groups_fu_422_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then 
                groups_fu_422 <= groups_6_fu_2887_p3;
            elsif (((grp_joint_search_hls_Pipeline_1_fu_2146_groups_out_ap_vld = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                groups_fu_422 <= grp_joint_search_hls_Pipeline_1_fu_2146_groups_out;
            end if; 
        end if;
    end process;

    k_fu_582_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then 
                k_fu_582 <= ap_const_lv2_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state54) and ((icmp_ln131_reg_6029 = ap_const_lv1_1) or (icmp_ln155_fu_4550_p2 = ap_const_lv1_1)))) then 
                k_fu_582 <= add_ln130_reg_6017;
            end if; 
        end if;
    end process;

    level_1_reg_1587_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                level_1_reg_1587 <= ap_const_lv2_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                level_1_reg_1587 <= level_3_reg_6262;
            end if; 
        end if;
    end process;

    level_reg_910_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                level_reg_910 <= ap_const_lv3_0;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                level_reg_910 <= level_2_reg_6101;
            end if; 
        end if;
    end process;

    local_best_1_reg_1598_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                local_best_1_reg_1598 <= local_best_reg_921;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                local_best_1_reg_1598 <= local_best_5_reg_1757;
            end if; 
        end if;
    end process;

    local_best_2_reg_1097_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                local_best_2_reg_1097 <= ap_phi_mux_local_best_3_phi_fu_1505_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                local_best_2_reg_1097 <= local_best_reg_921;
            end if; 
        end if;
    end process;

    local_best_3_reg_1501_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
                local_best_3_reg_1501 <= local_best_7_fu_4484_p3;
            elsif (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                local_best_3_reg_1501 <= local_best_7_reg_6234;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                local_best_3_reg_1501 <= local_best_2_reg_1097;
            end if; 
        end if;
    end process;

    local_best_4_reg_2093_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
                local_best_4_reg_2093 <= local_best_8_fu_5014_p3;
            elsif (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                local_best_4_reg_2093 <= local_best_8_reg_6435;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                local_best_4_reg_2093 <= local_best_5_reg_1757;
            end if; 
        end if;
    end process;

    local_best_5_reg_1757_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                local_best_5_reg_1757 <= local_best_4_reg_2093;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                local_best_5_reg_1757 <= local_best_1_reg_1598;
            end if; 
        end if;
    end process;

    local_best_reg_921_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                local_best_reg_921 <= local_best_9_reg_6022;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                local_best_reg_921 <= local_best_2_reg_1097;
            end if; 
        end if;
    end process;

    lx_10_reg_1631_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                lx_10_reg_1631 <= lx_reg_951;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                lx_10_reg_1631 <= lx_6_reg_1793;
            end if; 
        end if;
    end process;

    lx_3_reg_1441_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
                lx_3_reg_1441 <= lx_7_fu_4463_p3;
            elsif (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                lx_3_reg_1441 <= lx_7_reg_6216;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                lx_3_reg_1441 <= lx_4_reg_1133;
            end if; 
        end if;
    end process;

    lx_4_reg_1133_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                lx_4_reg_1133 <= ap_phi_mux_lx_3_phi_fu_1445_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                lx_4_reg_1133 <= lx_reg_951;
            end if; 
        end if;
    end process;

    lx_5_reg_2033_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
                lx_5_reg_2033 <= lx_8_fu_4993_p3;
            elsif (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                lx_5_reg_2033 <= lx_8_reg_6417;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                lx_5_reg_2033 <= lx_6_reg_1793;
            end if; 
        end if;
    end process;

    lx_6_reg_1793_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                lx_6_reg_1793 <= lx_5_reg_2033;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                lx_6_reg_1793 <= lx_10_reg_1631;
            end if; 
        end if;
    end process;

    lx_reg_951_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                lx_reg_951 <= lx_9_reg_6033;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                lx_reg_951 <= lx_4_reg_1133;
            end if; 
        end if;
    end process;

    ly_10_reg_1620_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                ly_10_reg_1620 <= ly_reg_941;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                ly_10_reg_1620 <= ly_6_reg_1781;
            end if; 
        end if;
    end process;

    ly_3_reg_1461_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
                ly_3_reg_1461 <= ly_7_fu_4470_p3;
            elsif (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                ly_3_reg_1461 <= ly_7_reg_6222;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                ly_3_reg_1461 <= ly_4_reg_1121;
            end if; 
        end if;
    end process;

    ly_4_reg_1121_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                ly_4_reg_1121 <= ap_phi_mux_ly_3_phi_fu_1465_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                ly_4_reg_1121 <= ly_reg_941;
            end if; 
        end if;
    end process;

    ly_5_reg_2053_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
                ly_5_reg_2053 <= ly_8_fu_5000_p3;
            elsif (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                ly_5_reg_2053 <= ly_8_reg_6423;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                ly_5_reg_2053 <= ly_6_reg_1781;
            end if; 
        end if;
    end process;

    ly_6_reg_1781_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                ly_6_reg_1781 <= ly_5_reg_2053;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                ly_6_reg_1781 <= ly_10_reg_1620;
            end if; 
        end if;
    end process;

    ly_reg_941_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                ly_reg_941 <= ly_9_reg_6040;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                ly_reg_941 <= ly_4_reg_1121;
            end if; 
        end if;
    end process;

    lz_10_reg_1609_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then 
                lz_10_reg_1609 <= lz_reg_931;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then 
                lz_10_reg_1609 <= lz_6_reg_1769;
            end if; 
        end if;
    end process;

    lz_3_reg_1481_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
                lz_3_reg_1481 <= lz_7_fu_4477_p3;
            elsif (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
                lz_3_reg_1481 <= lz_7_reg_6228;
            elsif ((((ap_const_lv1_0 = and_ln49_2_reg_6185) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_1) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48)) or ((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state48)))) then 
                lz_3_reg_1481 <= lz_4_reg_1109;
            end if; 
        end if;
    end process;

    lz_4_reg_1109_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                lz_4_reg_1109 <= ap_phi_mux_lz_3_phi_fu_1485_p10;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                lz_4_reg_1109 <= lz_reg_931;
            end if; 
        end if;
    end process;

    lz_5_reg_2073_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
                lz_5_reg_2073 <= lz_8_fu_5007_p3;
            elsif (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln166_reg_6441 = ap_const_lv1_1) and (icmp_ln49_8_reg_6405 = ap_const_lv1_0) and (icmp_ln49_7_reg_6401 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state66))) then 
                lz_5_reg_2073 <= lz_8_reg_6429;
            elsif ((((ap_const_lv1_0 = and_ln49_1_reg_6397) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_1) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61)) or ((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state61)))) then 
                lz_5_reg_2073 <= lz_6_reg_1769;
            end if; 
        end if;
    end process;

    lz_6_reg_1769_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                lz_6_reg_1769 <= lz_5_reg_2073;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                lz_6_reg_1769 <= lz_10_reg_1609;
            end if; 
        end if;
    end process;

    lz_reg_931_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state32)) then 
                lz_reg_931 <= lz_9_reg_6047;
            elsif (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
                lz_reg_931 <= lz_4_reg_1109;
            end if; 
        end if;
    end process;

    mask_fu_402_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                mask_fu_402 <= ap_const_lv12_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state15)) then 
                mask_fu_402 <= mask_1_reg_5571;
            end if; 
        end if;
    end process;

    n_3_reg_1086_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                n_3_reg_1086 <= n_5_reg_6143;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                n_3_reg_1086 <= ap_const_lv9_0;
            end if; 
        end if;
    end process;

    n_4_reg_1733_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state67)) then 
                n_4_reg_1733 <= add_ln158_reg_6459;
            elsif (((icmp_ln131_reg_6029 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state54) and (icmp_ln155_fu_4550_p2 = ap_const_lv1_0))) then 
                n_4_reg_1733 <= ap_const_lv6_2C;
            end if; 
        end if;
    end process;

    n_fu_530_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                n_fu_530 <= ap_const_lv17_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state26)) then 
                n_fu_530 <= n_2_reg_5753;
            end if; 
        end if;
    end process;

    o_slot_fu_398_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                o_slot_fu_398 <= ap_const_lv4_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state10) and (icmp_ln92_fu_2601_p2 = ap_const_lv1_1))) then 
                o_slot_fu_398 <= s_2_reg_5439;
            end if; 
        end if;
    end process;

    p_1_reg_763_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state16_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state16))) then 
                p_1_reg_763 <= p_reg_5499;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
                p_1_reg_763 <= ap_const_lv7_0;
            end if; 
        end if;
    end process;

    p_ph305_reg_785_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                p_ph305_reg_785 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                p_ph305_reg_785 <= empty_83_fu_614;
            end if; 
        end if;
    end process;

    p_ph306_reg_795_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                p_ph306_reg_795 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                p_ph306_reg_795 <= empty_82_fu_610;
            end if; 
        end if;
    end process;

    p_ph_reg_775_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
                p_ph_reg_775 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out;
            elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
                p_ph_reg_775 <= empty_84_fu_618;
            end if; 
        end if;
    end process;

    phi_mul74_reg_1216_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_mul74_reg_1216 <= add_ln141_2_reg_6130;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_mul74_reg_1216 <= ap_const_lv19_0;
            end if; 
        end if;
    end process;

    phi_mul76_reg_1227_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_mul76_reg_1227 <= add_ln141_1_reg_6125;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_mul76_reg_1227 <= ap_const_lv18_0;
            end if; 
        end if;
    end process;

    phi_mul78_reg_1238_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_mul78_reg_1238 <= add_ln141_reg_6120;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_mul78_reg_1238 <= ap_const_lv18_0;
            end if; 
        end if;
    end process;

    phi_mul_reg_1205_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_mul_reg_1205 <= add_ln141_3_reg_6135;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_mul_reg_1205 <= ap_const_lv18_0;
            end if; 
        end if;
    end process;

    phi_urem80_reg_1261_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_urem80_reg_1261 <= select_ln129_fu_4522_p3;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_urem80_reg_1261 <= ap_const_lv9_0;
            end if; 
        end if;
    end process;

    phi_urem_reg_1249_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state53)) then 
                phi_urem_reg_1249 <= select_ln129_1_fu_4542_p3;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then 
                phi_urem_reg_1249 <= ap_const_lv9_0;
            end if; 
        end if;
    end process;

    result_local_0_reg_2136_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state68)) then 
                                result_local_0_reg_2136(97 downto 0) <= tmp_s_fu_5192_p9(97 downto 0);                result_local_0_reg_2136(143 downto 100) <= tmp_s_fu_5192_p9(143 downto 100);
            elsif (((ap_const_logic_1 = ap_CS_fsm_state18) and (or_ln107_3_fu_3096_p2 = ap_const_lv1_1))) then 
                                result_local_0_reg_2136(97 downto 0) <= zext_ln106_fu_3004_p1(97 downto 0);                result_local_0_reg_2136(143 downto 100) <= zext_ln106_fu_3004_p1(143 downto 100);
            end if; 
        end if;
    end process;

    seeds_score_1_fu_574_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_score_1_fu_574 <= ap_const_lv32_80000001;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_1) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_score_1_fu_574 <= reg_2479;
            end if; 
        end if;
    end process;

    seeds_score_2_fu_578_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_score_2_fu_578 <= ap_const_lv32_80000001;
            elsif ((not((trunc_ln126_fu_3501_p1 = ap_const_lv2_1)) and not((trunc_ln126_fu_3501_p1 = ap_const_lv2_0)) and (ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_score_2_fu_578 <= reg_2479;
            end if; 
        end if;
    end process;

    seeds_score_fu_570_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_score_fu_570 <= ap_const_lv32_80000001;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_0) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_score_fu_570 <= reg_2479;
            end if; 
        end if;
    end process;

    seeds_x_1_fu_538_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_x_1_fu_538 <= ap_const_lv32_0;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_1) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_x_1_fu_538 <= sext_ln116_reg_5853;
            end if; 
        end if;
    end process;

    seeds_x_2_fu_542_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_x_2_fu_542 <= ap_const_lv32_0;
            elsif ((not((trunc_ln126_fu_3501_p1 = ap_const_lv2_1)) and not((trunc_ln126_fu_3501_p1 = ap_const_lv2_0)) and (ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_x_2_fu_542 <= sext_ln116_reg_5853;
            end if; 
        end if;
    end process;

    seeds_x_fu_534_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_x_fu_534 <= ap_const_lv32_0;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_0) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_x_fu_534 <= sext_ln116_reg_5853;
            end if; 
        end if;
    end process;

    seeds_y_1_fu_550_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_y_1_fu_550 <= ap_const_lv32_0;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_1) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_y_1_fu_550 <= sext_ln116_1_reg_5866;
            end if; 
        end if;
    end process;

    seeds_y_2_fu_554_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_y_2_fu_554 <= ap_const_lv32_0;
            elsif ((not((trunc_ln126_fu_3501_p1 = ap_const_lv2_1)) and not((trunc_ln126_fu_3501_p1 = ap_const_lv2_0)) and (ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_y_2_fu_554 <= sext_ln116_1_reg_5866;
            end if; 
        end if;
    end process;

    seeds_y_fu_546_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_y_fu_546 <= ap_const_lv32_0;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_0) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_y_fu_546 <= sext_ln116_1_reg_5866;
            end if; 
        end if;
    end process;

    seeds_z_1_fu_562_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_z_1_fu_562 <= ap_const_lv32_3E8;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_1) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_z_1_fu_562 <= sext_ln116_2_reg_5879;
            end if; 
        end if;
    end process;

    seeds_z_2_fu_566_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_z_2_fu_566 <= ap_const_lv32_3E8;
            elsif ((not((trunc_ln126_fu_3501_p1 = ap_const_lv2_1)) and not((trunc_ln126_fu_3501_p1 = ap_const_lv2_0)) and (ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_z_2_fu_566 <= sext_ln116_2_reg_5879;
            end if; 
        end if;
    end process;

    seeds_z_fu_558_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then 
                seeds_z_fu_558 <= ap_const_lv32_3E8;
            elsif (((ap_const_lv1_1 = and_ln49_reg_5887) and (icmp_ln49_2_reg_5895 = ap_const_lv1_0) and (icmp_ln49_1_reg_5891 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state26) and (trunc_ln126_fu_3501_p1 = ap_const_lv2_0) and (icmp_ln127_fu_3522_p2 = ap_const_lv1_1))) then 
                seeds_z_fu_558 <= sext_ln116_2_reg_5879;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state9)) then
                    add116_reg_5476(15 downto 3) <= add116_fu_2586_p2(15 downto 3);
                    mul115_reg_5470(15 downto 3) <= mul115_fu_2580_p2(15 downto 3);
                o_coefficient_reg_5491 <= r18_PHASE_MM_q0;
                    s_1_cast51_reg_5486(3 downto 0) <= s_1_cast51_fu_2598_p1(3 downto 0);
                tobool_reg_5481 <= tobool_fu_2592_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state19)) then
                add_ln108_reg_5630 <= add_ln108_fu_3116_p2;
                    conv2_i_i_i1144_reg_5731(31 downto 0) <= conv2_i_i_i1144_fu_3152_p1(31 downto 0);
                    conv_i_i1171_reg_5738(63 downto 0) <= conv_i_i1171_fu_3155_p1(63 downto 0);
                g_2_reg_5623 <= g_fu_514;
                select_ln114_reg_5745 <= select_ln114_fu_3174_p3;
                sext_ln108_reg_5635 <= sext_ln108_fu_3142_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state27)) then
                add_ln130_reg_6017 <= add_ln130_fu_3619_p2;
                    add_ln170_11_reg_6084(44 downto 1) <= add_ln170_11_fu_4106_p2(44 downto 1);
                    add_ln170_3_reg_6074(44 downto 1) <= add_ln170_3_fu_3874_p2(44 downto 1);
                    add_ln170_7_reg_6079(44 downto 1) <= add_ln170_7_fu_3990_p2(44 downto 1);
                best_2_reg_5983 <= best_fu_598;
                best_raw_1_reg_5989 <= best_raw_fu_602;
                bx_1_reg_5968 <= bx_fu_586;
                by_1_reg_5973 <= by_fu_590;
                bz_1_reg_5978 <= bz_fu_594;
                found_5_reg_5994 <= found_fu_606;
                icmp_ln131_reg_6029 <= icmp_ln131_fu_3645_p2;
                icmp_ln170_1_reg_6054 <= icmp_ln170_1_fu_3711_p2;
                icmp_ln170_2_reg_6059 <= icmp_ln170_2_fu_3726_p2;
                icmp_ln170_3_reg_6064 <= icmp_ln170_3_fu_3742_p2;
                icmp_ln170_4_reg_6069 <= icmp_ln170_4_fu_3758_p2;
                local_best_9_reg_6022 <= local_best_9_fu_3625_p9;
                lx_9_reg_6033 <= lx_9_fu_3651_p9;
                ly_9_reg_6040 <= ly_9_fu_3671_p9;
                lz_9_reg_6047 <= lz_9_fu_3691_p9;
                p_load302_reg_6009 <= empty_84_fu_618;
                p_load303_reg_6004 <= empty_83_fu_614;
                p_load304_reg_5999 <= empty_82_fu_610;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state34)) then
                add_ln141_1_reg_6125 <= add_ln141_1_fu_4192_p2;
                add_ln141_2_reg_6130 <= add_ln141_2_fu_4198_p2;
                add_ln141_3_reg_6135 <= add_ln141_3_fu_4204_p2;
                add_ln141_reg_6120 <= add_ln141_fu_4186_p2;
                n_5_reg_6143 <= n_5_fu_4215_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state66)) then
                add_ln158_reg_6459 <= add_ln158_fu_5035_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state58)) then
                add_ln160_reg_6305 <= add_ln160_fu_4713_p2;
                add_ln161_reg_6316 <= add_ln161_fu_4726_p2;
                mul_ln162_reg_6327 <= mul_ln162_fu_2293_p2;
                tmp_46_reg_6310 <= add_ln160_fu_4713_p2(45 downto 45);
                tmp_47_reg_6321 <= add_ln161_fu_4726_p2(45 downto 45);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state11)) then
                add_ln95_1_reg_5525 <= add_ln95_1_fu_2668_p2;
                pair_reg_5514 <= r18_PAIRS_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state60)) then
                and_ln49_1_reg_6397 <= and_ln49_1_fu_4923_p2;
                cx_2_reg_6371 <= cx_2_fu_4822_p3;
                cy_2_reg_6380 <= cy_2_fu_4855_p3;
                cz_2_reg_6389 <= cz_2_fu_4888_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state40)) then
                and_ln49_2_reg_6185 <= and_ln49_2_fu_4362_p2;
                cz_1_reg_6177 <= grp_fu_5213_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state23)) then
                and_ln49_reg_5887 <= and_ln49_fu_3428_p2;
                cx_reg_5848 <= grid_q0(47 downto 32);
                cy_reg_5861 <= grid_q0(31 downto 16);
                cz_reg_5874 <= cz_fu_3379_p1;
                icmp_ln49_1_reg_5891 <= icmp_ln49_1_fu_3456_p2;
                icmp_ln49_2_reg_5895 <= icmp_ln49_2_fu_3473_p2;
                sext_ln116_1_reg_5866 <= sext_ln116_1_fu_3375_p1;
                sext_ln116_2_reg_5879 <= sext_ln116_2_fu_3383_p1;
                sext_ln116_reg_5853 <= sext_ln116_fu_3363_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state14)) then
                and_ln98_1_reg_5558 <= and_ln98_1_fu_2756_p2;
                icmp_ln98_reg_5562 <= icmp_ln98_fu_2789_p2;
                mask_1_reg_5571 <= mask_1_fu_2895_p4;
                o_group_reg_5566 <= o_group_fu_2825_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                baseline_two_read_reg_5406 <= baseline_two;
                fast_mode_read_reg_5396 <= fast_mode;
                grid_count_read_reg_5421 <= grid_count;
                horizontal_mm_read_reg_5416 <= horizontal_mm;
                trunc_ln58_reg_5426 <= trunc_ln58_fu_2532_p1;
                vertical_mm_read_reg_5411 <= vertical_mm;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state30)) then
                best_raw_11_reg_6093 <= grp_fu_2458_p2;
                icmp_ln134_reg_6089 <= icmp_ln134_fu_4127_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state51)) then
                best_raw_12_reg_6244 <= grp_fu_2458_p2;
                icmp_ln150_reg_6240 <= icmp_ln150_fu_4492_p2;
                local_best_7_reg_6234 <= local_best_7_fu_4484_p3;
                lx_7_reg_6216 <= lx_7_fu_4463_p3;
                ly_7_reg_6222 <= ly_7_fu_4470_p3;
                lz_7_reg_6228 <= lz_7_fu_4477_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state64)) then
                best_raw_13_reg_6445 <= grp_fu_2458_p2;
                icmp_ln166_reg_6441 <= icmp_ln166_fu_5021_p2;
                local_best_8_reg_6435 <= local_best_8_fu_5014_p3;
                lx_8_reg_6417 <= lx_8_fu_4993_p3;
                ly_8_reg_6423 <= ly_8_fu_5000_p3;
                lz_8_reg_6429 <= lz_8_fu_5007_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state54)) then
                    conv576_cast_cast_reg_6272(45 downto 4) <= conv576_cast_cast_fu_4608_p3(45 downto 4);
                level_3_reg_6262 <= level_3_fu_4556_p2;
                lx_10_cast_reg_6267 <= lx_10_cast_fu_4596_p1;
                ly_10_cast_reg_6277 <= ly_10_cast_fu_4616_p1;
                    select_ln162_reg_6282(45 downto 4) <= select_ln162_fu_4628_p3(45 downto 4);
                sext_ln158_reg_6292 <= sext_ln158_fu_4644_p1;
                    zext_ln162_reg_6287(3 downto 0) <= zext_ln162_fu_4640_p1(3 downto 0);    zext_ln162_reg_6287(6 downto 5) <= zext_ln162_fu_4640_p1(6 downto 5);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state37)) then
                cx_1_reg_6168 <= grp_fu_5206_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state47)) then
                cy_1_reg_6199 <= grp_fu_5222_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                f_reg_5454 <= chosen_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state48)) then
                icmp_ln49_4_reg_6208 <= icmp_ln49_4_fu_4422_p2;
                icmp_ln49_6_reg_6212 <= icmp_ln49_6_fu_4436_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state61)) then
                icmp_ln49_7_reg_6401 <= icmp_ln49_7_fu_4953_p2;
                icmp_ln49_8_reg_6405 <= icmp_ln49_8_fu_4967_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state13)) then
                icmp_ln96_reg_5552 <= icmp_ln96_fu_2697_p2;
                trunc_ln95_1_reg_5547 <= trunc_ln95_1_fu_2693_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state12)) then
                im_reg_5536 <= covariance_q0(63 downto 32);
                re_reg_5530 <= re_fu_2673_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state33)) then
                level_2_reg_6101 <= level_2_fu_4152_p2;
                    zext_ln138_1_reg_6115(10 downto 0) <= zext_ln138_1_fu_4182_p1(10 downto 0);
                    zext_ln138_reg_6109(10 downto 0) <= zext_ln138_fu_4178_p1(10 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
                mask_load_reg_5449 <= mask_fu_402;
                s_2_reg_5439 <= s_2_fu_2545_p2;
                s_reg_5431 <= o_slot_fu_398;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state59)) then
                mul_ln160_1_reg_6332 <= mul_ln160_1_fu_2318_p2;
                mul_ln161_1_reg_6343 <= mul_ln161_1_fu_2323_p2;
                mul_ln162_1_reg_6354 <= mul_ln162_1_fu_2328_p2;
                tmp_10_cast_reg_6337 <= mul_ln160_1_fu_2318_p2(91 downto 60);
                tmp_14_cast_reg_6348 <= mul_ln161_1_fu_2323_p2(91 downto 60);
                tmp_18_cast_reg_6365 <= mul_ln162_1_fu_2328_p2(91 downto 60);
                tmp_48_reg_6359 <= add_ln162_fu_4767_p2(45 downto 45);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state21)) then
                n_2_reg_5753 <= n_2_fu_3277_p2;
                    select_ln130_reg_5843(1) <= select_ln130_fu_3298_p3(1);    select_ln130_reg_5843(3) <= select_ln130_fu_3298_p3(3);    select_ln130_reg_5843(5) <= select_ln130_fu_3298_p3(5);    select_ln130_reg_5843(8) <= select_ln130_fu_3298_p3(8);
                    select_ln135_cast_cast_reg_5833(0) <= select_ln135_cast_cast_fu_3288_p3(0);
                    zext_ln130_reg_5838(0) <= zext_ln130_fu_3295_p1(0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then
                p_reg_5499 <= p_fu_2607_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_udiv_fu_2193_ap_done = ap_const_logic_1) and (g_2_reg_5623 = ap_const_lv2_0) and (ap_const_logic_1 = ap_CS_fsm_state20))) then
                reciprocal_idx53_val97_fu_518 <= reciprocal_fu_3246_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_udiv_fu_2193_ap_done = ap_const_logic_1) and (g_2_reg_5623 = ap_const_lv2_1) and (ap_const_logic_1 = ap_CS_fsm_state20))) then
                reciprocal_idx54_val99_fu_522 <= reciprocal_fu_3246_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((g_2_reg_5623 = ap_const_lv2_1)) and not((g_2_reg_5623 = ap_const_lv2_0)) and (grp_udiv_fu_2193_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state20))) then
                reciprocal_idx55_val101_fu_526 <= reciprocal_fu_3246_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state62) or (ap_const_logic_1 = ap_CS_fsm_state49) or (ap_const_logic_1 = ap_CS_fsm_state28) or (ap_const_logic_1 = ap_CS_fsm_state24))) then
                reg_2464 <= reciprocal_idx53_val97_fu_518;
                reg_2469 <= reciprocal_idx54_val99_fu_522;
                reg_2474 <= reciprocal_idx55_val101_fu_526;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state50) or (ap_const_logic_1 = ap_CS_fsm_state25))) then
                reg_2479 <= grp_evaluate_fu_2200_ap_return_0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state63) or (ap_const_logic_1 = ap_CS_fsm_state29) or (ap_const_logic_1 = ap_CS_fsm_state50))) then
                reg_2484 <= grp_evaluate_fu_2200_ap_return_1;
                reg_2488 <= grp_evaluate_fu_2200_ap_return_2;
                reg_2492 <= grp_evaluate_fu_2200_ap_return_3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state64) or (ap_const_logic_1 = ap_CS_fsm_state51) or (ap_const_logic_1 = ap_CS_fsm_state30))) then
                reg_2496 <= grp_load_fu_2434_p1;
                reg_2503 <= grp_load_fu_2440_p1;
                reg_2510 <= grp_load_fu_2446_p1;
                sg_1_fu_506 <= reg_2488;
                sg_2_fu_510 <= reg_2492;
                sg_fu_502 <= reg_2484;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state63)) then
                score_2_reg_6409 <= grp_evaluate_fu_2200_ap_return_0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state24)) then
                seeds_score_1_load_reg_5950 <= seeds_score_1_fu_574;
                seeds_score_2_load_reg_5956 <= seeds_score_2_fu_578;
                seeds_score_load_reg_5944 <= seeds_score_fu_570;
                seeds_x_1_load_reg_5904 <= seeds_x_1_fu_538;
                seeds_x_2_load_reg_5909 <= seeds_x_2_fu_542;
                seeds_x_load_reg_5899 <= seeds_x_fu_534;
                seeds_y_1_load_reg_5919 <= seeds_y_1_fu_550;
                seeds_y_2_load_reg_5924 <= seeds_y_2_fu_554;
                seeds_y_load_reg_5914 <= seeds_y_fu_546;
                seeds_z_1_load_reg_5934 <= seeds_z_1_fu_562;
                seeds_z_2_load_reg_5939 <= seeds_z_2_fu_566;
                seeds_z_load_reg_5929 <= seeds_z_fu_558;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state18)) then
                trunc_ln106_reg_5585 <= trunc_ln106_fu_2992_p1;
                trunc_ln90_reg_5576 <= trunc_ln90_fu_2985_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state43)) then
                urem_ln145_reg_6189 <= grp_fu_4287_p2;
            end if;
        end if;
    end process;
    mul115_reg_5470(2 downto 0) <= "000";
    add116_reg_5476(2 downto 0) <= "000";
    s_1_cast51_reg_5486(31 downto 4) <= "0000000000000000000000000000";
    conv2_i_i_i1144_reg_5731(32) <= '0';
    conv_i_i1171_reg_5738(64) <= '0';
    select_ln135_cast_cast_reg_5833(3 downto 1) <= "011";
    zext_ln130_reg_5838(2 downto 1) <= "00";
    select_ln130_reg_5843(0) <= '1';
    select_ln130_reg_5843(2 downto 2) <= "1";
    select_ln130_reg_5843(4 downto 4) <= "1";
    select_ln130_reg_5843(7 downto 6) <= "01";
    add_ln170_3_reg_6074(0) <= '0';
    add_ln170_7_reg_6079(0) <= '0';
    add_ln170_11_reg_6084(0) <= '0';
    zext_ln138_reg_6109(13 downto 11) <= "000";
    zext_ln138_1_reg_6115(15 downto 11) <= "00000";
    conv576_cast_cast_reg_6272(3 downto 0) <= "1000";
    select_ln162_reg_6282(3 downto 0) <= "1000";
    zext_ln162_reg_6287(4) <= '0';
    zext_ln162_reg_6287(12 downto 7) <= "000000";
    result_local_0_reg_2136(99 downto 98) <= "00";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, ap_CS_fsm_state30, ap_CS_fsm_state51, ap_CS_fsm_state64, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state10, and_ln98_1_fu_2756_p2, ap_CS_fsm_state14, icmp_ln98_fu_2789_p2, ap_CS_fsm_state18, ap_CS_fsm_state19, ap_CS_fsm_state21, ap_CS_fsm_state23, and_ln49_fu_3428_p2, icmp_ln49_1_fu_3456_p2, icmp_ln49_2_fu_3473_p2, ap_CS_fsm_state27, icmp_ln131_fu_3645_p2, icmp_ln131_reg_6029, icmp_ln134_fu_4127_p2, ap_CS_fsm_state33, ap_CS_fsm_state34, and_ln49_2_reg_6185, icmp_ln49_4_fu_4422_p2, ap_CS_fsm_state48, icmp_ln49_6_fu_4436_p2, icmp_ln150_fu_4492_p2, ap_CS_fsm_state54, ap_CS_fsm_state55, and_ln49_1_reg_6397, icmp_ln49_7_fu_4953_p2, ap_CS_fsm_state61, icmp_ln49_8_fu_4967_p2, icmp_ln166_fu_5021_p2, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done, grp_udiv_fu_2193_ap_done, grp_evaluate_fu_2200_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done, ap_CS_fsm_state16, ap_block_state16_on_subcall_done, icmp_ln141_fu_4210_p2, icmp_ln136_fu_4147_p2, icmp_ln158_fu_4697_p2, icmp_ln155_fu_4550_p2, or_ln107_3_fu_3096_p2, ap_CS_fsm_state2, ap_CS_fsm_state4, icmp_ln90_fu_2539_p2, ap_CS_fsm_state17, icmp_ln108_fu_3110_p2, ap_CS_fsm_state20, ap_CS_fsm_state31, ap_CS_fsm_state52, ap_CS_fsm_state65, icmp_ln92_fu_2601_p2, icmp_ln114_fu_3272_p2, icmp_ln130_fu_3613_p2, ap_block_state2_on_subcall_done, ap_block_state25_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (icmp_ln90_fu_2539_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state17;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state10) and (icmp_ln92_fu_2601_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state11;
                end if;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                if (((ap_const_lv1_1 = and_ln98_1_fu_2756_p2) and (icmp_ln98_fu_2789_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state14))) then
                    ap_NS_fsm <= ap_ST_fsm_state15;
                else
                    ap_NS_fsm <= ap_ST_fsm_state16;
                end if;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                if (((ap_const_boolean_0 = ap_block_state16_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state16))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state16;
                end if;
            when ap_ST_fsm_state17 => 
                if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state17))) then
                    ap_NS_fsm <= ap_ST_fsm_state18;
                else
                    ap_NS_fsm <= ap_ST_fsm_state17;
                end if;
            when ap_ST_fsm_state18 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state18) and (or_ln107_3_fu_3096_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state19;
                else
                    ap_NS_fsm <= ap_ST_fsm_state69;
                end if;
            when ap_ST_fsm_state19 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state19) and (icmp_ln108_fu_3110_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state21;
                else
                    ap_NS_fsm <= ap_ST_fsm_state20;
                end if;
            when ap_ST_fsm_state20 => 
                if (((grp_udiv_fu_2193_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state20))) then
                    ap_NS_fsm <= ap_ST_fsm_state19;
                else
                    ap_NS_fsm <= ap_ST_fsm_state20;
                end if;
            when ap_ST_fsm_state21 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state21) and (icmp_ln114_fu_3272_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state27;
                else
                    ap_NS_fsm <= ap_ST_fsm_state22;
                end if;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state23;
            when ap_ST_fsm_state23 => 
                if (((ap_const_lv1_1 = and_ln49_fu_3428_p2) and (icmp_ln49_2_fu_3473_p2 = ap_const_lv1_0) and (icmp_ln49_1_fu_3456_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state23))) then
                    ap_NS_fsm <= ap_ST_fsm_state24;
                else
                    ap_NS_fsm <= ap_ST_fsm_state26;
                end if;
            when ap_ST_fsm_state24 => 
                ap_NS_fsm <= ap_ST_fsm_state25;
            when ap_ST_fsm_state25 => 
                if (((ap_const_boolean_0 = ap_block_state25_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state25))) then
                    ap_NS_fsm <= ap_ST_fsm_state26;
                else
                    ap_NS_fsm <= ap_ST_fsm_state25;
                end if;
            when ap_ST_fsm_state26 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state27 => 
                if (((icmp_ln131_fu_3645_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state27) and (icmp_ln130_fu_3613_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state54;
                elsif (((icmp_ln131_fu_3645_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state27) and (icmp_ln130_fu_3613_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state28;
                else
                    ap_NS_fsm <= ap_ST_fsm_state68;
                end if;
            when ap_ST_fsm_state28 => 
                ap_NS_fsm <= ap_ST_fsm_state29;
            when ap_ST_fsm_state29 => 
                if (((grp_evaluate_fu_2200_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state29))) then
                    ap_NS_fsm <= ap_ST_fsm_state30;
                else
                    ap_NS_fsm <= ap_ST_fsm_state29;
                end if;
            when ap_ST_fsm_state30 => 
                if (((icmp_ln134_fu_4127_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state30))) then
                    ap_NS_fsm <= ap_ST_fsm_state32;
                else
                    ap_NS_fsm <= ap_ST_fsm_state31;
                end if;
            when ap_ST_fsm_state31 => 
                if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state31))) then
                    ap_NS_fsm <= ap_ST_fsm_state32;
                else
                    ap_NS_fsm <= ap_ST_fsm_state31;
                end if;
            when ap_ST_fsm_state32 => 
                ap_NS_fsm <= ap_ST_fsm_state33;
            when ap_ST_fsm_state33 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state54;
                else
                    ap_NS_fsm <= ap_ST_fsm_state34;
                end if;
            when ap_ST_fsm_state34 => 
                if (((icmp_ln141_fu_4210_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then
                    ap_NS_fsm <= ap_ST_fsm_state33;
                else
                    ap_NS_fsm <= ap_ST_fsm_state35;
                end if;
            when ap_ST_fsm_state35 => 
                ap_NS_fsm <= ap_ST_fsm_state36;
            when ap_ST_fsm_state36 => 
                ap_NS_fsm <= ap_ST_fsm_state37;
            when ap_ST_fsm_state37 => 
                ap_NS_fsm <= ap_ST_fsm_state38;
            when ap_ST_fsm_state38 => 
                ap_NS_fsm <= ap_ST_fsm_state39;
            when ap_ST_fsm_state39 => 
                ap_NS_fsm <= ap_ST_fsm_state40;
            when ap_ST_fsm_state40 => 
                ap_NS_fsm <= ap_ST_fsm_state41;
            when ap_ST_fsm_state41 => 
                ap_NS_fsm <= ap_ST_fsm_state42;
            when ap_ST_fsm_state42 => 
                ap_NS_fsm <= ap_ST_fsm_state43;
            when ap_ST_fsm_state43 => 
                ap_NS_fsm <= ap_ST_fsm_state44;
            when ap_ST_fsm_state44 => 
                ap_NS_fsm <= ap_ST_fsm_state45;
            when ap_ST_fsm_state45 => 
                ap_NS_fsm <= ap_ST_fsm_state46;
            when ap_ST_fsm_state46 => 
                ap_NS_fsm <= ap_ST_fsm_state47;
            when ap_ST_fsm_state47 => 
                ap_NS_fsm <= ap_ST_fsm_state48;
            when ap_ST_fsm_state48 => 
                if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln49_6_fu_4436_p2 = ap_const_lv1_0) and (icmp_ln49_4_fu_4422_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state48))) then
                    ap_NS_fsm <= ap_ST_fsm_state49;
                else
                    ap_NS_fsm <= ap_ST_fsm_state53;
                end if;
            when ap_ST_fsm_state49 => 
                ap_NS_fsm <= ap_ST_fsm_state50;
            when ap_ST_fsm_state50 => 
                if (((grp_evaluate_fu_2200_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state50))) then
                    ap_NS_fsm <= ap_ST_fsm_state51;
                else
                    ap_NS_fsm <= ap_ST_fsm_state50;
                end if;
            when ap_ST_fsm_state51 => 
                if (((icmp_ln150_fu_4492_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state51))) then
                    ap_NS_fsm <= ap_ST_fsm_state53;
                else
                    ap_NS_fsm <= ap_ST_fsm_state52;
                end if;
            when ap_ST_fsm_state52 => 
                if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state52))) then
                    ap_NS_fsm <= ap_ST_fsm_state53;
                else
                    ap_NS_fsm <= ap_ST_fsm_state52;
                end if;
            when ap_ST_fsm_state53 => 
                ap_NS_fsm <= ap_ST_fsm_state34;
            when ap_ST_fsm_state54 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state54) and ((icmp_ln131_reg_6029 = ap_const_lv1_1) or (icmp_ln155_fu_4550_p2 = ap_const_lv1_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_state27;
                else
                    ap_NS_fsm <= ap_ST_fsm_state55;
                end if;
            when ap_ST_fsm_state55 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state55) and (icmp_ln158_fu_4697_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state54;
                else
                    ap_NS_fsm <= ap_ST_fsm_state56;
                end if;
            when ap_ST_fsm_state56 => 
                ap_NS_fsm <= ap_ST_fsm_state57;
            when ap_ST_fsm_state57 => 
                ap_NS_fsm <= ap_ST_fsm_state58;
            when ap_ST_fsm_state58 => 
                ap_NS_fsm <= ap_ST_fsm_state59;
            when ap_ST_fsm_state59 => 
                ap_NS_fsm <= ap_ST_fsm_state60;
            when ap_ST_fsm_state60 => 
                ap_NS_fsm <= ap_ST_fsm_state61;
            when ap_ST_fsm_state61 => 
                if (((ap_const_lv1_1 = and_ln49_1_reg_6397) and (icmp_ln49_8_fu_4967_p2 = ap_const_lv1_0) and (icmp_ln49_7_fu_4953_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state61))) then
                    ap_NS_fsm <= ap_ST_fsm_state62;
                else
                    ap_NS_fsm <= ap_ST_fsm_state66;
                end if;
            when ap_ST_fsm_state62 => 
                ap_NS_fsm <= ap_ST_fsm_state63;
            when ap_ST_fsm_state63 => 
                if (((grp_evaluate_fu_2200_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state63))) then
                    ap_NS_fsm <= ap_ST_fsm_state64;
                else
                    ap_NS_fsm <= ap_ST_fsm_state63;
                end if;
            when ap_ST_fsm_state64 => 
                if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state64))) then
                    ap_NS_fsm <= ap_ST_fsm_state66;
                else
                    ap_NS_fsm <= ap_ST_fsm_state65;
                end if;
            when ap_ST_fsm_state65 => 
                if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state65))) then
                    ap_NS_fsm <= ap_ST_fsm_state66;
                else
                    ap_NS_fsm <= ap_ST_fsm_state65;
                end if;
            when ap_ST_fsm_state66 => 
                ap_NS_fsm <= ap_ST_fsm_state67;
            when ap_ST_fsm_state67 => 
                ap_NS_fsm <= ap_ST_fsm_state55;
            when ap_ST_fsm_state68 => 
                ap_NS_fsm <= ap_ST_fsm_state69;
            when ap_ST_fsm_state69 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    aa_fu_2689_p1 <= covariance_q0(32 - 1 downto 0);
    add116_fu_2586_p2 <= std_logic_vector(unsigned(mul115_fu_2580_p2) + unsigned(ap_const_lv16_10));
    add_ln108_fu_3116_p2 <= std_logic_vector(unsigned(g_fu_514) + unsigned(ap_const_lv2_1));
    add_ln129_1_fu_4530_p2 <= std_logic_vector(unsigned(phi_urem_reg_1249) + unsigned(ap_const_lv9_1));
    add_ln129_fu_4510_p2 <= std_logic_vector(unsigned(phi_urem80_reg_1261) + unsigned(ap_const_lv9_1));
    add_ln130_fu_3619_p2 <= std_logic_vector(unsigned(k_fu_582) + unsigned(ap_const_lv2_1));
    add_ln141_1_fu_4192_p2 <= std_logic_vector(unsigned(phi_mul76_reg_1227) + unsigned(ap_const_lv18_29D));
    add_ln141_2_fu_4198_p2 <= std_logic_vector(unsigned(phi_mul74_reg_1216) + unsigned(ap_const_lv19_334));
    add_ln141_3_fu_4204_p2 <= std_logic_vector(unsigned(phi_mul_reg_1205) + unsigned(ap_const_lv18_290));
    add_ln141_fu_4186_p2 <= std_logic_vector(unsigned(phi_mul78_reg_1238) + unsigned(ap_const_lv18_24A));
    add_ln158_fu_5035_p2 <= std_logic_vector(signed(n_4_reg_1733) + signed(ap_const_lv6_1));
    add_ln160_fu_4713_p2 <= std_logic_vector(unsigned(mul_ln160_fu_2285_p2) + unsigned(conv576_cast_cast_reg_6272));
    add_ln161_fu_4726_p2 <= std_logic_vector(unsigned(mul_ln161_fu_2289_p2) + unsigned(select_ln162_reg_6282));
    add_ln162_fu_4767_p2 <= std_logic_vector(unsigned(mul_ln162_reg_6327) + unsigned(ap_const_lv46_1388));
    add_ln170_10_fu_4070_p2 <= std_logic_vector(unsigned(sub_ln170_5_fu_4052_p2) + unsigned(zext_ln170_20_fu_4066_p1));
    add_ln170_11_fu_4106_p2 <= std_logic_vector(unsigned(sub_ln170_6_fu_4088_p2) + unsigned(zext_ln170_22_fu_4102_p1));
    add_ln170_1_fu_3802_p2 <= std_logic_vector(unsigned(add_ln170_fu_3784_p2) + unsigned(zext_ln170_4_fu_3798_p1));
    add_ln170_2_fu_3838_p2 <= std_logic_vector(unsigned(sub_ln170_1_fu_3820_p2) + unsigned(zext_ln170_8_fu_3834_p1));
    add_ln170_3_fu_3874_p2 <= std_logic_vector(unsigned(sub_ln170_2_fu_3856_p2) + unsigned(zext_ln170_10_fu_3870_p1));
    add_ln170_4_fu_3900_p2 <= std_logic_vector(unsigned(p_shl4_fu_3880_p3) + unsigned(zext_ln170_11_fu_3896_p1));
    add_ln170_5_fu_3918_p2 <= std_logic_vector(unsigned(add_ln170_4_fu_3900_p2) + unsigned(zext_ln170_12_fu_3914_p1));
    add_ln170_6_fu_3954_p2 <= std_logic_vector(unsigned(sub_ln170_3_fu_3936_p2) + unsigned(zext_ln170_14_fu_3950_p1));
    add_ln170_7_fu_3990_p2 <= std_logic_vector(unsigned(sub_ln170_4_fu_3972_p2) + unsigned(zext_ln170_16_fu_3986_p1));
    add_ln170_8_fu_4016_p2 <= std_logic_vector(unsigned(p_shl_fu_3996_p3) + unsigned(zext_ln170_17_fu_4012_p1));
    add_ln170_9_fu_4034_p2 <= std_logic_vector(unsigned(add_ln170_8_fu_4016_p2) + unsigned(zext_ln170_18_fu_4030_p1));
    add_ln170_fu_3784_p2 <= std_logic_vector(unsigned(p_shl3_fu_3764_p3) + unsigned(zext_ln170_2_fu_3780_p1));
    add_ln49_1_fu_4947_p2 <= std_logic_vector(unsigned(zext_ln49_3_fu_4943_p1) + unsigned(zext_ln49_2_fu_4939_p1));
    add_ln49_2_fu_4416_p2 <= std_logic_vector(unsigned(zext_ln49_4_fu_4408_p1) + unsigned(zext_ln49_5_fu_4412_p1));
    add_ln49_fu_3450_p2 <= std_logic_vector(unsigned(zext_ln49_1_fu_3446_p1) + unsigned(zext_ln49_fu_3438_p1));
    add_ln94_fu_2622_p2 <= std_logic_vector(unsigned(zext_ln92_1_fu_2618_p1) + unsigned(add116_reg_5476));
    add_ln95_1_fu_2668_p2 <= std_logic_vector(unsigned(zext_ln93_1_fu_2654_p1) + unsigned(mul115_reg_5470));
    add_ln95_fu_2658_p2 <= std_logic_vector(unsigned(zext_ln93_fu_2650_p1) + unsigned(mul115_reg_5470));
    add_ln98_fu_2769_p2 <= std_logic_vector(unsigned(zext_ln98_1_fu_2765_p1) + unsigned(zext_ln98_fu_2761_p1));
    and_ln170_1_fu_5147_p2 <= (icmp_ln170_3_reg_6064 and icmp_ln170_2_reg_6059);
    and_ln170_2_fu_5151_p2 <= (and_ln170_fu_5142_p2 and and_ln170_1_fu_5147_p2);
    and_ln170_3_fu_5157_p2 <= (icmp_ln170_5_fu_5047_p2 and icmp_ln170_4_reg_6069);
    and_ln170_4_fu_5162_p2 <= (icmp_ln170_8_fu_5121_p2 and icmp_ln170_7_fu_5105_p2);
    and_ln170_5_fu_5168_p2 <= (icmp_ln170_6_fu_5089_p2 and and_ln170_4_fu_5162_p2);
    and_ln170_6_fu_5174_p2 <= (and_ln170_5_fu_5168_p2 and and_ln170_3_fu_5157_p2);
    and_ln170_7_fu_5180_p2 <= (and_ln170_6_fu_5174_p2 and and_ln170_2_fu_5151_p2);
    and_ln170_fu_5142_p2 <= (icmp_ln170_fu_5041_p2 and icmp_ln170_1_reg_6054);
    and_ln49_1_fu_4923_p2 <= (xor_ln49_5_fu_4917_p2 and xor_ln49_4_fu_4902_p2);
    and_ln49_2_fu_4362_p2 <= (xor_ln49_3_fu_4356_p2 and xor_ln49_2_fu_4342_p2);
    and_ln49_fu_3428_p2 <= (xor_ln49_fu_3407_p2 and xor_ln49_1_fu_3422_p2);
    and_ln98_1_fu_2756_p2 <= (tobool_reg_5481 and and_ln98_fu_2751_p2);
    and_ln98_fu_2751_p2 <= (icmp_ln96_reg_5552 and icmp_ln96_1_fu_2717_p2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state16 <= ap_CS_fsm(15);
    ap_CS_fsm_state17 <= ap_CS_fsm(16);
    ap_CS_fsm_state18 <= ap_CS_fsm(17);
    ap_CS_fsm_state19 <= ap_CS_fsm(18);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state20 <= ap_CS_fsm(19);
    ap_CS_fsm_state21 <= ap_CS_fsm(20);
    ap_CS_fsm_state22 <= ap_CS_fsm(21);
    ap_CS_fsm_state23 <= ap_CS_fsm(22);
    ap_CS_fsm_state24 <= ap_CS_fsm(23);
    ap_CS_fsm_state25 <= ap_CS_fsm(24);
    ap_CS_fsm_state26 <= ap_CS_fsm(25);
    ap_CS_fsm_state27 <= ap_CS_fsm(26);
    ap_CS_fsm_state28 <= ap_CS_fsm(27);
    ap_CS_fsm_state29 <= ap_CS_fsm(28);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state30 <= ap_CS_fsm(29);
    ap_CS_fsm_state31 <= ap_CS_fsm(30);
    ap_CS_fsm_state32 <= ap_CS_fsm(31);
    ap_CS_fsm_state33 <= ap_CS_fsm(32);
    ap_CS_fsm_state34 <= ap_CS_fsm(33);
    ap_CS_fsm_state36 <= ap_CS_fsm(35);
    ap_CS_fsm_state37 <= ap_CS_fsm(36);
    ap_CS_fsm_state39 <= ap_CS_fsm(38);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state40 <= ap_CS_fsm(39);
    ap_CS_fsm_state43 <= ap_CS_fsm(42);
    ap_CS_fsm_state44 <= ap_CS_fsm(43);
    ap_CS_fsm_state46 <= ap_CS_fsm(45);
    ap_CS_fsm_state47 <= ap_CS_fsm(46);
    ap_CS_fsm_state48 <= ap_CS_fsm(47);
    ap_CS_fsm_state49 <= ap_CS_fsm(48);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state50 <= ap_CS_fsm(49);
    ap_CS_fsm_state51 <= ap_CS_fsm(50);
    ap_CS_fsm_state52 <= ap_CS_fsm(51);
    ap_CS_fsm_state53 <= ap_CS_fsm(52);
    ap_CS_fsm_state54 <= ap_CS_fsm(53);
    ap_CS_fsm_state55 <= ap_CS_fsm(54);
    ap_CS_fsm_state57 <= ap_CS_fsm(56);
    ap_CS_fsm_state58 <= ap_CS_fsm(57);
    ap_CS_fsm_state59 <= ap_CS_fsm(58);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state60 <= ap_CS_fsm(59);
    ap_CS_fsm_state61 <= ap_CS_fsm(60);
    ap_CS_fsm_state62 <= ap_CS_fsm(61);
    ap_CS_fsm_state63 <= ap_CS_fsm(62);
    ap_CS_fsm_state64 <= ap_CS_fsm(63);
    ap_CS_fsm_state65 <= ap_CS_fsm(64);
    ap_CS_fsm_state66 <= ap_CS_fsm(65);
    ap_CS_fsm_state67 <= ap_CS_fsm(66);
    ap_CS_fsm_state68 <= ap_CS_fsm(67);
    ap_CS_fsm_state69 <= ap_CS_fsm(68);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;

    ap_ST_fsm_state16_blk_assign_proc : process(ap_block_state16_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state16_on_subcall_done)) then 
            ap_ST_fsm_state16_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state16_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state17_blk_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done)
    begin
        if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state17_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state17_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state18_blk <= ap_const_logic_0;
    ap_ST_fsm_state19_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state20_blk_assign_proc : process(grp_udiv_fu_2193_ap_done)
    begin
        if ((grp_udiv_fu_2193_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state20_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state20_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state21_blk <= ap_const_logic_0;
    ap_ST_fsm_state22_blk <= ap_const_logic_0;
    ap_ST_fsm_state23_blk <= ap_const_logic_0;
    ap_ST_fsm_state24_blk <= ap_const_logic_0;

    ap_ST_fsm_state25_blk_assign_proc : process(ap_block_state25_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state25_on_subcall_done)) then 
            ap_ST_fsm_state25_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state25_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state26_blk <= ap_const_logic_0;
    ap_ST_fsm_state27_blk <= ap_const_logic_0;
    ap_ST_fsm_state28_blk <= ap_const_logic_0;

    ap_ST_fsm_state29_blk_assign_proc : process(grp_evaluate_fu_2200_ap_done)
    begin
        if ((grp_evaluate_fu_2200_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state29_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state29_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(ap_block_state2_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state2_on_subcall_done)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state30_blk <= ap_const_logic_0;

    ap_ST_fsm_state31_blk_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done)
    begin
        if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state31_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state31_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state32_blk <= ap_const_logic_0;
    ap_ST_fsm_state33_blk <= ap_const_logic_0;
    ap_ST_fsm_state34_blk <= ap_const_logic_0;
    ap_ST_fsm_state35_blk <= ap_const_logic_0;
    ap_ST_fsm_state36_blk <= ap_const_logic_0;
    ap_ST_fsm_state37_blk <= ap_const_logic_0;
    ap_ST_fsm_state38_blk <= ap_const_logic_0;
    ap_ST_fsm_state39_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state40_blk <= ap_const_logic_0;
    ap_ST_fsm_state41_blk <= ap_const_logic_0;
    ap_ST_fsm_state42_blk <= ap_const_logic_0;
    ap_ST_fsm_state43_blk <= ap_const_logic_0;
    ap_ST_fsm_state44_blk <= ap_const_logic_0;
    ap_ST_fsm_state45_blk <= ap_const_logic_0;
    ap_ST_fsm_state46_blk <= ap_const_logic_0;
    ap_ST_fsm_state47_blk <= ap_const_logic_0;
    ap_ST_fsm_state48_blk <= ap_const_logic_0;
    ap_ST_fsm_state49_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done)
    begin
        if ((grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state50_blk_assign_proc : process(grp_evaluate_fu_2200_ap_done)
    begin
        if ((grp_evaluate_fu_2200_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state50_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state50_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state51_blk <= ap_const_logic_0;

    ap_ST_fsm_state52_blk_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done)
    begin
        if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state52_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state52_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state53_blk <= ap_const_logic_0;
    ap_ST_fsm_state54_blk <= ap_const_logic_0;
    ap_ST_fsm_state55_blk <= ap_const_logic_0;
    ap_ST_fsm_state56_blk <= ap_const_logic_0;
    ap_ST_fsm_state57_blk <= ap_const_logic_0;
    ap_ST_fsm_state58_blk <= ap_const_logic_0;
    ap_ST_fsm_state59_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state60_blk <= ap_const_logic_0;
    ap_ST_fsm_state61_blk <= ap_const_logic_0;
    ap_ST_fsm_state62_blk <= ap_const_logic_0;

    ap_ST_fsm_state63_blk_assign_proc : process(grp_evaluate_fu_2200_ap_done)
    begin
        if ((grp_evaluate_fu_2200_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state63_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state63_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state64_blk <= ap_const_logic_0;

    ap_ST_fsm_state65_blk_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done)
    begin
        if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state65_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state65_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state66_blk <= ap_const_logic_0;
    ap_ST_fsm_state67_blk <= ap_const_logic_0;
    ap_ST_fsm_state68_blk <= ap_const_logic_0;
    ap_ST_fsm_state69_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done)
    begin
        if ((grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state16_on_subcall_done_assign_proc : process(grp_cordic_fu_2185_ap_done, ap_predicate_op253_call_state16)
    begin
                ap_block_state16_on_subcall_done <= ((ap_predicate_op253_call_state16 = ap_const_boolean_1) and (grp_cordic_fu_2185_ap_done = ap_const_logic_0));
    end process;


    ap_block_state25_on_subcall_done_assign_proc : process(grp_evaluate_fu_2200_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done)
    begin
                ap_block_state25_on_subcall_done <= ((grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_done = ap_const_logic_0) or (grp_evaluate_fu_2200_ap_done = ap_const_logic_0));
    end process;


    ap_block_state2_on_subcall_done_assign_proc : process(grp_joint_search_hls_Pipeline_1_fu_2146_ap_done, grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done)
    begin
                ap_block_state2_on_subcall_done <= ((grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_done = ap_const_logic_0) or (grp_joint_search_hls_Pipeline_1_fu_2146_ap_done = ap_const_logic_0));
    end process;


    ap_condition_3537_assign_proc : process(j_fu_4158_p2)
    begin
                ap_condition_3537 <= (not((j_fu_4158_p2 = ap_const_lv3_4)) and not((j_fu_4158_p2 = ap_const_lv3_3)) and not((j_fu_4158_p2 = ap_const_lv3_2)) and not((j_fu_4158_p2 = ap_const_lv3_1)) and not((j_fu_4158_p2 = ap_const_lv3_0)));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state69)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state69)) then 
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


    ap_phi_mux_best_4_ph_phi_fu_829_p4_assign_proc : process(local_best_9_reg_6022, icmp_ln134_reg_6089, ap_CS_fsm_state32, best_4_ph_reg_826)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_best_4_ph_phi_fu_829_p4 <= local_best_9_reg_6022;
        else 
            ap_phi_mux_best_4_ph_phi_fu_829_p4 <= best_4_ph_reg_826;
        end if; 
    end process;


    ap_phi_mux_best_7_phi_fu_1403_p10_assign_proc : process(reg_2479, and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, best_7_reg_1399)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_best_7_phi_fu_1403_p10 <= reg_2479;
        else 
            ap_phi_mux_best_7_phi_fu_1403_p10 <= best_7_reg_1399;
        end if; 
    end process;


    ap_phi_mux_best_raw_2_ph_phi_fu_819_p4_assign_proc : process(icmp_ln134_reg_6089, best_raw_11_reg_6093, ap_CS_fsm_state32, best_raw_2_ph_reg_816)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_best_raw_2_ph_phi_fu_819_p4 <= best_raw_11_reg_6093;
        else 
            ap_phi_mux_best_raw_2_ph_phi_fu_819_p4 <= best_raw_2_ph_reg_816;
        end if; 
    end process;


    ap_phi_mux_best_raw_5_phi_fu_1424_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, best_raw_12_reg_6244, ap_CS_fsm_state53, best_raw_5_reg_1420)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_best_raw_5_phi_fu_1424_p10 <= best_raw_12_reg_6244;
        else 
            ap_phi_mux_best_raw_5_phi_fu_1424_p10 <= best_raw_5_reg_1420;
        end if; 
    end process;


    ap_phi_mux_bx_2_ph_phi_fu_859_p4_assign_proc : process(lx_9_reg_6033, icmp_ln134_reg_6089, ap_CS_fsm_state32, bx_2_ph_reg_856)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_bx_2_ph_phi_fu_859_p4 <= lx_9_reg_6033;
        else 
            ap_phi_mux_bx_2_ph_phi_fu_859_p4 <= bx_2_ph_reg_856;
        end if; 
    end process;


    ap_phi_mux_bx_5_phi_fu_1340_p10_assign_proc : process(cx_1_reg_6168, and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, bx_5_reg_1336)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_bx_5_phi_fu_1340_p10 <= cx_1_reg_6168;
        else 
            ap_phi_mux_bx_5_phi_fu_1340_p10 <= bx_5_reg_1336;
        end if; 
    end process;


    ap_phi_mux_by_2_ph_phi_fu_849_p4_assign_proc : process(ly_9_reg_6040, icmp_ln134_reg_6089, ap_CS_fsm_state32, by_2_ph_reg_846)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_by_2_ph_phi_fu_849_p4 <= ly_9_reg_6040;
        else 
            ap_phi_mux_by_2_ph_phi_fu_849_p4 <= by_2_ph_reg_846;
        end if; 
    end process;


    ap_phi_mux_by_5_phi_fu_1361_p10_assign_proc : process(and_ln49_2_reg_6185, cy_1_reg_6199, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, by_5_reg_1357)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_by_5_phi_fu_1361_p10 <= cy_1_reg_6199;
        else 
            ap_phi_mux_by_5_phi_fu_1361_p10 <= by_5_reg_1357;
        end if; 
    end process;


    ap_phi_mux_bz_2_ph_phi_fu_839_p4_assign_proc : process(lz_9_reg_6047, icmp_ln134_reg_6089, ap_CS_fsm_state32, bz_2_ph_reg_836)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_bz_2_ph_phi_fu_839_p4 <= lz_9_reg_6047;
        else 
            ap_phi_mux_bz_2_ph_phi_fu_839_p4 <= bz_2_ph_reg_836;
        end if; 
    end process;


    ap_phi_mux_bz_5_phi_fu_1382_p10_assign_proc : process(cz_1_reg_6177, and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, bz_5_reg_1378)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_bz_5_phi_fu_1382_p10 <= cz_1_reg_6177;
        else 
            ap_phi_mux_bz_5_phi_fu_1382_p10 <= bz_5_reg_1378;
        end if; 
    end process;


    ap_phi_mux_empty_91_phi_fu_1277_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out, empty_91_reg_1273)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_empty_91_phi_fu_1277_p10 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out;
        else 
            ap_phi_mux_empty_91_phi_fu_1277_p10 <= empty_91_reg_1273;
        end if; 
    end process;


    ap_phi_mux_empty_92_phi_fu_1298_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1, empty_92_reg_1294)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_empty_92_phi_fu_1298_p10 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out1;
        else 
            ap_phi_mux_empty_92_phi_fu_1298_p10 <= empty_92_reg_1294;
        end if; 
    end process;


    ap_phi_mux_empty_93_phi_fu_1319_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2, empty_93_reg_1315)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_empty_93_phi_fu_1319_p10 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_p_out2;
        else 
            ap_phi_mux_empty_93_phi_fu_1319_p10 <= empty_93_reg_1315;
        end if; 
    end process;


    ap_phi_mux_found_1_ph_phi_fu_808_p4_assign_proc : process(icmp_ln134_reg_6089, ap_CS_fsm_state32, found_1_ph_reg_805)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_found_1_ph_phi_fu_808_p4 <= ap_const_lv1_1;
        else 
            ap_phi_mux_found_1_ph_phi_fu_808_p4 <= found_1_ph_reg_805;
        end if; 
    end process;


    ap_phi_mux_found_4_phi_fu_1525_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, icmp_ln150_reg_6240, ap_CS_fsm_state53, found_4_reg_1521)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_found_4_phi_fu_1525_p10 <= ap_const_lv1_1;
        else 
            ap_phi_mux_found_4_phi_fu_1525_p10 <= found_4_reg_1521;
        end if; 
    end process;


    ap_phi_mux_local_best_3_phi_fu_1505_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, local_best_7_reg_6234, icmp_ln150_reg_6240, ap_CS_fsm_state53, local_best_3_reg_1501)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_local_best_3_phi_fu_1505_p10 <= local_best_7_reg_6234;
        else 
            ap_phi_mux_local_best_3_phi_fu_1505_p10 <= local_best_3_reg_1501;
        end if; 
    end process;


    ap_phi_mux_lx_3_phi_fu_1445_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, lx_7_reg_6216, icmp_ln150_reg_6240, ap_CS_fsm_state53, lx_3_reg_1441)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_lx_3_phi_fu_1445_p10 <= lx_7_reg_6216;
        else 
            ap_phi_mux_lx_3_phi_fu_1445_p10 <= lx_3_reg_1441;
        end if; 
    end process;


    ap_phi_mux_ly_3_phi_fu_1465_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, ly_7_reg_6222, icmp_ln150_reg_6240, ap_CS_fsm_state53, ly_3_reg_1461)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_ly_3_phi_fu_1465_p10 <= ly_7_reg_6222;
        else 
            ap_phi_mux_ly_3_phi_fu_1465_p10 <= ly_3_reg_1461;
        end if; 
    end process;


    ap_phi_mux_lz_3_phi_fu_1485_p10_assign_proc : process(and_ln49_2_reg_6185, icmp_ln49_4_reg_6208, icmp_ln49_6_reg_6212, lz_7_reg_6228, icmp_ln150_reg_6240, ap_CS_fsm_state53, lz_3_reg_1481)
    begin
        if (((ap_const_lv1_1 = and_ln49_2_reg_6185) and (icmp_ln150_reg_6240 = ap_const_lv1_1) and (icmp_ln49_6_reg_6212 = ap_const_lv1_0) and (icmp_ln49_4_reg_6208 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state53))) then 
            ap_phi_mux_lz_3_phi_fu_1485_p10 <= lz_7_reg_6228;
        else 
            ap_phi_mux_lz_3_phi_fu_1485_p10 <= lz_3_reg_1481;
        end if; 
    end process;


    ap_phi_mux_p_ph305_phi_fu_788_p4_assign_proc : process(icmp_ln134_reg_6089, grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1, ap_CS_fsm_state32, p_ph305_reg_785)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_p_ph305_phi_fu_788_p4 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out1;
        else 
            ap_phi_mux_p_ph305_phi_fu_788_p4 <= p_ph305_reg_785;
        end if; 
    end process;


    ap_phi_mux_p_ph306_phi_fu_798_p4_assign_proc : process(icmp_ln134_reg_6089, grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2, ap_CS_fsm_state32, p_ph306_reg_795)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_p_ph306_phi_fu_798_p4 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out2;
        else 
            ap_phi_mux_p_ph306_phi_fu_798_p4 <= p_ph306_reg_795;
        end if; 
    end process;


    ap_phi_mux_p_ph_phi_fu_778_p4_assign_proc : process(icmp_ln134_reg_6089, grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out, p_ph_reg_775, ap_CS_fsm_state32)
    begin
        if (((icmp_ln134_reg_6089 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state32))) then 
            ap_phi_mux_p_ph_phi_fu_778_p4 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_p_out;
        else 
            ap_phi_mux_p_ph_phi_fu_778_p4 <= p_ph_reg_775;
        end if; 
    end process;


    ap_phi_mux_step_phi_fu_1019_p12_assign_proc : process(ap_CS_fsm_state33, icmp_ln136_fu_4147_p2, j_fu_4158_p2, select_ln138_fu_4169_p3, ap_condition_3537)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state33) and (icmp_ln136_fu_4147_p2 = ap_const_lv1_1))) then
            if ((j_fu_4158_p2 = ap_const_lv3_4)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= ap_const_lv11_64;
            elsif ((ap_const_boolean_1 = ap_condition_3537)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= select_ln138_fu_4169_p3;
            elsif ((j_fu_4158_p2 = ap_const_lv3_3)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= ap_const_lv11_C8;
            elsif ((j_fu_4158_p2 = ap_const_lv3_2)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= ap_const_lv11_1F4;
            elsif ((j_fu_4158_p2 = ap_const_lv3_1)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= ap_const_lv11_3E8;
            elsif ((j_fu_4158_p2 = ap_const_lv3_0)) then 
                ap_phi_mux_step_phi_fu_1019_p12 <= ap_const_lv11_7D0;
            else 
                ap_phi_mux_step_phi_fu_1019_p12 <= "XXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_step_phi_fu_1019_p12 <= "XXXXXXXXXXX";
        end if; 
    end process;


    ap_predicate_op253_call_state16_assign_proc : process(and_ln98_1_reg_5558, icmp_ln98_reg_5562)
    begin
                ap_predicate_op253_call_state16 <= ((ap_const_lv1_1 = and_ln98_1_reg_5558) and (icmp_ln98_reg_5562 = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state69)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state69)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    ap_sig_allocacmp_sg_1_load_assign_proc : process(reg_2488, ap_CS_fsm_state30, sg_1_fu_506)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state30)) then 
            ap_sig_allocacmp_sg_1_load <= reg_2488;
        else 
            ap_sig_allocacmp_sg_1_load <= sg_1_fu_506;
        end if; 
    end process;


    ap_sig_allocacmp_sg_1_load_1_assign_proc : process(reg_2488, ap_CS_fsm_state64, sg_1_fu_506)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state64)) then 
            ap_sig_allocacmp_sg_1_load_1 <= reg_2488;
        else 
            ap_sig_allocacmp_sg_1_load_1 <= sg_1_fu_506;
        end if; 
    end process;


    ap_sig_allocacmp_sg_1_load_2_assign_proc : process(reg_2488, ap_CS_fsm_state51, sg_1_fu_506)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state51)) then 
            ap_sig_allocacmp_sg_1_load_2 <= reg_2488;
        else 
            ap_sig_allocacmp_sg_1_load_2 <= sg_1_fu_506;
        end if; 
    end process;


    ap_sig_allocacmp_sg_2_load_assign_proc : process(reg_2492, ap_CS_fsm_state30, sg_2_fu_510)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state30)) then 
            ap_sig_allocacmp_sg_2_load <= reg_2492;
        else 
            ap_sig_allocacmp_sg_2_load <= sg_2_fu_510;
        end if; 
    end process;


    ap_sig_allocacmp_sg_2_load_1_assign_proc : process(reg_2492, ap_CS_fsm_state64, sg_2_fu_510)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state64)) then 
            ap_sig_allocacmp_sg_2_load_1 <= reg_2492;
        else 
            ap_sig_allocacmp_sg_2_load_1 <= sg_2_fu_510;
        end if; 
    end process;


    ap_sig_allocacmp_sg_2_load_2_assign_proc : process(reg_2492, ap_CS_fsm_state51, sg_2_fu_510)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state51)) then 
            ap_sig_allocacmp_sg_2_load_2 <= reg_2492;
        else 
            ap_sig_allocacmp_sg_2_load_2 <= sg_2_fu_510;
        end if; 
    end process;


    ap_sig_allocacmp_sg_load_assign_proc : process(reg_2484, ap_CS_fsm_state30, sg_fu_502)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state30)) then 
            ap_sig_allocacmp_sg_load <= reg_2484;
        else 
            ap_sig_allocacmp_sg_load <= sg_fu_502;
        end if; 
    end process;


    ap_sig_allocacmp_sg_load_1_assign_proc : process(reg_2484, ap_CS_fsm_state64, sg_fu_502)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state64)) then 
            ap_sig_allocacmp_sg_load_1 <= reg_2484;
        else 
            ap_sig_allocacmp_sg_load_1 <= sg_fu_502;
        end if; 
    end process;


    ap_sig_allocacmp_sg_load_2_assign_proc : process(reg_2484, ap_CS_fsm_state51, sg_fu_502)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state51)) then 
            ap_sig_allocacmp_sg_load_2 <= reg_2484;
        else 
            ap_sig_allocacmp_sg_load_2 <= sg_fu_502;
        end if; 
    end process;

    bb_fu_2703_p1 <= covariance_q0(32 - 1 downto 0);

    blocked_address0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_address0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            blocked_address0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_address0;
        else 
            blocked_address0 <= "XXXXXXXXX";
        end if; 
    end process;


    blocked_ce0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_ce0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            blocked_ce0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_ce0;
        else 
            blocked_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    blocked_ce1_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_ce1 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_ce1;
        else 
            blocked_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    blocked_d0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_d0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            blocked_d0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_d0;
        else 
            blocked_d0 <= "X";
        end if; 
    end process;


    blocked_we0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_we0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            blocked_we0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_blocked_we0;
        else 
            blocked_we0 <= ap_const_logic_0;
        end if; 
    end process;


    blocked_we1_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            blocked_we1 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_blocked_we1;
        else 
            blocked_we1 <= ap_const_logic_0;
        end if; 
    end process;


    chosen_address0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0, zext_ln90_fu_2551_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            chosen_address0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_address0;
        else 
            chosen_address0 <= zext_ln90_fu_2551_p1(4 - 1 downto 0);
        end if; 
    end process;


    chosen_ce0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0, chosen_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            chosen_ce0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_ce0;
        else 
            chosen_ce0 <= chosen_ce0_local;
        end if; 
    end process;


    chosen_ce0_local_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            chosen_ce0_local <= ap_const_logic_1;
        else 
            chosen_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    chosen_we0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            chosen_we0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_chosen_we0;
        else 
            chosen_we0 <= ap_const_logic_0;
        end if; 
    end process;

    conv2_i_i61_i1109_fu_3147_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(horizontal_mm_read_reg_5416),64));
    conv2_i_i_i1144_fu_3152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(vertical_mm_read_reg_5411),33));
    conv576_cast_cast_fu_4608_p3 <= 
        ap_const_lv46_3FFFFFFFEC78 when (tmp_42_fu_4600_p3(0) = '1') else 
        ap_const_lv46_1388;
    conv_i_i1171_fu_3155_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(hh_fu_2301_p2),65));
    count_1_fu_2953_p2 <= std_logic_vector(unsigned(count_fu_406) + unsigned(ap_const_lv32_1));

    covariance_address0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0, ap_CS_fsm_state2, covariance_address0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            covariance_address0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_address0;
        else 
            covariance_address0 <= covariance_address0_local;
        end if; 
    end process;


    covariance_address0_local_assign_proc : process(ap_CS_fsm_state10, ap_CS_fsm_state11, ap_CS_fsm_state12, zext_ln94_fu_2627_p1, zext_ln95_fu_2663_p1, zext_ln95_1_fu_2685_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state12)) then 
            covariance_address0_local <= zext_ln95_1_fu_2685_p1(16 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            covariance_address0_local <= zext_ln95_fu_2663_p1(16 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            covariance_address0_local <= zext_ln94_fu_2627_p1(16 - 1 downto 0);
        else 
            covariance_address0_local <= "XXXXXXXXXXXXXXXX";
        end if; 
    end process;


    covariance_ce0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0, ap_CS_fsm_state2, covariance_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            covariance_ce0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_covariance_ce0;
        else 
            covariance_ce0 <= covariance_ce0_local;
        end if; 
    end process;


    covariance_ce0_local_assign_proc : process(ap_CS_fsm_state10, ap_CS_fsm_state11, ap_CS_fsm_state12, ap_CS_fsm_state13)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state13) or (ap_const_logic_1 = ap_CS_fsm_state12) or (ap_const_logic_1 = ap_CS_fsm_state11) or (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            covariance_ce0_local <= ap_const_logic_1;
        else 
            covariance_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    cx_2_fu_4822_p3 <= 
        sub_ln160_1_fu_4816_p2 when (tmp_46_reg_6310(0) = '1') else 
        tmp_10_cast_reg_6337;
    cx_fu_3355_p3 <= grid_q0(47 downto 32);
    cy_2_fu_4855_p3 <= 
        sub_ln161_1_fu_4849_p2 when (tmp_47_reg_6321(0) = '1') else 
        tmp_14_cast_reg_6348;
    cy_fu_3367_p3 <= grid_q0(31 downto 16);
    cz_2_fu_4888_p3 <= 
        sub_ln162_1_fu_4882_p2 when (tmp_48_reg_6359(0) = '1') else 
        tmp_18_cast_reg_6365;
    cz_fu_3379_p1 <= grid_q0(16 - 1 downto 0);
    grid_address0 <= zext_ln116_fu_3283_p1(16 - 1 downto 0);
    grid_ce0 <= grid_ce0_local;

    grid_ce0_local_assign_proc : process(ap_CS_fsm_state21, ap_CS_fsm_state22)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state21) or (ap_const_logic_1 = ap_CS_fsm_state22))) then 
            grid_ce0_local <= ap_const_logic_1;
        else 
            grid_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    groups_3_fu_2853_p2 <= std_logic_vector(unsigned(tmp_8_fu_2833_p9) + unsigned(ap_const_lv32_1));
    groups_4_fu_2871_p3 <= 
        groups_2_fu_430 when (or_ln101_fu_2865_p2(0) = '1') else 
        groups_3_fu_2853_p2;
    groups_5_fu_2879_p3 <= 
        groups_3_fu_2853_p2 when (icmp_ln101_fu_2859_p2(0) = '1') else 
        groups_1_fu_426;
    groups_6_fu_2887_p3 <= 
        groups_fu_422 when (tmp_15_fu_2795_p3(0) = '1') else 
        groups_3_fu_2853_p2;
    grp_cordic_fu_2185_ap_start <= grp_cordic_fu_2185_ap_start_reg;
    grp_evaluate_fu_2200_ap_start <= grp_evaluate_fu_2200_ap_start_reg;

    grp_evaluate_fu_2200_x_assign_proc : process(ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, sext_ln116_reg_5853, lx_9_reg_6033, cx_1_reg_6168, cx_2_reg_6371)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state63)) then 
            grp_evaluate_fu_2200_x <= cx_2_reg_6371;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state50)) then 
            grp_evaluate_fu_2200_x <= cx_1_reg_6168;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state29)) then 
            grp_evaluate_fu_2200_x <= lx_9_reg_6033;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state25)) then 
            grp_evaluate_fu_2200_x <= sext_ln116_reg_5853;
        else 
            grp_evaluate_fu_2200_x <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_evaluate_fu_2200_y_assign_proc : process(ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, sext_ln116_1_reg_5866, ly_9_reg_6040, cy_1_reg_6199, cy_2_reg_6380)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state63)) then 
            grp_evaluate_fu_2200_y <= cy_2_reg_6380;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state50)) then 
            grp_evaluate_fu_2200_y <= cy_1_reg_6199;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state29)) then 
            grp_evaluate_fu_2200_y <= ly_9_reg_6040;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state25)) then 
            grp_evaluate_fu_2200_y <= sext_ln116_1_reg_5866;
        else 
            grp_evaluate_fu_2200_y <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_evaluate_fu_2200_z_assign_proc : process(ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, sext_ln116_2_reg_5879, lz_9_reg_6047, cz_1_reg_6177, cz_2_reg_6389)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state63)) then 
            grp_evaluate_fu_2200_z <= cz_2_reg_6389;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state50)) then 
            grp_evaluate_fu_2200_z <= cz_1_reg_6177;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state29)) then 
            grp_evaluate_fu_2200_z <= lz_9_reg_6047;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state25)) then 
            grp_evaluate_fu_2200_z <= sext_ln116_2_reg_5879;
        else 
            grp_evaluate_fu_2200_z <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_2305_p0_assign_proc : process(ap_CS_fsm_state14, ap_CS_fsm_state48, ap_CS_fsm_state61, sext_ln97_fu_2741_p1, sext_ln48_fu_4398_p1, sext_ln48_2_fu_4929_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state61)) then 
            grp_fu_2305_p0 <= sext_ln48_2_fu_4929_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state48)) then 
            grp_fu_2305_p0 <= sext_ln48_fu_4398_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_2305_p0 <= sext_ln97_fu_2741_p1(32 - 1 downto 0);
        else 
            grp_fu_2305_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_2305_p1_assign_proc : process(ap_CS_fsm_state14, ap_CS_fsm_state48, ap_CS_fsm_state61, sext_ln97_fu_2741_p1, sext_ln48_fu_4398_p1, sext_ln48_2_fu_4929_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state61)) then 
            grp_fu_2305_p1 <= sext_ln48_2_fu_4929_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state48)) then 
            grp_fu_2305_p1 <= sext_ln48_fu_4398_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_2305_p1 <= sext_ln97_fu_2741_p1(32 - 1 downto 0);
        else 
            grp_fu_2305_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_2309_p0_assign_proc : process(ap_CS_fsm_state14, ap_CS_fsm_state48, ap_CS_fsm_state61, sext_ln97_1_fu_2746_p1, sext_ln48_1_fu_4403_p1, sext_ln48_3_fu_4934_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state61)) then 
            grp_fu_2309_p0 <= sext_ln48_3_fu_4934_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state48)) then 
            grp_fu_2309_p0 <= sext_ln48_1_fu_4403_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_2309_p0 <= sext_ln97_1_fu_2746_p1(32 - 1 downto 0);
        else 
            grp_fu_2309_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_2309_p1_assign_proc : process(ap_CS_fsm_state14, ap_CS_fsm_state48, ap_CS_fsm_state61, sext_ln97_1_fu_2746_p1, sext_ln48_1_fu_4403_p1, sext_ln48_3_fu_4934_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state61)) then 
            grp_fu_2309_p1 <= sext_ln48_3_fu_4934_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state48)) then 
            grp_fu_2309_p1 <= sext_ln48_1_fu_4403_p1(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_2309_p1 <= sext_ln97_1_fu_2746_p1(32 - 1 downto 0);
        else 
            grp_fu_2309_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    grp_fu_2452_p2 <= std_logic_vector(unsigned(grp_load_fu_2434_p1) + unsigned(grp_load_fu_2446_p1));
    grp_fu_2458_p2 <= std_logic_vector(unsigned(grp_fu_2452_p2) + unsigned(grp_load_fu_2440_p1));

    grp_fu_4251_ap_start_assign_proc : process(fast_mode_read_reg_5396, ap_CS_fsm_state34, icmp_ln141_fu_4210_p2)
    begin
        if (((icmp_ln141_fu_4210_p2 = ap_const_lv1_1) and (fast_mode_read_reg_5396 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
            grp_fu_4251_ap_start <= ap_const_logic_1;
        else 
            grp_fu_4251_ap_start <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_4251_p0 <= phi_mul74_reg_1216(18 downto 12);
    grp_fu_4251_p1 <= ap_const_lv7_5(4 - 1 downto 0);

    grp_fu_4287_ap_start_assign_proc : process(fast_mode_read_reg_5396, ap_CS_fsm_state34, icmp_ln141_fu_4210_p2)
    begin
        if (((icmp_ln141_fu_4210_p2 = ap_const_lv1_1) and (fast_mode_read_reg_5396 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state34))) then 
            grp_fu_4287_ap_start <= ap_const_logic_1;
        else 
            grp_fu_4287_ap_start <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_4287_p0 <= phi_mul78_reg_1238(17 downto 12);
    grp_fu_4287_p1 <= ap_const_lv6_7(4 - 1 downto 0);
    grp_fu_5206_p0 <= zext_ln138_1_reg_6115(11 - 1 downto 0);
    grp_fu_5213_p0 <= zext_ln138_reg_6109(11 - 1 downto 0);
    grp_fu_5222_p0 <= zext_ln138_reg_6109(11 - 1 downto 0);
    grp_fu_5229_p0 <= zext_ln162_reg_6287(7 - 1 downto 0);
    grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_ap_start_reg;
    grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_ap_start_reg;
    grp_joint_search_hls_Pipeline_1_fu_2146_ap_start <= grp_joint_search_hls_Pipeline_1_fu_2146_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_134_14_fu_2240_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_150_17_fu_2253_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_166_20_fu_2269_ap_start_reg;
    grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_ap_start_reg;

    grp_load_fu_2434_p1_assign_proc : process(ap_CS_fsm_state30, ap_CS_fsm_state51, ap_CS_fsm_state64, icmp_ln134_fu_4127_p2, icmp_ln150_fu_4492_p2, icmp_ln166_fu_5021_p2, ap_sig_allocacmp_sg_load_1, ap_sig_allocacmp_sg_load_2, ap_sig_allocacmp_sg_load)
    begin
        if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
            grp_load_fu_2434_p1 <= ap_sig_allocacmp_sg_load_1;
        elsif (((icmp_ln150_fu_4492_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
            grp_load_fu_2434_p1 <= ap_sig_allocacmp_sg_load_2;
        elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
            grp_load_fu_2434_p1 <= ap_sig_allocacmp_sg_load;
        else 
            grp_load_fu_2434_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_load_fu_2440_p1_assign_proc : process(ap_CS_fsm_state30, ap_CS_fsm_state51, ap_CS_fsm_state64, icmp_ln134_fu_4127_p2, icmp_ln150_fu_4492_p2, icmp_ln166_fu_5021_p2, ap_sig_allocacmp_sg_1_load_1, ap_sig_allocacmp_sg_1_load_2, ap_sig_allocacmp_sg_1_load)
    begin
        if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
            grp_load_fu_2440_p1 <= ap_sig_allocacmp_sg_1_load_1;
        elsif (((icmp_ln150_fu_4492_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
            grp_load_fu_2440_p1 <= ap_sig_allocacmp_sg_1_load_2;
        elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
            grp_load_fu_2440_p1 <= ap_sig_allocacmp_sg_1_load;
        else 
            grp_load_fu_2440_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_load_fu_2446_p1_assign_proc : process(ap_CS_fsm_state30, ap_CS_fsm_state51, ap_CS_fsm_state64, icmp_ln134_fu_4127_p2, icmp_ln150_fu_4492_p2, icmp_ln166_fu_5021_p2, ap_sig_allocacmp_sg_2_load_1, ap_sig_allocacmp_sg_2_load_2, ap_sig_allocacmp_sg_2_load)
    begin
        if (((icmp_ln166_fu_5021_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state64))) then 
            grp_load_fu_2446_p1 <= ap_sig_allocacmp_sg_2_load_1;
        elsif (((icmp_ln150_fu_4492_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state51))) then 
            grp_load_fu_2446_p1 <= ap_sig_allocacmp_sg_2_load_2;
        elsif (((icmp_ln134_fu_4127_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state30))) then 
            grp_load_fu_2446_p1 <= ap_sig_allocacmp_sg_2_load;
        else 
            grp_load_fu_2446_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_udiv_fu_2193_ap_start_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start, ap_CS_fsm_state4, grp_udiv_fu_2193_ap_start_reg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_udiv_fu_2193_ap_start <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_start;
        else 
            grp_udiv_fu_2193_ap_start <= grp_udiv_fu_2193_ap_start_reg;
        end if; 
    end process;


    grp_udiv_fu_2193_d_assign_proc : process(sext_ln108_reg_5635, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2, ap_CS_fsm_state4, ap_CS_fsm_state20)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_udiv_fu_2193_d <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din2;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
            grp_udiv_fu_2193_d <= sext_ln108_reg_5635;
        else 
            grp_udiv_fu_2193_d <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_udiv_fu_2193_n_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1, ap_CS_fsm_state4, ap_CS_fsm_state20)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            grp_udiv_fu_2193_n <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_grp_udiv_fu_2193_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state20)) then 
            grp_udiv_fu_2193_n <= ap_const_lv56_100000;
        else 
            grp_udiv_fu_2193_n <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    hh_fu_2301_p0 <= conv2_i_i61_i1109_fu_3147_p1(32 - 1 downto 0);
    hh_fu_2301_p1 <= conv2_i_i61_i1109_fu_3147_p1(32 - 1 downto 0);
    ia_fu_2640_p4 <= r18_PAIRS_q0(7 downto 4);
    ib_fu_2636_p1 <= r18_PAIRS_q0(4 - 1 downto 0);
    icmp103_fu_3168_p2 <= "1" when (tmp_14_fu_3159_p4 = ap_const_lv16_0) else "0";
    icmp_ln101_fu_2859_p2 <= "1" when (o_group_fu_2825_p3 = ap_const_lv2_1) else "0";
    icmp_ln107_1_fu_3024_p2 <= "1" when (tmp_fu_3014_p4 = ap_const_lv3_0) else "0";
    icmp_ln107_2_fu_3040_p2 <= "1" when (signed(tmp_10_fu_3030_p4) < signed(ap_const_lv30_1)) else "0";
    icmp_ln107_3_fu_3056_p2 <= "1" when (signed(tmp_11_fu_3046_p4) < signed(ap_const_lv30_1)) else "0";
    icmp_ln107_4_fu_3072_p2 <= "1" when (signed(tmp_12_fu_3062_p4) < signed(ap_const_lv30_1)) else "0";
    icmp_ln107_fu_3008_p2 <= "1" when (signed(count_fu_406) < signed(ap_const_lv32_18)) else "0";
    icmp_ln108_fu_3110_p2 <= "1" when (g_fu_514 = ap_const_lv2_3) else "0";
    icmp_ln114_fu_3272_p2 <= "1" when (n_fu_530 = select_ln114_reg_5745) else "0";
    icmp_ln127_fu_3522_p2 <= "1" when (signed(reg_2479) > signed(tmp_4_fu_3505_p9)) else "0";
    icmp_ln129_1_fu_4536_p2 <= "1" when (phi_urem_reg_1249 = ap_const_lv9_4) else "0";
    icmp_ln129_fu_4516_p2 <= "1" when (phi_urem80_reg_1261 = ap_const_lv9_6) else "0";
    icmp_ln130_fu_3613_p2 <= "1" when (k_fu_582 = ap_const_lv2_3) else "0";
    icmp_ln131_fu_3645_p2 <= "1" when (local_best_9_fu_3625_p9 = ap_const_lv32_80000001) else "0";
    icmp_ln134_fu_4127_p2 <= "1" when (signed(local_best_9_reg_6022) > signed(best_fu_598)) else "0";
    icmp_ln136_fu_4147_p2 <= "1" when (unsigned(zext_ln136_fu_4143_p1) < unsigned(select_ln135_cast_cast_reg_5833)) else "0";
    icmp_ln138_fu_4163_p2 <= "1" when (j_fu_4158_p2 = ap_const_lv3_5) else "0";
    icmp_ln141_fu_4210_p2 <= "1" when (unsigned(n_3_reg_1086) < unsigned(select_ln130_reg_5843)) else "0";
    icmp_ln149_fu_4457_p2 <= "1" when (signed(reg_2479) > signed(local_best_2_reg_1097)) else "0";
    icmp_ln150_fu_4492_p2 <= "1" when (signed(reg_2479) > signed(best_6_reg_1157)) else "0";
    icmp_ln155_fu_4550_p2 <= "1" when (level_1_reg_1587 = ap_const_lv2_3) else "0";
    icmp_ln156_1_fu_4568_p2 <= "1" when (level_1_reg_1587 = ap_const_lv2_1) else "0";
    icmp_ln156_fu_4562_p2 <= "1" when (level_1_reg_1587 = ap_const_lv2_0) else "0";
    icmp_ln158_fu_4697_p2 <= "1" when (n_4_reg_1733 = ap_const_lv6_15) else "0";
    icmp_ln165_fu_4988_p2 <= "1" when (signed(score_2_reg_6409) > signed(local_best_5_reg_1757)) else "0";
    icmp_ln166_fu_5021_p2 <= "1" when (signed(score_2_reg_6409) > signed(best_9_reg_1817)) else "0";
    icmp_ln170_1_fu_3711_p2 <= "1" when (unsigned(grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out) > unsigned(ap_const_lv4_2)) else "0";
    icmp_ln170_2_fu_3726_p2 <= "1" when (signed(tmp_19_fu_3716_p4) > signed(ap_const_lv29_0)) else "0";
    icmp_ln170_3_fu_3742_p2 <= "1" when (signed(tmp_20_fu_3732_p4) > signed(ap_const_lv29_0)) else "0";
    icmp_ln170_4_fu_3758_p2 <= "1" when (signed(tmp_21_fu_3748_p4) > signed(ap_const_lv29_0)) else "0";
    icmp_ln170_5_fu_5047_p2 <= "1" when (signed(best_2_reg_5983) > signed(ap_const_lv32_299A0000)) else "0";
    icmp_ln170_6_fu_5089_p2 <= "1" when (signed(zext_ln170_1_fu_5085_p1) < signed(best_raw_1_reg_5989)) else "0";
    icmp_ln170_7_fu_5105_p2 <= "1" when (signed(zext_ln170_3_fu_5101_p1) < signed(p_load304_reg_5999)) else "0";
    icmp_ln170_8_fu_5121_p2 <= "1" when (signed(zext_ln170_5_fu_5117_p1) < signed(p_load303_reg_6004)) else "0";
    icmp_ln170_9_fu_5137_p2 <= "1" when (signed(zext_ln170_7_fu_5133_p1) < signed(p_load302_reg_6009)) else "0";
    icmp_ln170_fu_5041_p2 <= "1" when (signed(count_fu_406) > signed(ap_const_lv32_2F)) else "0";
    icmp_ln49_1_fu_3456_p2 <= "1" when (unsigned(add_ln49_fu_3450_p2) > unsigned(conv_i_i1171_reg_5738)) else "0";
    icmp_ln49_2_fu_3473_p2 <= "1" when (or_ln49_1_fu_3467_p2 = ap_const_lv16_0) else "0";
    icmp_ln49_3_fu_4351_p2 <= "1" when (signed(conv2_i_i_i1144_reg_5731) < signed(sext_ln49_2_fu_4348_p1)) else "0";
    icmp_ln49_4_fu_4422_p2 <= "1" when (unsigned(add_ln49_2_fu_4416_p2) > unsigned(conv_i_i1171_reg_5738)) else "0";
    icmp_ln49_5_fu_4912_p2 <= "1" when (signed(conv2_i_i_i1144_reg_5731) < signed(sext_ln49_1_fu_4908_p1)) else "0";
    icmp_ln49_6_fu_4436_p2 <= "1" when (or_ln49_4_fu_4431_p2 = ap_const_lv32_0) else "0";
    icmp_ln49_7_fu_4953_p2 <= "1" when (unsigned(add_ln49_1_fu_4947_p2) > unsigned(conv_i_i1171_reg_5738)) else "0";
    icmp_ln49_8_fu_4967_p2 <= "1" when (or_ln49_3_fu_4962_p2 = ap_const_lv32_0) else "0";
    icmp_ln49_fu_3417_p2 <= "1" when (signed(conv2_i_i_i1144_reg_5731) < signed(sext_ln49_fu_3413_p1)) else "0";
    icmp_ln90_fu_2539_p2 <= "1" when (o_slot_fu_398 = ap_const_lv4_C) else "0";
    icmp_ln92_fu_2601_p2 <= "1" when (p_1_reg_763 = ap_const_lv7_78) else "0";
    icmp_ln96_1_fu_2717_p2 <= "1" when (signed(bb_fu_2703_p1) > signed(ap_const_lv32_0)) else "0";
    icmp_ln96_fu_2697_p2 <= "1" when (signed(aa_fu_2689_p1) > signed(ap_const_lv32_0)) else "0";
    icmp_ln98_fu_2789_p2 <= "1" when (unsigned(add_ln98_fu_2769_p2) < unsigned(zext_ln98_2_fu_2785_p1)) else "0";
    idxprom140_fu_2556_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(chosen_q0),64));
    ix_1_fu_4267_p2 <= std_logic_vector(unsigned(trunc_ln8_fu_4257_p4) + unsigned(ap_const_lv3_5));
    ix_2_fu_4293_p3 <= 
        ix_fu_4235_p2 when (fast_mode_read_reg_5396(0) = '1') else 
        sext_ln143_fu_4273_p1;
    ix_fu_4235_p2 <= std_logic_vector(unsigned(zext_ln144_fu_4231_p1) + unsigned(ap_const_lv5_1E));
    iy_1_fu_4381_p2 <= std_logic_vector(unsigned(trunc_ln145_fu_4378_p1) + unsigned(ap_const_lv3_5));
    iy_2_fu_4387_p3 <= 
        iy_fu_4372_p2 when (fast_mode_read_reg_5396(0) = '1') else 
        iy_1_fu_4381_p2;
    iy_fu_4372_p2 <= std_logic_vector(unsigned(trunc_ln144_fu_4368_p1) + unsigned(ap_const_lv3_6));
    iz_1_fu_4318_p2 <= std_logic_vector(unsigned(trunc_ln145_2_fu_4314_p1) + unsigned(ap_const_lv3_5));
    iz_2_fu_4324_p3 <= 
        iz_fu_4308_p2 when (fast_mode_read_reg_5396(0) = '1') else 
        iz_1_fu_4318_p2;
    iz_fu_4308_p2 <= std_logic_vector(unsigned(trunc_ln144_2_fu_4304_p1) + unsigned(ap_const_lv3_6));
    j_fu_4158_p2 <= std_logic_vector(unsigned(level_reg_910) + unsigned(zext_ln130_reg_5838));
    k_3_fu_3493_p3 <= 
        grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_worst_out when (tmp_41_fu_3485_p3(0) = '1') else 
        grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out;
    level_2_fu_4152_p2 <= std_logic_vector(unsigned(level_reg_910) + unsigned(ap_const_lv3_1));
    level_3_fu_4556_p2 <= std_logic_vector(unsigned(level_1_reg_1587) + unsigned(ap_const_lv2_1));
    local_best_7_fu_4484_p3 <= 
        reg_2479 when (icmp_ln149_fu_4457_p2(0) = '1') else 
        local_best_2_reg_1097;
    local_best_8_fu_5014_p3 <= 
        score_2_reg_6409 when (icmp_ln165_fu_4988_p2(0) = '1') else 
        local_best_5_reg_1757;
    local_best_9_fu_3625_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    lshr_ln_fu_2775_p4 <= pp_fu_2297_p2(61 downto 1);
        lx_10_cast_fu_4596_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(lx_10_reg_1631),46));

    lx_7_fu_4463_p3 <= 
        cx_1_reg_6168 when (icmp_ln149_fu_4457_p2(0) = '1') else 
        lx_4_reg_1133;
    lx_8_fu_4993_p3 <= 
        cx_2_reg_6371 when (icmp_ln165_fu_4988_p2(0) = '1') else 
        lx_6_reg_1793;
    lx_9_fu_3651_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        ly_10_cast_fu_4616_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ly_10_reg_1620),46));

    ly_7_fu_4470_p3 <= 
        cy_1_reg_6199 when (icmp_ln149_fu_4457_p2(0) = '1') else 
        ly_4_reg_1121;
    ly_8_fu_5000_p3 <= 
        cy_2_reg_6380 when (icmp_ln165_fu_4988_p2(0) = '1') else 
        ly_6_reg_1781;
    ly_9_fu_3671_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    lz_7_fu_4477_p3 <= 
        cz_1_reg_6177 when (icmp_ln149_fu_4457_p2(0) = '1') else 
        lz_4_reg_1109;
    lz_8_fu_5007_p3 <= 
        cz_2_reg_6389 when (icmp_ln165_fu_4988_p2(0) = '1') else 
        lz_6_reg_1769;
    lz_9_fu_3691_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    mul115_fu_2580_p2 <= std_logic_vector(unsigned(p_shl1_fu_2562_p3) + unsigned(p_shl261_fu_2576_p1));
    mul_ln160_1_fu_2318_p1 <= ap_const_lv93_68DB8BAC710D(48 - 1 downto 0);
    mul_ln160_fu_2285_p0 <= zext_ln160_fu_4707_p1(14 - 1 downto 0);
    mul_ln160_fu_2285_p1 <= lx_10_cast_reg_6267(32 - 1 downto 0);
    mul_ln161_1_fu_2323_p1 <= ap_const_lv93_68DB8BAC710D(48 - 1 downto 0);
    mul_ln161_fu_2289_p0 <= zext_ln160_fu_4707_p1(14 - 1 downto 0);
    mul_ln161_fu_2289_p1 <= ly_10_cast_reg_6277(32 - 1 downto 0);
    mul_ln162_1_fu_2328_p1 <= ap_const_lv93_68DB8BAC710D(48 - 1 downto 0);
    mul_ln162_fu_2293_p0 <= zext_ln160_fu_4707_p1(14 - 1 downto 0);
    mul_ln162_fu_2293_p1 <= sext_ln158_reg_6292(32 - 1 downto 0);
    n_2_fu_3277_p2 <= std_logic_vector(unsigned(n_fu_530) + unsigned(ap_const_lv17_1));
    n_5_fu_4215_p2 <= std_logic_vector(unsigned(n_3_reg_1086) + unsigned(ap_const_lv9_1));
    o_group_fu_2825_p3 <= 
        zext_ln100_fu_2815_p1 when (or_ln100_fu_2819_p2(0) = '1') else 
        ap_const_lv2_2;
    o_phase_fu_2943_p4 <= phase_fu_2313_p2(61 downto 30);

    obs_address0_assign_proc : process(ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, grp_evaluate_fu_2200_obs_address0, zext_ln101_fu_2959_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state63) or (ap_const_logic_1 = ap_CS_fsm_state29) or (ap_const_logic_1 = ap_CS_fsm_state50) or (ap_const_logic_1 = ap_CS_fsm_state25))) then 
            obs_address0 <= grp_evaluate_fu_2200_obs_address0;
        else 
            obs_address0 <= zext_ln101_fu_2959_p1(11 - 1 downto 0);
        end if; 
    end process;


    obs_ce0_assign_proc : process(ap_CS_fsm_state25, ap_CS_fsm_state50, ap_CS_fsm_state29, ap_CS_fsm_state63, grp_evaluate_fu_2200_obs_ce0, obs_ce0_local)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state63) or (ap_const_logic_1 = ap_CS_fsm_state29) or (ap_const_logic_1 = ap_CS_fsm_state50) or (ap_const_logic_1 = ap_CS_fsm_state25))) then 
            obs_ce0 <= grp_evaluate_fu_2200_obs_ce0;
        else 
            obs_ce0 <= obs_ce0_local;
        end if; 
    end process;


    obs_ce0_local_assign_proc : process(ap_CS_fsm_state16, ap_block_state16_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state16_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state16))) then 
            obs_ce0_local <= ap_const_logic_1;
        else 
            obs_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    obs_we0_local_assign_proc : process(and_ln98_1_reg_5558, icmp_ln98_reg_5562, ap_CS_fsm_state16, ap_block_state16_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state16_on_subcall_done) and (ap_const_lv1_1 = and_ln98_1_reg_5558) and (icmp_ln98_reg_5562 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state16))) then 
            obs_we0_local <= ap_const_logic_1;
        else 
            obs_we0_local <= ap_const_logic_0;
        end if; 
    end process;

    or_ln100_fu_2819_p2 <= (xor_ln100_fu_2802_p2 or tmp_16_fu_2808_p3);
    or_ln101_3_fu_2964_p8 <= ((((((s_reg_5431 & o_group_reg_5566) & ap_const_lv1_0) & p_1_reg_763) & ap_const_lv6_0) & o_coefficient_reg_5491) & o_phase_fu_2943_p4);
    or_ln101_fu_2865_p2 <= (xor_ln100_fu_2802_p2 or icmp_ln101_fu_2859_p2);
    or_ln107_1_fu_3084_p2 <= (icmp_ln107_4_fu_3072_p2 or icmp_ln107_3_fu_3056_p2);
    or_ln107_2_fu_3090_p2 <= (or_ln107_1_fu_3084_p2 or icmp_ln107_2_fu_3040_p2);
    or_ln107_3_fu_3096_p2 <= (or_ln107_fu_3078_p2 or or_ln107_2_fu_3090_p2);
    or_ln107_fu_3078_p2 <= (icmp_ln107_fu_3008_p2 or icmp_ln107_1_fu_3024_p2);
    or_ln156_fu_4582_p2 <= (icmp_ln156_fu_4562_p2 or icmp_ln156_1_fu_4568_p2);
    or_ln49_1_fu_3467_p2 <= (or_ln49_fu_3461_p2 or cy_fu_3367_p3);
    or_ln49_2_fu_4427_p2 <= (cz_1_reg_6177 or cy_1_reg_6199);
    or_ln49_3_fu_4962_p2 <= (or_ln49_5_fu_4958_p2 or cy_2_reg_6380);
    or_ln49_4_fu_4431_p2 <= (or_ln49_2_fu_4427_p2 or cx_1_reg_6168);
    or_ln49_5_fu_4958_p2 <= (cz_2_reg_6389 or cx_2_reg_6371);
    or_ln49_fu_3461_p2 <= (cz_fu_3379_p1 or cx_fu_3355_p3);
    p_fu_2607_p2 <= std_logic_vector(unsigned(p_1_reg_763) + unsigned(ap_const_lv7_1));
    p_shl1_fu_2562_p3 <= (f_reg_5454 & ap_const_lv7_0);
    p_shl261_fu_2576_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_13_fu_2569_p3),16));
    p_shl2_fu_5052_p3 <= (trunc_ln90_reg_5576 & ap_const_lv14_0);
    p_shl3_fu_3764_p3 <= (empty_fu_410 & ap_const_lv13_0);
    p_shl4_fu_3880_p3 <= (empty_80_fu_414 & ap_const_lv13_0);
    p_shl_fu_3996_p3 <= (empty_81_fu_418 & ap_const_lv13_0);
    pa_1_fu_2711_p3 <= 
        trunc_ln95_1_reg_5547 when (icmp_ln96_reg_5552(0) = '1') else 
        ap_const_lv31_0;
    pb_1_fu_2723_p3 <= 
        trunc_ln95_2_fu_2707_p1 when (icmp_ln96_1_fu_2717_p2(0) = '1') else 
        ap_const_lv31_0;
    phase_fu_2313_p1 <= ap_const_lv62_517CC1B7(32 - 1 downto 0);
    pp_fu_2297_p0 <= pp_fu_2297_p00(31 - 1 downto 0);
    pp_fu_2297_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(pb_1_fu_2723_p3),62));
    pp_fu_2297_p1 <= pp_fu_2297_p10(31 - 1 downto 0);
    pp_fu_2297_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(pa_1_fu_2711_p3),62));
    quality_fu_5186_p2 <= (icmp_ln170_9_fu_5137_p2 and and_ln170_7_fu_5180_p2);
    r18_PAIRS_address0 <= zext_ln92_fu_2613_p1(7 - 1 downto 0);

    r18_PAIRS_ce0_local_assign_proc : process(ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            r18_PAIRS_ce0_local <= ap_const_logic_1;
        else 
            r18_PAIRS_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    r18_PHASE_MM_address0 <= idxprom140_fu_2556_p1(9 - 1 downto 0);

    r18_PHASE_MM_ce0_local_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            r18_PHASE_MM_ce0_local <= ap_const_logic_1;
        else 
            r18_PHASE_MM_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    re_fu_2673_p1 <= covariance_q0(32 - 1 downto 0);
    reciprocal_fu_3246_p1 <= grp_udiv_fu_2193_ap_return(32 - 1 downto 0);
    result <= result_local_0_reg_2136;
    s_1_cast51_fu_2598_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(o_slot_fu_398),32));
    s_2_fu_2545_p2 <= std_logic_vector(unsigned(o_slot_fu_398) + unsigned(ap_const_lv4_1));
    select_ln114_fu_3174_p3 <= 
        trunc_ln58_reg_5426 when (icmp103_fu_3168_p2(0) = '1') else 
        ap_const_lv17_10000;
    select_ln129_1_fu_4542_p3 <= 
        ap_const_lv9_0 when (icmp_ln129_1_fu_4536_p2(0) = '1') else 
        add_ln129_1_fu_4530_p2;
    select_ln129_fu_4522_p3 <= 
        ap_const_lv9_0 when (icmp_ln129_fu_4516_p2(0) = '1') else 
        add_ln129_fu_4510_p2;
    select_ln130_fu_3298_p3 <= 
        ap_const_lv9_7D when (fast_mode_read_reg_5396(0) = '1') else 
        ap_const_lv9_157;
    select_ln135_cast_cast_fu_3288_p3 <= 
        ap_const_lv4_6 when (fast_mode_read_reg_5396(0) = '1') else 
        ap_const_lv4_7;
    select_ln138_fu_4169_p3 <= 
        ap_const_lv11_19 when (icmp_ln138_fu_4163_p2(0) = '1') else 
        ap_const_lv11_A;
    select_ln156_fu_4574_p3 <= 
        ap_const_lv6_24 when (icmp_ln156_fu_4562_p2(0) = '1') else 
        ap_const_lv6_A;
    select_ln160_fu_4810_p3 <= 
        tmp_cast_fu_4800_p4 when (tmp_46_reg_6310(0) = '1') else 
        tmp_10_cast_reg_6337;
    select_ln161_fu_4843_p3 <= 
        tmp_13_cast_fu_4833_p4 when (tmp_47_reg_6321(0) = '1') else 
        tmp_14_cast_reg_6348;
    select_ln162_1_fu_4876_p3 <= 
        tmp_17_cast_fu_4866_p4 when (tmp_48_reg_6359(0) = '1') else 
        tmp_18_cast_reg_6365;
    select_ln162_fu_4628_p3 <= 
        ap_const_lv46_3FFFFFFFEC78 when (tmp_43_fu_4620_p3(0) = '1') else 
        ap_const_lv46_1388;
        sext_ln108_fu_3142_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_9_fu_3122_p9),42));

        sext_ln116_1_fu_3375_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cy_fu_3367_p3),32));

        sext_ln116_2_fu_3383_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cz_fu_3379_p1),32));

        sext_ln116_fu_3363_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cx_fu_3355_p3),32));

        sext_ln143_fu_4273_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(ix_1_fu_4267_p2),5));

        sext_ln158_fu_4644_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(lz_10_reg_1609),46));

        sext_ln162_fu_4636_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(step_1_fu_4588_p3),7));

        sext_ln48_1_fu_4403_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cy_1_reg_6199),64));

        sext_ln48_2_fu_4929_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cx_2_reg_6371),64));

        sext_ln48_3_fu_4934_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cy_2_reg_6380),64));

        sext_ln48_fu_4398_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cx_1_reg_6168),64));

        sext_ln49_1_fu_4908_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cz_2_fu_4888_p3),33));

        sext_ln49_2_fu_4348_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(grp_fu_5213_p3),33));

        sext_ln49_3_fu_3434_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(xx_fu_3387_p2),64));

        sext_ln49_4_fu_3442_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(yy_fu_3393_p2),64));

        sext_ln49_fu_3413_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(cz_fu_3379_p1),33));

        sext_ln97_1_fu_2746_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(im_reg_5536),64));

        sext_ln97_fu_2741_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(re_reg_5530),64));

    shl_ln170_1_fu_5094_p3 <= (add_ln170_3_reg_6074 & ap_const_lv16_0);
    shl_ln170_2_fu_5110_p3 <= (add_ln170_7_reg_6079 & ap_const_lv16_0);
    shl_ln170_3_fu_5126_p3 <= (add_ln170_11_reg_6084 & ap_const_lv16_0);
    shl_ln_fu_5077_p3 <= (sub_ln170_fu_5071_p2 & ap_const_lv16_0);
    step_1_fu_4588_p3 <= 
        select_ln156_fu_4574_p3 when (or_ln156_fu_4582_p2(0) = '1') else 
        ap_const_lv6_1;
    sub_ln160_1_fu_4816_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(select_ln160_fu_4810_p3));
    sub_ln160_fu_4795_p2 <= std_logic_vector(unsigned(ap_const_lv93_0) - unsigned(mul_ln160_1_reg_6332));
    sub_ln161_1_fu_4849_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(select_ln161_fu_4843_p3));
    sub_ln161_fu_4828_p2 <= std_logic_vector(unsigned(ap_const_lv93_0) - unsigned(mul_ln161_1_reg_6343));
    sub_ln162_1_fu_4882_p2 <= std_logic_vector(unsigned(ap_const_lv32_0) - unsigned(select_ln162_1_fu_4876_p3));
    sub_ln162_fu_4861_p2 <= std_logic_vector(unsigned(ap_const_lv93_0) - unsigned(mul_ln162_1_reg_6354));
    sub_ln170_1_fu_3820_p2 <= std_logic_vector(unsigned(add_ln170_1_fu_3802_p2) - unsigned(zext_ln170_6_fu_3816_p1));
    sub_ln170_2_fu_3856_p2 <= std_logic_vector(unsigned(add_ln170_2_fu_3838_p2) - unsigned(zext_ln170_9_fu_3852_p1));
    sub_ln170_3_fu_3936_p2 <= std_logic_vector(unsigned(add_ln170_5_fu_3918_p2) - unsigned(zext_ln170_13_fu_3932_p1));
    sub_ln170_4_fu_3972_p2 <= std_logic_vector(unsigned(add_ln170_6_fu_3954_p2) - unsigned(zext_ln170_15_fu_3968_p1));
    sub_ln170_5_fu_4052_p2 <= std_logic_vector(unsigned(add_ln170_9_fu_4034_p2) - unsigned(zext_ln170_19_fu_4048_p1));
    sub_ln170_6_fu_4088_p2 <= std_logic_vector(unsigned(add_ln170_10_fu_4070_p2) - unsigned(zext_ln170_21_fu_4084_p1));
    sub_ln170_fu_5071_p2 <= std_logic_vector(unsigned(p_shl2_fu_5052_p3) - unsigned(zext_ln170_fu_5067_p1));
    tmp2_fu_2996_p3 <= (trunc_ln106_fu_2992_p1 & ap_const_lv100_0);
    tmp_10_fu_3030_p4 <= empty_fu_410(31 downto 2);
    tmp_11_fu_3046_p4 <= empty_80_fu_414(31 downto 2);
    tmp_12_fu_3062_p4 <= empty_81_fu_418(31 downto 2);
    tmp_13_cast_fu_4833_p4 <= sub_ln161_fu_4828_p2(91 downto 60);
    tmp_13_fu_2569_p3 <= (f_reg_5454 & ap_const_lv3_0);
    tmp_14_fu_3159_p4 <= grid_count_read_reg_5421(31 downto 16);
    tmp_15_fu_2795_p3 <= pair_reg_5514(7 downto 7);
    tmp_16_fu_2808_p3 <= pair_reg_5514(3 downto 3);
    tmp_17_cast_fu_4866_p4 <= sub_ln162_fu_4861_p2(91 downto 60);
    tmp_18_fu_3399_p3 <= grid_q0(15 downto 15);
    tmp_19_fu_3716_p4 <= empty_fu_410(31 downto 3);
    tmp_20_fu_3732_p4 <= empty_80_fu_414(31 downto 3);
    tmp_21_fu_3748_p4 <= empty_81_fu_418(31 downto 3);
    tmp_22_fu_5059_p3 <= (count_fu_406 & ap_const_lv12_0);
    tmp_23_fu_3772_p3 <= (empty_fu_410 & ap_const_lv11_0);
    tmp_24_fu_3790_p3 <= (empty_fu_410 & ap_const_lv9_0);
    tmp_25_fu_3808_p3 <= (empty_fu_410 & ap_const_lv7_0);
    tmp_26_fu_3826_p3 <= (empty_fu_410 & ap_const_lv5_0);
    tmp_27_fu_3844_p3 <= (empty_fu_410 & ap_const_lv3_0);
    tmp_28_fu_3862_p3 <= (empty_fu_410 & ap_const_lv1_0);
    tmp_29_fu_3888_p3 <= (empty_80_fu_414 & ap_const_lv11_0);
    tmp_30_fu_3906_p3 <= (empty_80_fu_414 & ap_const_lv9_0);
    tmp_31_fu_3924_p3 <= (empty_80_fu_414 & ap_const_lv7_0);
    tmp_32_fu_3942_p3 <= (empty_80_fu_414 & ap_const_lv5_0);
    tmp_33_fu_3960_p3 <= (empty_80_fu_414 & ap_const_lv3_0);
    tmp_34_fu_3978_p3 <= (empty_80_fu_414 & ap_const_lv1_0);
    tmp_35_fu_4004_p3 <= (empty_81_fu_418 & ap_const_lv11_0);
    tmp_36_fu_4022_p3 <= (empty_81_fu_418 & ap_const_lv9_0);
    tmp_37_fu_4040_p3 <= (empty_81_fu_418 & ap_const_lv7_0);
    tmp_38_fu_4058_p3 <= (empty_81_fu_418 & ap_const_lv5_0);
    tmp_39_fu_4076_p3 <= (empty_81_fu_418 & ap_const_lv3_0);
    tmp_40_fu_4094_p3 <= (empty_81_fu_418 & ap_const_lv1_0);
    tmp_41_fu_3485_p3 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_120_12_fu_2219_near_out(31 downto 31);
    tmp_42_fu_4600_p3 <= lx_10_reg_1631(31 downto 31);
    tmp_43_fu_4620_p3 <= ly_10_reg_1620(31 downto 31);
    tmp_44_fu_4221_p4 <= phi_mul_reg_1205(17 downto 14);
    tmp_45_fu_4335_p3 <= grp_fu_5213_p3(31 downto 31);
    tmp_49_fu_4894_p3 <= cz_2_fu_4888_p3(31 downto 31);
    tmp_4_fu_3505_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_4_fu_3505_p8 <= k_3_fu_3493_p3(2 - 1 downto 0);
    tmp_8_fu_2833_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_9_fu_3122_p7 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    tmp_cast_fu_4800_p4 <= sub_ln160_fu_4795_p2(91 downto 60);
    tmp_fu_3014_p4 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_105_8_fu_2179_frequencies_out(3 downto 1);
    tmp_s_fu_5192_p9 <= (((((((best_2_reg_5983 & trunc_ln106_reg_5585) & ap_const_lv2_0) & quality_fu_5186_p2) & found_5_reg_5994) & bz_1_reg_5978) & by_1_reg_5973) & bx_1_reg_5968);
    tobool_fu_2592_p2 <= "0" when (weights_q0 = ap_const_lv20_0) else "1";

    trace_address0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            trace_address0 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            trace_address0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_address0;
        else 
            trace_address0 <= "XXXXXXXXX";
        end if; 
    end process;


    trace_ce0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            trace_ce0 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            trace_ce0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_ce0;
        else 
            trace_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    trace_ce1_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            trace_ce1 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_trace_ce1;
        else 
            trace_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    trace_we0_assign_proc : process(grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            trace_we0 <= grp_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2_fu_2156_trace_we0;
        else 
            trace_we0 <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln106_fu_2992_p1 <= count_fu_406(12 - 1 downto 0);
    trunc_ln126_fu_3501_p1 <= k_3_fu_3493_p3(2 - 1 downto 0);
    trunc_ln144_2_fu_4304_p1 <= phi_urem_reg_1249(3 - 1 downto 0);
    trunc_ln144_fu_4368_p1 <= grp_fu_4251_p2(3 - 1 downto 0);
    trunc_ln145_2_fu_4314_p1 <= phi_urem80_reg_1261(3 - 1 downto 0);
    trunc_ln145_fu_4378_p1 <= urem_ln145_reg_6189(3 - 1 downto 0);
    trunc_ln58_fu_2532_p1 <= grid_count(17 - 1 downto 0);
    trunc_ln8_fu_4257_p4 <= phi_mul76_reg_1227(17 downto 15);
    trunc_ln90_fu_2985_p1 <= count_fu_406(31 - 1 downto 0);
    trunc_ln95_1_fu_2693_p1 <= covariance_q0(31 - 1 downto 0);
    trunc_ln95_2_fu_2707_p1 <= covariance_q0(31 - 1 downto 0);

    weights_address0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0, ap_CS_fsm_state4, idxprom140_fu_2556_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            weights_address0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            weights_address0 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_address0;
        else 
            weights_address0 <= idxprom140_fu_2556_p1(9 - 1 downto 0);
        end if; 
    end process;


    weights_ce0_assign_proc : process(ap_CS_fsm_state6, grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0, grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0, ap_CS_fsm_state4, weights_ce0_local)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            weights_ce0 <= grp_joint_search_hls_Outline_VITIS_LOOP_83_4_fu_2172_weights_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            weights_ce0 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_ce0;
        else 
            weights_ce0 <= weights_ce0_local;
        end if; 
    end process;


    weights_ce0_local_assign_proc : process(ap_CS_fsm_state8)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
            weights_ce0_local <= ap_const_logic_1;
        else 
            weights_ce0_local <= ap_const_logic_0;
        end if; 
    end process;


    weights_we0_assign_proc : process(grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            weights_we0 <= grp_joint_search_hls_Outline_VITIS_LOOP_79_3_fu_2166_weights_we0;
        else 
            weights_we0 <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln100_fu_2802_p2 <= (tmp_15_fu_2795_p3 xor ap_const_lv1_1);
    xor_ln49_1_fu_3422_p2 <= (icmp_ln49_fu_3417_p2 xor ap_const_lv1_1);
    xor_ln49_2_fu_4342_p2 <= (tmp_45_fu_4335_p3 xor ap_const_lv1_1);
    xor_ln49_3_fu_4356_p2 <= (icmp_ln49_3_fu_4351_p2 xor ap_const_lv1_1);
    xor_ln49_4_fu_4902_p2 <= (tmp_49_fu_4894_p3 xor ap_const_lv1_1);
    xor_ln49_5_fu_4917_p2 <= (icmp_ln49_5_fu_4912_p2 xor ap_const_lv1_1);
    xor_ln49_fu_3407_p2 <= (tmp_18_fu_3399_p3 xor ap_const_lv1_1);
    xx_fu_3387_p0 <= sext_ln116_fu_3363_p1(16 - 1 downto 0);
    xx_fu_3387_p1 <= sext_ln116_fu_3363_p1(16 - 1 downto 0);
    yy_fu_3393_p0 <= sext_ln116_1_fu_3375_p1(16 - 1 downto 0);
    yy_fu_3393_p1 <= sext_ln116_1_fu_3375_p1(16 - 1 downto 0);
    zext_ln100_fu_2815_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_15_fu_2795_p3),2));
    zext_ln101_fu_2959_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(count_fu_406),64));
    zext_ln106_fu_3004_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp2_fu_2996_p3),144));
    zext_ln116_fu_3283_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(n_fu_530),64));
    zext_ln130_fu_3295_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(fast_mode_read_reg_5396),3));
    zext_ln136_fu_4143_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(level_reg_910),4));
    zext_ln138_1_fu_4182_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_step_phi_fu_1019_p12),16));
    zext_ln138_fu_4178_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_phi_mux_step_phi_fu_1019_p12),14));
    zext_ln144_fu_4231_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_44_fu_4221_p4),5));
    zext_ln160_fu_4707_p0 <= grp_fu_5229_p3;
    zext_ln160_fu_4707_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln160_fu_4707_p0),46));
    zext_ln162_fu_4640_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln162_fu_4636_p1),13));
    zext_ln170_10_fu_3870_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_28_fu_3862_p3),45));
    zext_ln170_11_fu_3896_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_29_fu_3888_p3),45));
    zext_ln170_12_fu_3914_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_30_fu_3906_p3),45));
    zext_ln170_13_fu_3932_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_31_fu_3924_p3),45));
    zext_ln170_14_fu_3950_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_32_fu_3942_p3),45));
    zext_ln170_15_fu_3968_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_33_fu_3960_p3),45));
    zext_ln170_16_fu_3986_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_34_fu_3978_p3),45));
    zext_ln170_17_fu_4012_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_35_fu_4004_p3),45));
    zext_ln170_18_fu_4030_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_36_fu_4022_p3),45));
    zext_ln170_19_fu_4048_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_37_fu_4040_p3),45));
    zext_ln170_1_fu_5085_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_5077_p3),64));
    zext_ln170_20_fu_4066_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_38_fu_4058_p3),45));
    zext_ln170_21_fu_4084_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_39_fu_4076_p3),45));
    zext_ln170_22_fu_4102_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_40_fu_4094_p3),45));
    zext_ln170_2_fu_3780_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_23_fu_3772_p3),45));
    zext_ln170_3_fu_5101_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln170_1_fu_5094_p3),64));
    zext_ln170_4_fu_3798_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_24_fu_3790_p3),45));
    zext_ln170_5_fu_5117_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln170_2_fu_5110_p3),64));
    zext_ln170_6_fu_3816_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_25_fu_3808_p3),45));
    zext_ln170_7_fu_5133_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln170_3_fu_5126_p3),64));
    zext_ln170_8_fu_3834_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_26_fu_3826_p3),45));
    zext_ln170_9_fu_3852_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_27_fu_3844_p3),45));
    zext_ln170_fu_5067_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_22_fu_5059_p3),45));
    zext_ln49_1_fu_3446_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln49_4_fu_3442_p1),65));
    zext_ln49_2_fu_4939_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2305_p2),65));
    zext_ln49_3_fu_4943_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2309_p2),65));
    zext_ln49_4_fu_4408_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2305_p2),65));
    zext_ln49_5_fu_4412_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2309_p2),65));
    zext_ln49_fu_3438_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln49_3_fu_3434_p1),65));
    zext_ln90_fu_2551_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(o_slot_fu_398),64));
    zext_ln92_1_fu_2618_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_1_reg_763),16));
    zext_ln92_fu_2613_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_1_reg_763),64));
    zext_ln93_1_fu_2654_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ib_fu_2636_p1),16));
    zext_ln93_fu_2650_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ia_fu_2640_p4),16));
    zext_ln94_fu_2627_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln94_fu_2622_p2),64));
    zext_ln95_1_fu_2685_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln95_1_reg_5525),64));
    zext_ln95_fu_2663_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln95_fu_2658_p2),64));
    zext_ln98_1_fu_2765_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2309_p2),65));
    zext_ln98_2_fu_2785_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln_fu_2775_p4),65));
    zext_ln98_fu_2761_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_2305_p2),65));
end behav;
