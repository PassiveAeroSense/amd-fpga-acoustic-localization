                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module detector_hls_detector_hls_Pipeline_VITIS_LOOP_22_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        raw_address0,
        raw_ce0,
        raw_we0,
        raw_d0,
        bands_address0,
        bands_ce0,
        bands_q0,
        features_address0,
        features_ce0,
        features_we0,
        features_d0,
        sum_out,
        sum_out_ap_vld
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
output   raw_we0;
output  [47:0] raw_d0;
output  [6:0] bands_address0;
output   bands_ce0;
input  [47:0] bands_q0;
output  [7:0] features_address0;
output   features_ce0;
output   features_we0;
output  [47:0] features_d0;
output  [54:0] sum_out;
output   sum_out_ap_vld;

reg ap_idle;
reg sum_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln22_fu_119_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln22_fu_131_p1;
reg   [63:0] zext_ln22_reg_181;
wire    ap_block_pp0_stage0_11001;
wire    ap_block_pp0_stage0;
reg   [54:0] sum_fu_50;
wire   [54:0] sum_1_fu_148_p2;
wire    ap_loop_init;
reg   [6:0] i_fu_54;
wire   [6:0] add_ln22_fu_125_p2;
reg   [6:0] ap_sig_allocacmp_i_4;
wire    ap_block_pp0_stage0_01001;
reg    bands_ce0_local;
reg    raw_we0_local;
reg    raw_ce0_local;
reg    features_we0_local;
reg    features_ce0_local;
wire  signed [47:0] sext_ln24_fu_144_p0;
wire  signed [54:0] sext_ln24_fu_144_p1;
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
#0 sum_fu_50 = 55'd0;
#0 i_fu_54 = 7'd0;
#0 ap_done_reg = 1'b0;
end

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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln22_fu_119_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_54 <= add_ln22_fu_125_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_54 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            sum_fu_50 <= 55'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            sum_fu_50 <= sum_1_fu_148_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        zext_ln22_reg_181[6 : 0] <= zext_ln22_fu_131_p1[6 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_119_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_4 = 7'd0;
    end else begin
        ap_sig_allocacmp_i_4 = i_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        bands_ce0_local = 1'b1;
    end else begin
        bands_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        features_ce0_local = 1'b1;
    end else begin
        features_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        features_we0_local = 1'b1;
    end else begin
        features_we0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        raw_ce0_local = 1'b1;
    end else begin
        raw_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        raw_we0_local = 1'b1;
    end else begin
        raw_we0_local = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln22_fu_119_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sum_out_ap_vld = 1'b1;
    end else begin
        sum_out_ap_vld = 1'b0;
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

assign add_ln22_fu_125_p2 = (ap_sig_allocacmp_i_4 + 7'd1);

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

assign bands_address0 = zext_ln22_fu_131_p1;

assign bands_ce0 = bands_ce0_local;

assign features_address0 = zext_ln22_reg_181;

assign features_ce0 = features_ce0_local;

assign features_d0 = bands_q0;

assign features_we0 = features_we0_local;

assign icmp_ln22_fu_119_p2 = ((ap_sig_allocacmp_i_4 == 7'd97) ? 1'b1 : 1'b0);

assign raw_address0 = zext_ln22_reg_181;

assign raw_ce0 = raw_ce0_local;

assign raw_d0 = bands_q0;

assign raw_we0 = raw_we0_local;

assign sext_ln24_fu_144_p0 = bands_q0;

assign sext_ln24_fu_144_p1 = sext_ln24_fu_144_p0;

assign sum_1_fu_148_p2 = ($signed(sext_ln24_fu_144_p1) + $signed(sum_fu_50));

assign sum_out = sum_fu_50;

assign zext_ln22_fu_131_p1 = ap_sig_allocacmp_i_4;

always @ (posedge ap_clk) begin
    zext_ln22_reg_181[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
end

endmodule                                                     
