                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        z_4_ph,
        yy_ph_cast,
        sext_ln31,
        mode,
        xor_ln25,
        z_3_out,
        z_3_out_ap_vld,
        yy_out,
        yy_out_ap_vld,
        xx_out,
        xx_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] z_4_ph;
input  [40:0] yy_ph_cast;
input  [40:0] sext_ln31;
input  [0:0] mode;
input  [0:0] xor_ln25;
output  [31:0] z_3_out;
output   z_3_out_ap_vld;
output  [31:0] yy_out;
output   yy_out_ap_vld;
output  [43:0] xx_out;
output   xx_out_ap_vld;

reg ap_idle;
reg z_3_out_ap_vld;
reg yy_out_ap_vld;
reg xx_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln31_fu_195_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [4:0] r18_CORDIC_ATAN_address0;
wire   [28:0] r18_CORDIC_ATAN_q0;
wire    ap_block_pp0_stage0_11001;
reg   [4:0] i_1_reg_487;
reg   [0:0] icmp_ln31_reg_492;
wire   [63:0] zext_ln31_fu_207_p1;
wire    ap_block_pp0_stage0;
reg   [43:0] x_fu_80;
wire   [43:0] x_4_fu_356_p11;
wire  signed [43:0] sext_ln31_cast_fu_160_p1;
wire    ap_loop_init;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [43:0] y_fu_84;
wire   [43:0] y_4_fu_380_p11;
wire  signed [43:0] yy_ph_cast_cast_fu_164_p1;
reg   [32:0] z_fu_88;
wire   [32:0] z_4_fu_404_p11;
wire  signed [32:0] z_4_ph_cast_fu_168_p1;
reg   [4:0] i_fu_92;
wire   [4:0] add_ln31_fu_201_p2;
reg   [4:0] ap_sig_allocacmp_i_1;
wire    ap_block_pp0_stage0_01001;
reg    r18_CORDIC_ATAN_ce0_local;
wire   [43:0] zext_ln35_1_fu_236_p1;
wire   [0:0] tmp_fu_249_p3;
wire   [0:0] tmp_1_fu_263_p3;
wire   [43:0] shr_i42325_fu_283_p2;
wire   [43:0] ashr_ln35_fu_239_p2;
wire   [32:0] zext_ln35_fu_245_p1;
wire   [43:0] ashr_ln35_1_fu_277_p2;
wire   [0:0] xor_ln34_fu_257_p2;
wire   [0:0] xor_ln35_fu_271_p2;
wire   [0:0] and_ln34_fu_331_p2;
wire   [0:0] and_ln35_fu_336_p2;
wire   [0:0] and_ln34_1_fu_341_p2;
wire   [43:0] x_4_fu_356_p2;
wire   [43:0] x_2_fu_307_p2;
wire   [43:0] x_4_fu_356_p8;
wire   [43:0] x_4_fu_356_p9;
wire   [2:0] sel_tmp5_fu_346_p4;
wire   [43:0] y_2_fu_295_p2;
wire   [43:0] y_3_fu_313_p2;
wire   [43:0] y_4_fu_380_p9;
wire   [32:0] z_2_fu_301_p2;
wire   [32:0] z_3_fu_319_p2;
wire   [32:0] z_4_fu_404_p9;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire  signed [2:0] x_4_fu_356_p1;
wire   [2:0] x_4_fu_356_p3;
wire   [2:0] x_4_fu_356_p5;
wire   [2:0] x_4_fu_356_p7;
wire  signed [2:0] y_4_fu_380_p1;
wire   [2:0] y_4_fu_380_p3;
wire   [2:0] y_4_fu_380_p5;
wire   [2:0] y_4_fu_380_p7;
wire  signed [2:0] z_4_fu_404_p1;
wire   [2:0] z_4_fu_404_p3;
wire   [2:0] z_4_fu_404_p5;
wire   [2:0] z_4_fu_404_p7;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 x_fu_80 = 44'd0;
#0 y_fu_84 = 44'd0;
#0 z_fu_88 = 33'd0;
#0 i_fu_92 = 5'd0;
#0 ap_done_reg = 1'b0;
end

cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R #(
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

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_9_3_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 3'h4 ),
    .din0_WIDTH( 44 ),
    .CASE1( 3'h2 ),
    .din1_WIDTH( 44 ),
    .CASE2( 3'h1 ),
    .din2_WIDTH( 44 ),
    .CASE3( 3'h0 ),
    .din3_WIDTH( 44 ),
    .def_WIDTH( 44 ),
    .sel_WIDTH( 3 ),
    .dout_WIDTH( 44 ))
sparsemux_9_3_44_1_1_U1(
    .din0(x_4_fu_356_p2),
    .din1(x_2_fu_307_p2),
    .din2(x_2_fu_307_p2),
    .din3(x_4_fu_356_p8),
    .def(x_4_fu_356_p9),
    .sel(sel_tmp5_fu_346_p4),
    .dout(x_4_fu_356_p11)
);

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_9_3_44_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 3'h4 ),
    .din0_WIDTH( 44 ),
    .CASE1( 3'h2 ),
    .din1_WIDTH( 44 ),
    .CASE2( 3'h1 ),
    .din2_WIDTH( 44 ),
    .CASE3( 3'h0 ),
    .din3_WIDTH( 44 ),
    .def_WIDTH( 44 ),
    .sel_WIDTH( 3 ),
    .dout_WIDTH( 44 ))
sparsemux_9_3_44_1_1_U2(
    .din0(y_2_fu_295_p2),
    .din1(y_3_fu_313_p2),
    .din2(y_3_fu_313_p2),
    .din3(y_2_fu_295_p2),
    .def(y_4_fu_380_p9),
    .sel(sel_tmp5_fu_346_p4),
    .dout(y_4_fu_380_p11)
);

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_9_3_33_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 3'h4 ),
    .din0_WIDTH( 33 ),
    .CASE1( 3'h2 ),
    .din1_WIDTH( 33 ),
    .CASE2( 3'h1 ),
    .din2_WIDTH( 33 ),
    .CASE3( 3'h0 ),
    .din3_WIDTH( 33 ),
    .def_WIDTH( 33 ),
    .sel_WIDTH( 3 ),
    .dout_WIDTH( 33 ))
sparsemux_9_3_33_1_1_U3(
    .din0(z_2_fu_301_p2),
    .din1(z_3_fu_319_p2),
    .din2(z_3_fu_319_p2),
    .din3(z_2_fu_301_p2),
    .def(z_4_fu_404_p9),
    .sel(sel_tmp5_fu_346_p4),
    .dout(z_4_fu_404_p11)
);

cordic_hls_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if (((ap_loop_exit_ready == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_11001)) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln31_fu_195_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_92 <= add_ln31_fu_201_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_92 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            x_fu_80 <= sext_ln31_cast_fu_160_p1;
        end else if (((icmp_ln31_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            x_fu_80 <= x_4_fu_356_p11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            y_fu_84 <= yy_ph_cast_cast_fu_164_p1;
        end else if (((icmp_ln31_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            y_fu_84 <= y_4_fu_380_p11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            z_fu_88 <= z_4_ph_cast_fu_168_p1;
        end else if (((icmp_ln31_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            z_fu_88 <= z_4_fu_404_p11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_1_reg_487 <= ap_sig_allocacmp_i_1;
        icmp_ln31_reg_492 <= icmp_ln31_fu_195_p2;
    end
end

always @ (*) begin
    if (((icmp_ln31_fu_195_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
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
        ap_sig_allocacmp_i_1 = 5'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_92;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r18_CORDIC_ATAN_ce0_local = 1'b1;
    end else begin
        r18_CORDIC_ATAN_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln31_reg_492 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        xx_out_ap_vld = 1'b1;
    end else begin
        xx_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln31_reg_492 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        yy_out_ap_vld = 1'b1;
    end else begin
        yy_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln31_reg_492 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        z_3_out_ap_vld = 1'b1;
    end else begin
        z_3_out_ap_vld = 1'b0;
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

assign add_ln31_fu_201_p2 = (ap_sig_allocacmp_i_1 + 5'd1);

assign and_ln34_1_fu_341_p2 = (tmp_fu_249_p3 & mode);

assign and_ln34_fu_331_p2 = (xor_ln34_fu_257_p2 & mode);

assign and_ln35_fu_336_p2 = (xor_ln35_fu_271_p2 & xor_ln25);

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

assign ashr_ln35_1_fu_277_p2 = $signed(y_fu_84) >>> zext_ln35_1_fu_236_p1;

assign ashr_ln35_fu_239_p2 = $signed(x_fu_80) >>> zext_ln35_1_fu_236_p1;

assign icmp_ln31_fu_195_p2 = ((ap_sig_allocacmp_i_1 == 5'd31) ? 1'b1 : 1'b0);

assign r18_CORDIC_ATAN_address0 = zext_ln31_fu_207_p1;

assign sel_tmp5_fu_346_p4 = {{{and_ln34_fu_331_p2}, {and_ln35_fu_336_p2}}, {and_ln34_1_fu_341_p2}};

assign sext_ln31_cast_fu_160_p1 = $signed(sext_ln31);

assign shr_i42325_fu_283_p2 = y_fu_84 >> zext_ln35_1_fu_236_p1;

assign tmp_1_fu_263_p3 = z_fu_88[32'd32];

assign tmp_fu_249_p3 = y_fu_84[32'd43];

assign x_2_fu_307_p2 = (x_fu_80 - ashr_ln35_1_fu_277_p2);

assign x_4_fu_356_p2 = (x_fu_80 + shr_i42325_fu_283_p2);

assign x_4_fu_356_p8 = (x_fu_80 + ashr_ln35_1_fu_277_p2);

assign x_4_fu_356_p9 = 'bx;

assign xor_ln34_fu_257_p2 = (tmp_fu_249_p3 ^ 1'd1);

assign xor_ln35_fu_271_p2 = (tmp_1_fu_263_p3 ^ 1'd1);

assign xx_out = x_fu_80;

assign y_2_fu_295_p2 = (y_fu_84 - ashr_ln35_fu_239_p2);

assign y_3_fu_313_p2 = (ashr_ln35_fu_239_p2 + y_fu_84);

assign y_4_fu_380_p9 = 'bx;

assign yy_out = y_fu_84[31:0];

assign yy_ph_cast_cast_fu_164_p1 = $signed(yy_ph_cast);

assign z_2_fu_301_p2 = (z_fu_88 + zext_ln35_fu_245_p1);

assign z_3_fu_319_p2 = (z_fu_88 - zext_ln35_fu_245_p1);

assign z_3_out = z_fu_88[31:0];

assign z_4_fu_404_p9 = 'bx;

assign z_4_ph_cast_fu_168_p1 = $signed(z_4_ph);

assign zext_ln31_fu_207_p1 = ap_sig_allocacmp_i_1;

assign zext_ln35_1_fu_236_p1 = i_1_reg_487;

assign zext_ln35_fu_245_p1 = r18_CORDIC_ATAN_q0;

endmodule                                             
