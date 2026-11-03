                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_isqrt (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        ap_return
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] x;
output  [31:0] ap_return;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_fu_80_p3;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [63:0] rem_02_fu_44;
wire   [63:0] rem_5_fu_193_p3;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [31:0] root_fu_48;
wire   [31:0] select_ln11_fu_185_p3;
reg   [5:0] i_fu_52;
wire   [5:0] add_ln7_fu_201_p2;
wire   [5:0] shl_ln9_fu_98_p2;
wire   [63:0] zext_ln9_fu_104_p1;
wire   [63:0] lshr_ln9_fu_108_p2;
wire   [61:0] trunc_ln9_fu_94_p1;
wire   [1:0] trunc_ln9_1_fu_113_p1;
wire   [33:0] trial_fu_133_p3;
wire   [65:0] rem_fu_125_p3;
wire   [65:0] zext_ln10_fu_141_p1;
wire   [0:0] icmp_ln11_fu_159_p2;
wire   [63:0] or_ln9_fu_117_p3;
wire   [63:0] zext_ln10_1_fu_145_p1;
wire   [30:0] trunc_ln11_fu_149_p1;
wire   [0:0] xor_ln11_fu_165_p2;
wire   [31:0] or_ln_fu_177_p3;
wire   [31:0] shl_ln11_fu_153_p2;
wire   [63:0] rem_4_fu_171_p2;
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
#0 rem_02_fu_44 = 64'd0;
#0 root_fu_48 = 32'd0;
#0 i_fu_52 = 6'd0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_52 <= 6'd31;
        end else if (((tmp_fu_80_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_52 <= add_ln7_fu_201_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            rem_02_fu_44 <= 64'd0;
        end else if (((tmp_fu_80_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            rem_02_fu_44 <= rem_5_fu_193_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            root_fu_48 <= 32'd0;
        end else if (((tmp_fu_80_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            root_fu_48 <= select_ln11_fu_185_p3;
        end
    end
end

always @ (*) begin
    if (((tmp_fu_80_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
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
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln7_fu_201_p2 = ($signed(i_fu_52) + $signed(6'd63));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_ready = ap_ready_sig;

assign ap_return = root_fu_48;

assign icmp_ln11_fu_159_p2 = ((rem_fu_125_p3 < zext_ln10_fu_141_p1) ? 1'b1 : 1'b0);

assign lshr_ln9_fu_108_p2 = x >> zext_ln9_fu_104_p1;

assign or_ln9_fu_117_p3 = {{trunc_ln9_fu_94_p1}, {trunc_ln9_1_fu_113_p1}};

assign or_ln_fu_177_p3 = {{trunc_ln11_fu_149_p1}, {1'd1}};

assign rem_4_fu_171_p2 = (or_ln9_fu_117_p3 - zext_ln10_1_fu_145_p1);

assign rem_5_fu_193_p3 = ((xor_ln11_fu_165_p2[0:0] == 1'b1) ? rem_4_fu_171_p2 : or_ln9_fu_117_p3);

assign rem_fu_125_p3 = {{rem_02_fu_44}, {trunc_ln9_1_fu_113_p1}};

assign select_ln11_fu_185_p3 = ((xor_ln11_fu_165_p2[0:0] == 1'b1) ? or_ln_fu_177_p3 : shl_ln11_fu_153_p2);

assign shl_ln11_fu_153_p2 = root_fu_48 << 32'd1;

assign shl_ln9_fu_98_p2 = i_fu_52 << 6'd1;

assign tmp_fu_80_p3 = i_fu_52[32'd5];

assign trial_fu_133_p3 = {{root_fu_48}, {2'd1}};

assign trunc_ln11_fu_149_p1 = root_fu_48[30:0];

assign trunc_ln9_1_fu_113_p1 = lshr_ln9_fu_108_p2[1:0];

assign trunc_ln9_fu_94_p1 = rem_02_fu_44[61:0];

assign xor_ln11_fu_165_p2 = (icmp_ln11_fu_159_p2 ^ 1'd1);

assign zext_ln10_1_fu_145_p1 = trial_fu_133_p3;

assign zext_ln10_fu_141_p1 = trial_fu_133_p3;

assign zext_ln9_fu_104_p1 = shl_ln9_fu_98_p2;

endmodule                         
