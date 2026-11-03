                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_79_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        trace_address0,
        trace_ce0,
        trace_q0,
        trace_address1,
        trace_ce1,
        trace_q1,
        weights_address0,
        weights_ce0,
        weights_we0,
        weights_d0,
        grp_udiv_fu_2193_p_din1,
        grp_udiv_fu_2193_p_din2,
        grp_udiv_fu_2193_p_dout0,
        grp_udiv_fu_2193_p_start,
        grp_udiv_fu_2193_p_ready,
        grp_udiv_fu_2193_p_done,
        grp_udiv_fu_2193_p_idle
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [8:0] trace_address0;
output   trace_ce0;
input  [39:0] trace_q0;
output  [8:0] trace_address1;
output   trace_ce1;
input  [39:0] trace_q1;
output  [8:0] weights_address0;
output   weights_ce0;
output   weights_we0;
output  [19:0] weights_d0;
output  [55:0] grp_udiv_fu_2193_p_din1;
output  [41:0] grp_udiv_fu_2193_p_din2;
input  [63:0] grp_udiv_fu_2193_p_dout0;
output   grp_udiv_fu_2193_p_start;
input   grp_udiv_fu_2193_p_ready;
input   grp_udiv_fu_2193_p_done;
input   grp_udiv_fu_2193_p_idle;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [8:0] f_reg_307;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln79_fu_138_p1;
reg   [63:0] zext_ln79_reg_320;
reg   [39:0] trace_load_reg_330;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln81_fu_203_p2;
reg   [0:0] icmp_ln81_reg_345;
wire   [0:0] icmp_ln81_1_fu_209_p2;
reg   [0:0] icmp_ln81_1_reg_350;
wire   [55:0] n_fu_214_p3;
reg   [55:0] n_reg_355;
wire    ap_CS_fsm_state4;
wire   [41:0] zext_ln80_4_fu_242_p1;
reg   [41:0] zext_ln80_4_reg_360;
wire    grp_udiv_fu_112_ap_done;
wire    grp_udiv_fu_112_ap_ready;
reg    grp_udiv_fu_112_ap_start_reg;
wire    ap_CS_fsm_state5;
wire   [0:0] icmp_ln79_fu_126_p2;
wire   [63:0] zext_ln80_fu_166_p1;
wire   [63:0] zext_ln80_2_fu_189_p1;
reg   [8:0] f_1_fu_62;
wire   [8:0] add_ln79_fu_132_p2;
reg    trace_ce0_local;
reg   [8:0] trace_address0_local;
reg    trace_ce1_local;
reg    weights_we0_local;
wire   [19:0] select_ln81_1_fu_291_p3;
reg    weights_ce0_local;
wire   [0:0] icmp_ln80_fu_148_p2;
wire   [8:0] add_ln80_fu_153_p2;
wire   [8:0] select_ln80_fu_158_p3;
wire   [0:0] icmp_ln80_1_fu_171_p2;
wire   [8:0] add_ln80_1_fu_176_p2;
wire   [8:0] select_ln80_1_fu_181_p3;
wire   [5:0] tmp_fu_194_p4;
wire   [40:0] zext_ln80_3_fu_226_p1;
wire   [40:0] add_ln80_2_fu_230_p2;
wire   [40:0] zext_ln80_1_fu_222_p1;
wire   [40:0] d_fu_236_p2;
wire   [0:0] icmp_ln81_2_fu_247_p2;
wire   [0:0] and_ln81_fu_253_p2;
wire   [43:0] tmp_9_fu_263_p4;
wire   [0:0] icmp_ln81_3_fu_273_p2;
wire   [19:0] trunc_ln81_fu_279_p1;
wire   [0:0] and_ln81_1_fu_258_p2;
wire   [19:0] select_ln81_fu_283_p3;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_udiv_fu_112_ap_start_reg = 1'b0;
#0 f_1_fu_62 = 9'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_udiv_fu_112_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_udiv_fu_112_ap_start_reg <= 1'b1;
        end else if ((grp_udiv_fu_112_ap_ready == 1'b1)) begin
            grp_udiv_fu_112_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        f_1_fu_62 <= 9'd0;
    end else if (((icmp_ln79_fu_126_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        f_1_fu_62 <= add_ln79_fu_132_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        f_reg_307 <= f_1_fu_62;
        zext_ln79_reg_320[8 : 0] <= zext_ln79_fu_138_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln81_1_reg_350 <= icmp_ln81_1_fu_209_p2;
        icmp_ln81_reg_345 <= icmp_ln81_fu_203_p2;
        trace_load_reg_330 <= trace_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        n_reg_355[55 : 16] <= n_fu_214_p3[55 : 16];
        zext_ln80_4_reg_360[40 : 0] <= zext_ln80_4_fu_242_p1[40 : 0];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_udiv_fu_112_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln79_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
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
    if (((icmp_ln79_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        trace_address0_local = zext_ln80_2_fu_189_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        trace_address0_local = zext_ln79_fu_138_p1;
    end else begin
        trace_address0_local = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        trace_ce0_local = 1'b1;
    end else begin
        trace_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        trace_ce1_local = 1'b1;
    end else begin
        trace_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if (((grp_udiv_fu_112_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        weights_ce0_local = 1'b1;
    end else begin
        weights_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((grp_udiv_fu_112_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        weights_we0_local = 1'b1;
    end else begin
        weights_we0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln79_fu_126_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_udiv_fu_112_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln79_fu_132_p2 = (f_1_fu_62 + 9'd1);

assign add_ln80_1_fu_176_p2 = (f_reg_307 + 9'd6);

assign add_ln80_2_fu_230_p2 = (zext_ln80_3_fu_226_p1 + 41'd1);

assign add_ln80_fu_153_p2 = ($signed(f_reg_307) + $signed(9'd506));

assign and_ln81_1_fu_258_p2 = (icmp_ln81_reg_345 & and_ln81_fu_253_p2);

assign and_ln81_fu_253_p2 = (icmp_ln81_2_fu_247_p2 & icmp_ln81_1_reg_350);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign d_fu_236_p2 = (add_ln80_2_fu_230_p2 + zext_ln80_1_fu_222_p1);

assign grp_udiv_fu_112_ap_done = grp_udiv_fu_2193_p_done;

assign grp_udiv_fu_112_ap_ready = grp_udiv_fu_2193_p_ready;

assign grp_udiv_fu_2193_p_din1 = n_reg_355;

assign grp_udiv_fu_2193_p_din2 = zext_ln80_4_reg_360;

assign grp_udiv_fu_2193_p_start = grp_udiv_fu_112_ap_start_reg;

assign icmp_ln79_fu_126_p2 = ((f_1_fu_62 == 9'd266) ? 1'b1 : 1'b0);

assign icmp_ln80_1_fu_171_p2 = ((f_reg_307 > 9'd259) ? 1'b1 : 1'b0);

assign icmp_ln80_fu_148_p2 = ((f_reg_307 < 9'd6) ? 1'b1 : 1'b0);

assign icmp_ln81_1_fu_209_p2 = ((f_reg_307 < 9'd235) ? 1'b1 : 1'b0);

assign icmp_ln81_2_fu_247_p2 = ((grp_udiv_fu_2193_p_dout0 > 64'd40960) ? 1'b1 : 1'b0);

assign icmp_ln81_3_fu_273_p2 = ((tmp_9_fu_263_p4 != 44'd0) ? 1'b1 : 1'b0);

assign icmp_ln81_fu_203_p2 = ((tmp_fu_194_p4 != 6'd0) ? 1'b1 : 1'b0);

assign n_fu_214_p3 = {{trace_load_reg_330}, {16'd0}};

assign select_ln80_1_fu_181_p3 = ((icmp_ln80_1_fu_171_p2[0:0] == 1'b1) ? 9'd265 : add_ln80_1_fu_176_p2);

assign select_ln80_fu_158_p3 = ((icmp_ln80_fu_148_p2[0:0] == 1'b1) ? 9'd0 : add_ln80_fu_153_p2);

assign select_ln81_1_fu_291_p3 = ((and_ln81_1_fu_258_p2[0:0] == 1'b1) ? select_ln81_fu_283_p3 : 20'd0);

assign select_ln81_fu_283_p3 = ((icmp_ln81_3_fu_273_p2[0:0] == 1'b1) ? 20'd1048575 : trunc_ln81_fu_279_p1);

assign tmp_9_fu_263_p4 = {{grp_udiv_fu_2193_p_dout0[63:20]}};

assign tmp_fu_194_p4 = {{f_reg_307[8:3]}};

assign trace_address0 = trace_address0_local;

assign trace_address1 = zext_ln80_fu_166_p1;

assign trace_ce0 = trace_ce0_local;

assign trace_ce1 = trace_ce1_local;

assign trunc_ln81_fu_279_p1 = grp_udiv_fu_2193_p_dout0[19:0];

assign weights_address0 = zext_ln79_reg_320;

assign weights_ce0 = weights_ce0_local;

assign weights_d0 = select_ln81_1_fu_291_p3;

assign weights_we0 = weights_we0_local;

assign zext_ln79_fu_138_p1 = f_1_fu_62;

assign zext_ln80_1_fu_222_p1 = trace_q1;

assign zext_ln80_2_fu_189_p1 = select_ln80_1_fu_181_p3;

assign zext_ln80_3_fu_226_p1 = trace_q0;

assign zext_ln80_4_fu_242_p1 = d_fu_236_p2;

assign zext_ln80_fu_166_p1 = select_ln80_fu_158_p3;

always @ (posedge ap_clk) begin
    zext_ln79_reg_320[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
    n_reg_355[15:0] <= 16'b0000000000000000;
    zext_ln80_4_reg_360[41] <= 1'b0;
end

endmodule                                                            
