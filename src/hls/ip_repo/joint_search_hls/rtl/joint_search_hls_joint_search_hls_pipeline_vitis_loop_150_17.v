                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_150_17 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        empty_65,
        empty_66,
        empty,
        sg_load_2,
        sg_1_load_2,
        sg_2_load_2,
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
input  [63:0] empty_65;
input  [63:0] empty_66;
input  [63:0] empty;
input  [63:0] sg_load_2;
input  [63:0] sg_1_load_2;
input  [63:0] sg_2_load_2;
output  [63:0] p_out;
output   p_out_ap_vld;
output  [63:0] p_out1;
output   p_out1_ap_vld;
output  [63:0] p_out2;
output   p_out2_ap_vld;

reg ap_idle;
reg p_out_ap_vld;
reg p_out1_ap_vld;
reg p_out2_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln150_fu_148_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [1:0] t_fu_52;
wire   [1:0] add_ln150_fu_154_p2;
wire    ap_loop_init;
reg   [1:0] ap_sig_allocacmp_t_2;
wire   [1:0] t_2_load_fu_145_p1;
reg   [63:0] empty_72_fu_56;
wire   [63:0] bg_fu_160_p9;
reg   [63:0] empty_73_fu_60;
reg   [63:0] empty_74_fu_64;
wire   [63:0] bg_fu_160_p7;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
reg    ap_condition_83;
wire   [1:0] bg_fu_160_p1;
wire   [1:0] bg_fu_160_p3;
wire  signed [1:0] bg_fu_160_p5;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 t_fu_52 = 2'd0;
#0 empty_72_fu_56 = 64'd0;
#0 empty_73_fu_60 = 64'd0;
#0 empty_74_fu_64 = 64'd0;
#0 ap_done_reg = 1'b0;
end

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 64 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 64 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 64 ),
    .def_WIDTH( 64 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 64 ))
sparsemux_7_2_64_1_1_U170(
    .din0(sg_load_2),
    .din1(sg_1_load_2),
    .din2(sg_2_load_2),
    .def(bg_fu_160_p7),
    .sel(ap_sig_allocacmp_t_2),
    .dout(bg_fu_160_p9)
);

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
        if (((t_2_load_fu_145_p1 == 2'd0) & (icmp_ln150_fu_148_p2 == 1'd0))) begin
            empty_72_fu_56 <= bg_fu_160_p9;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_72_fu_56 <= empty;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if (((t_2_load_fu_145_p1 == 2'd1) & (icmp_ln150_fu_148_p2 == 1'd0))) begin
            empty_73_fu_60 <= bg_fu_160_p9;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_73_fu_60 <= empty_66;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((1'b1 == ap_condition_83)) begin
            empty_74_fu_64 <= bg_fu_160_p9;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_74_fu_64 <= empty_65;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln150_fu_148_p2 == 1'd0)) begin
            t_fu_52 <= add_ln150_fu_154_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            t_fu_52 <= 2'd0;
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
    if (((icmp_ln150_fu_148_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
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
        ap_sig_allocacmp_t_2 = 2'd0;
    end else begin
        ap_sig_allocacmp_t_2 = t_fu_52;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln150_fu_148_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        p_out1_ap_vld = 1'b1;
    end else begin
        p_out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln150_fu_148_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        p_out2_ap_vld = 1'b1;
    end else begin
        p_out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln150_fu_148_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign add_ln150_fu_154_p2 = (ap_sig_allocacmp_t_2 + 2'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

always @ (*) begin
    ap_condition_83 = (~(t_2_load_fu_145_p1 == 2'd1) & ~(t_2_load_fu_145_p1 == 2'd0) & (icmp_ln150_fu_148_p2 == 1'd0));
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign bg_fu_160_p7 = 'bx;

assign icmp_ln150_fu_148_p2 = ((ap_sig_allocacmp_t_2 == 2'd3) ? 1'b1 : 1'b0);

assign p_out = empty_74_fu_64;

assign p_out1 = empty_73_fu_60;

assign p_out2 = empty_72_fu_56;

assign t_2_load_fu_145_p1 = ap_sig_allocacmp_t_2;

endmodule                                                               
