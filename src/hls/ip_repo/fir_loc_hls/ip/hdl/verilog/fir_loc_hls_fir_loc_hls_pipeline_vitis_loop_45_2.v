                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        wr_load,
        p_out,
        p_out_ap_vld,
        p_out1,
        p_out1_ap_vld,
        p_out2,
        p_out2_ap_vld,
        p_out3,
        p_out3_ap_vld,
        p_out4,
        p_out4_ap_vld,
        p_out5,
        p_out5_ap_vld,
        p_out6,
        p_out6_ap_vld,
        p_out7,
        p_out7_ap_vld,
        p_out8,
        p_out8_ap_vld,
        p_out9,
        p_out9_ap_vld,
        p_out10,
        p_out10_ap_vld,
        p_out11,
        p_out11_ap_vld,
        p_out12,
        p_out12_ap_vld,
        p_out13,
        p_out13_ap_vld,
        p_out14,
        p_out14_ap_vld,
        p_out15,
        p_out15_ap_vld,
        history_address0,
        history_ce0,
        history_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] wr_load;
output  [51:0] p_out;
output   p_out_ap_vld;
output  [51:0] p_out1;
output   p_out1_ap_vld;
output  [51:0] p_out2;
output   p_out2_ap_vld;
output  [51:0] p_out3;
output   p_out3_ap_vld;
output  [51:0] p_out4;
output   p_out4_ap_vld;
output  [51:0] p_out5;
output   p_out5_ap_vld;
output  [51:0] p_out6;
output   p_out6_ap_vld;
output  [51:0] p_out7;
output   p_out7_ap_vld;
output  [51:0] p_out8;
output   p_out8_ap_vld;
output  [51:0] p_out9;
output   p_out9_ap_vld;
output  [51:0] p_out10;
output   p_out10_ap_vld;
output  [51:0] p_out11;
output   p_out11_ap_vld;
output  [51:0] p_out12;
output   p_out12_ap_vld;
output  [51:0] p_out13;
output   p_out13_ap_vld;
output  [51:0] p_out14;
output   p_out14_ap_vld;
output  [51:0] p_out15;
output   p_out15_ap_vld;
output  [8:0] history_address0;
output   history_ce0;
input  [383:0] history_q0;

reg ap_idle;
reg p_out_ap_vld;
reg p_out1_ap_vld;
reg p_out2_ap_vld;
reg p_out3_ap_vld;
reg p_out4_ap_vld;
reg p_out5_ap_vld;
reg p_out6_ap_vld;
reg p_out7_ap_vld;
reg p_out8_ap_vld;
reg p_out9_ap_vld;
reg p_out10_ap_vld;
reg p_out11_ap_vld;
reg p_out12_ap_vld;
reg p_out13_ap_vld;
reg p_out14_ap_vld;
reg p_out15_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln45_fu_472_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [8:0] r18_LOC_FIR_address0;
wire   [20:0] r18_LOC_FIR_q0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln45_reg_1183;
reg   [0:0] icmp_ln45_reg_1183_pp0_iter1_reg;
reg   [20:0] co_reg_1197;
wire   [23:0] sample_fu_505_p1;
reg  signed [23:0] sample_reg_1202;
reg  signed [23:0] sample_1_reg_1207;
reg  signed [23:0] sample_2_reg_1212;
reg  signed [23:0] sample_3_reg_1217;
reg  signed [23:0] sample_4_reg_1222;
reg  signed [23:0] sample_5_reg_1227;
reg  signed [23:0] sample_6_reg_1232;
reg  signed [23:0] sample_7_reg_1237;
reg  signed [23:0] sample_8_reg_1242;
reg  signed [23:0] sample_9_reg_1247;
reg  signed [23:0] sample_10_reg_1252;
reg  signed [23:0] sample_11_reg_1257;
reg  signed [23:0] sample_12_reg_1262;
reg  signed [23:0] sample_13_reg_1267;
reg  signed [23:0] sample_14_reg_1272;
reg  signed [23:0] sample_15_reg_1277;
wire   [44:0] prod_fu_320_p2;
reg   [44:0] prod_reg_1282;
wire   [44:0] prod_1_fu_324_p2;
reg   [44:0] prod_1_reg_1287;
wire   [44:0] prod_2_fu_328_p2;
reg   [44:0] prod_2_reg_1292;
wire   [44:0] prod_3_fu_332_p2;
reg   [44:0] prod_3_reg_1297;
wire   [44:0] prod_4_fu_336_p2;
reg   [44:0] prod_4_reg_1302;
wire   [44:0] prod_5_fu_340_p2;
reg   [44:0] prod_5_reg_1307;
wire   [44:0] prod_6_fu_344_p2;
reg   [44:0] prod_6_reg_1312;
wire   [44:0] prod_7_fu_348_p2;
reg   [44:0] prod_7_reg_1317;
wire   [44:0] prod_8_fu_352_p2;
reg   [44:0] prod_8_reg_1322;
wire   [44:0] prod_9_fu_356_p2;
reg   [44:0] prod_9_reg_1327;
wire   [44:0] prod_10_fu_360_p2;
reg   [44:0] prod_10_reg_1332;
wire   [44:0] prod_11_fu_364_p2;
reg   [44:0] prod_11_reg_1337;
wire   [44:0] prod_12_fu_368_p2;
reg   [44:0] prod_12_reg_1342;
wire   [44:0] prod_13_fu_372_p2;
reg   [44:0] prod_13_reg_1347;
wire   [44:0] prod_14_fu_376_p2;
reg   [44:0] prod_14_reg_1352;
wire   [44:0] prod_15_fu_380_p2;
reg   [44:0] prod_15_reg_1357;
wire   [63:0] zext_ln47_fu_495_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln45_fu_484_p1;
reg   [51:0] empty_fu_108;
wire   [51:0] add_ln50_fu_763_p2;
wire    ap_loop_init;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [51:0] empty_10_fu_112;
wire   [51:0] add_ln50_1_fu_772_p2;
reg   [51:0] empty_11_fu_116;
wire   [51:0] add_ln50_2_fu_781_p2;
reg   [51:0] empty_12_fu_120;
wire   [51:0] add_ln50_3_fu_790_p2;
reg   [51:0] empty_13_fu_124;
wire   [51:0] add_ln50_4_fu_799_p2;
reg   [51:0] empty_14_fu_128;
wire   [51:0] add_ln50_5_fu_808_p2;
reg   [51:0] empty_15_fu_132;
wire   [51:0] add_ln50_6_fu_817_p2;
reg   [51:0] empty_16_fu_136;
wire   [51:0] add_ln50_7_fu_826_p2;
reg   [51:0] empty_17_fu_140;
wire   [51:0] add_ln50_8_fu_835_p2;
reg   [51:0] empty_18_fu_144;
wire   [51:0] add_ln50_9_fu_844_p2;
reg   [51:0] empty_19_fu_148;
wire   [51:0] add_ln50_10_fu_853_p2;
reg   [51:0] empty_20_fu_152;
wire   [51:0] add_ln50_11_fu_862_p2;
reg   [51:0] empty_21_fu_156;
wire   [51:0] add_ln50_12_fu_871_p2;
reg   [51:0] empty_22_fu_160;
wire   [51:0] add_ln50_13_fu_880_p2;
reg   [51:0] empty_23_fu_164;
wire   [51:0] add_ln50_14_fu_889_p2;
reg   [51:0] empty_24_fu_168;
wire   [51:0] add_ln50_15_fu_898_p2;
reg   [8:0] tap_fu_172;
wire   [8:0] tap_2_fu_478_p2;
reg   [8:0] ap_sig_allocacmp_tap_1;
wire    ap_block_pp0_stage0_01001;
reg    history_ce0_local;
reg    r18_LOC_FIR_ce0_local;
wire  signed [20:0] prod_fu_320_p1;
wire  signed [44:0] sext_ln50_fu_629_p1;
wire  signed [20:0] prod_1_fu_324_p1;
wire  signed [20:0] prod_2_fu_328_p1;
wire  signed [20:0] prod_3_fu_332_p1;
wire  signed [20:0] prod_4_fu_336_p1;
wire  signed [20:0] prod_5_fu_340_p1;
wire  signed [20:0] prod_6_fu_344_p1;
wire  signed [20:0] prod_7_fu_348_p1;
wire  signed [20:0] prod_8_fu_352_p1;
wire  signed [20:0] prod_9_fu_356_p1;
wire  signed [20:0] prod_10_fu_360_p1;
wire  signed [20:0] prod_11_fu_364_p1;
wire  signed [20:0] prod_12_fu_368_p1;
wire  signed [20:0] prod_13_fu_372_p1;
wire  signed [20:0] prod_14_fu_376_p1;
wire  signed [20:0] prod_15_fu_380_p1;
wire   [8:0] at_fu_489_p2;
wire  signed [51:0] sext_ln50_2_fu_760_p1;
wire  signed [51:0] sext_ln50_4_fu_769_p1;
wire  signed [51:0] sext_ln50_6_fu_778_p1;
wire  signed [51:0] sext_ln50_8_fu_787_p1;
wire  signed [51:0] sext_ln50_10_fu_796_p1;
wire  signed [51:0] sext_ln50_12_fu_805_p1;
wire  signed [51:0] sext_ln50_14_fu_814_p1;
wire  signed [51:0] sext_ln50_16_fu_823_p1;
wire  signed [51:0] sext_ln50_18_fu_832_p1;
wire  signed [51:0] sext_ln50_20_fu_841_p1;
wire  signed [51:0] sext_ln50_22_fu_850_p1;
wire  signed [51:0] sext_ln50_24_fu_859_p1;
wire  signed [51:0] sext_ln50_26_fu_868_p1;
wire  signed [51:0] sext_ln50_28_fu_877_p1;
wire  signed [51:0] sext_ln50_30_fu_886_p1;
wire  signed [51:0] sext_ln50_32_fu_895_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 empty_fu_108 = 52'd0;
#0 empty_10_fu_112 = 52'd0;
#0 empty_11_fu_116 = 52'd0;
#0 empty_12_fu_120 = 52'd0;
#0 empty_13_fu_124 = 52'd0;
#0 empty_14_fu_128 = 52'd0;
#0 empty_15_fu_132 = 52'd0;
#0 empty_16_fu_136 = 52'd0;
#0 empty_17_fu_140 = 52'd0;
#0 empty_18_fu_144 = 52'd0;
#0 empty_19_fu_148 = 52'd0;
#0 empty_20_fu_152 = 52'd0;
#0 empty_21_fu_156 = 52'd0;
#0 empty_22_fu_160 = 52'd0;
#0 empty_23_fu_164 = 52'd0;
#0 empty_24_fu_168 = 52'd0;
#0 tap_fu_172 = 9'd0;
#0 ap_done_reg = 1'b0;
end

fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_r18_LOC_FIR_ROM_AUTO_1R #(
    .DataWidth( 21 ),
    .AddressRange( 383 ),
    .AddressWidth( 9 ))
r18_LOC_FIR_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_LOC_FIR_address0),
    .ce0(r18_LOC_FIR_ce0_local),
    .q0(r18_LOC_FIR_q0)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U1(
    .din0(sample_reg_1202),
    .din1(prod_fu_320_p1),
    .dout(prod_fu_320_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U2(
    .din0(sample_1_reg_1207),
    .din1(prod_1_fu_324_p1),
    .dout(prod_1_fu_324_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U3(
    .din0(sample_2_reg_1212),
    .din1(prod_2_fu_328_p1),
    .dout(prod_2_fu_328_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U4(
    .din0(sample_3_reg_1217),
    .din1(prod_3_fu_332_p1),
    .dout(prod_3_fu_332_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U5(
    .din0(sample_4_reg_1222),
    .din1(prod_4_fu_336_p1),
    .dout(prod_4_fu_336_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U6(
    .din0(sample_5_reg_1227),
    .din1(prod_5_fu_340_p1),
    .dout(prod_5_fu_340_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U7(
    .din0(sample_6_reg_1232),
    .din1(prod_6_fu_344_p1),
    .dout(prod_6_fu_344_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U8(
    .din0(sample_7_reg_1237),
    .din1(prod_7_fu_348_p1),
    .dout(prod_7_fu_348_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U9(
    .din0(sample_8_reg_1242),
    .din1(prod_8_fu_352_p1),
    .dout(prod_8_fu_352_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U10(
    .din0(sample_9_reg_1247),
    .din1(prod_9_fu_356_p1),
    .dout(prod_9_fu_356_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U11(
    .din0(sample_10_reg_1252),
    .din1(prod_10_fu_360_p1),
    .dout(prod_10_fu_360_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U12(
    .din0(sample_11_reg_1257),
    .din1(prod_11_fu_364_p1),
    .dout(prod_11_fu_364_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U13(
    .din0(sample_12_reg_1262),
    .din1(prod_12_fu_368_p1),
    .dout(prod_12_fu_368_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U14(
    .din0(sample_13_reg_1267),
    .din1(prod_13_fu_372_p1),
    .dout(prod_13_fu_372_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U15(
    .din0(sample_14_reg_1272),
    .din1(prod_14_fu_376_p1),
    .dout(prod_14_fu_376_p2)
);

fir_loc_hls_mul_24s_21s_45_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 45 ))
mul_24s_21s_45_1_1_U16(
    .din0(sample_15_reg_1277),
    .din1(prod_15_fu_380_p1),
    .dout(prod_15_fu_380_p2)
);

fir_loc_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_10_fu_112 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_10_fu_112 <= add_ln50_1_fu_772_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_11_fu_116 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_11_fu_116 <= add_ln50_2_fu_781_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_12_fu_120 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_12_fu_120 <= add_ln50_3_fu_790_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_13_fu_124 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_13_fu_124 <= add_ln50_4_fu_799_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_14_fu_128 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_14_fu_128 <= add_ln50_5_fu_808_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_15_fu_132 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_15_fu_132 <= add_ln50_6_fu_817_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_16_fu_136 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_16_fu_136 <= add_ln50_7_fu_826_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_17_fu_140 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_17_fu_140 <= add_ln50_8_fu_835_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_18_fu_144 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_18_fu_144 <= add_ln50_9_fu_844_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_19_fu_148 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_19_fu_148 <= add_ln50_10_fu_853_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_20_fu_152 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_20_fu_152 <= add_ln50_11_fu_862_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_21_fu_156 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_21_fu_156 <= add_ln50_12_fu_871_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_22_fu_160 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_22_fu_160 <= add_ln50_13_fu_880_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_23_fu_164 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_23_fu_164 <= add_ln50_14_fu_889_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_24_fu_168 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_24_fu_168 <= add_ln50_15_fu_898_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            empty_fu_108 <= 52'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_fu_108 <= add_ln50_fu_763_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln45_fu_472_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            tap_fu_172 <= tap_2_fu_478_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            tap_fu_172 <= 9'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        co_reg_1197 <= r18_LOC_FIR_q0;
        icmp_ln45_reg_1183 <= icmp_ln45_fu_472_p2;
        icmp_ln45_reg_1183_pp0_iter1_reg <= icmp_ln45_reg_1183;
        sample_10_reg_1252 <= {{history_q0[263:240]}};
        sample_11_reg_1257 <= {{history_q0[287:264]}};
        sample_12_reg_1262 <= {{history_q0[311:288]}};
        sample_13_reg_1267 <= {{history_q0[335:312]}};
        sample_14_reg_1272 <= {{history_q0[359:336]}};
        sample_15_reg_1277 <= {{history_q0[383:360]}};
        sample_1_reg_1207 <= {{history_q0[47:24]}};
        sample_2_reg_1212 <= {{history_q0[71:48]}};
        sample_3_reg_1217 <= {{history_q0[95:72]}};
        sample_4_reg_1222 <= {{history_q0[119:96]}};
        sample_5_reg_1227 <= {{history_q0[143:120]}};
        sample_6_reg_1232 <= {{history_q0[167:144]}};
        sample_7_reg_1237 <= {{history_q0[191:168]}};
        sample_8_reg_1242 <= {{history_q0[215:192]}};
        sample_9_reg_1247 <= {{history_q0[239:216]}};
        sample_reg_1202 <= sample_fu_505_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        prod_10_reg_1332 <= prod_10_fu_360_p2;
        prod_11_reg_1337 <= prod_11_fu_364_p2;
        prod_12_reg_1342 <= prod_12_fu_368_p2;
        prod_13_reg_1347 <= prod_13_fu_372_p2;
        prod_14_reg_1352 <= prod_14_fu_376_p2;
        prod_15_reg_1357 <= prod_15_fu_380_p2;
        prod_1_reg_1287 <= prod_1_fu_324_p2;
        prod_2_reg_1292 <= prod_2_fu_328_p2;
        prod_3_reg_1297 <= prod_3_fu_332_p2;
        prod_4_reg_1302 <= prod_4_fu_336_p2;
        prod_5_reg_1307 <= prod_5_fu_340_p2;
        prod_6_reg_1312 <= prod_6_fu_344_p2;
        prod_7_reg_1317 <= prod_7_fu_348_p2;
        prod_8_reg_1322 <= prod_8_fu_352_p2;
        prod_9_reg_1327 <= prod_9_fu_356_p2;
        prod_reg_1282 <= prod_fu_320_p2;
    end
end

always @ (*) begin
    if (((icmp_ln45_fu_472_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_tap_1 = 9'd0;
    end else begin
        ap_sig_allocacmp_tap_1 = tap_fu_172;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        history_ce0_local = 1'b1;
    end else begin
        history_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out10_ap_vld = 1'b1;
    end else begin
        p_out10_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out11_ap_vld = 1'b1;
    end else begin
        p_out11_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out12_ap_vld = 1'b1;
    end else begin
        p_out12_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out13_ap_vld = 1'b1;
    end else begin
        p_out13_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out14_ap_vld = 1'b1;
    end else begin
        p_out14_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out15_ap_vld = 1'b1;
    end else begin
        p_out15_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out1_ap_vld = 1'b1;
    end else begin
        p_out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out2_ap_vld = 1'b1;
    end else begin
        p_out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out3_ap_vld = 1'b1;
    end else begin
        p_out3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out4_ap_vld = 1'b1;
    end else begin
        p_out4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out5_ap_vld = 1'b1;
    end else begin
        p_out5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out6_ap_vld = 1'b1;
    end else begin
        p_out6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out7_ap_vld = 1'b1;
    end else begin
        p_out7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out8_ap_vld = 1'b1;
    end else begin
        p_out8_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out9_ap_vld = 1'b1;
    end else begin
        p_out9_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_1183_pp0_iter1_reg == 1'd1))) begin
        p_out_ap_vld = 1'b1;
    end else begin
        p_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_LOC_FIR_ce0_local = 1'b1;
    end else begin
        r18_LOC_FIR_ce0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln50_10_fu_853_p2 = ($signed(sext_ln50_22_fu_850_p1) + $signed(empty_19_fu_148));

assign add_ln50_11_fu_862_p2 = ($signed(sext_ln50_24_fu_859_p1) + $signed(empty_20_fu_152));

assign add_ln50_12_fu_871_p2 = ($signed(sext_ln50_26_fu_868_p1) + $signed(empty_21_fu_156));

assign add_ln50_13_fu_880_p2 = ($signed(sext_ln50_28_fu_877_p1) + $signed(empty_22_fu_160));

assign add_ln50_14_fu_889_p2 = ($signed(sext_ln50_30_fu_886_p1) + $signed(empty_23_fu_164));

assign add_ln50_15_fu_898_p2 = ($signed(sext_ln50_32_fu_895_p1) + $signed(empty_24_fu_168));

assign add_ln50_1_fu_772_p2 = ($signed(sext_ln50_4_fu_769_p1) + $signed(empty_10_fu_112));

assign add_ln50_2_fu_781_p2 = ($signed(sext_ln50_6_fu_778_p1) + $signed(empty_11_fu_116));

assign add_ln50_3_fu_790_p2 = ($signed(sext_ln50_8_fu_787_p1) + $signed(empty_12_fu_120));

assign add_ln50_4_fu_799_p2 = ($signed(sext_ln50_10_fu_796_p1) + $signed(empty_13_fu_124));

assign add_ln50_5_fu_808_p2 = ($signed(sext_ln50_12_fu_805_p1) + $signed(empty_14_fu_128));

assign add_ln50_6_fu_817_p2 = ($signed(sext_ln50_14_fu_814_p1) + $signed(empty_15_fu_132));

assign add_ln50_7_fu_826_p2 = ($signed(sext_ln50_16_fu_823_p1) + $signed(empty_16_fu_136));

assign add_ln50_8_fu_835_p2 = ($signed(sext_ln50_18_fu_832_p1) + $signed(empty_17_fu_140));

assign add_ln50_9_fu_844_p2 = ($signed(sext_ln50_20_fu_841_p1) + $signed(empty_18_fu_144));

assign add_ln50_fu_763_p2 = ($signed(sext_ln50_2_fu_760_p1) + $signed(empty_fu_108));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign at_fu_489_p2 = (wr_load - ap_sig_allocacmp_tap_1);

assign history_address0 = zext_ln47_fu_495_p1;

assign history_ce0 = history_ce0_local;

assign icmp_ln45_fu_472_p2 = ((ap_sig_allocacmp_tap_1 == 9'd383) ? 1'b1 : 1'b0);

assign p_out = empty_24_fu_168;

assign p_out1 = empty_23_fu_164;

assign p_out10 = empty_14_fu_128;

assign p_out11 = empty_13_fu_124;

assign p_out12 = empty_12_fu_120;

assign p_out13 = empty_11_fu_116;

assign p_out14 = empty_10_fu_112;

assign p_out15 = empty_fu_108;

assign p_out2 = empty_22_fu_160;

assign p_out3 = empty_21_fu_156;

assign p_out4 = empty_20_fu_152;

assign p_out5 = empty_19_fu_148;

assign p_out6 = empty_18_fu_144;

assign p_out7 = empty_17_fu_140;

assign p_out8 = empty_16_fu_136;

assign p_out9 = empty_15_fu_132;

assign prod_10_fu_360_p1 = sext_ln50_fu_629_p1;

assign prod_11_fu_364_p1 = sext_ln50_fu_629_p1;

assign prod_12_fu_368_p1 = sext_ln50_fu_629_p1;

assign prod_13_fu_372_p1 = sext_ln50_fu_629_p1;

assign prod_14_fu_376_p1 = sext_ln50_fu_629_p1;

assign prod_15_fu_380_p1 = sext_ln50_fu_629_p1;

assign prod_1_fu_324_p1 = sext_ln50_fu_629_p1;

assign prod_2_fu_328_p1 = sext_ln50_fu_629_p1;

assign prod_3_fu_332_p1 = sext_ln50_fu_629_p1;

assign prod_4_fu_336_p1 = sext_ln50_fu_629_p1;

assign prod_5_fu_340_p1 = sext_ln50_fu_629_p1;

assign prod_6_fu_344_p1 = sext_ln50_fu_629_p1;

assign prod_7_fu_348_p1 = sext_ln50_fu_629_p1;

assign prod_8_fu_352_p1 = sext_ln50_fu_629_p1;

assign prod_9_fu_356_p1 = sext_ln50_fu_629_p1;

assign prod_fu_320_p1 = sext_ln50_fu_629_p1;

assign r18_LOC_FIR_address0 = zext_ln45_fu_484_p1;

assign sample_fu_505_p1 = history_q0[23:0];

assign sext_ln50_10_fu_796_p1 = $signed(prod_4_reg_1302);

assign sext_ln50_12_fu_805_p1 = $signed(prod_5_reg_1307);

assign sext_ln50_14_fu_814_p1 = $signed(prod_6_reg_1312);

assign sext_ln50_16_fu_823_p1 = $signed(prod_7_reg_1317);

assign sext_ln50_18_fu_832_p1 = $signed(prod_8_reg_1322);

assign sext_ln50_20_fu_841_p1 = $signed(prod_9_reg_1327);

assign sext_ln50_22_fu_850_p1 = $signed(prod_10_reg_1332);

assign sext_ln50_24_fu_859_p1 = $signed(prod_11_reg_1337);

assign sext_ln50_26_fu_868_p1 = $signed(prod_12_reg_1342);

assign sext_ln50_28_fu_877_p1 = $signed(prod_13_reg_1347);

assign sext_ln50_2_fu_760_p1 = $signed(prod_reg_1282);

assign sext_ln50_30_fu_886_p1 = $signed(prod_14_reg_1352);

assign sext_ln50_32_fu_895_p1 = $signed(prod_15_reg_1357);

assign sext_ln50_4_fu_769_p1 = $signed(prod_1_reg_1287);

assign sext_ln50_6_fu_778_p1 = $signed(prod_2_reg_1292);

assign sext_ln50_8_fu_787_p1 = $signed(prod_3_reg_1297);

assign sext_ln50_fu_629_p1 = $signed(co_reg_1197);

assign tap_2_fu_478_p2 = (ap_sig_allocacmp_tap_1 + 9'd1);

assign zext_ln45_fu_484_p1 = ap_sig_allocacmp_tap_1;

assign zext_ln47_fu_495_p1 = at_fu_489_p2;

endmodule                                                   
