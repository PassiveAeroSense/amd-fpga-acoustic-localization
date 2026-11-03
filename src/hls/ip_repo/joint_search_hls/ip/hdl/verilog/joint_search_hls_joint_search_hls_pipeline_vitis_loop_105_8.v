                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_105_8 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mask,
        frequencies_out,
        frequencies_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [11:0] mask;
output  [3:0] frequencies_out;
output   frequencies_out_ap_vld;

reg ap_idle;
reg frequencies_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln105_fu_68_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [3:0] i_fu_34;
wire   [3:0] i_5_fu_74_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_i_4;
reg   [3:0] frequencies_fu_38;
wire   [3:0] frequencies_1_fu_99_p2;
reg   [3:0] ap_sig_allocacmp_frequencies_load;
wire   [31:0] tmp_fu_87_p2;
wire   [0:0] tmp_fu_87_p3;
wire   [3:0] zext_ln105_1_fu_95_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire   [0:0] tmp_fu_87_p0;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 i_fu_34 = 4'd0;
#0 frequencies_fu_38 = 4'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1 #(
    .DATAWIDTH( 12 ),
    .ADDRWIDTH( 32 ))
bitselect_1ns_12ns_32ns_1_1_1_U35(
    .din(mask),
    .sel(tmp_fu_87_p2),
    .dout(tmp_fu_87_p3)
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
        if ((icmp_ln105_fu_68_p2 == 1'd0)) begin
            frequencies_fu_38 <= frequencies_1_fu_99_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            frequencies_fu_38 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln105_fu_68_p2 == 1'd0)) begin
            i_fu_34 <= i_5_fu_74_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_34 <= 4'd0;
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
    if (((icmp_ln105_fu_68_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
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
        ap_sig_allocacmp_frequencies_load = 4'd0;
    end else begin
        ap_sig_allocacmp_frequencies_load = frequencies_fu_38;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_4 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_4 = i_fu_34;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln105_fu_68_p2 == 1'd1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        frequencies_out_ap_vld = 1'b1;
    end else begin
        frequencies_out_ap_vld = 1'b0;
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

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign frequencies_1_fu_99_p2 = (zext_ln105_1_fu_95_p1 + ap_sig_allocacmp_frequencies_load);

assign frequencies_out = frequencies_fu_38;

assign i_5_fu_74_p2 = (ap_sig_allocacmp_i_4 + 4'd1);

assign icmp_ln105_fu_68_p2 = ((ap_sig_allocacmp_i_4 == 4'd12) ? 1'b1 : 1'b0);

assign tmp_fu_87_p2 = ap_sig_allocacmp_i_4;

assign zext_ln105_1_fu_95_p1 = tmp_fu_87_p3;

endmodule                                                              
