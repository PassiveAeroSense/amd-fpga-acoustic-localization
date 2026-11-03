                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        r18_ROOTS_load,
        features_address0,
        features_ce0,
        features_q0,
        node_2_in_out,
        node_2_in_out_ap_vld,
        ap_return
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_pp0_stage1 = 6'd4;
parameter    ap_ST_fsm_pp0_stage2 = 6'd8;
parameter    ap_ST_fsm_state6 = 6'd16;
parameter    ap_ST_fsm_state7 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [10:0] r18_ROOTS_load;
output  [7:0] features_address0;
output   features_ce0;
input  [47:0] features_q0;
output  [10:0] node_2_in_out;
output   node_2_in_out_ap_vld;
output  [0:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg node_2_in_out_ap_vld;
reg[0:0] ap_return;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [10:0] r18_NODE_LEAF_address0;
wire   [0:0] r18_NODE_LEAF_q0;
wire   [10:0] r18_NODE_FEAT_address0;
wire   [7:0] r18_NODE_FEAT_q0;
wire   [10:0] r18_NODE_LEFT_address0;
wire   [10:0] r18_NODE_LEFT_q0;
wire   [10:0] r18_NODE_RIGHT_address0;
wire   [10:0] r18_NODE_RIGHT_q0;
wire   [10:0] r18_NODE_THR_address0;
wire   [37:0] r18_NODE_THR_q0;
reg   [10:0] node_2_in_reg_149;
wire   [63:0] zext_ln43_fu_177_p1;
reg   [63:0] zext_ln43_reg_250;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] r18_NODE_LEAF_load_reg_263;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter0_reg;
wire    ap_block_pp0_stage1_11001;
reg   [10:0] r18_NODE_LEFT_load_reg_287;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2_11001;
reg   [10:0] r18_NODE_RIGHT_load_reg_292;
reg   [37:0] r18_NODE_THR_load_reg_302;
wire   [0:0] tmp_fu_204_p3;
reg   [0:0] tmp_reg_307;
wire   [10:0] select_ln46_fu_232_p3;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage2_subdone;
reg    ap_predicate_tran5to6_state4;
reg    ap_condition_pp0_flush_enable;
wire    ap_block_pp0_stage0_subdone;
reg   [10:0] ap_phi_mux_node_2_in_phi_fu_153_p4;
wire    ap_block_pp0_stage0;
reg   [0:0] ap_phi_mux_UnifiedRetVal_phi_fu_164_p4;
reg   [0:0] UnifiedRetVal_reg_160;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state6;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln46_fu_189_p1;
wire    ap_block_pp0_stage2;
reg   [4:0] depth_fu_54;
wire   [4:0] trunc_ln42_fu_200_p1;
reg    r18_NODE_LEAF_ce0_local;
reg    r18_NODE_FEAT_ce0_local;
reg    r18_NODE_LEFT_ce0_local;
reg    r18_NODE_RIGHT_ce0_local;
reg    r18_NODE_THR_ce0_local;
reg    features_ce0_local;
wire   [5:0] zext_ln31_fu_185_p1;
wire   [5:0] depth_1_fu_194_p2;
wire  signed [47:0] sext_ln46_fu_217_p1;
wire   [0:0] icmp_ln46_fu_220_p2;
wire   [0:0] xor_ln46_fu_226_p2;
reg   [0:0] ap_return_preg;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
reg   [1:0] ap_exit_tran_regpp0;
wire    ap_block_pp0_stage1_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 depth_fu_54 = 5'd0;
#0 ap_return_preg = 1'd0;
end

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEAF_ROM_AUTO_1R #(
    .DataWidth( 1 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_LEAF_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_NODE_LEAF_address0),
    .ce0(r18_NODE_LEAF_ce0_local),
    .q0(r18_NODE_LEAF_q0)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_FEAT_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_FEAT_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_NODE_FEAT_address0),
    .ce0(r18_NODE_FEAT_ce0_local),
    .q0(r18_NODE_FEAT_q0)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEFT_ROM_AUTO_1R #(
    .DataWidth( 11 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_LEFT_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_NODE_LEFT_address0),
    .ce0(r18_NODE_LEFT_ce0_local),
    .q0(r18_NODE_LEFT_q0)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_RIGHT_ROM_AUTO_1R #(
    .DataWidth( 11 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_RIGHT_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_NODE_RIGHT_address0),
    .ce0(r18_NODE_RIGHT_ce0_local),
    .q0(r18_NODE_RIGHT_q0)
);

detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_THR_ROM_AUTO_1R #(
    .DataWidth( 38 ),
    .AddressRange( 1560 ),
    .AddressWidth( 11 ))
r18_NODE_THR_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_NODE_THR_address0),
    .ce0(r18_NODE_THR_ce0_local),
    .q0(r18_NODE_THR_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((((ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            ap_return_preg <= ap_phi_mux_UnifiedRetVal_phi_fu_164_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        UnifiedRetVal_reg_160 <= 1'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        UnifiedRetVal_reg_160 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
        if ((r18_NODE_LEAF_load_reg_263 == 1'd1)) begin
                        ap_exit_tran_regpp0[0] <= 1'b1;
        end else if ((ap_predicate_tran5to6_state4 == 1'b1)) begin
                        ap_exit_tran_regpp0[0] <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        depth_fu_54 <= 5'd0;
    end else if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        depth_fu_54 <= trunc_ln42_fu_200_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_reg_307 == 1'd0))) begin
        node_2_in_reg_149 <= select_ln46_fu_232_p3;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        node_2_in_reg_149 <= r18_ROOTS_load;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_NODE_LEAF_load_reg_263 <= r18_NODE_LEAF_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        r18_NODE_LEFT_load_reg_287 <= r18_NODE_LEFT_q0;
        r18_NODE_RIGHT_load_reg_292 <= r18_NODE_RIGHT_q0;
        r18_NODE_THR_load_reg_302 <= r18_NODE_THR_q0;
        tmp_reg_307 <= depth_1_fu_194_p2[32'd5];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln43_reg_250[10 : 0] <= zext_ln43_fu_177_p1[10 : 0];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_CS_fsm_pp0_stage2) & ((r18_NODE_LEAF_load_reg_263 == 1'd1) | (ap_predicate_tran5to6_state4 == 1'b1)))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_phi_mux_UnifiedRetVal_phi_fu_164_p4 = 1'd0;
    end else begin
        ap_phi_mux_UnifiedRetVal_phi_fu_164_p4 = UnifiedRetVal_reg_160;
    end
end

always @ (*) begin
    if (((r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_reg_307 == 1'd0))) begin
        ap_phi_mux_node_2_in_phi_fu_153_p4 = select_ln46_fu_232_p3;
    end else begin
        ap_phi_mux_node_2_in_phi_fu_153_p4 = node_2_in_reg_149;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_return = ap_phi_mux_UnifiedRetVal_phi_fu_164_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        features_ce0_local = 1'b1;
    end else begin
        features_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | ((r18_NODE_LEAF_load_reg_263 == 1'd0) & (1'b1 == ap_CS_fsm_state6)))) begin
        node_2_in_out_ap_vld = 1'b1;
    end else begin
        node_2_in_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_NODE_FEAT_ce0_local = 1'b1;
    end else begin
        r18_NODE_FEAT_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_NODE_LEAF_ce0_local = 1'b1;
    end else begin
        r18_NODE_LEAF_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_NODE_LEFT_ce0_local = 1'b1;
    end else begin
        r18_NODE_LEFT_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_NODE_RIGHT_ce0_local = 1'b1;
    end else begin
        r18_NODE_RIGHT_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        r18_NODE_THR_ce0_local = 1'b1;
    end else begin
        r18_NODE_THR_ce0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_exit_tran_regpp0 == 2'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_exit_tran_regpp0 == 2'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_tran5to6_state4 = ((r18_NODE_LEAF_load_reg_263 == 1'd0) & (tmp_fu_204_p3 == 1'd1));
end

assign depth_1_fu_194_p2 = (zext_ln31_fu_185_p1 + 6'd1);

assign features_address0 = zext_ln46_fu_189_p1;

assign features_ce0 = features_ce0_local;

assign icmp_ln46_fu_220_p2 = (($signed(sext_ln46_fu_217_p1) < $signed(features_q0)) ? 1'b1 : 1'b0);

assign node_2_in_out = node_2_in_reg_149;

assign r18_NODE_FEAT_address0 = zext_ln43_reg_250;

assign r18_NODE_LEAF_address0 = zext_ln43_fu_177_p1;

assign r18_NODE_LEFT_address0 = zext_ln43_reg_250;

assign r18_NODE_RIGHT_address0 = zext_ln43_reg_250;

assign r18_NODE_THR_address0 = zext_ln43_reg_250;

assign select_ln46_fu_232_p3 = ((xor_ln46_fu_226_p2[0:0] == 1'b1) ? r18_NODE_LEFT_load_reg_287 : r18_NODE_RIGHT_load_reg_292);

assign sext_ln46_fu_217_p1 = $signed(r18_NODE_THR_load_reg_302);

assign tmp_fu_204_p3 = depth_1_fu_194_p2[32'd5];

assign trunc_ln42_fu_200_p1 = depth_1_fu_194_p2[4:0];

assign xor_ln46_fu_226_p2 = (icmp_ln46_fu_220_p2 ^ 1'd1);

assign zext_ln31_fu_185_p1 = depth_fu_54;

assign zext_ln43_fu_177_p1 = ap_phi_mux_node_2_in_phi_fu_153_p4;

assign zext_ln46_fu_189_p1 = r18_NODE_FEAT_q0;

always @ (posedge ap_clk) begin
    zext_ln43_reg_250[63:11] <= 53'b00000000000000000000000000000000000000000000000000000;
    ap_exit_tran_regpp0[1] <= 1'b0;
end

endmodule                                                     
