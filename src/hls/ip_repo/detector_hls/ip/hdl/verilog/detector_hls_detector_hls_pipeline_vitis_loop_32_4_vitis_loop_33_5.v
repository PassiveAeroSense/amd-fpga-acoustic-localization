                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        raw_address0,
        raw_ce0,
        raw_q0,
        conv3_i12_i3167,
        features_address0,
        features_ce0,
        features_we0,
        features_d0,
        invalid_21_out_i,
        invalid_21_out_o,
        invalid_21_out_o_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] raw_address0;
output   raw_ce0;
input  [47:0] raw_q0;
input  [47:0] conv3_i12_i3167;
output  [7:0] features_address0;
output   features_ce0;
output   features_we0;
output  [47:0] features_d0;
input  [0:0] invalid_21_out_i;
output  [0:0] invalid_21_out_o;
output   invalid_21_out_o_ap_vld;

reg ap_idle;
reg[0:0] invalid_21_out_o;
reg invalid_21_out_o_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln32_fu_176_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [11:0] r18_DCT_address0;
wire  signed [28:0] r18_DCT_q0;
reg   [0:0] invalid_reg_131;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln32_reg_435;
reg   [0:0] icmp_ln32_reg_435_pp0_iter1_reg;
reg   [0:0] icmp_ln32_reg_435_pp0_iter2_reg;
reg   [0:0] icmp_ln32_reg_435_pp0_iter3_reg;
reg   [0:0] icmp_ln32_reg_435_pp0_iter4_reg;
wire   [0:0] icmp_ln33_fu_194_p2;
reg   [0:0] icmp_ln33_reg_439;
reg   [0:0] icmp_ln33_reg_439_pp0_iter1_reg;
reg   [0:0] icmp_ln33_reg_439_pp0_iter2_reg;
reg   [0:0] icmp_ln33_reg_439_pp0_iter3_reg;
reg   [0:0] icmp_ln33_reg_439_pp0_iter4_reg;
wire   [6:0] select_ln32_fu_200_p3;
reg   [6:0] select_ln32_reg_445;
reg   [6:0] select_ln32_reg_445_pp0_iter1_reg;
reg   [6:0] select_ln32_reg_445_pp0_iter2_reg;
wire   [4:0] select_ln32_2_fu_214_p3;
reg   [4:0] select_ln32_2_reg_451;
reg   [4:0] select_ln32_2_reg_451_pp0_iter1_reg;
reg   [4:0] select_ln32_2_reg_451_pp0_iter2_reg;
reg   [4:0] select_ln32_2_reg_451_pp0_iter3_reg;
reg   [4:0] select_ln32_2_reg_451_pp0_iter4_reg;
wire   [0:0] icmp_ln33_1_fu_232_p2;
reg   [0:0] icmp_ln33_1_reg_461;
reg   [0:0] icmp_ln33_1_reg_461_pp0_iter1_reg;
reg   [0:0] icmp_ln33_1_reg_461_pp0_iter2_reg;
reg   [0:0] icmp_ln33_1_reg_461_pp0_iter3_reg;
reg   [0:0] icmp_ln33_1_reg_461_pp0_iter4_reg;
wire   [75:0] prod_fu_143_p2;
reg   [75:0] prod_reg_480;
wire   [0:0] select_ln32_3_fu_293_p3;
reg    ap_condition_exit_pp0_iter4_stage0;
wire    ap_loop_init;
wire   [63:0] zext_ln33_fu_256_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln35_fu_260_p1;
wire   [63:0] zext_ln37_fu_377_p1;
wire   [0:0] invalid_1_fu_350_p2;
reg   [81:0] acc_fu_70;
wire   [81:0] acc_1_fu_306_p2;
reg   [6:0] i_3_fu_74;
wire   [6:0] add_ln33_fu_226_p2;
reg   [6:0] ap_sig_allocacmp_i_3_load;
reg   [4:0] k_fu_78;
reg   [4:0] ap_sig_allocacmp_k_load;
reg   [11:0] indvar_flatten_fu_82;
wire   [11:0] add_ln32_fu_182_p2;
reg   [11:0] ap_sig_allocacmp_indvar_flatten_load;
reg    raw_ce0_local;
reg    r18_DCT_ce0_local;
reg    features_we0_local;
reg    features_ce0_local;
wire   [4:0] add_ln32_1_fu_208_p2;
wire   [11:0] grp_fu_393_p3;
wire  signed [47:0] x_fu_264_p2;
wire  signed [81:0] sext_ln35_2_fu_303_p1;
wire   [81:0] select_ln32_1_fu_286_p3;
wire   [4:0] tmp_fu_322_p4;
wire   [51:0] trunc_ln37_1_fu_312_p4;
wire   [0:0] icmp_ln37_1_fu_338_p2;
wire   [0:0] icmp_ln37_fu_332_p2;
wire   [0:0] or_ln37_fu_344_p2;
wire   [6:0] zext_ln32_fu_300_p1;
wire   [6:0] add_ln37_fu_367_p2;
wire  signed [7:0] sext_ln37_fu_373_p1;
wire   [6:0] grp_fu_393_p0;
wire   [4:0] grp_fu_393_p1;
wire   [6:0] grp_fu_393_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire   [11:0] grp_fu_393_p10;
wire   [11:0] grp_fu_393_p20;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 acc_fu_70 = 82'd0;
#0 i_3_fu_74 = 7'd0;
#0 k_fu_78 = 5'd0;
#0 indvar_flatten_fu_82 = 12'd0;
#0 ap_done_reg = 1'b0;
end

detector_hls_detector_hls_Pipeline_VITIS_LOOP_32_4_VITIS_LOOP_33_5_r18_DCT_ROM_AUTO_1R #(
    .DataWidth( 29 ),
    .AddressRange( 2328 ),
    .AddressWidth( 12 ))
r18_DCT_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_DCT_address0),
    .ce0(r18_DCT_ce0_local),
    .q0(r18_DCT_q0)
);

detector_hls_mul_48s_29s_76_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 48 ),
    .din1_WIDTH( 29 ),
    .dout_WIDTH( 76 ))
mul_48s_29s_76_1_1_U14(
    .din0(x_fu_264_p2),
    .din1(r18_DCT_q0),
    .dout(prod_fu_143_p2)
);

detector_hls_mac_muladd_7ns_5ns_7ns_12_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 5 ),
    .din2_WIDTH( 7 ),
    .dout_WIDTH( 12 ))
mac_muladd_7ns_5ns_7ns_12_4_1_U15(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_393_p0),
    .din1(grp_fu_393_p1),
    .din2(grp_fu_393_p2),
    .ce(1'b1),
    .dout(grp_fu_393_p3)
);

detector_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter4_stage0)) begin
            ap_enable_reg_pp0_iter5 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            acc_fu_70 <= 82'd0;
        end else if (((ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln32_reg_435_pp0_iter4_reg == 1'd0))) begin
            acc_fu_70 <= acc_1_fu_306_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln32_fu_176_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_3_fu_74 <= add_ln33_fu_226_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_3_fu_74 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln32_fu_176_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_82 <= add_ln32_fu_182_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_82 <= 12'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        invalid_reg_131 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln32_reg_435_pp0_iter4_reg == 1'd0))) begin
        invalid_reg_131 <= select_ln32_3_fu_293_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln32_fu_176_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            k_fu_78 <= select_ln32_2_fu_214_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            k_fu_78 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        icmp_ln32_reg_435 <= icmp_ln32_fu_176_p2;
        icmp_ln32_reg_435_pp0_iter1_reg <= icmp_ln32_reg_435;
        icmp_ln33_1_reg_461 <= icmp_ln33_1_fu_232_p2;
        icmp_ln33_1_reg_461_pp0_iter1_reg <= icmp_ln33_1_reg_461;
        icmp_ln33_reg_439 <= icmp_ln33_fu_194_p2;
        icmp_ln33_reg_439_pp0_iter1_reg <= icmp_ln33_reg_439;
        select_ln32_2_reg_451 <= select_ln32_2_fu_214_p3;
        select_ln32_2_reg_451_pp0_iter1_reg <= select_ln32_2_reg_451;
        select_ln32_reg_445 <= select_ln32_fu_200_p3;
        select_ln32_reg_445_pp0_iter1_reg <= select_ln32_reg_445;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        icmp_ln32_reg_435_pp0_iter2_reg <= icmp_ln32_reg_435_pp0_iter1_reg;
        icmp_ln32_reg_435_pp0_iter3_reg <= icmp_ln32_reg_435_pp0_iter2_reg;
        icmp_ln32_reg_435_pp0_iter4_reg <= icmp_ln32_reg_435_pp0_iter3_reg;
        icmp_ln33_1_reg_461_pp0_iter2_reg <= icmp_ln33_1_reg_461_pp0_iter1_reg;
        icmp_ln33_1_reg_461_pp0_iter3_reg <= icmp_ln33_1_reg_461_pp0_iter2_reg;
        icmp_ln33_1_reg_461_pp0_iter4_reg <= icmp_ln33_1_reg_461_pp0_iter3_reg;
        icmp_ln33_reg_439_pp0_iter2_reg <= icmp_ln33_reg_439_pp0_iter1_reg;
        icmp_ln33_reg_439_pp0_iter3_reg <= icmp_ln33_reg_439_pp0_iter2_reg;
        icmp_ln33_reg_439_pp0_iter4_reg <= icmp_ln33_reg_439_pp0_iter3_reg;
        prod_reg_480 <= prod_fu_143_p2;
        select_ln32_2_reg_451_pp0_iter2_reg <= select_ln32_2_reg_451_pp0_iter1_reg;
        select_ln32_2_reg_451_pp0_iter3_reg <= select_ln32_2_reg_451_pp0_iter2_reg;
        select_ln32_2_reg_451_pp0_iter4_reg <= select_ln32_2_reg_451_pp0_iter3_reg;
        select_ln32_reg_445_pp0_iter2_reg <= select_ln32_reg_445_pp0_iter1_reg;
    end
end

always @ (*) begin
    if (((icmp_ln32_fu_176_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (icmp_ln32_reg_435_pp0_iter3_reg == 1'd1))) begin
        ap_condition_exit_pp0_iter4_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter4_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
        ap_sig_allocacmp_i_3_load = 7'd0;
    end else begin
        ap_sig_allocacmp_i_3_load = i_3_fu_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 12'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_82;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_k_load = 5'd0;
    end else begin
        ap_sig_allocacmp_k_load = k_fu_78;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        features_ce0_local = 1'b1;
    end else begin
        features_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln33_1_reg_461_pp0_iter4_reg == 1'd1))) begin
        features_we0_local = 1'b1;
    end else begin
        features_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_block_pp0_stage0)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            invalid_21_out_o = 'bx;
        end else if (((ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln32_reg_435_pp0_iter4_reg == 1'd0))) begin
            invalid_21_out_o = invalid_1_fu_350_p2;
        end else begin
            invalid_21_out_o = invalid_21_out_i;
        end
    end else begin
        invalid_21_out_o = invalid_21_out_i;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln32_reg_435_pp0_iter4_reg == 1'd0)))) begin
        invalid_21_out_o_ap_vld = 1'b1;
    end else begin
        invalid_21_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        r18_DCT_ce0_local = 1'b1;
    end else begin
        r18_DCT_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        raw_ce0_local = 1'b1;
    end else begin
        raw_ce0_local = 1'b0;
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

assign acc_1_fu_306_p2 = ($signed(sext_ln35_2_fu_303_p1) + $signed(select_ln32_1_fu_286_p3));

assign add_ln32_1_fu_208_p2 = (ap_sig_allocacmp_k_load + 5'd1);

assign add_ln32_fu_182_p2 = (ap_sig_allocacmp_indvar_flatten_load + 12'd1);

assign add_ln33_fu_226_p2 = (select_ln32_fu_200_p3 + 7'd1);

assign add_ln37_fu_367_p2 = ($signed(zext_ln32_fu_300_p1) + $signed(7'd66));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign features_address0 = zext_ln37_fu_377_p1;

assign features_ce0 = features_ce0_local;

assign features_d0 = {{acc_1_fu_306_p2[77:30]}};

assign features_we0 = features_we0_local;

assign grp_fu_393_p0 = 12'd97;

assign grp_fu_393_p1 = grp_fu_393_p10;

assign grp_fu_393_p10 = select_ln32_2_fu_214_p3;

assign grp_fu_393_p2 = grp_fu_393_p20;

assign grp_fu_393_p20 = select_ln32_reg_445_pp0_iter1_reg;

assign icmp_ln32_fu_176_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 12'd2328) ? 1'b1 : 1'b0);

assign icmp_ln33_1_fu_232_p2 = ((add_ln33_fu_226_p2 == 7'd97) ? 1'b1 : 1'b0);

assign icmp_ln33_fu_194_p2 = ((ap_sig_allocacmp_i_3_load == 7'd97) ? 1'b1 : 1'b0);

assign icmp_ln37_1_fu_338_p2 = (($signed(trunc_ln37_1_fu_312_p4) < $signed(52'd4362862139015168)) ? 1'b1 : 1'b0);

assign icmp_ln37_fu_332_p2 = (($signed(tmp_fu_322_p4) > $signed(5'd0)) ? 1'b1 : 1'b0);

assign invalid_1_fu_350_p2 = (select_ln32_3_fu_293_p3 | or_ln37_fu_344_p2);

assign or_ln37_fu_344_p2 = (icmp_ln37_fu_332_p2 | icmp_ln37_1_fu_338_p2);

assign r18_DCT_address0 = zext_ln35_fu_260_p1;

assign raw_address0 = zext_ln33_fu_256_p1;

assign raw_ce0 = raw_ce0_local;

assign select_ln32_1_fu_286_p3 = ((icmp_ln33_reg_439_pp0_iter4_reg[0:0] == 1'b1) ? 82'd0 : acc_fu_70);

assign select_ln32_2_fu_214_p3 = ((icmp_ln33_fu_194_p2[0:0] == 1'b1) ? add_ln32_1_fu_208_p2 : ap_sig_allocacmp_k_load);

assign select_ln32_3_fu_293_p3 = ((icmp_ln33_reg_439_pp0_iter4_reg[0:0] == 1'b1) ? invalid_21_out_i : invalid_reg_131);

assign select_ln32_fu_200_p3 = ((icmp_ln33_fu_194_p2[0:0] == 1'b1) ? 7'd0 : ap_sig_allocacmp_i_3_load);

assign sext_ln35_2_fu_303_p1 = $signed(prod_reg_480);

assign sext_ln37_fu_373_p1 = $signed(add_ln37_fu_367_p2);

assign tmp_fu_322_p4 = {{acc_1_fu_306_p2[81:77]}};

assign trunc_ln37_1_fu_312_p4 = {{acc_1_fu_306_p2[81:30]}};

assign x_fu_264_p2 = (raw_q0 - conv3_i12_i3167);

assign zext_ln32_fu_300_p1 = select_ln32_2_reg_451_pp0_iter4_reg;

assign zext_ln33_fu_256_p1 = select_ln32_reg_445_pp0_iter2_reg;

assign zext_ln35_fu_260_p1 = grp_fu_393_p3;

assign zext_ln37_fu_377_p1 = $unsigned(sext_ln37_fu_373_p1);

endmodule                                                                     
