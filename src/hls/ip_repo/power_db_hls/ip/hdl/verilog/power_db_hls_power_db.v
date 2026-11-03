                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module power_db_hls_power_db (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        value_r,
        exponent,
        ap_return
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] value_r;
input  [15:0] exponent;
output  [47:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[47:0] ap_return;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [11:0] r18_LN_LUT_address0;
wire   [23:0] r18_LN_LUT_q0;
wire   [11:0] r18_LN_LUT_address1;
wire   [23:0] r18_LN_LUT_q1;
wire   [0:0] icmp_ln44_fu_166_p2;
reg   [0:0] icmp_ln44_reg_526;
wire   [31:0] xx_1_fu_296_p3;
reg   [31:0] xx_1_reg_530;
wire    ap_CS_fsm_state3;
wire   [32:0] add_ln53_fu_312_p2;
reg  signed [32:0] add_ln53_reg_537;
wire   [18:0] frac_fu_369_p1;
reg   [18:0] frac_reg_545;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln50_fu_378_p2;
reg   [0:0] icmp_ln50_reg_555;
reg   [23:0] l0_reg_565;
wire    ap_CS_fsm_state6;
wire   [31:0] mul_ln52_fu_151_p2;
reg   [31:0] mul_ln52_reg_570;
reg   [31:0] trunc_ln1_reg_575;
wire   [63:0] ln_fu_480_p2;
reg  signed [63:0] ln_reg_580;
wire    ap_CS_fsm_state7;
wire    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start;
wire    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done;
wire    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_idle;
wire    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready;
wire   [31:0] grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;
wire    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out_ap_vld;
wire    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start;
wire    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done;
wire    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_idle;
wire    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready;
wire   [31:0] grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out;
wire    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out_ap_vld;
reg   [47:0] ap_phi_mux_agg_result_0_phi_fu_127_p4;
reg   [47:0] agg_result_0_reg_123;
wire    ap_CS_fsm_state8;
reg    grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg;
wire    ap_CS_fsm_state2;
reg    grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg;
wire    ap_CS_fsm_state4;
wire   [63:0] zext_ln50_fu_373_p1;
wire   [63:0] zext_ln50_2_fu_390_p1;
reg    r18_LN_LUT_ce1_local;
reg    r18_LN_LUT_ce0_local;
wire   [31:0] mul_ln51_fu_147_p0;
wire   [18:0] mul_ln51_fu_147_p1;
wire  signed [31:0] mul_ln52_fu_151_p0;
wire   [24:0] mul_ln52_fu_151_p1;
wire   [32:0] mul_ln53_fu_156_p1;
wire   [33:0] p_fu_161_p1;
wire  signed [31:0] icmp_ln46_fu_175_p0;
wire  signed [31:0] add_ln46_fu_181_p0;
wire   [31:0] add_ln46_fu_181_p2;
wire   [63:0] zext_ln46_fu_187_p1;
wire   [63:0] lshr_ln46_fu_191_p2;
wire  signed [31:0] sub_ln46_fu_200_p1;
wire   [31:0] sub_ln46_fu_200_p2;
wire   [63:0] zext_ln46_1_fu_214_p1;
wire   [63:0] shl_ln46_fu_218_p2;
wire   [31:0] sub_ln46_1_fu_227_p2;
wire   [63:0] zext_ln46_2_fu_233_p1;
wire   [63:0] lshr_ln46_1_fu_237_p2;
wire   [0:0] tmp_fu_206_p3;
wire   [0:0] icmp_ln46_fu_175_p2;
wire   [0:0] or_ln46_fu_246_p2;
wire   [0:0] xor_ln46_fu_252_p2;
wire   [32:0] lx_fu_266_p2;
wire   [32:0] lx_fu_266_p4;
wire   [32:0] lx_fu_266_p6;
wire   [32:0] lx_fu_266_p7;
wire   [1:0] lx_fu_266_p8;
wire   [32:0] lx_fu_266_p9;
wire   [0:0] icmp_ln47_fu_286_p2;
wire   [31:0] xx_fu_292_p1;
wire  signed [31:0] sext_ln53_1_fu_308_p0;
wire  signed [32:0] sext_ln53_1_fu_308_p1;
wire  signed [32:0] sext_ln53_fu_305_p1;
wire   [31:0] sub_ln49_fu_321_p2;
wire   [31:0] sub_ln49_1_fu_340_p2;
wire   [0:0] tmp_1_fu_327_p3;
wire   [31:0] lshr_ln49_fu_346_p2;
wire   [31:0] shl_ln49_fu_335_p2;
wire   [31:0] select_ln49_fu_351_p3;
wire   [11:0] idx_fu_359_p4;
wire   [11:0] add_ln50_fu_384_p2;
wire   [23:0] l1_1_fu_399_p3;
wire   [24:0] zext_ln50_4_fu_406_p1;
wire   [24:0] zext_ln50_3_fu_395_p1;
wire   [24:0] sub_ln51_fu_410_p2;
wire  signed [31:0] sext_ln51_fu_416_p1;
wire   [50:0] mul_ln51_fu_147_p2;
wire   [31:0] zext_ln50_1_fu_445_p1;
wire   [31:0] sub_ln52_1_fu_448_p2;
wire   [63:0] mul_ln53_fu_156_p2;
wire   [31:0] neglog_fu_453_p2;
wire   [39:0] shl_ln_fu_468_p3;
wire   [63:0] add_ln53_1_fu_462_p2;
wire   [63:0] zext_ln53_fu_476_p1;
wire   [77:0] p_fu_161_p2;
reg   [47:0] ap_return_preg;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire   [50:0] mul_ln51_fu_147_p00;
wire   [50:0] mul_ln51_fu_147_p10;
wire  signed [1:0] lx_fu_266_p1;
wire   [1:0] lx_fu_266_p3;
wire   [1:0] lx_fu_266_p5;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg = 1'b0;
#0 grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg = 1'b0;
#0 ap_return_preg = 48'd0;
end

power_db_hls_power_db_r18_LN_LUT_ROM_AUTO_1R #(
    .DataWidth( 24 ),
    .AddressRange( 4096 ),
    .AddressWidth( 12 ))
r18_LN_LUT_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(r18_LN_LUT_address0),
    .ce0(r18_LN_LUT_ce0_local),
    .q0(r18_LN_LUT_q0),
    .address1(r18_LN_LUT_address1),
    .ce1(r18_LN_LUT_ce1_local),
    .q1(r18_LN_LUT_q1)
);

power_db_hls_power_db_Pipeline_VITIS_LOOP_45_1 grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start),
    .ap_done(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done),
    .ap_idle(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_idle),
    .ap_ready(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready),
    .value_r(value_r),
    .leading_out(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out),
    .leading_out_ap_vld(grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out_ap_vld)
);

power_db_hls_power_db_Pipeline_VITIS_LOOP_48_2 grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start),
    .ap_done(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done),
    .ap_idle(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_idle),
    .ap_ready(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready),
    .xx_1(xx_1_reg_530),
    .lead_out(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out),
    .lead_out_ap_vld(grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out_ap_vld)
);

power_db_hls_mul_32ns_19ns_51_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 19 ),
    .dout_WIDTH( 51 ))
mul_32ns_19ns_51_1_1_U9(
    .din0(mul_ln51_fu_147_p0),
    .din1(mul_ln51_fu_147_p1),
    .dout(mul_ln51_fu_147_p2)
);

power_db_hls_mul_32s_25ns_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 25 ),
    .dout_WIDTH( 32 ))
mul_32s_25ns_32_1_1_U10(
    .din0(mul_ln52_fu_151_p0),
    .din1(mul_ln52_fu_151_p1),
    .dout(mul_ln52_fu_151_p2)
);

power_db_hls_mul_33s_33ns_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 33 ),
    .din1_WIDTH( 33 ),
    .dout_WIDTH( 64 ))
mul_33s_33ns_64_1_1_U11(
    .din0(add_ln53_reg_537),
    .din1(mul_ln53_fu_156_p1),
    .dout(mul_ln53_fu_156_p2)
);

power_db_hls_mul_64s_34ns_78_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 34 ),
    .dout_WIDTH( 78 ))
mul_64s_34ns_78_1_1_U12(
    .din0(ln_reg_580),
    .din1(p_fu_161_p1),
    .dout(p_fu_161_p2)
);

(* dissolve_hierarchy = "yes" *) power_db_hls_sparsemux_7_2_33_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .CASE0( 2'h2 ),
    .din0_WIDTH( 33 ),
    .CASE1( 2'h1 ),
    .din1_WIDTH( 33 ),
    .CASE2( 2'h0 ),
    .din2_WIDTH( 33 ),
    .def_WIDTH( 33 ),
    .sel_WIDTH( 2 ),
    .dout_WIDTH( 33 ))
sparsemux_7_2_33_1_1_U13(
    .din0(lx_fu_266_p2),
    .din1(lx_fu_266_p4),
    .din2(lx_fu_266_p6),
    .def(lx_fu_266_p7),
    .sel(lx_fu_266_p8),
    .dout(lx_fu_266_p9)
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
        ap_return_preg <= 48'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_return_preg <= ap_phi_mux_agg_result_0_phi_fu_127_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln44_fu_166_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= 1'b1;
        end else if ((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_ready == 1'b1)) begin
            grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= 1'b1;
        end else if ((grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_ready == 1'b1)) begin
            grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln44_fu_166_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        agg_result_0_reg_123 <= 48'd280186486521856;
    end else if (((icmp_ln44_reg_526 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        agg_result_0_reg_123 <= {{p_fu_161_p2[77:30]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln53_reg_537 <= add_ln53_fu_312_p2;
        xx_1_reg_530 <= xx_1_fu_296_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        frac_reg_545 <= frac_fu_369_p1;
        icmp_ln50_reg_555 <= icmp_ln50_fu_378_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln44_reg_526 <= icmp_ln44_fu_166_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        l0_reg_565 <= r18_LN_LUT_q1;
        mul_ln52_reg_570 <= mul_ln52_fu_151_p2;
        trunc_ln1_reg_575 <= {{mul_ln51_fu_147_p2[50:19]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ln_reg_580 <= ln_fu_480_p2;
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
    if ((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln44_reg_526 == 1'd0) & (1'b1 == ap_CS_fsm_state8))) begin
        ap_phi_mux_agg_result_0_phi_fu_127_p4 = {{p_fu_161_p2[77:30]}};
    end else begin
        ap_phi_mux_agg_result_0_phi_fu_127_p4 = agg_result_0_reg_123;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_return = ap_phi_mux_agg_result_0_phi_fu_127_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        r18_LN_LUT_ce0_local = 1'b1;
    end else begin
        r18_LN_LUT_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        r18_LN_LUT_ce1_local = 1'b1;
    end else begin
        r18_LN_LUT_ce1_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((icmp_ln44_fu_166_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else if (((icmp_ln44_fu_166_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln46_fu_181_p0 = grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;

assign add_ln46_fu_181_p2 = ($signed(add_ln46_fu_181_p0) + $signed(32'd4294967265));

assign add_ln50_fu_384_p2 = (idx_fu_359_p4 + 12'd1);

assign add_ln53_1_fu_462_p2 = (mul_ln53_fu_156_p2 + 64'd2977044472);

assign add_ln53_fu_312_p2 = ($signed(sext_ln53_1_fu_308_p1) + $signed(sext_ln53_fu_305_p1));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign frac_fu_369_p1 = select_ln49_fu_351_p3[18:0];

assign grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start = grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_ap_start_reg;

assign grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start = grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_ap_start_reg;

assign icmp_ln44_fu_166_p2 = ((value_r == 64'd0) ? 1'b1 : 1'b0);

assign icmp_ln46_fu_175_p0 = grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;

assign icmp_ln46_fu_175_p2 = (($signed(icmp_ln46_fu_175_p0) > $signed(32'd30)) ? 1'b1 : 1'b0);

assign icmp_ln47_fu_286_p2 = ((lx_fu_266_p9 < 33'd43) ? 1'b1 : 1'b0);

assign icmp_ln50_fu_378_p2 = ((idx_fu_359_p4 == 12'd4095) ? 1'b1 : 1'b0);

assign idx_fu_359_p4 = {{select_ln49_fu_351_p3[30:19]}};

assign l1_1_fu_399_p3 = ((icmp_ln50_reg_555[0:0] == 1'b1) ? 24'd11629080 : r18_LN_LUT_q0);

assign ln_fu_480_p2 = (add_ln53_1_fu_462_p2 - zext_ln53_fu_476_p1);

assign lshr_ln46_1_fu_237_p2 = value_r >> zext_ln46_2_fu_233_p1;

assign lshr_ln46_fu_191_p2 = value_r >> zext_ln46_fu_187_p1;

assign lshr_ln49_fu_346_p2 = xx_1_reg_530 >> sub_ln49_1_fu_340_p2;

assign lx_fu_266_p2 = lshr_ln46_fu_191_p2[32:0];

assign lx_fu_266_p4 = shl_ln46_fu_218_p2[32:0];

assign lx_fu_266_p6 = lshr_ln46_1_fu_237_p2[32:0];

assign lx_fu_266_p7 = 'bx;

assign lx_fu_266_p8 = {{icmp_ln46_fu_175_p2}, {xor_ln46_fu_252_p2}};

assign mul_ln51_fu_147_p0 = mul_ln51_fu_147_p00;

assign mul_ln51_fu_147_p00 = $unsigned(sext_ln51_fu_416_p1);

assign mul_ln51_fu_147_p1 = mul_ln51_fu_147_p10;

assign mul_ln51_fu_147_p10 = frac_reg_545;

assign mul_ln52_fu_151_p0 = (32'd32 - grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out);

assign mul_ln52_fu_151_p1 = 32'd11629080;

assign mul_ln53_fu_156_p1 = 64'd2977044472;

assign neglog_fu_453_p2 = (sub_ln52_1_fu_448_p2 - trunc_ln1_reg_575);

assign or_ln46_fu_246_p2 = (tmp_fu_206_p3 | icmp_ln46_fu_175_p2);

assign p_fu_161_p1 = 78'd4663201492;

assign r18_LN_LUT_address0 = zext_ln50_2_fu_390_p1;

assign r18_LN_LUT_address1 = zext_ln50_fu_373_p1;

assign select_ln49_fu_351_p3 = ((tmp_1_fu_327_p3[0:0] == 1'b1) ? lshr_ln49_fu_346_p2 : shl_ln49_fu_335_p2);

assign sext_ln51_fu_416_p1 = $signed(sub_ln51_fu_410_p2);

assign sext_ln53_1_fu_308_p0 = grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;

assign sext_ln53_1_fu_308_p1 = sext_ln53_1_fu_308_p0;

assign sext_ln53_fu_305_p1 = $signed(exponent);

assign shl_ln46_fu_218_p2 = value_r << zext_ln46_1_fu_214_p1;

assign shl_ln49_fu_335_p2 = xx_1_reg_530 << sub_ln49_fu_321_p2;

assign shl_ln_fu_468_p3 = {{neglog_fu_453_p2}, {8'd0}};

assign sub_ln46_1_fu_227_p2 = (32'd0 - sub_ln46_fu_200_p2);

assign sub_ln46_fu_200_p1 = grp_power_db_Pipeline_VITIS_LOOP_45_1_fu_134_leading_out;

assign sub_ln46_fu_200_p2 = ($signed(32'd31) - $signed(sub_ln46_fu_200_p1));

assign sub_ln49_1_fu_340_p2 = (32'd0 - sub_ln49_fu_321_p2);

assign sub_ln49_fu_321_p2 = (32'd31 - grp_power_db_Pipeline_VITIS_LOOP_48_2_fu_141_lead_out);

assign sub_ln51_fu_410_p2 = (zext_ln50_4_fu_406_p1 - zext_ln50_3_fu_395_p1);

assign sub_ln52_1_fu_448_p2 = (mul_ln52_reg_570 - zext_ln50_1_fu_445_p1);

assign tmp_1_fu_327_p3 = sub_ln49_fu_321_p2[32'd31];

assign tmp_fu_206_p3 = sub_ln46_fu_200_p2[32'd31];

assign xor_ln46_fu_252_p2 = (or_ln46_fu_246_p2 ^ 1'd1);

assign xx_1_fu_296_p3 = ((icmp_ln47_fu_286_p2[0:0] == 1'b1) ? 32'd43 : xx_fu_292_p1);

assign xx_fu_292_p1 = lx_fu_266_p9[31:0];

assign zext_ln46_1_fu_214_p1 = sub_ln46_fu_200_p2;

assign zext_ln46_2_fu_233_p1 = sub_ln46_1_fu_227_p2;

assign zext_ln46_fu_187_p1 = add_ln46_fu_181_p2;

assign zext_ln50_1_fu_445_p1 = l0_reg_565;

assign zext_ln50_2_fu_390_p1 = add_ln50_fu_384_p2;

assign zext_ln50_3_fu_395_p1 = r18_LN_LUT_q1;

assign zext_ln50_4_fu_406_p1 = l1_1_fu_399_p3;

assign zext_ln50_fu_373_p1 = idx_fu_359_p4;

assign zext_ln53_fu_476_p1 = shl_ln_fu_468_p3;

endmodule                        
