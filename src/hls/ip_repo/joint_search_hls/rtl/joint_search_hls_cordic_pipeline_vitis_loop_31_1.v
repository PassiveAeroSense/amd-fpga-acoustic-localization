                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        z_1_ph_cast,
        yy_ph_cast,
        zext_ln31_1,
        z_1_out,
        z_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] z_1_ph_cast;
input  [32:0] yy_ph_cast;
input  [31:0] zext_ln31_1;
output  [31:0] z_1_out;
output   z_1_out_ap_vld;

reg ap_idle;
reg z_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln31_fu_133_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [4:0] r18_CORDIC_ATAN_address0;
wire   [28:0] r18_CORDIC_ATAN_q0;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln31_reg_305;
wire   [0:0] tmp_fu_156_p3;
reg   [0:0] tmp_reg_309;
wire   [63:0] zext_ln31_fu_151_p1;
wire    ap_block_pp0_stage0;
reg   [43:0] x_fu_44;
wire   [43:0] x_2_fu_210_p3;
wire   [43:0] zext_ln31_1_cast_fu_98_p1;
wire    ap_loop_init;
reg   [43:0] y_fu_48;
wire   [43:0] y_2_fu_218_p3;
wire  signed [43:0] yy_ph_cast_cast_fu_102_p1;
reg   [32:0] z_1_fu_52;
wire   [32:0] z_2_fu_265_p3;
wire  signed [32:0] z_1_ph_cast_cast_fu_106_p1;
reg   [4:0] i_fu_56;
wire   [4:0] add_ln31_fu_139_p2;
reg    ap_loop_exit_ready_pp0_iter2_reg;
wire    ap_block_pp0_stage0_01001;
reg    r18_CORDIC_ATAN_ce0_local;
wire   [43:0] zext_ln34_1_fu_164_p1;
wire   [43:0] shr_i42315_fu_174_p2;
wire   [43:0] ashr_ln34_fu_168_p2;
wire   [43:0] ashr_ln34_1_fu_192_p2;
wire   [43:0] x_4_fu_198_p2;
wire   [43:0] x_3_fu_180_p2;
wire   [43:0] y_4_fu_204_p2;
wire   [43:0] y_3_fu_186_p2;
wire   [32:0] zext_ln34_fu_249_p1;
wire   [32:0] z_4_fu_259_p2;
wire   [32:0] z_3_fu_253_p2;
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
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 x_fu_44 = 44'd0;
#0 y_fu_48 = 44'd0;
#0 z_1_fu_52 = 33'd0;
#0 i_fu_56 = 5'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R #(
    .DataWidth( 29 ),
    .AddressRange( 31 ),
    .AddressWidth( 5 ))
r18_CORDIC_ATAN_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_CORDIC_ATAN_address0),
    .ce0(r18_CORDIC_ATAN_ce0_local),
    .q0(r18_CORDIC_ATAN_q0)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_loop_exit_ready == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_56 <= 5'd0;
        end else if (((icmp_ln31_fu_133_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_56 <= add_ln31_fu_139_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            x_fu_44 <= zext_ln31_1_cast_fu_98_p1;
        end else if (((icmp_ln31_fu_133_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            x_fu_44 <= x_2_fu_210_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            y_fu_48 <= yy_ph_cast_cast_fu_102_p1;
        end else if (((icmp_ln31_fu_133_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            y_fu_48 <= y_2_fu_218_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            z_1_fu_52 <= z_1_ph_cast_cast_fu_106_p1;
        end else if (((icmp_ln31_reg_305 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            z_1_fu_52 <= z_2_fu_265_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln31_reg_305 <= icmp_ln31_fu_133_p2;
        tmp_reg_309 <= y_fu_48[32'd43];
    end
end

always @ (*) begin
    if (((icmp_ln31_fu_133_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_CORDIC_ATAN_ce0_local = 1'b1;
    end else begin
        r18_CORDIC_ATAN_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln31_reg_305 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
        z_1_out_ap_vld = 1'b1;
    end else begin
        z_1_out_ap_vld = 1'b0;
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

assign add_ln31_fu_139_p2 = (i_fu_56 + 5'd1);

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

assign ashr_ln34_1_fu_192_p2 = $signed(y_fu_48) >>> zext_ln34_1_fu_164_p1;

assign ashr_ln34_fu_168_p2 = $signed(x_fu_44) >>> zext_ln34_1_fu_164_p1;

assign icmp_ln31_fu_133_p2 = ((i_fu_56 == 5'd31) ? 1'b1 : 1'b0);

assign r18_CORDIC_ATAN_address0 = zext_ln31_fu_151_p1;

assign shr_i42315_fu_174_p2 = y_fu_48 >> zext_ln34_1_fu_164_p1;

assign tmp_fu_156_p3 = y_fu_48[32'd43];

assign x_2_fu_210_p3 = ((tmp_fu_156_p3[0:0] == 1'b1) ? x_4_fu_198_p2 : x_3_fu_180_p2);

assign x_3_fu_180_p2 = (x_fu_44 + shr_i42315_fu_174_p2);

assign x_4_fu_198_p2 = (x_fu_44 - ashr_ln34_1_fu_192_p2);

assign y_2_fu_218_p3 = ((tmp_fu_156_p3[0:0] == 1'b1) ? y_4_fu_204_p2 : y_3_fu_186_p2);

assign y_3_fu_186_p2 = (y_fu_48 - ashr_ln34_fu_168_p2);

assign y_4_fu_204_p2 = (ashr_ln34_fu_168_p2 + y_fu_48);

assign yy_ph_cast_cast_fu_102_p1 = $signed(yy_ph_cast);

assign z_1_out = z_1_fu_52[31:0];

assign z_1_ph_cast_cast_fu_106_p1 = $signed(z_1_ph_cast);

assign z_2_fu_265_p3 = ((tmp_reg_309[0:0] == 1'b1) ? z_4_fu_259_p2 : z_3_fu_253_p2);

assign z_3_fu_253_p2 = (z_1_fu_52 + zext_ln34_fu_249_p1);

assign z_4_fu_259_p2 = (z_1_fu_52 - zext_ln34_fu_249_p1);

assign zext_ln31_1_cast_fu_98_p1 = zext_ln31_1;

assign zext_ln31_fu_151_p1 = i_fu_56;

assign zext_ln34_1_fu_164_p1 = i_fu_56;

assign zext_ln34_fu_249_p1 = r18_CORDIC_ATAN_q0;

endmodule                                                   
