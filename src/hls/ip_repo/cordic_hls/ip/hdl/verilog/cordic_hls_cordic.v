                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module cordic_hls_cordic (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mode,
        vx,
        vy,
        angle,
        ap_return
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [0:0] mode;
input  [39:0] vx;
input  [39:0] vy;
input  [31:0] angle;
output  [135:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] xor_ln25_fu_238_p2;
reg   [0:0] xor_ln25_reg_403;
wire   [31:0] z_4_ph_fu_261_p11;
reg   [31:0] z_4_ph_reg_408;
wire   [40:0] yy_ph_fu_294_p9;
reg   [40:0] yy_ph_reg_413;
wire   [40:0] xx_ph_fu_315_p11;
reg   [40:0] xx_ph_reg_418;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_idle;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready;
wire   [31:0] grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld;
wire   [31:0] grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld;
wire   [43:0] grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out_ap_vld;
reg    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [31:0] z_3_loc_fu_88;
reg   [31:0] yy_loc_fu_84;
wire    ap_CS_fsm_state3;
wire   [30:0] product_fu_131_p1;
wire  signed [39:0] tmp_fu_136_p1;
wire  signed [39:0] sext_ln29_fu_144_p0;
wire  signed [39:0] sext_ln30_fu_148_p0;
wire  signed [40:0] sext_ln29_fu_144_p1;
wire  signed [40:0] sext_ln30_fu_148_p1;
wire  signed [39:0] tmp_2_fu_170_p1;
wire   [0:0] tmp_2_fu_170_p3;
wire   [0:0] icmp_ln30_1_fu_192_p2;
wire   [31:0] z_5_fu_198_p2;
wire   [0:0] tmp_fu_136_p3;
wire   [0:0] xor_ln29_fu_226_p2;
wire   [0:0] icmp_ln30_fu_152_p2;
wire   [0:0] and_ln29_fu_220_p2;
wire   [0:0] and_ln29_1_fu_232_p2;
wire   [0:0] and_ln30_fu_245_p2;
wire   [31:0] z_4_ph_fu_261_p2;
wire   [31:0] z_4_ph_fu_261_p6;
wire   [31:0] z_4_ph_fu_261_p8;
wire   [31:0] z_4_ph_fu_261_p9;
wire   [2:0] sel_tmp1_fu_251_p4;
wire   [40:0] yy_ph_fu_294_p2;
wire   [40:0] yy_ph_fu_294_p7;
wire   [1:0] yy_ph_fu_294_p8;
wire   [40:0] xx_ph_fu_315_p2;
wire   [40:0] xx_ph_fu_315_p8;
wire   [40:0] xx_ph_fu_315_p9;
wire  signed [43:0] sext_ln37_fu_349_p0;
wire  signed [43:0] trunc_ln38_fu_354_p0;
wire   [69:0] product_fu_131_p2;
wire   [39:0] trunc_ln38_3_fu_358_p4;
wire   [31:0] trunc_ln38_fu_354_p1;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire  signed [2:0] z_4_ph_fu_261_p1;
wire   [2:0] z_4_ph_fu_261_p3;
wire   [2:0] z_4_ph_fu_261_p5;
wire   [2:0] z_4_ph_fu_261_p7;
wire  signed [1:0] yy_ph_fu_294_p1;
wire   [1:0] yy_ph_fu_294_p3;
wire   [1:0] yy_ph_fu_294_p5;
wire  signed [2:0] xx_ph_fu_315_p1;
wire   [2:0] xx_ph_fu_315_p3;
wire   [2:0] xx_ph_fu_315_p5;
wire   [2:0] xx_ph_fu_315_p7;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg = 1'b0;
end

cordic_hls_cordic_Pipeline_VITIS_LOOP_31_1 grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start),
    .ap_done(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done),
    .ap_idle(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_idle),
    .ap_ready(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready),
    .z_4_ph(z_4_ph_reg_408),
    .yy_ph_cast(yy_ph_reg_413),
    .sext_ln31(xx_ph_reg_418),
    .mode(mode),
    .xor_ln25(xor_ln25_reg_403),
    .z_3_out(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out),
    .z_3_out_ap_vld(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld),
    .yy_out(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out),
    .yy_out_ap_vld(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld),
    .xx_out(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out),
    .xx_out_ap_vld(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out_ap_vld)
);

cordic_hls_mul_44s_31ns_70_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 44 ),
    .din1_WIDTH( 31 ),
    .dout_WIDTH( 70 ))
mul_44s_31ns_70_1_1_U15(
    .din0(sext_ln37_fu_349_p0),
    .din1(product_fu_131_p1),
    .dout(product_fu_131_p2)
);

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_9_3_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 3'h4 ),
    .din0_WIDTH( 32 ),
    .CASE1( 3'h2 ),
    .din1_WIDTH( 32 ),
    .CASE2( 3'h1 ),
    .din2_WIDTH( 32 ),
    .CASE3( 3'h0 ),
    .din3_WIDTH( 32 ),
    .def_WIDTH( 32 ),
    .sel_WIDTH( 3 ),
    .dout_WIDTH( 32 ))
sparsemux_9_3_32_1_1_U16(
    .din0(z_4_ph_fu_261_p2),
    .din1(32'd0),
    .din2(z_4_ph_fu_261_p6),
    .din3(z_4_ph_fu_261_p8),
    .def(z_4_ph_fu_261_p9),
    .sel(sel_tmp1_fu_251_p4),
    .dout(z_4_ph_fu_261_p11)
);

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_7_2_41_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h2 ),
    .din0_WIDTH( 41 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 41 ),
    .CASE2( 2'h0 ),
    .din2_WIDTH( 41 ),
    .def_WIDTH( 41 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 41 ))
sparsemux_7_2_41_1_1_U17(
    .din0(yy_ph_fu_294_p2),
    .din1(41'd0),
    .din2(sext_ln30_fu_148_p1),
    .def(yy_ph_fu_294_p7),
    .sel(yy_ph_fu_294_p8),
    .dout(yy_ph_fu_294_p9)
);

(* dissolve_hierarchy = "yes" *) cordic_hls_sparsemux_9_3_41_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 3'h4 ),
    .din0_WIDTH( 41 ),
    .CASE1( 3'h2 ),
    .din1_WIDTH( 41 ),
    .CASE2( 3'h1 ),
    .din2_WIDTH( 41 ),
    .CASE3( 3'h0 ),
    .din3_WIDTH( 41 ),
    .def_WIDTH( 41 ),
    .sel_WIDTH( 3 ),
    .dout_WIDTH( 41 ))
sparsemux_9_3_41_1_1_U18(
    .din0(xx_ph_fu_315_p2),
    .din1(sext_ln29_fu_144_p1),
    .din2(41'd2198371222678),
    .din3(xx_ph_fu_315_p8),
    .def(xx_ph_fu_315_p9),
    .sel(sel_tmp1_fu_251_p4),
    .dout(xx_ph_fu_315_p11)
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
        grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= 1'b1;
        end else if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_ready == 1'b1)) begin
            grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        xor_ln25_reg_403 <= xor_ln25_fu_238_p2;
        xx_ph_reg_418 <= xx_ph_fu_315_p11;
        yy_ph_reg_413 <= yy_ph_fu_294_p9;
        z_4_ph_reg_408 <= z_4_ph_fu_261_p11;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        yy_loc_fu_84 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_yy_out;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        z_3_loc_fu_88 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_z_3_out;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln29_1_fu_232_p2 = (xor_ln29_fu_226_p2 & mode);

assign and_ln29_fu_220_p2 = (tmp_fu_136_p3 & mode);

assign and_ln30_fu_245_p2 = (xor_ln25_fu_238_p2 & icmp_ln30_fu_152_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_return = {{{{trunc_ln38_3_fu_358_p4}, {yy_loc_fu_84}}, {trunc_ln38_fu_354_p1}}, {z_3_loc_fu_88}};

assign grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start = grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_ap_start_reg;

assign icmp_ln30_1_fu_192_p2 = (($signed(angle) < $signed(32'd3451652439)) ? 1'b1 : 1'b0);

assign icmp_ln30_fu_152_p2 = (($signed(angle) > $signed(32'd843314857)) ? 1'b1 : 1'b0);

assign product_fu_131_p1 = 70'd652032874;

assign sel_tmp1_fu_251_p4 = {{{and_ln29_fu_220_p2}, {and_ln29_1_fu_232_p2}}, {and_ln30_fu_245_p2}};

assign sext_ln29_fu_144_p0 = vx;

assign sext_ln29_fu_144_p1 = sext_ln29_fu_144_p0;

assign sext_ln30_fu_148_p0 = vy;

assign sext_ln30_fu_148_p1 = sext_ln30_fu_148_p0;

assign sext_ln37_fu_349_p0 = grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out;

assign tmp_2_fu_170_p1 = vy;

assign tmp_2_fu_170_p3 = tmp_2_fu_170_p1[32'd39];

assign tmp_fu_136_p1 = vx;

assign tmp_fu_136_p3 = tmp_fu_136_p1[32'd39];

assign trunc_ln38_3_fu_358_p4 = {{product_fu_131_p2[69:30]}};

assign trunc_ln38_fu_354_p0 = grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_116_xx_out;

assign trunc_ln38_fu_354_p1 = trunc_ln38_fu_354_p0[31:0];

assign xor_ln25_fu_238_p2 = (mode ^ 1'd1);

assign xor_ln29_fu_226_p2 = (tmp_fu_136_p3 ^ 1'd1);

assign xx_ph_fu_315_p2 = ($signed(41'd0) - $signed(sext_ln29_fu_144_p1));

assign xx_ph_fu_315_p8 = ((icmp_ln30_1_fu_192_p2[0:0] == 1'b1) ? 41'd2198371222678 : 41'd652032874);

assign xx_ph_fu_315_p9 = 'bx;

assign yy_ph_fu_294_p2 = ($signed(41'd0) - $signed(sext_ln30_fu_148_p1));

assign yy_ph_fu_294_p7 = 'bx;

assign yy_ph_fu_294_p8 = {{and_ln29_fu_220_p2}, {xor_ln25_fu_238_p2}};

assign z_4_ph_fu_261_p2 = ((tmp_2_fu_170_p3[0:0] == 1'b1) ? 32'd2608337583 : 32'd1686629713);

assign z_4_ph_fu_261_p6 = ($signed(angle) + $signed(32'd2608337583));

assign z_4_ph_fu_261_p8 = ((icmp_ln30_1_fu_192_p2[0:0] == 1'b1) ? z_5_fu_198_p2 : angle);

assign z_4_ph_fu_261_p9 = 'bx;

assign z_5_fu_198_p2 = (angle + 32'd1686629713);

endmodule                    
