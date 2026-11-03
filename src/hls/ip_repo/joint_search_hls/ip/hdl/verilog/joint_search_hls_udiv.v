                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

module joint_search_hls_udiv (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        n,
        d,
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
input  [55:0] n;
input  [41:0] d;
output  [63:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[63:0] ap_return;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln18_fu_54_p2;
reg   [0:0] icmp_ln18_reg_81;
wire    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start;
wire    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done;
wire    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_idle;
wire    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready;
wire   [63:0] grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out;
wire    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out_ap_vld;
reg   [63:0] ap_phi_mux_agg_result_0_phi_fu_36_p4;
reg   [63:0] agg_result_0_reg_32;
wire    ap_CS_fsm_state3;
reg    grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [63:0] ap_return_preg;
reg   [2:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 3'd1;
#0 grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg = 1'b0;
#0 ap_return_preg = 64'd0;
end

joint_search_hls_udiv_Pipeline_VITIS_LOOP_19_1 grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start),
    .ap_done(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done),
    .ap_idle(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_idle),
    .ap_ready(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready),
    .zext_ln16(n),
    .conv_i4_cast_cast(d),
    .conv_i4_cast(d),
    .q_out(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out),
    .q_out_ap_vld(grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out_ap_vld)
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
        ap_return_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_return_preg <= ap_phi_mux_agg_result_0_phi_fu_36_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (icmp_ln18_fu_54_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= 1'b1;
        end else if ((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_ready == 1'b1)) begin
            grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln18_reg_81 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        agg_result_0_reg_32 <= grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out;
    end else if (((ap_start == 1'b1) & (icmp_ln18_fu_54_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        agg_result_0_reg_32 <= 64'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln18_reg_81 <= icmp_ln18_fu_54_p2;
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
    if ((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done == 1'b0)) begin
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
    if (((icmp_ln18_reg_81 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_agg_result_0_phi_fu_36_p4 = grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_q_out;
    end else begin
        ap_phi_mux_agg_result_0_phi_fu_36_p4 = agg_result_0_reg_32;
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
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_return = ap_phi_mux_agg_result_0_phi_fu_36_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (icmp_ln18_fu_54_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else if (((ap_start == 1'b1) & (icmp_ln18_fu_54_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start = grp_udiv_Pipeline_VITIS_LOOP_19_1_fu_43_ap_start_reg;

assign icmp_ln18_fu_54_p2 = ((d == 42'd0) ? 1'b1 : 1'b0);

endmodule                        
