                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        wr_load,
        zext_ln45,
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
input  [2:0] zext_ln45;
output  [52:0] p_out;
output   p_out_ap_vld;
output  [52:0] p_out1;
output   p_out1_ap_vld;
output  [52:0] p_out2;
output   p_out2_ap_vld;
output  [52:0] p_out3;
output   p_out3_ap_vld;
output  [52:0] p_out4;
output   p_out4_ap_vld;
output  [52:0] p_out5;
output   p_out5_ap_vld;
output  [52:0] p_out6;
output   p_out6_ap_vld;
output  [52:0] p_out7;
output   p_out7_ap_vld;
output  [8:0] history_address0;
output   history_ce0;
input  [191:0] history_q0;

reg ap_idle;
reg p_out_ap_vld;
reg p_out1_ap_vld;
reg p_out2_ap_vld;
reg p_out3_ap_vld;
reg p_out4_ap_vld;
reg p_out5_ap_vld;
reg p_out6_ap_vld;
reg p_out7_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln45_fu_316_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [10:0] r18_DET_FIR_address0;
wire   [21:0] r18_DET_FIR_q0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln45_reg_746;
reg   [0:0] icmp_ln45_reg_746_pp0_iter1_reg;
wire   [0:0] icmp_ln47_fu_372_p2;
reg   [0:0] icmp_ln47_reg_755;
wire   [21:0] co_1_fu_383_p3;
reg   [21:0] co_1_reg_765;
wire   [23:0] sample_fu_390_p1;
reg  signed [23:0] sample_reg_770;
reg  signed [23:0] sample_1_reg_775;
reg  signed [23:0] sample_2_reg_780;
reg  signed [23:0] sample_3_reg_785;
reg  signed [23:0] sample_4_reg_790;
reg  signed [23:0] sample_5_reg_795;
reg  signed [23:0] sample_6_reg_800;
reg  signed [23:0] sample_7_reg_805;
wire   [45:0] prod_fu_232_p2;
reg   [45:0] prod_reg_810;
wire   [45:0] prod_1_fu_236_p2;
reg   [45:0] prod_1_reg_815;
wire   [45:0] prod_2_fu_240_p2;
reg   [45:0] prod_2_reg_820;
wire   [45:0] prod_3_fu_244_p2;
reg   [45:0] prod_3_reg_825;
wire   [45:0] prod_4_fu_248_p2;
reg   [45:0] prod_4_reg_830;
wire   [45:0] prod_5_fu_252_p2;
reg   [45:0] prod_5_reg_835;
wire   [45:0] prod_6_fu_256_p2;
reg   [45:0] prod_6_reg_840;
wire   [45:0] prod_7_fu_260_p2;
reg   [45:0] prod_7_reg_845;
wire   [63:0] zext_ln47_fu_338_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln47_1_fu_367_p1;
reg   [52:0] empty_fu_102;
wire   [52:0] add_ln50_fu_534_p2;
wire    ap_loop_init;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [52:0] empty_12_fu_106;
wire   [52:0] add_ln50_1_fu_543_p2;
reg   [52:0] empty_13_fu_110;
wire   [52:0] add_ln50_2_fu_552_p2;
reg   [52:0] empty_14_fu_114;
wire   [52:0] add_ln50_3_fu_561_p2;
reg   [52:0] empty_15_fu_118;
wire   [52:0] add_ln50_4_fu_570_p2;
reg   [52:0] empty_16_fu_122;
wire   [52:0] add_ln50_5_fu_579_p2;
reg   [52:0] empty_17_fu_126;
wire   [52:0] add_ln50_6_fu_588_p2;
reg   [52:0] empty_18_fu_130;
wire   [52:0] add_ln50_7_fu_597_p2;
reg   [8:0] tap_fu_134;
wire   [8:0] tap_2_fu_322_p2;
reg   [8:0] ap_sig_allocacmp_tap_1;
wire    ap_block_pp0_stage0_01001;
reg    history_ce0_local;
reg    r18_DET_FIR_ce0_local;
wire  signed [21:0] prod_fu_232_p1;
wire  signed [45:0] sext_ln50_fu_464_p1;
wire  signed [21:0] prod_1_fu_236_p1;
wire  signed [21:0] prod_2_fu_240_p1;
wire  signed [21:0] prod_3_fu_244_p1;
wire  signed [21:0] prod_4_fu_248_p1;
wire  signed [21:0] prod_5_fu_252_p1;
wire  signed [21:0] prod_6_fu_256_p1;
wire  signed [21:0] prod_7_fu_260_p1;
wire   [8:0] at_fu_332_p2;
wire   [10:0] tmp_fu_343_p3;
wire   [11:0] zext_ln47_2_fu_351_p1;
wire   [11:0] zext_ln45_1_fu_328_p1;
wire   [11:0] add_ln47_1_fu_355_p2;
wire   [11:0] zext_ln45_cast_fu_264_p1;
wire   [11:0] add_ln47_fu_361_p2;
wire  signed [52:0] sext_ln50_2_fu_531_p1;
wire  signed [52:0] sext_ln50_4_fu_540_p1;
wire  signed [52:0] sext_ln50_6_fu_549_p1;
wire  signed [52:0] sext_ln50_8_fu_558_p1;
wire  signed [52:0] sext_ln50_10_fu_567_p1;
wire  signed [52:0] sext_ln50_12_fu_576_p1;
wire  signed [52:0] sext_ln50_14_fu_585_p1;
wire  signed [52:0] sext_ln50_16_fu_594_p1;
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
#0 empty_fu_102 = 53'd0;
#0 empty_12_fu_106 = 53'd0;
#0 empty_13_fu_110 = 53'd0;
#0 empty_14_fu_114 = 53'd0;
#0 empty_15_fu_118 = 53'd0;
#0 empty_16_fu_122 = 53'd0;
#0 empty_17_fu_126 = 53'd0;
#0 empty_18_fu_130 = 53'd0;
#0 tap_fu_134 = 9'd0;
#0 ap_done_reg = 1'b0;
end

fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2_r18_DET_FIR_ROM_AUTO_1R #(
    .DataWidth( 22 ),
    .AddressRange( 2047 ),
    .AddressWidth( 11 ))
r18_DET_FIR_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_DET_FIR_address0),
    .ce0(r18_DET_FIR_ce0_local),
    .q0(r18_DET_FIR_q0)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U1(
    .din0(sample_reg_770),
    .din1(prod_fu_232_p1),
    .dout(prod_fu_232_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U2(
    .din0(sample_1_reg_775),
    .din1(prod_1_fu_236_p1),
    .dout(prod_1_fu_236_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U3(
    .din0(sample_2_reg_780),
    .din1(prod_2_fu_240_p1),
    .dout(prod_2_fu_240_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U4(
    .din0(sample_3_reg_785),
    .din1(prod_3_fu_244_p1),
    .dout(prod_3_fu_244_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U5(
    .din0(sample_4_reg_790),
    .din1(prod_4_fu_248_p1),
    .dout(prod_4_fu_248_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U6(
    .din0(sample_5_reg_795),
    .din1(prod_5_fu_252_p1),
    .dout(prod_5_fu_252_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U7(
    .din0(sample_6_reg_800),
    .din1(prod_6_fu_256_p1),
    .dout(prod_6_fu_256_p2)
);

fir_det_hls_mul_24s_22s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 24 ),
    .din1_WIDTH( 22 ),
    .dout_WIDTH( 46 ))
mul_24s_22s_46_1_1_U8(
    .din0(sample_7_reg_805),
    .din1(prod_7_fu_260_p1),
    .dout(prod_7_fu_260_p2)
);

fir_det_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_12_fu_106 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_12_fu_106 <= add_ln50_1_fu_543_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_13_fu_110 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_13_fu_110 <= add_ln50_2_fu_552_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_14_fu_114 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_14_fu_114 <= add_ln50_3_fu_561_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_15_fu_118 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_15_fu_118 <= add_ln50_4_fu_570_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_16_fu_122 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_16_fu_122 <= add_ln50_5_fu_579_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_17_fu_126 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_17_fu_126 <= add_ln50_6_fu_588_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_18_fu_130 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_18_fu_130 <= add_ln50_7_fu_597_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            empty_fu_102 <= 53'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            empty_fu_102 <= add_ln50_fu_534_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln45_fu_316_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            tap_fu_134 <= tap_2_fu_322_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            tap_fu_134 <= 9'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        co_1_reg_765 <= co_1_fu_383_p3;
        icmp_ln45_reg_746 <= icmp_ln45_fu_316_p2;
        icmp_ln45_reg_746_pp0_iter1_reg <= icmp_ln45_reg_746;
        icmp_ln47_reg_755 <= icmp_ln47_fu_372_p2;
        sample_1_reg_775 <= {{history_q0[47:24]}};
        sample_2_reg_780 <= {{history_q0[71:48]}};
        sample_3_reg_785 <= {{history_q0[95:72]}};
        sample_4_reg_790 <= {{history_q0[119:96]}};
        sample_5_reg_795 <= {{history_q0[143:120]}};
        sample_6_reg_800 <= {{history_q0[167:144]}};
        sample_7_reg_805 <= {{history_q0[191:168]}};
        sample_reg_770 <= sample_fu_390_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        prod_1_reg_815 <= prod_1_fu_236_p2;
        prod_2_reg_820 <= prod_2_fu_240_p2;
        prod_3_reg_825 <= prod_3_fu_244_p2;
        prod_4_reg_830 <= prod_4_fu_248_p2;
        prod_5_reg_835 <= prod_5_fu_252_p2;
        prod_6_reg_840 <= prod_6_fu_256_p2;
        prod_7_reg_845 <= prod_7_fu_260_p2;
        prod_reg_810 <= prod_fu_232_p2;
    end
end

always @ (*) begin
    if (((icmp_ln45_fu_316_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_tap_1 = 9'd0;
    end else begin
        ap_sig_allocacmp_tap_1 = tap_fu_134;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out1_ap_vld = 1'b1;
    end else begin
        p_out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out2_ap_vld = 1'b1;
    end else begin
        p_out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out3_ap_vld = 1'b1;
    end else begin
        p_out3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out4_ap_vld = 1'b1;
    end else begin
        p_out4_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out5_ap_vld = 1'b1;
    end else begin
        p_out5_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out6_ap_vld = 1'b1;
    end else begin
        p_out6_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out7_ap_vld = 1'b1;
    end else begin
        p_out7_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1) & (icmp_ln45_reg_746_pp0_iter1_reg == 1'd1))) begin
        p_out_ap_vld = 1'b1;
    end else begin
        p_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_DET_FIR_ce0_local = 1'b1;
    end else begin
        r18_DET_FIR_ce0_local = 1'b0;
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

assign add_ln47_1_fu_355_p2 = (zext_ln47_2_fu_351_p1 + zext_ln45_1_fu_328_p1);

assign add_ln47_fu_361_p2 = (add_ln47_1_fu_355_p2 + zext_ln45_cast_fu_264_p1);

assign add_ln50_1_fu_543_p2 = ($signed(sext_ln50_4_fu_540_p1) + $signed(empty_12_fu_106));

assign add_ln50_2_fu_552_p2 = ($signed(sext_ln50_6_fu_549_p1) + $signed(empty_13_fu_110));

assign add_ln50_3_fu_561_p2 = ($signed(sext_ln50_8_fu_558_p1) + $signed(empty_14_fu_114));

assign add_ln50_4_fu_570_p2 = ($signed(sext_ln50_10_fu_567_p1) + $signed(empty_15_fu_118));

assign add_ln50_5_fu_579_p2 = ($signed(sext_ln50_12_fu_576_p1) + $signed(empty_16_fu_122));

assign add_ln50_6_fu_588_p2 = ($signed(sext_ln50_14_fu_585_p1) + $signed(empty_17_fu_126));

assign add_ln50_7_fu_597_p2 = ($signed(sext_ln50_16_fu_594_p1) + $signed(empty_18_fu_130));

assign add_ln50_fu_534_p2 = ($signed(sext_ln50_2_fu_531_p1) + $signed(empty_fu_102));

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

assign at_fu_332_p2 = (wr_load - ap_sig_allocacmp_tap_1);

assign co_1_fu_383_p3 = ((icmp_ln47_reg_755[0:0] == 1'b1) ? r18_DET_FIR_q0 : 22'd0);

assign history_address0 = zext_ln47_fu_338_p1;

assign history_ce0 = history_ce0_local;

assign icmp_ln45_fu_316_p2 = ((ap_sig_allocacmp_tap_1 == 9'd410) ? 1'b1 : 1'b0);

assign icmp_ln47_fu_372_p2 = ((add_ln47_fu_361_p2 < 12'd2047) ? 1'b1 : 1'b0);

assign p_out = empty_18_fu_130;

assign p_out1 = empty_17_fu_126;

assign p_out2 = empty_16_fu_122;

assign p_out3 = empty_15_fu_118;

assign p_out4 = empty_14_fu_114;

assign p_out5 = empty_13_fu_110;

assign p_out6 = empty_12_fu_106;

assign p_out7 = empty_fu_102;

assign prod_1_fu_236_p1 = sext_ln50_fu_464_p1;

assign prod_2_fu_240_p1 = sext_ln50_fu_464_p1;

assign prod_3_fu_244_p1 = sext_ln50_fu_464_p1;

assign prod_4_fu_248_p1 = sext_ln50_fu_464_p1;

assign prod_5_fu_252_p1 = sext_ln50_fu_464_p1;

assign prod_6_fu_256_p1 = sext_ln50_fu_464_p1;

assign prod_7_fu_260_p1 = sext_ln50_fu_464_p1;

assign prod_fu_232_p1 = sext_ln50_fu_464_p1;

assign r18_DET_FIR_address0 = zext_ln47_1_fu_367_p1;

assign sample_fu_390_p1 = history_q0[23:0];

assign sext_ln50_10_fu_567_p1 = $signed(prod_4_reg_830);

assign sext_ln50_12_fu_576_p1 = $signed(prod_5_reg_835);

assign sext_ln50_14_fu_585_p1 = $signed(prod_6_reg_840);

assign sext_ln50_16_fu_594_p1 = $signed(prod_7_reg_845);

assign sext_ln50_2_fu_531_p1 = $signed(prod_reg_810);

assign sext_ln50_4_fu_540_p1 = $signed(prod_1_reg_815);

assign sext_ln50_6_fu_549_p1 = $signed(prod_2_reg_820);

assign sext_ln50_8_fu_558_p1 = $signed(prod_3_reg_825);

assign sext_ln50_fu_464_p1 = $signed(co_1_reg_765);

assign tap_2_fu_322_p2 = (ap_sig_allocacmp_tap_1 + 9'd1);

assign tmp_fu_343_p3 = {{ap_sig_allocacmp_tap_1}, {2'd0}};

assign zext_ln45_1_fu_328_p1 = ap_sig_allocacmp_tap_1;

assign zext_ln45_cast_fu_264_p1 = zext_ln45;

assign zext_ln47_1_fu_367_p1 = add_ln47_fu_361_p2;

assign zext_ln47_2_fu_351_p1 = tmp_fu_343_p3;

assign zext_ln47_fu_338_p1 = at_fu_332_p2;

endmodule                                                   
