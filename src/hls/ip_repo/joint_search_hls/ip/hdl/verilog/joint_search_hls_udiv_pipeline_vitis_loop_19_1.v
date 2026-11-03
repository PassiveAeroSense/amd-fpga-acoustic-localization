                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_udiv_Pipeline_VITIS_LOOP_19_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zext_ln16,
        conv_i4_cast_cast,
        conv_i4_cast,
        q_out,
        q_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [55:0] zext_ln16;
input  [41:0] conv_i4_cast_cast;
input  [41:0] conv_i4_cast;
output  [63:0] q_out;
output   q_out_ap_vld;

reg ap_idle;
reg q_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_fu_121_p3;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire  signed [63:0] conv_i4_cast_cast1_fu_87_p1;
reg  signed [63:0] conv_i4_cast_cast1_reg_249;
wire    ap_block_pp0_stage0_11001;
wire   [64:0] conv_i4_cast_cast_cast_cast_fu_95_p1;
reg   [64:0] conv_i4_cast_cast_cast_cast_reg_254;
wire   [63:0] zext_ln16_cast_fu_99_p1;
reg   [63:0] zext_ln16_cast_reg_259;
reg   [63:0] rem_fu_50;
wire   [63:0] rem_1_fu_186_p3;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [63:0] q_fu_54;
wire   [63:0] q_1_fu_194_p3;
reg   [6:0] i_fu_58;
wire   [6:0] i_3_fu_202_p2;
wire    ap_block_pp0_stage0_01001;
wire  signed [63:0] conv_i4_cast_cast_cast_fu_91_p1;
wire   [31:0] zext_ln19_fu_135_p1;
wire   [0:0] tmp_1_fu_139_p3;
wire   [62:0] trunc_ln21_fu_146_p1;
wire   [64:0] rem_2_fu_150_p3;
wire   [63:0] rem_2_cast4_fu_158_p3;
wire   [0:0] icmp_ln21_fu_166_p2;
wire   [63:0] rem_3_fu_171_p2;
wire   [63:0] q_2_fu_176_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire   [0:0] tmp_1_fu_139_p0;
wire   [63:0] q_2_fu_176_p0;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 rem_fu_50 = 64'd0;
#0 q_fu_54 = 64'd0;
#0 i_fu_58 = 7'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_bitselect_1ns_64ns_32ns_1_1_1 #(
    .DATAWIDTH( 64 ),
    .ADDRWIDTH( 32 ))
bitselect_1ns_64ns_32ns_1_1_1_U10(
    .din(zext_ln16_cast_reg_259),
    .sel(zext_ln19_fu_135_p1),
    .dout(tmp_1_fu_139_p3)
);

joint_search_hls_bitset_64ns_64ns_32ns_1s_64_1_1 #(
    .DATAWIDTH( 64 ),
    .ADDRWIDTH( 32 ))
bitset_64ns_64ns_32ns_1s_64_1_1_U11(
    .din(q_fu_54),
    .sel(zext_ln19_fu_135_p1),
    .value(1'd1),
    .dout(q_2_fu_176_p4)
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
            i_fu_58 <= 7'd63;
        end else if (((tmp_fu_121_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_58 <= i_3_fu_202_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            q_fu_54 <= 64'd0;
        end else if (((tmp_fu_121_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            q_fu_54 <= q_1_fu_194_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            rem_fu_50 <= 64'd0;
        end else if (((tmp_fu_121_p3 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            rem_fu_50 <= rem_1_fu_186_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        conv_i4_cast_cast1_reg_249 <= conv_i4_cast_cast1_fu_87_p1;
        conv_i4_cast_cast_cast_cast_reg_254[63 : 0] <= conv_i4_cast_cast_cast_cast_fu_95_p1[63 : 0];
        zext_ln16_cast_reg_259[55 : 0] <= zext_ln16_cast_fu_99_p1[55 : 0];
    end
end

always @ (*) begin
    if (((tmp_fu_121_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_loop_exit_ready == 1'b1) & (tmp_fu_121_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        q_out_ap_vld = 1'b1;
    end else begin
        q_out_ap_vld = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_ready = ap_ready_sig;

assign conv_i4_cast_cast1_fu_87_p1 = $signed(conv_i4_cast);

assign conv_i4_cast_cast_cast_cast_fu_95_p1 = $unsigned(conv_i4_cast_cast_cast_fu_91_p1);

assign conv_i4_cast_cast_cast_fu_91_p1 = $signed(conv_i4_cast_cast);

assign i_3_fu_202_p2 = ($signed(i_fu_58) + $signed(7'd127));

assign icmp_ln21_fu_166_p2 = ((rem_2_fu_150_p3 < conv_i4_cast_cast_cast_cast_reg_254) ? 1'b1 : 1'b0);

assign q_1_fu_194_p3 = ((icmp_ln21_fu_166_p2[0:0] == 1'b1) ? q_fu_54 : q_2_fu_176_p4);

assign q_out = q_fu_54;

assign rem_1_fu_186_p3 = ((icmp_ln21_fu_166_p2[0:0] == 1'b1) ? rem_2_cast4_fu_158_p3 : rem_3_fu_171_p2);

assign rem_2_cast4_fu_158_p3 = {{trunc_ln21_fu_146_p1}, {tmp_1_fu_139_p3}};

assign rem_2_fu_150_p3 = {{rem_fu_50}, {tmp_1_fu_139_p3}};

assign rem_3_fu_171_p2 = ($signed(rem_2_cast4_fu_158_p3) - $signed(conv_i4_cast_cast1_reg_249));

assign tmp_fu_121_p3 = i_fu_58[32'd6];

assign trunc_ln21_fu_146_p1 = rem_fu_50[62:0];

assign zext_ln16_cast_fu_99_p1 = zext_ln16;

assign zext_ln19_fu_135_p1 = i_fu_58;

always @ (posedge ap_clk) begin
    conv_i4_cast_cast_cast_cast_reg_254[64] <= 1'b0;
    zext_ln16_cast_reg_259[63:56] <= 8'b00000000;
end

endmodule                                                 
