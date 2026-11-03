                                                                 
                                 
                                                        
                                                                        
                                                                 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1 is
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
end;


architecture behav of joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv5_1F : STD_LOGIC_VECTOR (4 downto 0) := "11111";
    constant ap_const_lv5_1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_const_lv32_2B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101011";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln31_fu_133_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal r18_CORDIC_ATAN_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal r18_CORDIC_ATAN_q0 : STD_LOGIC_VECTOR (28 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln31_reg_305 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_156_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_309 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln31_fu_151_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal x_fu_44 : STD_LOGIC_VECTOR (43 downto 0) := "00000000000000000000000000000000000000000000";
    signal x_2_fu_210_p3 : STD_LOGIC_VECTOR (43 downto 0);
    signal zext_ln31_1_cast_fu_98_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal y_fu_48 : STD_LOGIC_VECTOR (43 downto 0) := "00000000000000000000000000000000000000000000";
    signal y_2_fu_218_p3 : STD_LOGIC_VECTOR (43 downto 0);
    signal yy_ph_cast_cast_fu_102_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal z_1_fu_52 : STD_LOGIC_VECTOR (32 downto 0) := "000000000000000000000000000000000";
    signal z_2_fu_265_p3 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_1_ph_cast_cast_fu_106_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal i_fu_56 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal add_ln31_fu_139_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal r18_CORDIC_ATAN_ce0_local : STD_LOGIC;
    signal zext_ln34_1_fu_164_p1 : STD_LOGIC_VECTOR (43 downto 0);
    signal shr_i42315_fu_174_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal ashr_ln34_fu_168_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal ashr_ln34_1_fu_192_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal x_4_fu_198_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal x_3_fu_180_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal y_4_fu_204_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal y_3_fu_186_p2 : STD_LOGIC_VECTOR (43 downto 0);
    signal zext_ln34_fu_249_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_4_fu_259_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal z_3_fu_253_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ready_sig : STD_LOGIC;
    signal ap_done_sig : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (28 downto 0) );
    end component;


    component joint_search_hls_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    r18_CORDIC_ATAN_U : component joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R
    generic map (
        DataWidth => 29,
        AddressRange => 31,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => r18_CORDIC_ATAN_address0,
        ce0 => r18_CORDIC_ATAN_ce0_local,
        q0 => r18_CORDIC_ATAN_q0);

    flow_control_loop_pipe_sequential_init_U : component joint_search_hls_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready_sig,
        ap_done => ap_done_sig,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter2_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_loop_exit_ready = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_const_logic_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
            end if; 
        end if;
    end process;

    i_fu_56_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_56 <= ap_const_lv5_0;
                elsif (((icmp_ln31_fu_133_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_56 <= add_ln31_fu_139_p2;
                end if;
            end if; 
        end if;
    end process;

    x_fu_44_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    x_fu_44 <= zext_ln31_1_cast_fu_98_p1;
                elsif (((icmp_ln31_fu_133_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    x_fu_44 <= x_2_fu_210_p3;
                end if;
            end if; 
        end if;
    end process;

    y_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    y_fu_48 <= yy_ph_cast_cast_fu_102_p1;
                elsif (((icmp_ln31_fu_133_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    y_fu_48 <= y_2_fu_218_p3;
                end if;
            end if; 
        end if;
    end process;

    z_1_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    z_1_fu_52 <= z_1_ph_cast_cast_fu_106_p1;
                elsif (((icmp_ln31_reg_305 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
                    z_1_fu_52 <= z_2_fu_265_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln31_reg_305 <= icmp_ln31_fu_133_p2;
                tmp_reg_309 <= y_fu_48(43 downto 43);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln31_fu_139_p2 <= std_logic_vector(unsigned(i_fu_56) + unsigned(ap_const_lv5_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln31_fu_133_p2)
    begin
        if (((icmp_ln31_fu_133_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_done <= ap_done_sig;

    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_loop_exit_ready_pp0_iter2_reg, ap_done_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;
    ap_ready <= ap_ready_sig;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    ashr_ln34_1_fu_192_p2 <= std_logic_vector(shift_right(signed(y_fu_48),to_integer(unsigned('0' & zext_ln34_1_fu_164_p1(31-1 downto 0)))));
    ashr_ln34_fu_168_p2 <= std_logic_vector(shift_right(signed(x_fu_44),to_integer(unsigned('0' & zext_ln34_1_fu_164_p1(31-1 downto 0)))));
    icmp_ln31_fu_133_p2 <= "1" when (i_fu_56 = ap_const_lv5_1F) else "0";
    r18_CORDIC_ATAN_address0 <= zext_ln31_fu_151_p1(5 - 1 downto 0);

    r18_CORDIC_ATAN_ce0_local_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            r18_CORDIC_ATAN_ce0_local <= ap_const_logic_1;
        else 
            r18_CORDIC_ATAN_ce0_local <= ap_const_logic_0;
        end if; 
    end process;

    shr_i42315_fu_174_p2 <= std_logic_vector(shift_right(unsigned(y_fu_48),to_integer(unsigned('0' & zext_ln34_1_fu_164_p1(31-1 downto 0)))));
    tmp_fu_156_p3 <= y_fu_48(43 downto 43);
    x_2_fu_210_p3 <= 
        x_4_fu_198_p2 when (tmp_fu_156_p3(0) = '1') else 
        x_3_fu_180_p2;
    x_3_fu_180_p2 <= std_logic_vector(unsigned(x_fu_44) + unsigned(shr_i42315_fu_174_p2));
    x_4_fu_198_p2 <= std_logic_vector(unsigned(x_fu_44) - unsigned(ashr_ln34_1_fu_192_p2));
    y_2_fu_218_p3 <= 
        y_4_fu_204_p2 when (tmp_fu_156_p3(0) = '1') else 
        y_3_fu_186_p2;
    y_3_fu_186_p2 <= std_logic_vector(unsigned(y_fu_48) - unsigned(ashr_ln34_fu_168_p2));
    y_4_fu_204_p2 <= std_logic_vector(unsigned(ashr_ln34_fu_168_p2) + unsigned(y_fu_48));
        yy_ph_cast_cast_fu_102_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(yy_ph_cast),44));

    z_1_out <= z_1_fu_52(32 - 1 downto 0);

    z_1_out_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, icmp_ln31_reg_305, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((icmp_ln31_reg_305 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            z_1_out_ap_vld <= ap_const_logic_1;
        else 
            z_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

        z_1_ph_cast_cast_fu_106_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(z_1_ph_cast),33));

    z_2_fu_265_p3 <= 
        z_4_fu_259_p2 when (tmp_reg_309(0) = '1') else 
        z_3_fu_253_p2;
    z_3_fu_253_p2 <= std_logic_vector(unsigned(z_1_fu_52) + unsigned(zext_ln34_fu_249_p1));
    z_4_fu_259_p2 <= std_logic_vector(unsigned(z_1_fu_52) - unsigned(zext_ln34_fu_249_p1));
    zext_ln31_1_cast_fu_98_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln31_1),44));
    zext_ln31_fu_151_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_56),64));
    zext_ln34_1_fu_164_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_56),44));
    zext_ln34_fu_249_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r18_CORDIC_ATAN_q0),33));
end behav;
