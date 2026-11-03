                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        groups_2_out,
        groups_2_out_ap_vld,
        groups_1_out,
        groups_1_out_ap_vld,
        groups_out,
        groups_out_ap_vld,
        p_out,
        p_out_ap_vld,
        p_out1,
        p_out1_ap_vld,
        p_out2,
        p_out2_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] groups_2_out;
output   groups_2_out_ap_vld;
output  [31:0] groups_1_out;
output   groups_1_out_ap_vld;
output  [31:0] groups_out;
output   groups_out_ap_vld;
output  [31:0] p_out;
output   p_out_ap_vld;
output  [31:0] p_out1;
output   p_out1_ap_vld;
output  [31:0] p_out2;
output   p_out2_ap_vld;

reg ap_idle;
reg[31:0] groups_2_out;
reg groups_2_out_ap_vld;
reg[31:0] groups_1_out;
reg groups_1_out_ap_vld;
reg[31:0] groups_out;
reg groups_out_ap_vld;
reg[31:0] p_out;
reg p_out_ap_vld;
reg[31:0] p_out1;
reg p_out1_ap_vld;
reg[31:0] p_out2;
reg p_out2_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] exitcond25446_fu_82_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_loop_init;
wire   [1:0] p_load5_load_fu_79_p1;
reg   [1:0] empty_fu_34;
wire   [1:0] empty_78_fu_88_p2;
reg   [1:0] ap_sig_allocacmp_p_load5;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
reg    ap_condition_60;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 empty_fu_34 = 2'd0;
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((exitcond25446_fu_82_p2 == 1'd0)) begin
            empty_fu_34 <= empty_78_fu_88_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_fu_34 <= 2'd0;
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1_pp0_stage0_iter0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond25446_fu_82_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_p_load5 = 2'd0;
    end else begin
        ap_sig_allocacmp_p_load5 = empty_fu_34;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((p_load5_load_fu_79_p1 == 2'd1) & (exitcond25446_fu_82_p2 == 1'd0))) begin
            groups_1_out = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            groups_1_out = 'bx;
        end else begin
            groups_1_out = 'bx;
        end
    end else begin
        groups_1_out = 'bx;
    end
end

always @ (*) begin
    if ((((p_load5_load_fu_79_p1 == 2'd1) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        groups_1_out_ap_vld = 1'b1;
    end else begin
        groups_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((1'b1 == ap_condition_60)) begin
            groups_2_out = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            groups_2_out = 'bx;
        end else begin
            groups_2_out = 'bx;
        end
    end else begin
        groups_2_out = 'bx;
    end
end

always @ (*) begin
    if (((~(p_load5_load_fu_79_p1 == 2'd1) & ~(p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        groups_2_out_ap_vld = 1'b1;
    end else begin
        groups_2_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0))) begin
            groups_out = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            groups_out = 'bx;
        end else begin
            groups_out = 'bx;
        end
    end else begin
        groups_out = 'bx;
    end
end

always @ (*) begin
    if ((((p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        groups_out_ap_vld = 1'b1;
    end else begin
        groups_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((1'b1 == ap_condition_60)) begin
            p_out = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            p_out = 'bx;
        end else begin
            p_out = 'bx;
        end
    end else begin
        p_out = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((p_load5_load_fu_79_p1 == 2'd1) & (exitcond25446_fu_82_p2 == 1'd0))) begin
            p_out1 = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            p_out1 = 'bx;
        end else begin
            p_out1 = 'bx;
        end
    end else begin
        p_out1 = 'bx;
    end
end

always @ (*) begin
    if ((((p_load5_load_fu_79_p1 == 2'd1) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_out1_ap_vld = 1'b1;
    end else begin
        p_out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if (((p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0))) begin
            p_out2 = 32'd0;
        end else if ((ap_loop_init == 1'b1)) begin
            p_out2 = 'bx;
        end else begin
            p_out2 = 'bx;
        end
    end else begin
        p_out2 = 'bx;
    end
end

always @ (*) begin
    if ((((p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_out2_ap_vld = 1'b1;
    end else begin
        p_out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((~(p_load5_load_fu_79_p1 == 2'd1) & ~(p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)) | ((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1)))) begin
        p_out_ap_vld = 1'b1;
    end else begin
        p_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

always @ (*) begin
    ap_condition_60 = (~(p_load5_load_fu_79_p1 == 2'd1) & ~(p_load5_load_fu_79_p1 == 2'd0) & (exitcond25446_fu_82_p2 == 1'd0));
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign empty_78_fu_88_p2 = (ap_sig_allocacmp_p_load5 + 2'd1);

assign exitcond25446_fu_82_p2 = ((ap_sig_allocacmp_p_load5 == 2'd3) ? 1'b1 : 1'b0);

assign p_load5_load_fu_79_p1 = ap_sig_allocacmp_p_load5;

endmodule                                               
