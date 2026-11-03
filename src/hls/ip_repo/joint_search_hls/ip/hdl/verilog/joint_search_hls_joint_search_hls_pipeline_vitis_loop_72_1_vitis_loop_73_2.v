                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_72_1_VITIS_LOOP_73_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        covariance_address0,
        covariance_ce0,
        covariance_q0,
        trace_address0,
        trace_ce0,
        trace_we0,
        trace_d0,
        blocked_address0,
        blocked_ce0,
        blocked_we0,
        blocked_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [15:0] covariance_address0;
output   covariance_ce0;
input  [63:0] covariance_q0;
output  [8:0] trace_address0;
output   trace_ce0;
output   trace_we0;
output  [39:0] trace_d0;
output  [8:0] blocked_address0;
output   blocked_ce0;
output   blocked_we0;
output  [0:0] blocked_d0;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln72_fu_146_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln73_fu_164_p2;
reg   [0:0] icmp_ln73_reg_342;
reg   [0:0] icmp_ln73_reg_342_pp0_iter1_reg;
wire   [0:0] icmp_ln73_1_fu_245_p2;
reg   [0:0] icmp_ln73_1_reg_352;
reg   [0:0] icmp_ln73_1_reg_352_pp0_iter1_reg;
reg   [8:0] trace_addr_reg_356;
reg   [8:0] trace_addr_reg_356_pp0_iter1_reg;
wire   [63:0] zext_ln75_1_fu_234_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln72_fu_192_p1;
reg   [39:0] sum_fu_68;
wire   [39:0] sum_2_fu_296_p3;
wire    ap_loop_init;
reg   [4:0] c_fu_72;
wire   [4:0] add_ln73_fu_239_p2;
reg   [4:0] ap_sig_allocacmp_c_load;
reg   [8:0] f_fu_76;
wire   [8:0] select_ln72_2_fu_184_p3;
reg   [8:0] ap_sig_allocacmp_f_load;
reg   [12:0] indvar_flatten_fu_80;
wire   [12:0] add_ln72_fu_152_p2;
reg   [12:0] ap_sig_allocacmp_indvar_flatten_load;
reg    covariance_ce0_local;
reg    blocked_we0_local;
reg    blocked_ce0_local;
reg    trace_we0_local;
reg    trace_ce0_local;
wire   [8:0] add_ln72_1_fu_178_p2;
wire   [11:0] tmp_fu_206_p3;
wire   [15:0] p_shl_fu_198_p3;
wire   [15:0] zext_ln73_fu_214_p1;
wire   [4:0] select_ln72_fu_170_p3;
wire   [15:0] zext_ln73_1_fu_224_p1;
wire   [15:0] add_ln73_1_fu_218_p2;
wire   [15:0] add_ln75_fu_228_p2;
wire   [31:0] v_fu_276_p1;
wire   [39:0] select_ln72_1_fu_269_p3;
wire   [39:0] zext_ln75_fu_286_p1;
wire   [0:0] icmp_ln75_fu_280_p2;
wire   [39:0] sum_1_fu_290_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
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
#0 sum_fu_68 = 40'd0;
#0 c_fu_72 = 5'd0;
#0 f_fu_76 = 9'd0;
#0 indvar_flatten_fu_80 = 13'd0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln72_fu_146_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            c_fu_72 <= add_ln73_fu_239_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            c_fu_72 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln72_fu_146_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            f_fu_76 <= select_ln72_2_fu_184_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            f_fu_76 <= 9'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln72_fu_146_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten_fu_80 <= add_ln72_fu_152_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_80 <= 13'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            sum_fu_68 <= 40'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            sum_fu_68 <= sum_2_fu_296_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln73_1_reg_352 <= icmp_ln73_1_fu_245_p2;
        icmp_ln73_1_reg_352_pp0_iter1_reg <= icmp_ln73_1_reg_352;
        icmp_ln73_reg_342 <= icmp_ln73_fu_164_p2;
        icmp_ln73_reg_342_pp0_iter1_reg <= icmp_ln73_reg_342;
        trace_addr_reg_356 <= zext_ln72_fu_192_p1;
        trace_addr_reg_356_pp0_iter1_reg <= trace_addr_reg_356;
    end
end

always @ (*) begin
    if (((icmp_ln72_fu_146_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
        ap_sig_allocacmp_c_load = 5'd0;
    end else begin
        ap_sig_allocacmp_c_load = c_fu_72;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_f_load = 9'd0;
    end else begin
        ap_sig_allocacmp_f_load = f_fu_76;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_indvar_flatten_load = 13'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_80;
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
    if (((icmp_ln73_1_fu_245_p2 == 1'd1) & (icmp_ln72_fu_146_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        blocked_we0_local = 1'b1;
    end else begin
        blocked_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        covariance_ce0_local = 1'b1;
    end else begin
        covariance_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        trace_ce0_local = 1'b1;
    end else begin
        trace_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln73_1_reg_352_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        trace_we0_local = 1'b1;
    end else begin
        trace_we0_local = 1'b0;
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

assign add_ln72_1_fu_178_p2 = (ap_sig_allocacmp_f_load + 9'd1);

assign add_ln72_fu_152_p2 = (ap_sig_allocacmp_indvar_flatten_load + 13'd1);

assign add_ln73_1_fu_218_p2 = (p_shl_fu_198_p3 + zext_ln73_fu_214_p1);

assign add_ln73_fu_239_p2 = (select_ln72_fu_170_p3 + 5'd1);

assign add_ln75_fu_228_p2 = (zext_ln73_1_fu_224_p1 + add_ln73_1_fu_218_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_ready = ap_ready_sig;

assign blocked_address0 = zext_ln72_fu_192_p1;

assign blocked_ce0 = blocked_ce0_local;

assign blocked_d0 = 1'd0;

assign blocked_we0 = blocked_we0_local;

assign covariance_address0 = zext_ln75_1_fu_234_p1;

assign covariance_ce0 = covariance_ce0_local;

assign icmp_ln72_fu_146_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 13'd4256) ? 1'b1 : 1'b0);

assign icmp_ln73_1_fu_245_p2 = ((add_ln73_fu_239_p2 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln73_fu_164_p2 = ((ap_sig_allocacmp_c_load == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln75_fu_280_p2 = (($signed(v_fu_276_p1) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign p_shl_fu_198_p3 = {{select_ln72_2_fu_184_p3}, {7'd0}};

assign select_ln72_1_fu_269_p3 = ((icmp_ln73_reg_342_pp0_iter1_reg[0:0] == 1'b1) ? 40'd0 : sum_fu_68);

assign select_ln72_2_fu_184_p3 = ((icmp_ln73_fu_164_p2[0:0] == 1'b1) ? add_ln72_1_fu_178_p2 : ap_sig_allocacmp_f_load);

assign select_ln72_fu_170_p3 = ((icmp_ln73_fu_164_p2[0:0] == 1'b1) ? 5'd0 : ap_sig_allocacmp_c_load);

assign sum_1_fu_290_p2 = (select_ln72_1_fu_269_p3 + zext_ln75_fu_286_p1);

assign sum_2_fu_296_p3 = ((icmp_ln75_fu_280_p2[0:0] == 1'b1) ? sum_1_fu_290_p2 : select_ln72_1_fu_269_p3);

assign tmp_fu_206_p3 = {{select_ln72_2_fu_184_p3}, {3'd0}};

assign trace_address0 = trace_addr_reg_356_pp0_iter1_reg;

assign trace_ce0 = trace_ce0_local;

assign trace_d0 = sum_2_fu_296_p3;

assign trace_we0 = trace_we0_local;

assign v_fu_276_p1 = covariance_q0[31:0];

assign zext_ln72_fu_192_p1 = select_ln72_2_fu_184_p3;

assign zext_ln73_1_fu_224_p1 = select_ln72_fu_170_p3;

assign zext_ln73_fu_214_p1 = tmp_fu_206_p3;

assign zext_ln75_1_fu_234_p1 = add_ln75_fu_228_p2;

assign zext_ln75_fu_286_p1 = v_fu_276_p1;

endmodule                                                                             
