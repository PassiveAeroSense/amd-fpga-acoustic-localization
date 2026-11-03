                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_evaluate (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        y,
        z,
        obs_address0,
        obs_ce0,
        obs_q0,
        count,
        baseline_two,
        reciprocal_0_0_val,
        reciprocal_0_1_val,
        reciprocal_0_2_val,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] x;
input  [31:0] y;
input  [31:0] z;
output  [10:0] obs_address0;
output   obs_ce0;
input  [77:0] obs_q0;
input  [30:0] count;
input  [0:0] baseline_two;
input  [31:0] reciprocal_0_0_val;
input  [31:0] reciprocal_0_1_val;
input  [31:0] reciprocal_0_2_val;
output  [31:0] ap_return_0;
output  [63:0] ap_return_1;
output  [63:0] ap_return_2;
output  [63:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[31:0] ap_return_0;
reg[63:0] ap_return_1;
reg[63:0] ap_return_2;
reg[63:0] ap_return_3;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg  signed [63:0] sg_0_assign_1_reg_267;
wire    ap_CS_fsm_state2;
reg  signed [63:0] sg_1_assign_1_reg_273;
reg  signed [63:0] sg_2_assign_1_reg_279;
wire   [63:0] grp_fu_118_p2;
reg   [63:0] v1_reg_285;
wire    ap_CS_fsm_state3;
wire   [63:0] v2_fu_122_p2;
reg   [63:0] v2_reg_290;
wire   [31:0] tmp_s_fu_154_p4;
reg   [31:0] tmp_s_reg_295;
wire   [31:0] select_ln55_1_fu_174_p3;
reg   [31:0] select_ln55_1_reg_300;
wire    grp_candidate_score_fu_96_ap_start;
wire    grp_candidate_score_fu_96_ap_done;
wire    grp_candidate_score_fu_96_ap_idle;
wire    grp_candidate_score_fu_96_ap_ready;
wire   [10:0] grp_candidate_score_fu_96_obs_address0;
wire    grp_candidate_score_fu_96_obs_ce0;
wire   [63:0] grp_candidate_score_fu_96_ap_return_0;
wire   [63:0] grp_candidate_score_fu_96_ap_return_1;
wire   [63:0] grp_candidate_score_fu_96_ap_return_2;
reg    grp_candidate_score_fu_96_ap_start_reg;
wire    ap_CS_fsm_state4;
reg  signed [63:0] grp_fu_118_p0;
reg   [31:0] grp_fu_118_p1;
wire   [63:0] zext_ln54_1_fu_138_p1;
wire   [63:0] zext_ln54_fu_182_p1;
wire   [31:0] v2_fu_122_p1;
wire   [0:0] icmp_ln55_2_fu_148_p2;
wire   [31:0] tmp_1_fu_164_p4;
wire   [0:0] icmp_ln55_1_fu_192_p2;
wire   [31:0] tmp_fu_197_p4;
wire   [0:0] icmp_ln55_fu_187_p2;
wire   [31:0] select_ln55_fu_207_p3;
wire   [31:0] select_ln55_2_fu_214_p3;
reg   [31:0] ap_return_0_preg;
reg   [63:0] ap_return_1_preg;
reg   [63:0] ap_return_2_preg;
reg   [63:0] ap_return_3_preg;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire   [63:0] v2_fu_122_p10;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 4'd1;
#0 grp_candidate_score_fu_96_ap_start_reg = 1'b0;
#0 ap_return_0_preg = 32'd0;
#0 ap_return_1_preg = 64'd0;
#0 ap_return_2_preg = 64'd0;
#0 ap_return_3_preg = 64'd0;
end

joint_search_hls_candidate_score grp_candidate_score_fu_96(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_candidate_score_fu_96_ap_start),
    .ap_done(grp_candidate_score_fu_96_ap_done),
    .ap_idle(grp_candidate_score_fu_96_ap_idle),
    .ap_ready(grp_candidate_score_fu_96_ap_ready),
    .cx(x),
    .cy(y),
    .cz(z),
    .obs_address0(grp_candidate_score_fu_96_obs_address0),
    .obs_ce0(grp_candidate_score_fu_96_obs_ce0),
    .obs_q0(obs_q0),
    .count(count),
    .baseline_two(baseline_two),
    .ap_return_0(grp_candidate_score_fu_96_ap_return_0),
    .ap_return_1(grp_candidate_score_fu_96_ap_return_1),
    .ap_return_2(grp_candidate_score_fu_96_ap_return_2)
);

joint_search_hls_mul_64s_32ns_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_64s_32ns_64_1_1_U120(
    .din0(grp_fu_118_p0),
    .din1(grp_fu_118_p1),
    .dout(grp_fu_118_p2)
);

joint_search_hls_mul_64s_32ns_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_64s_32ns_64_1_1_U121(
    .din0(sg_2_assign_1_reg_279),
    .din1(v2_fu_122_p1),
    .dout(v2_fu_122_p2)
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
        ap_return_0_preg <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_0_preg <= select_ln55_2_fu_214_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_1_preg <= sg_0_assign_1_reg_267;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_2_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_2_preg <= sg_1_assign_1_reg_273;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_3_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_return_3_preg <= sg_2_assign_1_reg_279;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_candidate_score_fu_96_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_candidate_score_fu_96_ap_start_reg <= 1'b1;
        end else if ((grp_candidate_score_fu_96_ap_ready == 1'b1)) begin
            grp_candidate_score_fu_96_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        select_ln55_1_reg_300 <= select_ln55_1_fu_174_p3;
        tmp_s_reg_295 <= {{v2_fu_122_p2[51:20]}};
        v1_reg_285 <= grp_fu_118_p2;
        v2_reg_290 <= v2_fu_122_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        sg_0_assign_1_reg_267 <= grp_candidate_score_fu_96_ap_return_0;
        sg_1_assign_1_reg_273 <= grp_candidate_score_fu_96_ap_return_1;
        sg_2_assign_1_reg_279 <= grp_candidate_score_fu_96_ap_return_2;
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
    if ((grp_candidate_score_fu_96_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return_0 = select_ln55_2_fu_214_p3;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return_1 = sg_0_assign_1_reg_267;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return_2 = sg_1_assign_1_reg_273;
    end else begin
        ap_return_2 = ap_return_2_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_return_3 = sg_2_assign_1_reg_279;
    end else begin
        ap_return_3 = ap_return_3_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_118_p0 = sg_0_assign_1_reg_267;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_118_p0 = sg_1_assign_1_reg_273;
    end else begin
        grp_fu_118_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_118_p1 = zext_ln54_fu_182_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_118_p1 = zext_ln54_1_fu_138_p1;
    end else begin
        grp_fu_118_p1 = 'bx;
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
            if (((grp_candidate_score_fu_96_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
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

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign grp_candidate_score_fu_96_ap_start = grp_candidate_score_fu_96_ap_start_reg;

assign icmp_ln55_1_fu_192_p2 = (($signed(grp_fu_118_p2) < $signed(v2_reg_290)) ? 1'b1 : 1'b0);

assign icmp_ln55_2_fu_148_p2 = (($signed(grp_fu_118_p2) < $signed(v2_fu_122_p2)) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_187_p2 = (($signed(grp_fu_118_p2) < $signed(v1_reg_285)) ? 1'b1 : 1'b0);

assign obs_address0 = grp_candidate_score_fu_96_obs_address0;

assign obs_ce0 = grp_candidate_score_fu_96_obs_ce0;

assign select_ln55_1_fu_174_p3 = ((icmp_ln55_2_fu_148_p2[0:0] == 1'b1) ? tmp_1_fu_164_p4 : tmp_s_fu_154_p4);

assign select_ln55_2_fu_214_p3 = ((icmp_ln55_fu_187_p2[0:0] == 1'b1) ? select_ln55_fu_207_p3 : select_ln55_1_reg_300);

assign select_ln55_fu_207_p3 = ((icmp_ln55_1_fu_192_p2[0:0] == 1'b1) ? tmp_fu_197_p4 : tmp_s_reg_295);

assign tmp_1_fu_164_p4 = {{grp_fu_118_p2[51:20]}};

assign tmp_fu_197_p4 = {{grp_fu_118_p2[51:20]}};

assign tmp_s_fu_154_p4 = {{v2_fu_122_p2[51:20]}};

assign v2_fu_122_p1 = v2_fu_122_p10;

assign v2_fu_122_p10 = reciprocal_0_2_val;

assign zext_ln54_1_fu_138_p1 = reciprocal_0_1_val;

assign zext_ln54_fu_182_p1 = reciprocal_0_0_val;

endmodule                            
