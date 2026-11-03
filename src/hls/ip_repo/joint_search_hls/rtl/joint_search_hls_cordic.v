                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_cordic (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        vx,
        vy,
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
input  [31:0] vx;
input  [31:0] vy;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] z_1_ph_fu_90_p3;
reg   [31:0] z_1_ph_reg_126;
wire   [32:0] yy_ph_fu_99_p3;
reg   [32:0] yy_ph_reg_131;
wire   [31:0] xx_ph_fu_108_p3;
reg   [31:0] xx_ph_reg_136;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_idle;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready;
wire   [31:0] grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out;
wire    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld;
reg    grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [31:0] z_1_loc_fu_24;
wire    ap_CS_fsm_state3;
wire  signed [31:0] sext_ln29_fu_58_p0;
wire  signed [32:0] sext_ln29_fu_58_p1;
wire  signed [31:0] tmp_50_fu_74_p1;
wire   [0:0] tmp_50_fu_74_p3;
wire   [0:0] tmp_fu_50_p3;
wire   [31:0] z_fu_82_p3;
wire   [32:0] y_fu_68_p2;
wire   [31:0] x_fu_62_p2;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg = 1'b0;
end

joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1 grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start),
    .ap_done(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done),
    .ap_idle(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_idle),
    .ap_ready(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready),
    .z_1_ph_cast(z_1_ph_reg_126),
    .yy_ph_cast(yy_ph_reg_131),
    .zext_ln31_1(xx_ph_reg_136),
    .z_1_out(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out),
    .z_1_out_ap_vld(grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld)
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
        grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= 1'b1;
        end else if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_ready == 1'b1)) begin
            grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        xx_ph_reg_136 <= xx_ph_fu_108_p3;
        yy_ph_reg_131 <= yy_ph_fu_99_p3;
        z_1_ph_reg_126 <= z_1_ph_fu_90_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        z_1_loc_fu_24 <= grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_z_1_out;
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
    if ((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done == 1'b0)) begin
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
            if (((grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_return = z_1_loc_fu_24;

assign grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start = grp_cordic_Pipeline_VITIS_LOOP_31_1_fu_40_ap_start_reg;

assign sext_ln29_fu_58_p0 = vy;

assign sext_ln29_fu_58_p1 = sext_ln29_fu_58_p0;

assign tmp_50_fu_74_p1 = vy;

assign tmp_50_fu_74_p3 = tmp_50_fu_74_p1[32'd31];

assign tmp_fu_50_p3 = vx[32'd31];

assign x_fu_62_p2 = (32'd0 - vx);

assign xx_ph_fu_108_p3 = ((tmp_fu_50_p3[0:0] == 1'b1) ? x_fu_62_p2 : vx);

assign y_fu_68_p2 = ($signed(33'd0) - $signed(sext_ln29_fu_58_p1));

assign yy_ph_fu_99_p3 = ((tmp_fu_50_p3[0:0] == 1'b1) ? y_fu_68_p2 : sext_ln29_fu_58_p1);

assign z_1_ph_fu_90_p3 = ((tmp_fu_50_p3[0:0] == 1'b1) ? z_fu_82_p3 : 32'd0);

assign z_fu_82_p3 = ((tmp_50_fu_74_p3[0:0] == 1'b1) ? 32'd2608337583 : 32'd1686629713);

endmodule                          
