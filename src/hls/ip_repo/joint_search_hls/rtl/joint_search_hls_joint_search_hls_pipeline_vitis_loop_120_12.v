                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_120_12 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        seeds_x,
        seeds_x_1,
        seeds_x_2,
        sext_ln116,
        seeds_y,
        seeds_y_1,
        seeds_y_2,
        sext_ln116_1,
        seeds_z,
        seeds_z_1,
        seeds_z_2,
        sext_ln116_2,
        seeds_score,
        seeds_score_1,
        seeds_score_2,
        near_out,
        near_out_ap_vld,
        worst_out,
        worst_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] seeds_x;
input  [31:0] seeds_x_1;
input  [31:0] seeds_x_2;
input  [15:0] sext_ln116;
input  [31:0] seeds_y;
input  [31:0] seeds_y_1;
input  [31:0] seeds_y_2;
input  [15:0] sext_ln116_1;
input  [31:0] seeds_z;
input  [31:0] seeds_z_1;
input  [31:0] seeds_z_2;
input  [15:0] sext_ln116_2;
input  [31:0] seeds_score;
input  [31:0] seeds_score_1;
input  [31:0] seeds_score_2;
output  [31:0] near_out;
output   near_out_ap_vld;
output  [31:0] worst_out;
output   worst_out_ap_vld;

reg ap_idle;
reg near_out_ap_vld;
reg worst_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln120_fu_232_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire  signed [31:0] sext_ln116_2_cast_fu_202_p1;
reg  signed [31:0] sext_ln116_2_cast_reg_532;
wire  signed [31:0] sext_ln116_1_cast_fu_206_p1;
reg  signed [31:0] sext_ln116_1_cast_reg_537;
wire  signed [31:0] sext_ln116_cast_fu_210_p1;
reg  signed [31:0] sext_ln116_cast_reg_542;
wire   [63:0] mul_ln122_fu_190_p2;
reg   [63:0] mul_ln122_reg_550;
wire   [63:0] mul_ln122_1_fu_194_p2;
reg   [63:0] mul_ln122_1_reg_555;
wire   [63:0] mul_ln122_2_fu_198_p2;
reg   [63:0] mul_ln122_2_reg_560;
wire   [0:0] icmp_ln123_fu_352_p2;
reg   [0:0] icmp_ln123_reg_565;
wire   [31:0] zext_ln123_fu_358_p1;
reg   [31:0] zext_ln123_reg_570;
reg   [31:0] worst_fu_74;
wire   [31:0] worst_1_fu_385_p3;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [31:0] near_fu_78;
wire   [31:0] near_4_fu_426_p3;
reg   [1:0] near_1_fu_82;
wire   [1:0] add_ln120_fu_238_p2;
wire    ap_block_pp0_stage0_01001;
wire  signed [31:0] mul_ln122_fu_190_p0;
wire  signed [63:0] sext_ln122_fu_317_p1;
wire  signed [31:0] mul_ln122_fu_190_p1;
wire  signed [31:0] mul_ln122_1_fu_194_p0;
wire  signed [63:0] sext_ln122_1_fu_323_p1;
wire  signed [31:0] mul_ln122_1_fu_194_p1;
wire  signed [31:0] mul_ln122_2_fu_198_p0;
wire  signed [63:0] sext_ln122_2_fu_329_p1;
wire  signed [31:0] mul_ln122_2_fu_198_p1;
wire   [31:0] tmp_5_fu_251_p7;
wire   [31:0] tmp_5_fu_251_p9;
wire   [31:0] tmp_6_fu_273_p7;
wire   [31:0] tmp_6_fu_273_p9;
wire   [31:0] tmp_7_fu_295_p7;
wire   [31:0] tmp_7_fu_295_p9;
wire   [31:0] dx_fu_268_p2;
wire   [31:0] dy_fu_290_p2;
wire   [31:0] dz_fu_312_p2;
wire   [31:0] tmp_1_fu_335_p7;
wire   [31:0] tmp_1_fu_335_p9;
wire   [31:0] tmp_3_fu_362_p7;
wire   [1:0] tmp_3_fu_362_p8;
wire   [31:0] tmp_3_fu_362_p9;
wire   [0:0] icmp_ln124_fu_379_p2;
wire   [63:0] add_ln122_fu_406_p2;
wire   [63:0] dd_fu_410_p2;
wire   [0:0] icmp_ln123_1_fu_415_p2;
wire   [0:0] and_ln123_fu_421_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire   [1:0] tmp_5_fu_251_p1;
wire   [1:0] tmp_5_fu_251_p3;
wire  signed [1:0] tmp_5_fu_251_p5;
wire   [1:0] tmp_6_fu_273_p1;
wire   [1:0] tmp_6_fu_273_p3;
wire  signed [1:0] tmp_6_fu_273_p5;
wire   [1:0] tmp_7_fu_295_p1;
wire   [1:0] tmp_7_fu_295_p3;
wire  signed [1:0] tmp_7_fu_295_p5;
wire   [1:0] tmp_1_fu_335_p1;
wire   [1:0] tmp_1_fu_335_p3;
wire  signed [1:0] tmp_1_fu_335_p5;
wire   [1:0] tmp_3_fu_362_p1;
wire   [1:0] tmp_3_fu_362_p3;
wire  signed [1:0] tmp_3_fu_362_p5;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 worst_fu_74 = 32'd0;
#0 near_fu_78 = 32'd0;
#0 near_1_fu_82 = 2'd0;
#0 ap_done_reg = 1'b0;
end

joint_search_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U132(
    .din0(mul_ln122_fu_190_p0),
    .din1(mul_ln122_fu_190_p1),
    .dout(mul_ln122_fu_190_p2)
);

joint_search_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U133(
    .din0(mul_ln122_1_fu_194_p0),
    .din1(mul_ln122_1_fu_194_p1),
    .dout(mul_ln122_1_fu_194_p2)
);

joint_search_hls_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U134(
    .din0(mul_ln122_2_fu_198_p0),
    .din1(mul_ln122_2_fu_198_p1),
    .dout(mul_ln122_2_fu_198_p2)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U135(
    .din0(seeds_x),
    .din1(seeds_x_1),
    .din2(seeds_x_2),
    .def(tmp_5_fu_251_p7),
    .sel(near_1_fu_82),
    .dout(tmp_5_fu_251_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U136(
    .din0(seeds_y),
    .din1(seeds_y_1),
    .din2(seeds_y_2),
    .def(tmp_6_fu_273_p7),
    .sel(near_1_fu_82),
    .dout(tmp_6_fu_273_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U137(
    .din0(seeds_z),
    .din1(seeds_z_1),
    .din2(seeds_z_2),
    .def(tmp_7_fu_295_p7),
    .sel(near_1_fu_82),
    .dout(tmp_7_fu_295_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U138(
    .din0(seeds_score),
    .din1(seeds_score_1),
    .din2(seeds_score_2),
    .def(tmp_1_fu_335_p7),
    .sel(near_1_fu_82),
    .dout(tmp_1_fu_335_p9)
);

(* dissolve_hierarchy = "yes" *) joint_search_hls_sparsemux_7_2_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h0 ),
    .din0_WIDTH( 32 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 32 ),
    .CASE2( 2'h2 ),
    .din2_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
sparsemux_7_2_32_1_1_U139(
    .din0(seeds_score),
    .din1(seeds_score_1),
    .din2(seeds_score_2),
    .def(tmp_3_fu_362_p7),
    .sel(tmp_3_fu_362_p8),
    .dout(tmp_3_fu_362_p9)
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            near_1_fu_82 <= 2'd0;
        end else if (((icmp_ln120_fu_232_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            near_1_fu_82 <= add_ln120_fu_238_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            near_fu_78 <= 32'd4294967295;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            near_fu_78 <= near_4_fu_426_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            worst_fu_74 <= 32'd0;
        end else if (((icmp_ln120_fu_232_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            worst_fu_74 <= worst_1_fu_385_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln123_reg_565 <= icmp_ln123_fu_352_p2;
        mul_ln122_1_reg_555 <= mul_ln122_1_fu_194_p2;
        mul_ln122_2_reg_560 <= mul_ln122_2_fu_198_p2;
        mul_ln122_reg_550 <= mul_ln122_fu_190_p2;
        sext_ln116_1_cast_reg_537 <= sext_ln116_1_cast_fu_206_p1;
        sext_ln116_2_cast_reg_532 <= sext_ln116_2_cast_fu_202_p1;
        sext_ln116_cast_reg_542 <= sext_ln116_cast_fu_210_p1;
        zext_ln123_reg_570[1 : 0] <= zext_ln123_fu_358_p1[1 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln120_fu_232_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln120_fu_232_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        near_out_ap_vld = 1'b1;
    end else begin
        near_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (icmp_ln120_fu_232_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        worst_out_ap_vld = 1'b1;
    end else begin
        worst_out_ap_vld = 1'b0;
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

assign add_ln120_fu_238_p2 = (near_1_fu_82 + 2'd1);

assign add_ln122_fu_406_p2 = (mul_ln122_reg_550 + mul_ln122_2_reg_560);

assign and_ln123_fu_421_p2 = (icmp_ln123_reg_565 & icmp_ln123_1_fu_415_p2);

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

assign dd_fu_410_p2 = (add_ln122_fu_406_p2 + mul_ln122_1_reg_555);

assign dx_fu_268_p2 = ($signed(sext_ln116_cast_reg_542) - $signed(tmp_5_fu_251_p9));

assign dy_fu_290_p2 = ($signed(sext_ln116_1_cast_reg_537) - $signed(tmp_6_fu_273_p9));

assign dz_fu_312_p2 = ($signed(sext_ln116_2_cast_reg_532) - $signed(tmp_7_fu_295_p9));

assign icmp_ln120_fu_232_p2 = ((near_1_fu_82 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln123_1_fu_415_p2 = (($signed(dd_fu_410_p2) < $signed(64'd250000)) ? 1'b1 : 1'b0);

assign icmp_ln123_fu_352_p2 = ((tmp_1_fu_335_p9 != 32'd2147483649) ? 1'b1 : 1'b0);

assign icmp_ln124_fu_379_p2 = (($signed(tmp_1_fu_335_p9) < $signed(tmp_3_fu_362_p9)) ? 1'b1 : 1'b0);

assign mul_ln122_1_fu_194_p0 = sext_ln122_1_fu_323_p1;

assign mul_ln122_1_fu_194_p1 = sext_ln122_1_fu_323_p1;

assign mul_ln122_2_fu_198_p0 = sext_ln122_2_fu_329_p1;

assign mul_ln122_2_fu_198_p1 = sext_ln122_2_fu_329_p1;

assign mul_ln122_fu_190_p0 = sext_ln122_fu_317_p1;

assign mul_ln122_fu_190_p1 = sext_ln122_fu_317_p1;

assign near_4_fu_426_p3 = ((and_ln123_fu_421_p2[0:0] == 1'b1) ? zext_ln123_reg_570 : near_fu_78);

assign near_out = near_fu_78;

assign sext_ln116_1_cast_fu_206_p1 = $signed(sext_ln116_1);

assign sext_ln116_2_cast_fu_202_p1 = $signed(sext_ln116_2);

assign sext_ln116_cast_fu_210_p1 = $signed(sext_ln116);

assign sext_ln122_1_fu_323_p1 = $signed(dy_fu_290_p2);

assign sext_ln122_2_fu_329_p1 = $signed(dz_fu_312_p2);

assign sext_ln122_fu_317_p1 = $signed(dx_fu_268_p2);

assign tmp_1_fu_335_p7 = 'bx;

assign tmp_3_fu_362_p7 = 'bx;

assign tmp_3_fu_362_p8 = worst_fu_74[1:0];

assign tmp_5_fu_251_p7 = 'bx;

assign tmp_6_fu_273_p7 = 'bx;

assign tmp_7_fu_295_p7 = 'bx;

assign worst_1_fu_385_p3 = ((icmp_ln124_fu_379_p2[0:0] == 1'b1) ? zext_ln123_fu_358_p1 : worst_fu_74);

assign worst_out = worst_fu_74;

assign zext_ln123_fu_358_p1 = near_1_fu_82;

always @ (posedge ap_clk) begin
    zext_ln123_reg_570[31:2] <= 30'b000000000000000000000000000000;
end

endmodule                                                               
