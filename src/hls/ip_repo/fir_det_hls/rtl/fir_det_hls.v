                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir_det_hls_fir_det_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.265500,HLS_SYN_LAT=212,HLS_SYN_TPT=none,HLS_SYN_MEM=9,HLS_SYN_DSP=0,HLS_SYN_FF=1416,HLS_SYN_LUT=2488,HLS_VERSION=2024_2}" *)

module fir_det_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        samples,
        result
);

parameter    ap_ST_fsm_state1 = 9'd1;
parameter    ap_ST_fsm_state2 = 9'd2;
parameter    ap_ST_fsm_state3 = 9'd4;
parameter    ap_ST_fsm_state4 = 9'd8;
parameter    ap_ST_fsm_state5 = 9'd16;
parameter    ap_ST_fsm_state6 = 9'd32;
parameter    ap_ST_fsm_state7 = 9'd64;
parameter    ap_ST_fsm_state8 = 9'd128;
parameter    ap_ST_fsm_state9 = 9'd256;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [383:0] samples;
output  [384:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[384:0] result;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [8:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [8:0] wr;
reg    history_ce0;
wire   [191:0] history_q0;
wire   [8:0] history_address1;
reg   [31:0] count;
reg   [31:0] next_r;
reg   [2:0] phase;
reg   [8:0] wr_load_reg_969;
reg   [31:0] count_load_reg_975;
wire   [0:0] icmp_ln38_fu_203_p2;
reg   [0:0] icmp_ln38_reg_981;
wire   [4:0] zext_ln58_2_cast_fu_217_p3;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_idle;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6_ap_vld;
wire   [52:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7_ap_vld;
wire   [8:0] grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0;
wire    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0;
reg    grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln37_fu_190_p1;
wire   [8:0] add_ln60_fu_899_p2;
wire    ap_CS_fsm_state9;
wire   [31:0] add_ln60_1_fu_910_p2;
wire   [31:0] add_ln58_fu_249_p2;
wire   [2:0] trunc_ln58_fu_889_p1;
wire    ap_CS_fsm_state4;
reg   [384:0] result_preg;
wire   [384:0] tmp_8_fu_880_p3;
reg    history_we1_local;
wire   [191:0] trunc_ln67_fu_181_p1;
reg    history_ce1_local;
wire   [3:0] zext_ln58_fu_213_p1;
wire   [4:0] mul_ln58_fu_229_p0;
wire   [6:0] mul_ln58_fu_229_p1;
wire   [10:0] mul_ln58_fu_229_p2;
wire   [2:0] tmp_10_fu_235_p4;
wire   [31:0] zext_ln58_1_fu_245_p1;
wire   [3:0] grp_fu_261_p1;
wire   [52:0] add_ln55_fu_291_p2;
wire   [7:0] tmp_1_fu_307_p4;
wire   [30:0] trunc_ln1_fu_297_p4;
wire   [0:0] icmp_ln55_fu_317_p2;
wire   [0:0] icmp_ln55_1_fu_323_p2;
wire   [0:0] or_ln55_fu_347_p2;
wire   [23:0] select_ln55_fu_339_p3;
wire   [23:0] s_fu_329_p4;
wire   [52:0] add_ln55_1_fu_361_p2;
wire   [7:0] tmp_2_fu_377_p4;
wire   [30:0] trunc_ln55_2_fu_367_p4;
wire   [0:0] icmp_ln55_2_fu_387_p2;
wire   [0:0] icmp_ln55_3_fu_393_p2;
wire   [0:0] or_ln55_1_fu_417_p2;
wire   [23:0] select_ln55_2_fu_409_p3;
wire   [23:0] s_2_fu_399_p4;
wire   [52:0] add_ln55_2_fu_431_p2;
wire   [7:0] tmp_3_fu_447_p4;
wire   [30:0] trunc_ln55_4_fu_437_p4;
wire   [0:0] icmp_ln55_4_fu_457_p2;
wire   [0:0] icmp_ln55_5_fu_463_p2;
wire   [0:0] or_ln55_2_fu_487_p2;
wire   [23:0] select_ln55_4_fu_479_p3;
wire   [23:0] s_4_fu_469_p4;
wire   [52:0] add_ln55_3_fu_501_p2;
wire   [7:0] tmp_4_fu_517_p4;
wire   [30:0] trunc_ln55_6_fu_507_p4;
wire   [0:0] icmp_ln55_6_fu_527_p2;
wire   [0:0] icmp_ln55_7_fu_533_p2;
wire   [0:0] or_ln55_3_fu_557_p2;
wire   [23:0] select_ln55_6_fu_549_p3;
wire   [23:0] s_6_fu_539_p4;
wire   [52:0] add_ln55_4_fu_571_p2;
wire   [7:0] tmp_5_fu_587_p4;
wire   [30:0] trunc_ln55_8_fu_577_p4;
wire   [0:0] icmp_ln55_8_fu_597_p2;
wire   [0:0] icmp_ln55_9_fu_603_p2;
wire   [0:0] or_ln55_4_fu_627_p2;
wire   [23:0] select_ln55_8_fu_619_p3;
wire   [23:0] s_8_fu_609_p4;
wire   [52:0] add_ln55_5_fu_641_p2;
wire   [7:0] tmp_6_fu_657_p4;
wire   [30:0] trunc_ln55_s_fu_647_p4;
wire   [0:0] icmp_ln55_10_fu_667_p2;
wire   [0:0] icmp_ln55_11_fu_673_p2;
wire   [0:0] or_ln55_5_fu_697_p2;
wire   [23:0] select_ln55_10_fu_689_p3;
wire   [23:0] s_10_fu_679_p4;
wire   [52:0] add_ln55_6_fu_711_p2;
wire   [7:0] tmp_7_fu_727_p4;
wire   [30:0] trunc_ln55_1_fu_717_p4;
wire   [0:0] icmp_ln55_12_fu_737_p2;
wire   [0:0] icmp_ln55_13_fu_743_p2;
wire   [0:0] or_ln55_6_fu_767_p2;
wire   [23:0] select_ln55_12_fu_759_p3;
wire   [23:0] s_12_fu_749_p4;
wire   [52:0] add_ln55_7_fu_781_p2;
wire   [7:0] tmp_9_fu_797_p4;
wire   [30:0] trunc_ln55_3_fu_787_p4;
wire   [0:0] icmp_ln55_14_fu_807_p2;
wire   [0:0] icmp_ln55_15_fu_813_p2;
wire   [0:0] or_ln55_7_fu_837_p2;
wire   [23:0] select_ln55_14_fu_829_p3;
wire   [23:0] s_14_fu_819_p4;
wire   [23:0] s_15_fu_843_p3;
wire   [23:0] s_13_fu_773_p3;
wire   [23:0] s_11_fu_703_p3;
wire   [23:0] s_9_fu_633_p3;
wire   [23:0] s_7_fu_563_p3;
wire   [23:0] s_5_fu_493_p3;
wire   [23:0] s_3_fu_423_p3;
wire   [23:0] s_1_fu_353_p3;
wire   [191:0] tmp_fu_851_p9;
wire   [0:0] icmp_ln57_fu_871_p2;
wire   [383:0] zext_ln57_fu_876_p1;
wire   [2:0] grp_fu_261_p2;
reg    grp_fu_261_ap_start;
wire    grp_fu_261_ap_done;
wire    grp_fu_261_ce;
reg   [8:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire   [10:0] mul_ln58_fu_229_p00;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 9'd1;
#0 wr = 9'd0;
#0 count = 32'd0;
#0 next_r = 32'd0;
#0 phase = 3'd0;
#0 grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg = 1'b0;
#0 result_preg = 385'd0;
end

fir_det_hls_history_RAM_S2P_BRAM_1R1W #(
    .DataWidth( 192 ),
    .AddressRange( 512 ),
    .AddressWidth( 9 ))
history_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0),
    .ce0(history_ce0),
    .q0(history_q0),
    .address1(history_address1),
    .ce1(history_ce1_local),
    .we1(history_we1_local),
    .d1(trunc_ln67_fu_181_p1)
);

fir_det_hls_fir_det_hls_Pipeline_VITIS_LOOP_45_2 grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start),
    .ap_done(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done),
    .ap_idle(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_idle),
    .ap_ready(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready),
    .wr_load(wr_load_reg_969),
    .zext_ln45(phase),
    .p_out(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out),
    .p_out_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out_ap_vld),
    .p_out1(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1),
    .p_out1_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1_ap_vld),
    .p_out2(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2),
    .p_out2_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2_ap_vld),
    .p_out3(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3),
    .p_out3_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3_ap_vld),
    .p_out4(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4),
    .p_out4_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4_ap_vld),
    .p_out5(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5),
    .p_out5_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5_ap_vld),
    .p_out6(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6),
    .p_out6_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6_ap_vld),
    .p_out7(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7),
    .p_out7_ap_vld(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7_ap_vld),
    .history_address0(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_address0),
    .history_ce0(grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0),
    .history_q0(history_q0)
);

fir_det_hls_mul_5ns_7ns_11_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 5 ),
    .din1_WIDTH( 7 ),
    .dout_WIDTH( 11 ))
mul_5ns_7ns_11_1_1_U22(
    .din0(mul_ln58_fu_229_p0),
    .din1(mul_ln58_fu_229_p1),
    .dout(mul_ln58_fu_229_p2)
);

fir_det_hls_urem_5ns_4ns_3_9_seq_1 #(
    .ID( 1 ),
    .NUM_STAGE( 9 ),
    .din0_WIDTH( 5 ),
    .din1_WIDTH( 4 ),
    .dout_WIDTH( 3 ))
urem_5ns_4ns_3_9_seq_1_U23(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .start(grp_fu_261_ap_start),
    .done(grp_fu_261_ap_done),
    .din0(zext_ln58_2_cast_fu_217_p3),
    .din1(grp_fu_261_p1),
    .ce(grp_fu_261_ce),
    .dout(grp_fu_261_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        count <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state9)) begin
            count <= add_ln60_1_fu_910_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= 1'b1;
        end else if ((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_ready == 1'b1)) begin
            grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        next_r <= 32'd0;
    end else begin
        if (((icmp_ln38_fu_203_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            next_r <= add_ln58_fu_249_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        phase <= 3'd0;
    end else begin
        if (((icmp_ln38_reg_981 == 1'd1) & (1'b1 == ap_CS_fsm_state9))) begin
            phase <= trunc_ln58_fu_889_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
                result_preg[0] <= 1'b0;
        result_preg[1] <= 1'b0;
        result_preg[2] <= 1'b0;
        result_preg[3] <= 1'b0;
        result_preg[4] <= 1'b0;
        result_preg[5] <= 1'b0;
        result_preg[6] <= 1'b0;
        result_preg[7] <= 1'b0;
        result_preg[8] <= 1'b0;
        result_preg[9] <= 1'b0;
        result_preg[10] <= 1'b0;
        result_preg[11] <= 1'b0;
        result_preg[12] <= 1'b0;
        result_preg[13] <= 1'b0;
        result_preg[14] <= 1'b0;
        result_preg[15] <= 1'b0;
        result_preg[16] <= 1'b0;
        result_preg[17] <= 1'b0;
        result_preg[18] <= 1'b0;
        result_preg[19] <= 1'b0;
        result_preg[20] <= 1'b0;
        result_preg[21] <= 1'b0;
        result_preg[22] <= 1'b0;
        result_preg[23] <= 1'b0;
        result_preg[24] <= 1'b0;
        result_preg[25] <= 1'b0;
        result_preg[26] <= 1'b0;
        result_preg[27] <= 1'b0;
        result_preg[28] <= 1'b0;
        result_preg[29] <= 1'b0;
        result_preg[30] <= 1'b0;
        result_preg[31] <= 1'b0;
        result_preg[32] <= 1'b0;
        result_preg[33] <= 1'b0;
        result_preg[34] <= 1'b0;
        result_preg[35] <= 1'b0;
        result_preg[36] <= 1'b0;
        result_preg[37] <= 1'b0;
        result_preg[38] <= 1'b0;
        result_preg[39] <= 1'b0;
        result_preg[40] <= 1'b0;
        result_preg[41] <= 1'b0;
        result_preg[42] <= 1'b0;
        result_preg[43] <= 1'b0;
        result_preg[44] <= 1'b0;
        result_preg[45] <= 1'b0;
        result_preg[46] <= 1'b0;
        result_preg[47] <= 1'b0;
        result_preg[48] <= 1'b0;
        result_preg[49] <= 1'b0;
        result_preg[50] <= 1'b0;
        result_preg[51] <= 1'b0;
        result_preg[52] <= 1'b0;
        result_preg[53] <= 1'b0;
        result_preg[54] <= 1'b0;
        result_preg[55] <= 1'b0;
        result_preg[56] <= 1'b0;
        result_preg[57] <= 1'b0;
        result_preg[58] <= 1'b0;
        result_preg[59] <= 1'b0;
        result_preg[60] <= 1'b0;
        result_preg[61] <= 1'b0;
        result_preg[62] <= 1'b0;
        result_preg[63] <= 1'b0;
        result_preg[64] <= 1'b0;
        result_preg[65] <= 1'b0;
        result_preg[66] <= 1'b0;
        result_preg[67] <= 1'b0;
        result_preg[68] <= 1'b0;
        result_preg[69] <= 1'b0;
        result_preg[70] <= 1'b0;
        result_preg[71] <= 1'b0;
        result_preg[72] <= 1'b0;
        result_preg[73] <= 1'b0;
        result_preg[74] <= 1'b0;
        result_preg[75] <= 1'b0;
        result_preg[76] <= 1'b0;
        result_preg[77] <= 1'b0;
        result_preg[78] <= 1'b0;
        result_preg[79] <= 1'b0;
        result_preg[80] <= 1'b0;
        result_preg[81] <= 1'b0;
        result_preg[82] <= 1'b0;
        result_preg[83] <= 1'b0;
        result_preg[84] <= 1'b0;
        result_preg[85] <= 1'b0;
        result_preg[86] <= 1'b0;
        result_preg[87] <= 1'b0;
        result_preg[88] <= 1'b0;
        result_preg[89] <= 1'b0;
        result_preg[90] <= 1'b0;
        result_preg[91] <= 1'b0;
        result_preg[92] <= 1'b0;
        result_preg[93] <= 1'b0;
        result_preg[94] <= 1'b0;
        result_preg[95] <= 1'b0;
        result_preg[96] <= 1'b0;
        result_preg[97] <= 1'b0;
        result_preg[98] <= 1'b0;
        result_preg[99] <= 1'b0;
        result_preg[100] <= 1'b0;
        result_preg[101] <= 1'b0;
        result_preg[102] <= 1'b0;
        result_preg[103] <= 1'b0;
        result_preg[104] <= 1'b0;
        result_preg[105] <= 1'b0;
        result_preg[106] <= 1'b0;
        result_preg[107] <= 1'b0;
        result_preg[108] <= 1'b0;
        result_preg[109] <= 1'b0;
        result_preg[110] <= 1'b0;
        result_preg[111] <= 1'b0;
        result_preg[112] <= 1'b0;
        result_preg[113] <= 1'b0;
        result_preg[114] <= 1'b0;
        result_preg[115] <= 1'b0;
        result_preg[116] <= 1'b0;
        result_preg[117] <= 1'b0;
        result_preg[118] <= 1'b0;
        result_preg[119] <= 1'b0;
        result_preg[120] <= 1'b0;
        result_preg[121] <= 1'b0;
        result_preg[122] <= 1'b0;
        result_preg[123] <= 1'b0;
        result_preg[124] <= 1'b0;
        result_preg[125] <= 1'b0;
        result_preg[126] <= 1'b0;
        result_preg[127] <= 1'b0;
        result_preg[128] <= 1'b0;
        result_preg[129] <= 1'b0;
        result_preg[130] <= 1'b0;
        result_preg[131] <= 1'b0;
        result_preg[132] <= 1'b0;
        result_preg[133] <= 1'b0;
        result_preg[134] <= 1'b0;
        result_preg[135] <= 1'b0;
        result_preg[136] <= 1'b0;
        result_preg[137] <= 1'b0;
        result_preg[138] <= 1'b0;
        result_preg[139] <= 1'b0;
        result_preg[140] <= 1'b0;
        result_preg[141] <= 1'b0;
        result_preg[142] <= 1'b0;
        result_preg[143] <= 1'b0;
        result_preg[144] <= 1'b0;
        result_preg[145] <= 1'b0;
        result_preg[146] <= 1'b0;
        result_preg[147] <= 1'b0;
        result_preg[148] <= 1'b0;
        result_preg[149] <= 1'b0;
        result_preg[150] <= 1'b0;
        result_preg[151] <= 1'b0;
        result_preg[152] <= 1'b0;
        result_preg[153] <= 1'b0;
        result_preg[154] <= 1'b0;
        result_preg[155] <= 1'b0;
        result_preg[156] <= 1'b0;
        result_preg[157] <= 1'b0;
        result_preg[158] <= 1'b0;
        result_preg[159] <= 1'b0;
        result_preg[160] <= 1'b0;
        result_preg[161] <= 1'b0;
        result_preg[162] <= 1'b0;
        result_preg[163] <= 1'b0;
        result_preg[164] <= 1'b0;
        result_preg[165] <= 1'b0;
        result_preg[166] <= 1'b0;
        result_preg[167] <= 1'b0;
        result_preg[168] <= 1'b0;
        result_preg[169] <= 1'b0;
        result_preg[170] <= 1'b0;
        result_preg[171] <= 1'b0;
        result_preg[172] <= 1'b0;
        result_preg[173] <= 1'b0;
        result_preg[174] <= 1'b0;
        result_preg[175] <= 1'b0;
        result_preg[176] <= 1'b0;
        result_preg[177] <= 1'b0;
        result_preg[178] <= 1'b0;
        result_preg[179] <= 1'b0;
        result_preg[180] <= 1'b0;
        result_preg[181] <= 1'b0;
        result_preg[182] <= 1'b0;
        result_preg[183] <= 1'b0;
        result_preg[184] <= 1'b0;
        result_preg[185] <= 1'b0;
        result_preg[186] <= 1'b0;
        result_preg[187] <= 1'b0;
        result_preg[188] <= 1'b0;
        result_preg[189] <= 1'b0;
        result_preg[190] <= 1'b0;
        result_preg[191] <= 1'b0;
        result_preg[384] <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
                        result_preg[191 : 0] <= tmp_8_fu_880_p3[191 : 0];
            result_preg[384] <= tmp_8_fu_880_p3[384];
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                        result_preg[0] <= 1'b0;
            result_preg[1] <= 1'b0;
            result_preg[2] <= 1'b0;
            result_preg[3] <= 1'b0;
            result_preg[4] <= 1'b0;
            result_preg[5] <= 1'b0;
            result_preg[6] <= 1'b0;
            result_preg[7] <= 1'b0;
            result_preg[8] <= 1'b0;
            result_preg[9] <= 1'b0;
            result_preg[10] <= 1'b0;
            result_preg[11] <= 1'b0;
            result_preg[12] <= 1'b0;
            result_preg[13] <= 1'b0;
            result_preg[14] <= 1'b0;
            result_preg[15] <= 1'b0;
            result_preg[16] <= 1'b0;
            result_preg[17] <= 1'b0;
            result_preg[18] <= 1'b0;
            result_preg[19] <= 1'b0;
            result_preg[20] <= 1'b0;
            result_preg[21] <= 1'b0;
            result_preg[22] <= 1'b0;
            result_preg[23] <= 1'b0;
            result_preg[24] <= 1'b0;
            result_preg[25] <= 1'b0;
            result_preg[26] <= 1'b0;
            result_preg[27] <= 1'b0;
            result_preg[28] <= 1'b0;
            result_preg[29] <= 1'b0;
            result_preg[30] <= 1'b0;
            result_preg[31] <= 1'b0;
            result_preg[32] <= 1'b0;
            result_preg[33] <= 1'b0;
            result_preg[34] <= 1'b0;
            result_preg[35] <= 1'b0;
            result_preg[36] <= 1'b0;
            result_preg[37] <= 1'b0;
            result_preg[38] <= 1'b0;
            result_preg[39] <= 1'b0;
            result_preg[40] <= 1'b0;
            result_preg[41] <= 1'b0;
            result_preg[42] <= 1'b0;
            result_preg[43] <= 1'b0;
            result_preg[44] <= 1'b0;
            result_preg[45] <= 1'b0;
            result_preg[46] <= 1'b0;
            result_preg[47] <= 1'b0;
            result_preg[48] <= 1'b0;
            result_preg[49] <= 1'b0;
            result_preg[50] <= 1'b0;
            result_preg[51] <= 1'b0;
            result_preg[52] <= 1'b0;
            result_preg[53] <= 1'b0;
            result_preg[54] <= 1'b0;
            result_preg[55] <= 1'b0;
            result_preg[56] <= 1'b0;
            result_preg[57] <= 1'b0;
            result_preg[58] <= 1'b0;
            result_preg[59] <= 1'b0;
            result_preg[60] <= 1'b0;
            result_preg[61] <= 1'b0;
            result_preg[62] <= 1'b0;
            result_preg[63] <= 1'b0;
            result_preg[64] <= 1'b0;
            result_preg[65] <= 1'b0;
            result_preg[66] <= 1'b0;
            result_preg[67] <= 1'b0;
            result_preg[68] <= 1'b0;
            result_preg[69] <= 1'b0;
            result_preg[70] <= 1'b0;
            result_preg[71] <= 1'b0;
            result_preg[72] <= 1'b0;
            result_preg[73] <= 1'b0;
            result_preg[74] <= 1'b0;
            result_preg[75] <= 1'b0;
            result_preg[76] <= 1'b0;
            result_preg[77] <= 1'b0;
            result_preg[78] <= 1'b0;
            result_preg[79] <= 1'b0;
            result_preg[80] <= 1'b0;
            result_preg[81] <= 1'b0;
            result_preg[82] <= 1'b0;
            result_preg[83] <= 1'b0;
            result_preg[84] <= 1'b0;
            result_preg[85] <= 1'b0;
            result_preg[86] <= 1'b0;
            result_preg[87] <= 1'b0;
            result_preg[88] <= 1'b0;
            result_preg[89] <= 1'b0;
            result_preg[90] <= 1'b0;
            result_preg[91] <= 1'b0;
            result_preg[92] <= 1'b0;
            result_preg[93] <= 1'b0;
            result_preg[94] <= 1'b0;
            result_preg[95] <= 1'b0;
            result_preg[96] <= 1'b0;
            result_preg[97] <= 1'b0;
            result_preg[98] <= 1'b0;
            result_preg[99] <= 1'b0;
            result_preg[100] <= 1'b0;
            result_preg[101] <= 1'b0;
            result_preg[102] <= 1'b0;
            result_preg[103] <= 1'b0;
            result_preg[104] <= 1'b0;
            result_preg[105] <= 1'b0;
            result_preg[106] <= 1'b0;
            result_preg[107] <= 1'b0;
            result_preg[108] <= 1'b0;
            result_preg[109] <= 1'b0;
            result_preg[110] <= 1'b0;
            result_preg[111] <= 1'b0;
            result_preg[112] <= 1'b0;
            result_preg[113] <= 1'b0;
            result_preg[114] <= 1'b0;
            result_preg[115] <= 1'b0;
            result_preg[116] <= 1'b0;
            result_preg[117] <= 1'b0;
            result_preg[118] <= 1'b0;
            result_preg[119] <= 1'b0;
            result_preg[120] <= 1'b0;
            result_preg[121] <= 1'b0;
            result_preg[122] <= 1'b0;
            result_preg[123] <= 1'b0;
            result_preg[124] <= 1'b0;
            result_preg[125] <= 1'b0;
            result_preg[126] <= 1'b0;
            result_preg[127] <= 1'b0;
            result_preg[128] <= 1'b0;
            result_preg[129] <= 1'b0;
            result_preg[130] <= 1'b0;
            result_preg[131] <= 1'b0;
            result_preg[132] <= 1'b0;
            result_preg[133] <= 1'b0;
            result_preg[134] <= 1'b0;
            result_preg[135] <= 1'b0;
            result_preg[136] <= 1'b0;
            result_preg[137] <= 1'b0;
            result_preg[138] <= 1'b0;
            result_preg[139] <= 1'b0;
            result_preg[140] <= 1'b0;
            result_preg[141] <= 1'b0;
            result_preg[142] <= 1'b0;
            result_preg[143] <= 1'b0;
            result_preg[144] <= 1'b0;
            result_preg[145] <= 1'b0;
            result_preg[146] <= 1'b0;
            result_preg[147] <= 1'b0;
            result_preg[148] <= 1'b0;
            result_preg[149] <= 1'b0;
            result_preg[150] <= 1'b0;
            result_preg[151] <= 1'b0;
            result_preg[152] <= 1'b0;
            result_preg[153] <= 1'b0;
            result_preg[154] <= 1'b0;
            result_preg[155] <= 1'b0;
            result_preg[156] <= 1'b0;
            result_preg[157] <= 1'b0;
            result_preg[158] <= 1'b0;
            result_preg[159] <= 1'b0;
            result_preg[160] <= 1'b0;
            result_preg[161] <= 1'b0;
            result_preg[162] <= 1'b0;
            result_preg[163] <= 1'b0;
            result_preg[164] <= 1'b0;
            result_preg[165] <= 1'b0;
            result_preg[166] <= 1'b0;
            result_preg[167] <= 1'b0;
            result_preg[168] <= 1'b0;
            result_preg[169] <= 1'b0;
            result_preg[170] <= 1'b0;
            result_preg[171] <= 1'b0;
            result_preg[172] <= 1'b0;
            result_preg[173] <= 1'b0;
            result_preg[174] <= 1'b0;
            result_preg[175] <= 1'b0;
            result_preg[176] <= 1'b0;
            result_preg[177] <= 1'b0;
            result_preg[178] <= 1'b0;
            result_preg[179] <= 1'b0;
            result_preg[180] <= 1'b0;
            result_preg[181] <= 1'b0;
            result_preg[182] <= 1'b0;
            result_preg[183] <= 1'b0;
            result_preg[184] <= 1'b0;
            result_preg[185] <= 1'b0;
            result_preg[186] <= 1'b0;
            result_preg[187] <= 1'b0;
            result_preg[188] <= 1'b0;
            result_preg[189] <= 1'b0;
            result_preg[190] <= 1'b0;
            result_preg[191] <= 1'b0;
            result_preg[384] <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        wr <= 9'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state9)) begin
            wr <= add_ln60_fu_899_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        count_load_reg_975 <= count;
        icmp_ln38_reg_981 <= icmp_ln38_fu_203_p2;
        wr_load_reg_969 <= wr;
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
    if ((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
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
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln38_fu_203_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        grp_fu_261_ap_start = 1'b1;
    end else begin
        grp_fu_261_ap_start = 1'b0;
    end
end

assign grp_fu_261_ce = 1'b1;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        history_ce0 = grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_history_ce0;
    end else begin
        history_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        history_ce1_local = 1'b1;
    end else begin
        history_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        history_we1_local = 1'b1;
    end else begin
        history_we1_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        result = tmp_8_fu_880_p3;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        result = 385'd0;
    end else begin
        result = result_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((icmp_ln38_fu_203_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else if (((icmp_ln38_fu_203_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
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
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln55_1_fu_361_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out6 + 53'd2097152);

assign add_ln55_2_fu_431_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out5 + 53'd2097152);

assign add_ln55_3_fu_501_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out4 + 53'd2097152);

assign add_ln55_4_fu_571_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out3 + 53'd2097152);

assign add_ln55_5_fu_641_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out2 + 53'd2097152);

assign add_ln55_6_fu_711_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out1 + 53'd2097152);

assign add_ln55_7_fu_781_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out + 53'd2097152);

assign add_ln55_fu_291_p2 = (grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_p_out7 + 53'd2097152);

assign add_ln58_fu_249_p2 = (count + zext_ln58_1_fu_245_p1);

assign add_ln60_1_fu_910_p2 = (count_load_reg_975 + 32'd1);

assign add_ln60_fu_899_p2 = (wr_load_reg_969 + 9'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start = grp_fir_det_hls_Pipeline_VITIS_LOOP_45_2_fu_163_ap_start_reg;

assign grp_fu_261_p1 = 5'd5;

assign history_address1 = zext_ln37_fu_190_p1;

assign icmp_ln38_fu_203_p2 = ((count == next_r) ? 1'b1 : 1'b0);

assign icmp_ln55_10_fu_667_p2 = (($signed(tmp_6_fu_657_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_11_fu_673_p2 = (($signed(trunc_ln55_s_fu_647_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_12_fu_737_p2 = (($signed(tmp_7_fu_727_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_13_fu_743_p2 = (($signed(trunc_ln55_1_fu_717_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_14_fu_807_p2 = (($signed(tmp_9_fu_797_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_15_fu_813_p2 = (($signed(trunc_ln55_3_fu_787_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_1_fu_323_p2 = (($signed(trunc_ln1_fu_297_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_2_fu_387_p2 = (($signed(tmp_2_fu_377_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_3_fu_393_p2 = (($signed(trunc_ln55_2_fu_367_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_4_fu_457_p2 = (($signed(tmp_3_fu_447_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_5_fu_463_p2 = (($signed(trunc_ln55_4_fu_437_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_6_fu_527_p2 = (($signed(tmp_4_fu_517_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_7_fu_533_p2 = (($signed(trunc_ln55_6_fu_507_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_8_fu_597_p2 = (($signed(tmp_5_fu_587_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_9_fu_603_p2 = (($signed(trunc_ln55_8_fu_577_p4) < $signed(31'd2139095040)) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_317_p2 = (($signed(tmp_1_fu_307_p4) > $signed(8'd0)) ? 1'b1 : 1'b0);

assign icmp_ln57_fu_871_p2 = ((count_load_reg_975 > 32'd408) ? 1'b1 : 1'b0);

assign mul_ln58_fu_229_p0 = mul_ln58_fu_229_p00;

assign mul_ln58_fu_229_p00 = zext_ln58_2_cast_fu_217_p3;

assign mul_ln58_fu_229_p1 = 11'd52;

assign or_ln55_1_fu_417_p2 = (icmp_ln55_3_fu_393_p2 | icmp_ln55_2_fu_387_p2);

assign or_ln55_2_fu_487_p2 = (icmp_ln55_5_fu_463_p2 | icmp_ln55_4_fu_457_p2);

assign or_ln55_3_fu_557_p2 = (icmp_ln55_7_fu_533_p2 | icmp_ln55_6_fu_527_p2);

assign or_ln55_4_fu_627_p2 = (icmp_ln55_9_fu_603_p2 | icmp_ln55_8_fu_597_p2);

assign or_ln55_5_fu_697_p2 = (icmp_ln55_11_fu_673_p2 | icmp_ln55_10_fu_667_p2);

assign or_ln55_6_fu_767_p2 = (icmp_ln55_13_fu_743_p2 | icmp_ln55_12_fu_737_p2);

assign or_ln55_7_fu_837_p2 = (icmp_ln55_15_fu_813_p2 | icmp_ln55_14_fu_807_p2);

assign or_ln55_fu_347_p2 = (icmp_ln55_fu_317_p2 | icmp_ln55_1_fu_323_p2);

assign s_10_fu_679_p4 = {{add_ln55_5_fu_641_p2[45:22]}};

assign s_11_fu_703_p3 = ((or_ln55_5_fu_697_p2[0:0] == 1'b1) ? select_ln55_10_fu_689_p3 : s_10_fu_679_p4);

assign s_12_fu_749_p4 = {{add_ln55_6_fu_711_p2[45:22]}};

assign s_13_fu_773_p3 = ((or_ln55_6_fu_767_p2[0:0] == 1'b1) ? select_ln55_12_fu_759_p3 : s_12_fu_749_p4);

assign s_14_fu_819_p4 = {{add_ln55_7_fu_781_p2[45:22]}};

assign s_15_fu_843_p3 = ((or_ln55_7_fu_837_p2[0:0] == 1'b1) ? select_ln55_14_fu_829_p3 : s_14_fu_819_p4);

assign s_1_fu_353_p3 = ((or_ln55_fu_347_p2[0:0] == 1'b1) ? select_ln55_fu_339_p3 : s_fu_329_p4);

assign s_2_fu_399_p4 = {{add_ln55_1_fu_361_p2[45:22]}};

assign s_3_fu_423_p3 = ((or_ln55_1_fu_417_p2[0:0] == 1'b1) ? select_ln55_2_fu_409_p3 : s_2_fu_399_p4);

assign s_4_fu_469_p4 = {{add_ln55_2_fu_431_p2[45:22]}};

assign s_5_fu_493_p3 = ((or_ln55_2_fu_487_p2[0:0] == 1'b1) ? select_ln55_4_fu_479_p3 : s_4_fu_469_p4);

assign s_6_fu_539_p4 = {{add_ln55_3_fu_501_p2[45:22]}};

assign s_7_fu_563_p3 = ((or_ln55_3_fu_557_p2[0:0] == 1'b1) ? select_ln55_6_fu_549_p3 : s_6_fu_539_p4);

assign s_8_fu_609_p4 = {{add_ln55_4_fu_571_p2[45:22]}};

assign s_9_fu_633_p3 = ((or_ln55_4_fu_627_p2[0:0] == 1'b1) ? select_ln55_8_fu_619_p3 : s_8_fu_609_p4);

assign s_fu_329_p4 = {{add_ln55_fu_291_p2[45:22]}};

assign select_ln55_10_fu_689_p3 = ((icmp_ln55_10_fu_667_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_12_fu_759_p3 = ((icmp_ln55_12_fu_737_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_14_fu_829_p3 = ((icmp_ln55_14_fu_807_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_2_fu_409_p3 = ((icmp_ln55_2_fu_387_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_4_fu_479_p3 = ((icmp_ln55_4_fu_457_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_6_fu_549_p3 = ((icmp_ln55_6_fu_527_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_8_fu_619_p3 = ((icmp_ln55_8_fu_597_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_fu_339_p3 = ((icmp_ln55_fu_317_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign tmp_10_fu_235_p4 = {{mul_ln58_fu_229_p2[10:8]}};

assign tmp_1_fu_307_p4 = {{add_ln55_fu_291_p2[52:45]}};

assign tmp_2_fu_377_p4 = {{add_ln55_1_fu_361_p2[52:45]}};

assign tmp_3_fu_447_p4 = {{add_ln55_2_fu_431_p2[52:45]}};

assign tmp_4_fu_517_p4 = {{add_ln55_3_fu_501_p2[52:45]}};

assign tmp_5_fu_587_p4 = {{add_ln55_4_fu_571_p2[52:45]}};

assign tmp_6_fu_657_p4 = {{add_ln55_5_fu_641_p2[52:45]}};

assign tmp_7_fu_727_p4 = {{add_ln55_6_fu_711_p2[52:45]}};

assign tmp_8_fu_880_p3 = {{icmp_ln57_fu_871_p2}, {zext_ln57_fu_876_p1}};

assign tmp_9_fu_797_p4 = {{add_ln55_7_fu_781_p2[52:45]}};

assign tmp_fu_851_p9 = {{{{{{{{s_15_fu_843_p3}, {s_13_fu_773_p3}}, {s_11_fu_703_p3}}, {s_9_fu_633_p3}}, {s_7_fu_563_p3}}, {s_5_fu_493_p3}}, {s_3_fu_423_p3}}, {s_1_fu_353_p3}};

assign trunc_ln1_fu_297_p4 = {{add_ln55_fu_291_p2[52:22]}};

assign trunc_ln55_1_fu_717_p4 = {{add_ln55_6_fu_711_p2[52:22]}};

assign trunc_ln55_2_fu_367_p4 = {{add_ln55_1_fu_361_p2[52:22]}};

assign trunc_ln55_3_fu_787_p4 = {{add_ln55_7_fu_781_p2[52:22]}};

assign trunc_ln55_4_fu_437_p4 = {{add_ln55_2_fu_431_p2[52:22]}};

assign trunc_ln55_6_fu_507_p4 = {{add_ln55_3_fu_501_p2[52:22]}};

assign trunc_ln55_8_fu_577_p4 = {{add_ln55_4_fu_571_p2[52:22]}};

assign trunc_ln55_s_fu_647_p4 = {{add_ln55_5_fu_641_p2[52:22]}};

assign trunc_ln58_fu_889_p1 = grp_fu_261_p2[2:0];

assign trunc_ln67_fu_181_p1 = samples[191:0];

assign zext_ln37_fu_190_p1 = wr;

assign zext_ln57_fu_876_p1 = tmp_fu_851_p9;

assign zext_ln58_1_fu_245_p1 = tmp_10_fu_235_p4;

assign zext_ln58_2_cast_fu_217_p3 = {{1'd1}, {zext_ln58_fu_213_p1}};

assign zext_ln58_fu_213_p1 = phase;

always @ (posedge ap_clk) begin
    result_preg[383:192] <= 192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
end

endmodule              
