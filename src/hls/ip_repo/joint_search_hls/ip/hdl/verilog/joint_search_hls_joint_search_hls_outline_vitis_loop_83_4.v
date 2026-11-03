                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_joint_search_hls_Outline_VITIS_LOOP_83_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        chosen_address0,
        chosen_ce0,
        chosen_we0,
        chosen_d0,
        blocked_address0,
        blocked_ce0,
        blocked_we0,
        blocked_d0,
        blocked_q0,
        blocked_address1,
        blocked_ce1,
        blocked_we1,
        blocked_d1,
        weights_address0,
        weights_ce0,
        weights_q0
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
output  [3:0] chosen_address0;
output   chosen_ce0;
output   chosen_we0;
output  [8:0] chosen_d0;
output  [8:0] blocked_address0;
output   blocked_ce0;
output   blocked_we0;
output  [0:0] blocked_d0;
input  [0:0] blocked_q0;
output  [8:0] blocked_address1;
output   blocked_ce1;
output   blocked_we1;
output  [0:0] blocked_d1;
output  [8:0] weights_address0;
output   weights_ce0;
input  [19:0] weights_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[8:0] blocked_address0;
reg blocked_ce0;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln83_fu_117_p2;
reg   [3:0] add_ln83_reg_196;
wire    ap_CS_fsm_state2;
wire   [8:0] trunc_ln84_fu_130_p1;
reg   [8:0] trunc_ln84_reg_201;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln88_1_fu_157_p2;
reg   [0:0] icmp_ln88_1_reg_209;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_idle;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready;
wire   [8:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0;
wire   [8:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0;
wire   [31:0] grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out;
wire    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out_ap_vld;
reg    grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg;
wire   [0:0] icmp_ln83_fu_111_p2;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln83_fu_123_p1;
wire   [63:0] zext_ln88_1_fu_135_p1;
wire   [63:0] zext_ln88_fu_152_p1;
wire   [0:0] icmp_ln88_fu_140_p2;
wire   [63:0] zext_ln88_2_fu_168_p1;
wire    ap_CS_fsm_state5;
reg   [3:0] s_fu_38;
reg    chosen_we0_local;
reg    chosen_ce0_local;
reg    blocked_we1_local;
reg    blocked_ce1_local;
reg    blocked_we0_local;
reg    blocked_ce0_local;
reg   [8:0] blocked_address0_local;
wire   [8:0] add_ln88_fu_146_p2;
wire   [8:0] add_ln88_1_fu_163_p2;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg = 1'b0;
#0 s_fu_38 = 4'd0;
end

joint_search_hls_joint_search_hls_Pipeline_VITIS_LOOP_84_5 grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start),
    .ap_done(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done),
    .ap_idle(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_idle),
    .ap_ready(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready),
    .blocked_address0(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0),
    .blocked_ce0(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0),
    .blocked_q0(blocked_q0),
    .weights_address0(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0),
    .weights_ce0(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0),
    .weights_q0(weights_q0),
    .bf_out(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out),
    .bf_out_ap_vld(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out_ap_vld)
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
        grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln83_fu_111_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= 1'b1;
        end else if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_ready == 1'b1)) begin
            grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        s_fu_38 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        s_fu_38 <= add_ln83_reg_196;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln83_reg_196 <= add_ln83_fu_117_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        icmp_ln88_1_reg_209 <= icmp_ln88_1_fu_157_p2;
        trunc_ln84_reg_201 <= trunc_ln84_fu_130_p1;
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

always @ (*) begin
    if ((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((icmp_ln83_fu_111_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
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
    if (((icmp_ln83_fu_111_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        blocked_address0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_address0;
    end else begin
        blocked_address0 = blocked_address0_local;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        blocked_address0_local = zext_ln88_2_fu_168_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        blocked_address0_local = zext_ln88_fu_152_p1;
    end else begin
        blocked_address0_local = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        blocked_ce0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_blocked_ce0;
    end else begin
        blocked_ce0 = blocked_ce0_local;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
        blocked_ce0_local = 1'b1;
    end else begin
        blocked_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        blocked_ce1_local = 1'b1;
    end else begin
        blocked_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state4) & (icmp_ln88_fu_140_p2 == 1'd1)) | ((icmp_ln88_1_reg_209 == 1'd1) & (1'b1 == ap_CS_fsm_state5)))) begin
        blocked_we0_local = 1'b1;
    end else begin
        blocked_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        blocked_we1_local = 1'b1;
    end else begin
        blocked_we1_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        chosen_ce0_local = 1'b1;
    end else begin
        chosen_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        chosen_we0_local = 1'b1;
    end else begin
        chosen_we0_local = 1'b0;
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
            if (((icmp_ln83_fu_111_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln83_fu_117_p2 = (s_fu_38 + 4'd1);

assign add_ln88_1_fu_163_p2 = (trunc_ln84_reg_201 + 9'd1);

assign add_ln88_fu_146_p2 = ($signed(trunc_ln84_fu_130_p1) + $signed(9'd511));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign blocked_address1 = zext_ln88_1_fu_135_p1;

assign blocked_ce1 = blocked_ce1_local;

assign blocked_d0 = 1'd1;

assign blocked_d1 = 1'd1;

assign blocked_we0 = blocked_we0_local;

assign blocked_we1 = blocked_we1_local;

assign chosen_address0 = zext_ln83_fu_123_p1;

assign chosen_ce0 = chosen_ce0_local;

assign chosen_d0 = trunc_ln84_fu_130_p1;

assign chosen_we0 = chosen_we0_local;

assign grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_ap_start_reg;

assign icmp_ln83_fu_111_p2 = ((s_fu_38 == 4'd12) ? 1'b1 : 1'b0);

assign icmp_ln88_1_fu_157_p2 = (($signed(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out) < $signed(32'd265)) ? 1'b1 : 1'b0);

assign icmp_ln88_fu_140_p2 = (($signed(grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign trunc_ln84_fu_130_p1 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out[8:0];

assign weights_address0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_address0;

assign weights_ce0 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_weights_ce0;

assign zext_ln83_fu_123_p1 = s_fu_38;

assign zext_ln88_1_fu_135_p1 = grp_joint_search_hls_Pipeline_VITIS_LOOP_84_5_fu_94_bf_out;

assign zext_ln88_2_fu_168_p1 = add_ln88_1_fu_163_p2;

assign zext_ln88_fu_152_p1 = add_ln88_fu_146_p2;

endmodule                                                            
