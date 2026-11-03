                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        blocked_address0,
        blocked_ce0,
        blocked_q0,
        weights_address0,
        weights_ce0,
        weights_q0,
        bf_out,
        bf_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [8:0] blocked_address0;
output   blocked_ce0;
input  [0:0] blocked_q0;
output  [8:0] weights_address0;
output   weights_ce0;
input  [19:0] weights_q0;
output  [31:0] bf_out;
output   bf_out_ap_vld;

reg ap_idle;
reg bf_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln84_fu_95_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [8:0] f_1_reg_205;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln84_fu_107_p1;
wire    ap_block_pp0_stage0;
reg   [31:0] best_fu_32;
wire   [31:0] best_1_fu_153_p3;
wire    ap_loop_init;
reg   [31:0] bf_fu_36;
wire   [31:0] bf_1_fu_161_p3;
reg   [8:0] f_fu_40;
wire   [8:0] add_ln84_fu_101_p2;
reg   [8:0] ap_sig_allocacmp_f_1;
wire    ap_block_pp0_stage0_01001;
reg    blocked_ce0_local;
reg    weights_ce0_local;
wire   [31:0] zext_ln86_fu_124_p1;
wire   [0:0] icmp_ln86_fu_128_p2;
wire   [31:0] zext_ln86_1_fu_142_p1;
wire   [31:0] select_ln86_fu_134_p3;
wire   [31:0] select_ln86_1_fu_145_p3;
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
#0 best_fu_32 = 32'd0;
#0 bf_fu_36 = 32'd0;
#0 f_fu_40 = 9'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        if ((ap_loop_init == 1'b1)) begin
            best_fu_32 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            best_fu_32 <= best_1_fu_153_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            bf_fu_36 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            bf_fu_36 <= bf_1_fu_161_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln84_fu_95_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            f_fu_40 <= add_ln84_fu_101_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            f_fu_40 <= 9'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        f_1_reg_205 <= ap_sig_allocacmp_f_1;
    end
end

always @ (*) begin
    if (((icmp_ln84_fu_95_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        ap_sig_allocacmp_f_1 = 9'd0;
    end else begin
        ap_sig_allocacmp_f_1 = f_fu_40;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln84_fu_95_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        bf_out_ap_vld = 1'b1;
    end else begin
        bf_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        blocked_ce0_local = 1'b1;
    end else begin
        blocked_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weights_ce0_local = 1'b1;
    end else begin
        weights_ce0_local = 1'b0;
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

assign add_ln84_fu_101_p2 = (ap_sig_allocacmp_f_1 + 9'd1);

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

assign best_1_fu_153_p3 = ((blocked_q0[0:0] == 1'b1) ? best_fu_32 : select_ln86_fu_134_p3);

assign bf_1_fu_161_p3 = ((blocked_q0[0:0] == 1'b1) ? bf_fu_36 : select_ln86_1_fu_145_p3);

assign bf_out = bf_fu_36;

assign blocked_address0 = zext_ln84_fu_107_p1;

assign blocked_ce0 = blocked_ce0_local;

assign icmp_ln84_fu_95_p2 = ((ap_sig_allocacmp_f_1 == 9'd266) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_128_p2 = ((zext_ln86_fu_124_p1 > best_fu_32) ? 1'b1 : 1'b0);

assign select_ln86_1_fu_145_p3 = ((icmp_ln86_fu_128_p2[0:0] == 1'b1) ? zext_ln86_1_fu_142_p1 : bf_fu_36);

assign select_ln86_fu_134_p3 = ((icmp_ln86_fu_128_p2[0:0] == 1'b1) ? zext_ln86_fu_124_p1 : best_fu_32);

assign weights_address0 = zext_ln84_fu_107_p1;

assign weights_ce0 = weights_ce0_local;

assign zext_ln84_fu_107_p1 = ap_sig_allocacmp_f_1;

assign zext_ln86_1_fu_142_p1 = f_1_reg_205;

assign zext_ln86_fu_124_p1 = weights_q0;

endmodule                                                             
