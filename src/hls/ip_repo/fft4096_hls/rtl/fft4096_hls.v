                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fft4096_hls_fft4096_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=12.625750,HLS_SYN_LAT=49159,HLS_SYN_TPT=none,HLS_SYN_MEM=8,HLS_SYN_DSP=0,HLS_SYN_FF=650,HLS_SYN_LUT=1605,HLS_VERSION=2024_2}" *)

module fft4096_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_address0,
        data_ce0,
        data_we0,
        data_d0,
        data_q0,
        data_address1,
        data_ce1,
        data_we1,
        data_d1,
        data_q1,
        overflow
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] data_address0;
output   data_ce0;
output   data_we0;
output  [63:0] data_d0;
input  [63:0] data_q0;
output  [11:0] data_address1;
output   data_ce1;
output   data_we1;
output  [63:0] data_d1;
input  [63:0] data_q1;
output  [0:0] overflow;

reg ap_idle;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_enable_reg_pp0_iter0_reg;
wire   [0:0] icmp_ln9_fu_415_p2;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg;
wire    ap_block_pp0_stage1_11001;
reg    ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg;
reg    ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg;
reg    ap_loop_exit_ready_delayed;
wire   [10:0] r18_TW_R_address0;
wire   [31:0] r18_TW_R_q0;
wire   [10:0] r18_TW_I_address0;
wire   [30:0] r18_TW_I_q0;
reg   [0:0] icmp_ln118_reg_184;
reg   [3:0] stage3_load_reg_962;
wire    ap_block_pp0_stage0_11001;
reg   [3:0] stage_17_load_reg_967;
wire   [3:0] stage_2_fu_251_p3;
reg   [3:0] stage_2_reg_972;
wire   [11:0] half_fu_267_p2;
reg   [11:0] half_reg_977;
wire   [10:0] j_fu_291_p2;
reg   [10:0] j_reg_982;
wire   [12:0] lshr_ln14_fu_297_p2;
reg   [12:0] lshr_ln14_reg_987;
wire   [0:0] icmp_ln11_fu_315_p2;
reg   [0:0] icmp_ln11_reg_992;
reg   [11:0] data_addr_reg_997;
reg   [11:0] data_addr_reg_997_pp0_iter1_reg;
reg   [11:0] data_addr_1_reg_1002;
reg   [11:0] data_addr_1_reg_1002_pp0_iter1_reg;
reg   [11:0] data_addr_1_reg_1002_pp0_iter2_reg;
reg   [0:0] icmp_ln9_reg_1017;
reg   [0:0] icmp_ln9_reg_1017_pp0_iter1_reg;
reg   [0:0] icmp_ln9_reg_1017_pp0_iter2_reg;
wire   [31:0] ar_fu_426_p1;
reg   [31:0] ar_reg_1021;
reg   [31:0] ai_reg_1026;
wire  signed [31:0] br_fu_438_p1;
reg  signed [31:0] br_reg_1031;
wire  signed [31:0] bi_fu_442_p3;
reg  signed [31:0] bi_reg_1036;
wire  signed [61:0] sext_ln17_2_fu_455_p1;
reg  signed [61:0] sext_ln17_2_reg_1041;
wire  signed [62:0] sext_ln17_5_fu_465_p1;
reg  signed [62:0] sext_ln17_5_reg_1046;
reg   [32:0] trunc_ln3_reg_1051;
reg   [32:0] trunc_ln19_2_reg_1056;
wire   [0:0] ov_fu_718_p2;
reg   [0:0] ov_reg_1061;
reg   [0:0] ov_reg_1061_pp0_iter3_reg;
wire   [63:0] u_fu_832_p3;
wire   [31:0] select_ln41_5_fu_887_p3;
reg   [31:0] select_ln41_5_reg_1072;
wire   [31:0] select_ln41_7_fu_919_p3;
reg   [31:0] select_ln41_7_reg_1077;
wire   [63:0] v_fu_927_p3;
reg   [0:0] ap_phi_mux_icmp_ln118_phi_fu_187_p4;
wire    ap_loop_init;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage0;
reg   [0:0] ap_phi_mux_ov_15_phi_fu_198_p4;
reg    ap_loop_init_pp0_iter1_reg;
reg    ap_loop_init_pp0_iter2_reg;
wire   [63:0] zext_ln15_fu_393_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln15_1_fu_398_p1;
wire   [63:0] zext_ln16_fu_403_p1;
reg   [14:0] indvar_flatten2_fu_110;
wire   [14:0] add_ln9_fu_409_p2;
reg   [3:0] stage3_fu_114;
reg   [3:0] ap_sig_allocacmp_stage3_load;
reg   [11:0] k4_fu_118;
wire   [11:0] k_fu_303_p2;
reg   [11:0] ap_sig_allocacmp_k4_load;
reg   [3:0] stage_17_fu_122;
wire   [3:0] stage_fu_309_p2;
reg   [3:0] ap_sig_allocacmp_stage_17_load;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
wire    ap_block_pp0_stage1_01001;
reg    data_ce1_local;
reg   [11:0] data_address1_local;
reg    data_ce0_local;
reg   [11:0] data_address0_local;
reg    data_we1_local;
reg    data_we0_local;
reg    r18_TW_R_ce0_local;
reg    r18_TW_I_ce0_local;
reg  signed [30:0] grp_fu_206_p0;
reg  signed [31:0] grp_fu_206_p1;
wire  signed [62:0] sext_ln17_4_fu_460_p1;
wire  signed [62:0] sext_ln17_fu_490_p1;
reg  signed [31:0] grp_fu_210_p0;
reg  signed [31:0] grp_fu_210_p1;
wire  signed [61:0] sext_ln17_1_fu_450_p1;
wire  signed [61:0] sext_ln17_3_fu_494_p1;
wire   [11:0] zext_ln9_1_fu_263_p1;
wire   [10:0] trunc_ln10_fu_273_p1;
wire   [11:0] select_ln9_fu_243_p3;
wire   [10:0] trunc_ln11_fu_287_p1;
wire   [10:0] sub_fu_277_p2;
wire   [12:0] zext_ln11_1_fu_283_p1;
wire   [12:0] zext_ln9_fu_259_p1;
wire   [3:0] stage_1_mid1_fu_339_p2;
wire   [3:0] select_ln9_1_fu_344_p3;
wire   [3:0] sub8_fu_355_p2;
wire   [12:0] stage_1_cast_fu_351_p1;
wire   [12:0] shl_ln14_fu_367_p2;
wire   [11:0] trunc_ln14_fu_372_p1;
wire   [11:0] zext_ln14_fu_364_p1;
wire   [11:0] a_fu_376_p2;
wire   [11:0] zext_ln11_fu_360_p1;
wire   [11:0] b_fu_382_p2;
wire   [11:0] t_fu_387_p2;
wire   [61:0] grp_fu_210_p2;
wire  signed [62:0] sext_ln18_fu_470_p1;
wire   [62:0] grp_fu_206_p2;
wire   [62:0] tr_fu_474_p2;
wire  signed [62:0] sext_ln18_1_fu_498_p1;
wire   [62:0] ti_fu_502_p2;
wire  signed [33:0] sext_ln19_1_fu_521_p1;
wire  signed [33:0] sext_ln19_fu_518_p1;
wire   [33:0] add_ln19_fu_524_p2;
wire  signed [32:0] tmp_fu_530_p4;
wire  signed [33:0] sext_ln19_4_fu_547_p1;
wire  signed [33:0] sext_ln19_3_fu_544_p1;
wire   [33:0] add_ln19_1_fu_550_p2;
wire  signed [32:0] tmp_1_fu_556_p4;
wire   [33:0] sub_ln20_fu_570_p2;
wire  signed [32:0] tmp_2_fu_576_p4;
wire   [33:0] sub_ln20_1_fu_590_p2;
wire  signed [35:0] sext_ln19_2_fu_540_p1;
wire   [35:0] add_ln21_fu_606_p2;
wire   [3:0] tmp_4_fu_612_p4;
wire  signed [35:0] sext_ln20_fu_566_p1;
wire   [35:0] add_ln21_1_fu_628_p2;
wire   [3:0] tmp_5_fu_634_p4;
wire  signed [35:0] sext_ln20_1_fu_586_p1;
wire   [35:0] add_ln21_2_fu_650_p2;
wire   [3:0] tmp_6_fu_656_p4;
wire   [1:0] tmp_7_fu_672_p4;
wire   [32:0] tmp_3_fu_596_p4;
wire   [0:0] icmp_ln21_3_fu_682_p2;
wire   [0:0] icmp_ln21_fu_622_p2;
wire   [0:0] icmp_ln21_2_fu_666_p2;
wire   [0:0] icmp_ln21_4_fu_688_p2;
wire   [0:0] or_ln21_1_fu_700_p2;
wire   [0:0] icmp_ln21_1_fu_644_p2;
wire   [0:0] or_ln21_2_fu_706_p2;
wire   [0:0] or_ln21_fu_694_p2;
wire   [0:0] or_ln21_3_fu_712_p2;
wire   [1:0] tmp_8_fu_724_p4;
wire   [0:0] icmp_ln41_fu_734_p2;
wire   [0:0] icmp_ln41_1_fu_740_p2;
wire   [0:0] or_ln41_fu_764_p2;
wire   [31:0] select_ln41_fu_756_p3;
wire   [31:0] trunc_ln5_fu_746_p4;
wire   [1:0] tmp_9_fu_778_p4;
wire   [0:0] icmp_ln41_2_fu_788_p2;
wire   [0:0] icmp_ln41_3_fu_794_p2;
wire   [0:0] or_ln41_1_fu_818_p2;
wire   [31:0] select_ln41_2_fu_810_p3;
wire   [31:0] trunc_ln41_1_fu_800_p4;
wire   [31:0] select_ln41_3_fu_824_p3;
wire   [31:0] select_ln41_1_fu_770_p3;
wire   [1:0] tmp_10_fu_841_p4;
wire   [0:0] icmp_ln41_4_fu_851_p2;
wire   [0:0] icmp_ln41_5_fu_857_p2;
wire   [0:0] or_ln41_2_fu_881_p2;
wire   [31:0] select_ln41_4_fu_873_p3;
wire   [31:0] trunc_ln41_2_fu_863_p4;
wire   [0:0] or_ln41_3_fu_913_p2;
wire   [31:0] select_ln41_6_fu_905_p3;
wire   [31:0] trunc_ln41_3_fu_895_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0_1to3;
reg    ap_block_pp0;
wire    ap_enable_operation_62;
reg    ap_enable_state2_pp0_iter0_stage1;
wire    ap_enable_operation_75;
reg    ap_enable_state3_pp0_iter1_stage0;
wire    ap_enable_operation_157;
reg    ap_enable_state5_pp0_iter2_stage0;
wire    ap_enable_operation_158;
reg    ap_enable_state6_pp0_iter2_stage1;
wire    ap_enable_operation_160;
reg    ap_enable_state7_pp0_iter3_stage0;
wire    ap_enable_operation_164;
reg    ap_enable_state8_pp0_iter3_stage1;
wire    ap_enable_operation_65;
wire    ap_enable_operation_76;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
reg    ap_condition_771;
reg    ap_condition_775;
reg    ap_condition_782;
reg    ap_condition_121;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 indvar_flatten2_fu_110 = 15'd0;
#0 stage3_fu_114 = 4'd0;
#0 k4_fu_118 = 12'd0;
#0 stage_17_fu_122 = 4'd0;
#0 ap_done_reg = 1'b0;
end

fft4096_hls_r18_TW_R_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
r18_TW_R_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_TW_R_address0),
    .ce0(r18_TW_R_ce0_local),
    .q0(r18_TW_R_q0)
);

fft4096_hls_r18_TW_I_ROM_AUTO_1R #(
    .DataWidth( 31 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
r18_TW_I_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(r18_TW_I_address0),
    .ce0(r18_TW_I_ce0_local),
    .q0(r18_TW_I_q0)
);

fft4096_hls_mul_31s_32s_63_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 31 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 63 ))
mul_31s_32s_63_1_1_U1(
    .din0(grp_fu_206_p0),
    .din1(grp_fu_206_p1),
    .dout(grp_fu_206_p2)
);

fft4096_hls_mul_32s_32s_62_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 62 ))
mul_32s_32s_62_1_1_U2(
    .din0(grp_fu_210_p0),
    .din1(grp_fu_210_p1),
    .dout(grp_fu_210_p2)
);

fft4096_hls_flow_control_loop_delay_pipe flow_control_loop_delay_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(1'b1),
    .ap_loop_exit_ready_delayed(ap_loop_exit_ready_delayed)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage1)) begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b0))) begin
            ap_loop_exit_ready_pp0_iter3_reg <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage1_11001)) begin
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_782)) begin
            icmp_ln118_reg_184 <= icmp_ln11_reg_992;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1))) begin
            icmp_ln118_reg_184 <= 1'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        indvar_flatten2_fu_110 <= 15'd0;
    end else if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        indvar_flatten2_fu_110 <= add_ln9_fu_409_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_121)) begin
        k4_fu_118 <= k_fu_303_p2;
    end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_121)) begin
    stage3_fu_114 <= stage_2_fu_251_p3;
end
end

always @ (posedge ap_clk) begin
if ((1'b1 == ap_condition_121)) begin
    stage_17_fu_122 <= stage_fu_309_p2;
end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ai_reg_1026 <= {{data_q1[63:32]}};
        ar_reg_1021 <= ar_fu_426_p1;
        bi_reg_1036 <= {{data_q0[63:32]}};
        br_reg_1031 <= br_fu_438_p1;
        half_reg_977 <= half_fu_267_p2;
        j_reg_982 <= j_fu_291_p2;
        lshr_ln14_reg_987 <= lshr_ln14_fu_297_p2;
        ov_reg_1061_pp0_iter3_reg <= ov_reg_1061;
        select_ln41_5_reg_1072 <= select_ln41_5_fu_887_p3;
        select_ln41_7_reg_1077 <= select_ln41_7_fu_919_p3;
        sext_ln17_2_reg_1041 <= sext_ln17_2_fu_455_p1;
        sext_ln17_5_reg_1046 <= sext_ln17_5_fu_465_p1;
        stage3_load_reg_962 <= ap_sig_allocacmp_stage3_load;
        stage_17_load_reg_967 <= ap_sig_allocacmp_stage_17_load;
        stage_2_reg_972 <= stage_2_fu_251_p3;
        trunc_ln3_reg_1051 <= {{tr_fu_474_p2[62:30]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg <= ap_condition_exit_pp0_iter0_stage1;
        ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg <= ap_condition_exit_pp0_iter0_stage1_pp0_iter1_reg;
        ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg <= ap_condition_exit_pp0_iter0_stage1_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        ap_loop_init_pp0_iter1_reg <= ap_loop_init;
        ap_loop_init_pp0_iter2_reg <= ap_loop_init_pp0_iter1_reg;
        data_addr_1_reg_1002 <= zext_ln15_1_fu_398_p1;
        data_addr_1_reg_1002_pp0_iter1_reg <= data_addr_1_reg_1002;
        data_addr_1_reg_1002_pp0_iter2_reg <= data_addr_1_reg_1002_pp0_iter1_reg;
        data_addr_reg_997 <= zext_ln15_fu_393_p1;
        data_addr_reg_997_pp0_iter1_reg <= data_addr_reg_997;
        icmp_ln9_reg_1017 <= icmp_ln9_fu_415_p2;
        icmp_ln9_reg_1017_pp0_iter1_reg <= icmp_ln9_reg_1017;
        icmp_ln9_reg_1017_pp0_iter2_reg <= icmp_ln9_reg_1017_pp0_iter1_reg;
        trunc_ln19_2_reg_1056 <= {{ti_fu_502_p2[62:30]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln11_reg_992 <= icmp_ln11_fu_315_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ov_reg_1061 <= ov_fu_718_p2;
    end
end

always @ (*) begin
    if (((icmp_ln9_fu_415_p2 == 1'd1) & (ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0_1to3 = 1'b1;
    end else begin
        ap_idle_pp0_1to3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_condition_exit_pp0_iter0_stage1_pp0_iter3_reg) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_loop_exit_ready_delayed = 1'b1;
    end else begin
        ap_loop_exit_ready_delayed = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_771)) begin
            ap_phi_mux_icmp_ln118_phi_fu_187_p4 = icmp_ln11_reg_992;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_icmp_ln118_phi_fu_187_p4 = 1'd0;
        end else begin
            ap_phi_mux_icmp_ln118_phi_fu_187_p4 = icmp_ln11_reg_992;
        end
    end else begin
        ap_phi_mux_icmp_ln118_phi_fu_187_p4 = icmp_ln11_reg_992;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_775)) begin
            ap_phi_mux_ov_15_phi_fu_198_p4 = ov_reg_1061;
        end else if ((ap_loop_init_pp0_iter2_reg == 1'b1)) begin
            ap_phi_mux_ov_15_phi_fu_198_p4 = 1'd0;
        end else begin
            ap_phi_mux_ov_15_phi_fu_198_p4 = ov_reg_1061;
        end
    end else begin
        ap_phi_mux_ov_15_phi_fu_198_p4 = ov_reg_1061;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_k4_load = 12'd0;
    end else begin
        ap_sig_allocacmp_k4_load = k4_fu_118;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_stage3_load = 4'd0;
    end else begin
        ap_sig_allocacmp_stage3_load = stage3_fu_114;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_stage_17_load = 4'd1;
    end else begin
        ap_sig_allocacmp_stage_17_load = stage_17_fu_122;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_address0_local = data_addr_1_reg_1002_pp0_iter2_reg;
    end else if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        data_address0_local = zext_ln15_1_fu_398_p1;
    end else begin
        data_address0_local = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_address1_local = data_addr_reg_997_pp0_iter1_reg;
    end else if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        data_address1_local = zext_ln15_fu_393_p1;
    end else begin
        data_address1_local = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        data_ce0_local = 1'b1;
    end else begin
        data_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        data_ce1_local = 1'b1;
    end else begin
        data_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_we0_local = 1'b1;
    end else begin
        data_we0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_we1_local = 1'b1;
    end else begin
        data_we1_local = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            grp_fu_206_p0 = sext_ln17_5_reg_1046;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_fu_206_p0 = sext_ln17_5_fu_465_p1;
        end else begin
            grp_fu_206_p0 = 'bx;
        end
    end else begin
        grp_fu_206_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            grp_fu_206_p1 = sext_ln17_fu_490_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_fu_206_p1 = sext_ln17_4_fu_460_p1;
        end else begin
            grp_fu_206_p1 = 'bx;
        end
    end else begin
        grp_fu_206_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            grp_fu_210_p0 = sext_ln17_2_reg_1041;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_fu_210_p0 = sext_ln17_2_fu_455_p1;
        end else begin
            grp_fu_210_p0 = 'bx;
        end
    end else begin
        grp_fu_210_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            grp_fu_210_p1 = sext_ln17_3_fu_494_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_fu_210_p1 = sext_ln17_1_fu_450_p1;
        end else begin
            grp_fu_210_p1 = 'bx;
        end
    end else begin
        grp_fu_210_p1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_TW_I_ce0_local = 1'b1;
    end else begin
        r18_TW_I_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_TW_R_ce0_local = 1'b1;
    end else begin
        r18_TW_R_ce0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to3 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_fu_376_p2 = (trunc_ln14_fu_372_p1 + zext_ln14_fu_364_p1);

assign add_ln19_1_fu_550_p2 = ($signed(sext_ln19_4_fu_547_p1) + $signed(sext_ln19_3_fu_544_p1));

assign add_ln19_fu_524_p2 = ($signed(sext_ln19_1_fu_521_p1) + $signed(sext_ln19_fu_518_p1));

assign add_ln21_1_fu_628_p2 = ($signed(sext_ln20_fu_566_p1) + $signed(36'd2147483648));

assign add_ln21_2_fu_650_p2 = ($signed(sext_ln20_1_fu_586_p1) + $signed(36'd2147483648));

assign add_ln21_fu_606_p2 = ($signed(sext_ln19_2_fu_540_p1) + $signed(36'd2147483648));

assign add_ln9_fu_409_p2 = (indvar_flatten2_fu_110 + 15'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_pp0 = (((ap_ST_fsm_pp0_stage1 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage1_subdone)) | ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone)));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_121 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_771 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln9_reg_1017 == 1'd0));
end

always @ (*) begin
    ap_condition_775 = ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln9_reg_1017_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_condition_782 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln9_reg_1017 == 1'd0));
end

assign ap_done = ap_done_sig;

assign ap_enable_operation_157 = (1'b1 == 1'b1);

assign ap_enable_operation_158 = (1'b1 == 1'b1);

assign ap_enable_operation_160 = (1'b1 == 1'b1);

assign ap_enable_operation_164 = (1'b1 == 1'b1);

assign ap_enable_operation_62 = (1'b1 == 1'b1);

assign ap_enable_operation_65 = (1'b1 == 1'b1);

assign ap_enable_operation_75 = (1'b1 == 1'b1);

assign ap_enable_operation_76 = (1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_enable_state2_pp0_iter0_stage1 = ((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1));
end

always @ (*) begin
    ap_enable_state3_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state5_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state6_pp0_iter2_stage1 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1));
end

always @ (*) begin
    ap_enable_state7_pp0_iter3_stage0 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state8_pp0_iter3_stage1 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ap_ready = ap_ready_sig;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ar_fu_426_p1 = data_q1[31:0];

assign b_fu_382_p2 = (a_fu_376_p2 + half_reg_977);

assign bi_fu_442_p3 = {{data_q0[63:32]}};

assign br_fu_438_p1 = data_q0[31:0];

assign data_address0 = data_address0_local;

assign data_address1 = data_address1_local;

assign data_ce0 = data_ce0_local;

assign data_ce1 = data_ce1_local;

assign data_d0 = v_fu_927_p3;

assign data_d1 = u_fu_832_p3;

assign data_we0 = data_we0_local;

assign data_we1 = data_we1_local;

assign half_fu_267_p2 = 12'd1 << zext_ln9_1_fu_263_p1;

assign icmp_ln11_fu_315_p2 = ((k_fu_303_p2 == 12'd2048) ? 1'b1 : 1'b0);

assign icmp_ln21_1_fu_644_p2 = ((tmp_5_fu_634_p4 != 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln21_2_fu_666_p2 = ((tmp_6_fu_656_p4 != 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln21_3_fu_682_p2 = ((tmp_7_fu_672_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln21_4_fu_688_p2 = (($signed(tmp_3_fu_596_p4) < $signed(33'd6442450944)) ? 1'b1 : 1'b0);

assign icmp_ln21_fu_622_p2 = ((tmp_4_fu_612_p4 != 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln41_1_fu_740_p2 = (($signed(tmp_fu_530_p4) < $signed(33'd6442450944)) ? 1'b1 : 1'b0);

assign icmp_ln41_2_fu_788_p2 = ((tmp_9_fu_778_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln41_3_fu_794_p2 = (($signed(tmp_1_fu_556_p4) < $signed(33'd6442450944)) ? 1'b1 : 1'b0);

assign icmp_ln41_4_fu_851_p2 = ((tmp_10_fu_841_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln41_5_fu_857_p2 = (($signed(tmp_2_fu_576_p4) < $signed(33'd6442450944)) ? 1'b1 : 1'b0);

assign icmp_ln41_fu_734_p2 = ((tmp_8_fu_724_p4 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln9_fu_415_p2 = ((indvar_flatten2_fu_110 == 15'd24575) ? 1'b1 : 1'b0);

assign j_fu_291_p2 = (trunc_ln11_fu_287_p1 & sub_fu_277_p2);

assign k_fu_303_p2 = (select_ln9_fu_243_p3 + 12'd1);

assign lshr_ln14_fu_297_p2 = zext_ln11_1_fu_283_p1 >> zext_ln9_fu_259_p1;

assign or_ln21_1_fu_700_p2 = (icmp_ln21_4_fu_688_p2 | icmp_ln21_2_fu_666_p2);

assign or_ln21_2_fu_706_p2 = (or_ln21_1_fu_700_p2 | icmp_ln21_1_fu_644_p2);

assign or_ln21_3_fu_712_p2 = (or_ln21_fu_694_p2 | or_ln21_2_fu_706_p2);

assign or_ln21_fu_694_p2 = (icmp_ln21_fu_622_p2 | icmp_ln21_3_fu_682_p2);

assign or_ln41_1_fu_818_p2 = (icmp_ln41_3_fu_794_p2 | icmp_ln41_2_fu_788_p2);

assign or_ln41_2_fu_881_p2 = (icmp_ln41_5_fu_857_p2 | icmp_ln41_4_fu_851_p2);

assign or_ln41_3_fu_913_p2 = (icmp_ln21_4_fu_688_p2 | icmp_ln21_3_fu_682_p2);

assign or_ln41_fu_764_p2 = (icmp_ln41_fu_734_p2 | icmp_ln41_1_fu_740_p2);

assign ov_fu_718_p2 = (or_ln21_3_fu_712_p2 | ap_phi_mux_ov_15_phi_fu_198_p4);

assign overflow = ov_reg_1061_pp0_iter3_reg;

assign r18_TW_I_address0 = zext_ln16_fu_403_p1;

assign r18_TW_R_address0 = zext_ln16_fu_403_p1;

assign select_ln41_1_fu_770_p3 = ((or_ln41_fu_764_p2[0:0] == 1'b1) ? select_ln41_fu_756_p3 : trunc_ln5_fu_746_p4);

assign select_ln41_2_fu_810_p3 = ((icmp_ln41_2_fu_788_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign select_ln41_3_fu_824_p3 = ((or_ln41_1_fu_818_p2[0:0] == 1'b1) ? select_ln41_2_fu_810_p3 : trunc_ln41_1_fu_800_p4);

assign select_ln41_4_fu_873_p3 = ((icmp_ln41_4_fu_851_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign select_ln41_5_fu_887_p3 = ((or_ln41_2_fu_881_p2[0:0] == 1'b1) ? select_ln41_4_fu_873_p3 : trunc_ln41_2_fu_863_p4);

assign select_ln41_6_fu_905_p3 = ((icmp_ln21_3_fu_682_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign select_ln41_7_fu_919_p3 = ((or_ln41_3_fu_913_p2[0:0] == 1'b1) ? select_ln41_6_fu_905_p3 : trunc_ln41_3_fu_895_p4);

assign select_ln41_fu_756_p3 = ((icmp_ln41_fu_734_p2[0:0] == 1'b1) ? 32'd2147483647 : 32'd2147483648);

assign select_ln9_1_fu_344_p3 = ((icmp_ln118_reg_184[0:0] == 1'b1) ? stage_1_mid1_fu_339_p2 : stage_17_load_reg_967);

assign select_ln9_fu_243_p3 = ((ap_phi_mux_icmp_ln118_phi_fu_187_p4[0:0] == 1'b1) ? 12'd0 : ap_sig_allocacmp_k4_load);

assign sext_ln17_1_fu_450_p1 = br_fu_438_p1;

assign sext_ln17_2_fu_455_p1 = $signed(r18_TW_R_q0);

assign sext_ln17_3_fu_494_p1 = bi_reg_1036;

assign sext_ln17_4_fu_460_p1 = bi_fu_442_p3;

assign sext_ln17_5_fu_465_p1 = $signed(r18_TW_I_q0);

assign sext_ln17_fu_490_p1 = br_reg_1031;

assign sext_ln18_1_fu_498_p1 = $signed(grp_fu_210_p2);

assign sext_ln18_fu_470_p1 = $signed(grp_fu_210_p2);

assign sext_ln19_1_fu_521_p1 = $signed(trunc_ln3_reg_1051);

assign sext_ln19_2_fu_540_p1 = tmp_fu_530_p4;

assign sext_ln19_3_fu_544_p1 = $signed(ai_reg_1026);

assign sext_ln19_4_fu_547_p1 = $signed(trunc_ln19_2_reg_1056);

assign sext_ln19_fu_518_p1 = $signed(ar_reg_1021);

assign sext_ln20_1_fu_586_p1 = tmp_2_fu_576_p4;

assign sext_ln20_fu_566_p1 = tmp_1_fu_556_p4;

assign shl_ln14_fu_367_p2 = lshr_ln14_reg_987 << stage_1_cast_fu_351_p1;

assign stage_1_cast_fu_351_p1 = select_ln9_1_fu_344_p3;

assign stage_1_mid1_fu_339_p2 = (stage3_load_reg_962 + 4'd2);

assign stage_2_fu_251_p3 = ((ap_phi_mux_icmp_ln118_phi_fu_187_p4[0:0] == 1'b1) ? ap_sig_allocacmp_stage_17_load : ap_sig_allocacmp_stage3_load);

assign stage_fu_309_p2 = (stage_2_fu_251_p3 + 4'd1);

assign sub8_fu_355_p2 = ($signed(4'd11) - $signed(stage_2_reg_972));

assign sub_fu_277_p2 = ($signed(trunc_ln10_fu_273_p1) + $signed(11'd2047));

assign sub_ln20_1_fu_590_p2 = ($signed(sext_ln19_3_fu_544_p1) - $signed(sext_ln19_4_fu_547_p1));

assign sub_ln20_fu_570_p2 = ($signed(sext_ln19_fu_518_p1) - $signed(sext_ln19_1_fu_521_p1));

assign t_fu_387_p2 = zext_ln14_fu_364_p1 << zext_ln11_fu_360_p1;

assign ti_fu_502_p2 = ($signed(grp_fu_206_p2) + $signed(sext_ln18_1_fu_498_p1));

assign tmp_10_fu_841_p4 = {{sub_ln20_fu_570_p2[33:32]}};

assign tmp_1_fu_556_p4 = {{add_ln19_1_fu_550_p2[33:1]}};

assign tmp_2_fu_576_p4 = {{sub_ln20_fu_570_p2[33:1]}};

assign tmp_3_fu_596_p4 = {{sub_ln20_1_fu_590_p2[33:1]}};

assign tmp_4_fu_612_p4 = {{add_ln21_fu_606_p2[35:32]}};

assign tmp_5_fu_634_p4 = {{add_ln21_1_fu_628_p2[35:32]}};

assign tmp_6_fu_656_p4 = {{add_ln21_2_fu_650_p2[35:32]}};

assign tmp_7_fu_672_p4 = {{sub_ln20_1_fu_590_p2[33:32]}};

assign tmp_8_fu_724_p4 = {{add_ln19_fu_524_p2[33:32]}};

assign tmp_9_fu_778_p4 = {{add_ln19_1_fu_550_p2[33:32]}};

assign tmp_fu_530_p4 = {{add_ln19_fu_524_p2[33:1]}};

assign tr_fu_474_p2 = ($signed(sext_ln18_fu_470_p1) - $signed(grp_fu_206_p2));

assign trunc_ln10_fu_273_p1 = half_fu_267_p2[10:0];

assign trunc_ln11_fu_287_p1 = select_ln9_fu_243_p3[10:0];

assign trunc_ln14_fu_372_p1 = shl_ln14_fu_367_p2[11:0];

assign trunc_ln41_1_fu_800_p4 = {{add_ln19_1_fu_550_p2[32:1]}};

assign trunc_ln41_2_fu_863_p4 = {{sub_ln20_fu_570_p2[32:1]}};

assign trunc_ln41_3_fu_895_p4 = {{sub_ln20_1_fu_590_p2[32:1]}};

assign trunc_ln5_fu_746_p4 = {{add_ln19_fu_524_p2[32:1]}};

assign u_fu_832_p3 = {{select_ln41_3_fu_824_p3}, {select_ln41_1_fu_770_p3}};

assign v_fu_927_p3 = {{select_ln41_7_reg_1077}, {select_ln41_5_reg_1072}};

assign zext_ln11_1_fu_283_p1 = select_ln9_fu_243_p3;

assign zext_ln11_fu_360_p1 = sub8_fu_355_p2;

assign zext_ln14_fu_364_p1 = j_reg_982;

assign zext_ln15_1_fu_398_p1 = b_fu_382_p2;

assign zext_ln15_fu_393_p1 = a_fu_376_p2;

assign zext_ln16_fu_403_p1 = t_fu_387_p2;

assign zext_ln9_1_fu_263_p1 = stage_2_fu_251_p3;

assign zext_ln9_fu_259_p1 = stage_2_fu_251_p3;

endmodule              
