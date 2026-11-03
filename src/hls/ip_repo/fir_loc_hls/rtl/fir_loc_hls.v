                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fir_loc_hls_fir_loc_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.978167,HLS_SYN_LAT=196,HLS_SYN_TPT=none,HLS_SYN_MEM=12,HLS_SYN_DSP=0,HLS_SYN_FF=2095,HLS_SYN_LUT=4297,HLS_VERSION=2024_2}" *)

module fir_loc_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        samples,
        result
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

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
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [8:0] wr;
reg    history_ce0;
wire   [383:0] history_q0;
wire   [8:0] history_address1;
reg   [31:0] count;
reg   [31:0] next_r;
reg   [8:0] wr_load_reg_1568;
reg   [31:0] count_load_reg_1574;
wire   [0:0] icmp_ln38_fu_220_p2;
reg   [0:0] icmp_ln38_reg_1580;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_idle;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14_ap_vld;
wire   [51:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15_ap_vld;
wire   [8:0] grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0;
wire    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0;
reg    grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln37_fu_207_p1;
wire   [8:0] add_ln60_fu_1450_p2;
wire    ap_CS_fsm_state4;
wire   [31:0] add_ln60_1_fu_1461_p2;
wire   [31:0] add_ln58_fu_226_p2;
wire   [384:0] tmp_fu_1411_p18;
reg    history_we1_local;
reg    history_ce1_local;
wire   [51:0] add_ln55_fu_286_p2;
wire   [6:0] tmp_1_fu_302_p4;
wire   [29:0] trunc_ln_fu_292_p4;
wire   [0:0] icmp_ln55_fu_312_p2;
wire   [0:0] icmp_ln55_1_fu_318_p2;
wire   [0:0] or_ln55_fu_342_p2;
wire   [23:0] select_ln55_fu_334_p3;
wire   [23:0] s_fu_324_p4;
wire   [51:0] add_ln55_1_fu_356_p2;
wire   [6:0] tmp_2_fu_372_p4;
wire   [29:0] trunc_ln55_2_fu_362_p4;
wire   [0:0] icmp_ln55_2_fu_382_p2;
wire   [0:0] icmp_ln55_3_fu_388_p2;
wire   [0:0] or_ln55_1_fu_412_p2;
wire   [23:0] select_ln55_2_fu_404_p3;
wire   [23:0] s_2_fu_394_p4;
wire   [51:0] add_ln55_2_fu_426_p2;
wire   [6:0] tmp_3_fu_442_p4;
wire   [29:0] trunc_ln55_4_fu_432_p4;
wire   [0:0] icmp_ln55_4_fu_452_p2;
wire   [0:0] icmp_ln55_5_fu_458_p2;
wire   [0:0] or_ln55_2_fu_482_p2;
wire   [23:0] select_ln55_4_fu_474_p3;
wire   [23:0] s_4_fu_464_p4;
wire   [51:0] add_ln55_3_fu_496_p2;
wire   [6:0] tmp_4_fu_512_p4;
wire   [29:0] trunc_ln55_6_fu_502_p4;
wire   [0:0] icmp_ln55_6_fu_522_p2;
wire   [0:0] icmp_ln55_7_fu_528_p2;
wire   [0:0] or_ln55_3_fu_552_p2;
wire   [23:0] select_ln55_6_fu_544_p3;
wire   [23:0] s_6_fu_534_p4;
wire   [51:0] add_ln55_4_fu_566_p2;
wire   [6:0] tmp_5_fu_582_p4;
wire   [29:0] trunc_ln55_8_fu_572_p4;
wire   [0:0] icmp_ln55_8_fu_592_p2;
wire   [0:0] icmp_ln55_9_fu_598_p2;
wire   [0:0] or_ln55_4_fu_622_p2;
wire   [23:0] select_ln55_8_fu_614_p3;
wire   [23:0] s_8_fu_604_p4;
wire   [51:0] add_ln55_5_fu_636_p2;
wire   [6:0] tmp_6_fu_652_p4;
wire   [29:0] trunc_ln55_s_fu_642_p4;
wire   [0:0] icmp_ln55_10_fu_662_p2;
wire   [0:0] icmp_ln55_11_fu_668_p2;
wire   [0:0] or_ln55_5_fu_692_p2;
wire   [23:0] select_ln55_10_fu_684_p3;
wire   [23:0] s_10_fu_674_p4;
wire   [51:0] add_ln55_6_fu_706_p2;
wire   [6:0] tmp_7_fu_722_p4;
wire   [29:0] trunc_ln55_1_fu_712_p4;
wire   [0:0] icmp_ln55_12_fu_732_p2;
wire   [0:0] icmp_ln55_13_fu_738_p2;
wire   [0:0] or_ln55_6_fu_762_p2;
wire   [23:0] select_ln55_12_fu_754_p3;
wire   [23:0] s_12_fu_744_p4;
wire   [51:0] add_ln55_7_fu_776_p2;
wire   [6:0] tmp_8_fu_792_p4;
wire   [29:0] trunc_ln55_3_fu_782_p4;
wire   [0:0] icmp_ln55_14_fu_802_p2;
wire   [0:0] icmp_ln55_15_fu_808_p2;
wire   [0:0] or_ln55_7_fu_832_p2;
wire   [23:0] select_ln55_14_fu_824_p3;
wire   [23:0] s_14_fu_814_p4;
wire   [51:0] add_ln55_8_fu_846_p2;
wire   [6:0] tmp_9_fu_862_p4;
wire   [29:0] trunc_ln55_5_fu_852_p4;
wire   [0:0] icmp_ln55_16_fu_872_p2;
wire   [0:0] icmp_ln55_17_fu_878_p2;
wire   [0:0] or_ln55_8_fu_902_p2;
wire   [23:0] select_ln55_16_fu_894_p3;
wire   [23:0] s_16_fu_884_p4;
wire   [51:0] add_ln55_9_fu_916_p2;
wire   [6:0] tmp_10_fu_932_p4;
wire   [29:0] trunc_ln55_7_fu_922_p4;
wire   [0:0] icmp_ln55_18_fu_942_p2;
wire   [0:0] icmp_ln55_19_fu_948_p2;
wire   [0:0] or_ln55_9_fu_972_p2;
wire   [23:0] select_ln55_18_fu_964_p3;
wire   [23:0] s_18_fu_954_p4;
wire   [51:0] add_ln55_10_fu_986_p2;
wire   [6:0] tmp_11_fu_1002_p4;
wire   [29:0] trunc_ln55_9_fu_992_p4;
wire   [0:0] icmp_ln55_20_fu_1012_p2;
wire   [0:0] icmp_ln55_21_fu_1018_p2;
wire   [0:0] or_ln55_10_fu_1042_p2;
wire   [23:0] select_ln55_20_fu_1034_p3;
wire   [23:0] s_20_fu_1024_p4;
wire   [51:0] add_ln55_11_fu_1056_p2;
wire   [6:0] tmp_12_fu_1072_p4;
wire   [29:0] trunc_ln55_10_fu_1062_p4;
wire   [0:0] icmp_ln55_22_fu_1082_p2;
wire   [0:0] icmp_ln55_23_fu_1088_p2;
wire   [0:0] or_ln55_11_fu_1112_p2;
wire   [23:0] select_ln55_22_fu_1104_p3;
wire   [23:0] s_22_fu_1094_p4;
wire   [51:0] add_ln55_12_fu_1126_p2;
wire   [6:0] tmp_13_fu_1142_p4;
wire   [29:0] trunc_ln55_11_fu_1132_p4;
wire   [0:0] icmp_ln55_24_fu_1152_p2;
wire   [0:0] icmp_ln55_25_fu_1158_p2;
wire   [0:0] or_ln55_12_fu_1182_p2;
wire   [23:0] select_ln55_24_fu_1174_p3;
wire   [23:0] s_24_fu_1164_p4;
wire   [51:0] add_ln55_13_fu_1196_p2;
wire   [6:0] tmp_14_fu_1212_p4;
wire   [29:0] trunc_ln55_12_fu_1202_p4;
wire   [0:0] icmp_ln55_26_fu_1222_p2;
wire   [0:0] icmp_ln55_27_fu_1228_p2;
wire   [0:0] or_ln55_13_fu_1252_p2;
wire   [23:0] select_ln55_26_fu_1244_p3;
wire   [23:0] s_26_fu_1234_p4;
wire   [51:0] add_ln55_14_fu_1266_p2;
wire   [6:0] tmp_15_fu_1282_p4;
wire   [29:0] trunc_ln55_13_fu_1272_p4;
wire   [0:0] icmp_ln55_28_fu_1292_p2;
wire   [0:0] icmp_ln55_29_fu_1298_p2;
wire   [0:0] or_ln55_14_fu_1322_p2;
wire   [23:0] select_ln55_28_fu_1314_p3;
wire   [23:0] s_28_fu_1304_p4;
wire   [51:0] add_ln55_15_fu_1336_p2;
wire   [6:0] tmp_16_fu_1352_p4;
wire   [29:0] trunc_ln55_14_fu_1342_p4;
wire   [0:0] icmp_ln55_30_fu_1362_p2;
wire   [0:0] icmp_ln55_31_fu_1368_p2;
wire   [0:0] or_ln55_15_fu_1392_p2;
wire   [23:0] select_ln55_30_fu_1384_p3;
wire   [23:0] s_30_fu_1374_p4;
wire   [0:0] icmp_ln57_fu_1406_p2;
wire   [23:0] s_31_fu_1398_p3;
wire   [23:0] s_29_fu_1328_p3;
wire   [23:0] s_27_fu_1258_p3;
wire   [23:0] s_25_fu_1188_p3;
wire   [23:0] s_23_fu_1118_p3;
wire   [23:0] s_21_fu_1048_p3;
wire   [23:0] s_19_fu_978_p3;
wire   [23:0] s_17_fu_908_p3;
wire   [23:0] s_15_fu_838_p3;
wire   [23:0] s_13_fu_768_p3;
wire   [23:0] s_11_fu_698_p3;
wire   [23:0] s_9_fu_628_p3;
wire   [23:0] s_7_fu_558_p3;
wire   [23:0] s_5_fu_488_p3;
wire   [23:0] s_3_fu_418_p3;
wire   [23:0] s_1_fu_348_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 4'd1;
#0 wr = 9'd0;
#0 count = 32'd0;
#0 next_r = 32'd0;
#0 grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg = 1'b0;
end

fir_loc_hls_history_RAM_S2P_BRAM_1R1W #(
    .DataWidth( 384 ),
    .AddressRange( 512 ),
    .AddressWidth( 9 ))
history_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0),
    .ce0(history_ce0),
    .q0(history_q0),
    .address1(history_address1),
    .ce1(history_ce1_local),
    .we1(history_we1_local),
    .d1(samples)
);

fir_loc_hls_fir_loc_hls_Pipeline_VITIS_LOOP_45_2 grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start),
    .ap_done(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done),
    .ap_idle(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_idle),
    .ap_ready(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready),
    .wr_load(wr_load_reg_1568),
    .p_out(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out),
    .p_out_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out_ap_vld),
    .p_out1(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1),
    .p_out1_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1_ap_vld),
    .p_out2(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2),
    .p_out2_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2_ap_vld),
    .p_out3(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3),
    .p_out3_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3_ap_vld),
    .p_out4(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4),
    .p_out4_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4_ap_vld),
    .p_out5(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5),
    .p_out5_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5_ap_vld),
    .p_out6(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6),
    .p_out6_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6_ap_vld),
    .p_out7(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7),
    .p_out7_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7_ap_vld),
    .p_out8(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8),
    .p_out8_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8_ap_vld),
    .p_out9(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9),
    .p_out9_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9_ap_vld),
    .p_out10(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10),
    .p_out10_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10_ap_vld),
    .p_out11(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11),
    .p_out11_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11_ap_vld),
    .p_out12(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12),
    .p_out12_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12_ap_vld),
    .p_out13(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13),
    .p_out13_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13_ap_vld),
    .p_out14(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14),
    .p_out14_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14_ap_vld),
    .p_out15(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15),
    .p_out15_ap_vld(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15_ap_vld),
    .history_address0(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_address0),
    .history_ce0(grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0),
    .history_q0(history_q0)
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
        if ((1'b1 == ap_CS_fsm_state4)) begin
            count <= add_ln60_1_fu_1461_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= 1'b1;
        end else if ((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_ready == 1'b1)) begin
            grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        next_r <= 32'd0;
    end else begin
        if (((icmp_ln38_fu_220_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            next_r <= add_ln58_fu_226_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        wr <= 9'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            wr <= add_ln60_fu_1450_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        count_load_reg_1574 <= count;
        icmp_ln38_reg_1580 <= icmp_ln38_fu_220_p2;
        wr_load_reg_1568 <= wr;
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
    if ((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        history_ce0 = grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_history_ce0;
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
    if (((icmp_ln38_reg_1580 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        result = tmp_fu_1411_p18;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        result = 385'd0;
    end else begin
        result = 385'd0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((icmp_ln38_fu_220_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if (((icmp_ln38_fu_220_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln55_10_fu_986_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out5 + 52'd2097152);

assign add_ln55_11_fu_1056_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out4 + 52'd2097152);

assign add_ln55_12_fu_1126_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out3 + 52'd2097152);

assign add_ln55_13_fu_1196_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out2 + 52'd2097152);

assign add_ln55_14_fu_1266_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out1 + 52'd2097152);

assign add_ln55_15_fu_1336_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out + 52'd2097152);

assign add_ln55_1_fu_356_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out14 + 52'd2097152);

assign add_ln55_2_fu_426_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out13 + 52'd2097152);

assign add_ln55_3_fu_496_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out12 + 52'd2097152);

assign add_ln55_4_fu_566_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out11 + 52'd2097152);

assign add_ln55_5_fu_636_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out10 + 52'd2097152);

assign add_ln55_6_fu_706_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out9 + 52'd2097152);

assign add_ln55_7_fu_776_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out8 + 52'd2097152);

assign add_ln55_8_fu_846_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out7 + 52'd2097152);

assign add_ln55_9_fu_916_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out6 + 52'd2097152);

assign add_ln55_fu_286_p2 = (grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_p_out15 + 52'd2097152);

assign add_ln58_fu_226_p2 = (count + 32'd1);

assign add_ln60_1_fu_1461_p2 = (count_load_reg_1574 + 32'd1);

assign add_ln60_fu_1450_p2 = (wr_load_reg_1568 + 9'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start = grp_fir_loc_hls_Pipeline_VITIS_LOOP_45_2_fu_178_ap_start_reg;

assign history_address1 = zext_ln37_fu_207_p1;

assign icmp_ln38_fu_220_p2 = ((count == next_r) ? 1'b1 : 1'b0);

assign icmp_ln55_10_fu_662_p2 = (($signed(tmp_6_fu_652_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_11_fu_668_p2 = (($signed(trunc_ln55_s_fu_642_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_12_fu_732_p2 = (($signed(tmp_7_fu_722_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_13_fu_738_p2 = (($signed(trunc_ln55_1_fu_712_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_14_fu_802_p2 = (($signed(tmp_8_fu_792_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_15_fu_808_p2 = (($signed(trunc_ln55_3_fu_782_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_16_fu_872_p2 = (($signed(tmp_9_fu_862_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_17_fu_878_p2 = (($signed(trunc_ln55_5_fu_852_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_18_fu_942_p2 = (($signed(tmp_10_fu_932_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_19_fu_948_p2 = (($signed(trunc_ln55_7_fu_922_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_1_fu_318_p2 = (($signed(trunc_ln_fu_292_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_20_fu_1012_p2 = (($signed(tmp_11_fu_1002_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_21_fu_1018_p2 = (($signed(trunc_ln55_9_fu_992_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_22_fu_1082_p2 = (($signed(tmp_12_fu_1072_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_23_fu_1088_p2 = (($signed(trunc_ln55_10_fu_1062_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_24_fu_1152_p2 = (($signed(tmp_13_fu_1142_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_25_fu_1158_p2 = (($signed(trunc_ln55_11_fu_1132_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_26_fu_1222_p2 = (($signed(tmp_14_fu_1212_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_27_fu_1228_p2 = (($signed(trunc_ln55_12_fu_1202_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_28_fu_1292_p2 = (($signed(tmp_15_fu_1282_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_29_fu_1298_p2 = (($signed(trunc_ln55_13_fu_1272_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_2_fu_382_p2 = (($signed(tmp_2_fu_372_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_30_fu_1362_p2 = (($signed(tmp_16_fu_1352_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_31_fu_1368_p2 = (($signed(trunc_ln55_14_fu_1342_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_3_fu_388_p2 = (($signed(trunc_ln55_2_fu_362_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_4_fu_452_p2 = (($signed(tmp_3_fu_442_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_5_fu_458_p2 = (($signed(trunc_ln55_4_fu_432_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_6_fu_522_p2 = (($signed(tmp_4_fu_512_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_7_fu_528_p2 = (($signed(trunc_ln55_6_fu_502_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_8_fu_592_p2 = (($signed(tmp_5_fu_582_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln55_9_fu_598_p2 = (($signed(trunc_ln55_8_fu_572_p4) < $signed(30'd1065353216)) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_312_p2 = (($signed(tmp_1_fu_302_p4) > $signed(7'd0)) ? 1'b1 : 1'b0);

assign icmp_ln57_fu_1406_p2 = ((count_load_reg_1574 > 32'd381) ? 1'b1 : 1'b0);

assign or_ln55_10_fu_1042_p2 = (icmp_ln55_21_fu_1018_p2 | icmp_ln55_20_fu_1012_p2);

assign or_ln55_11_fu_1112_p2 = (icmp_ln55_23_fu_1088_p2 | icmp_ln55_22_fu_1082_p2);

assign or_ln55_12_fu_1182_p2 = (icmp_ln55_25_fu_1158_p2 | icmp_ln55_24_fu_1152_p2);

assign or_ln55_13_fu_1252_p2 = (icmp_ln55_27_fu_1228_p2 | icmp_ln55_26_fu_1222_p2);

assign or_ln55_14_fu_1322_p2 = (icmp_ln55_29_fu_1298_p2 | icmp_ln55_28_fu_1292_p2);

assign or_ln55_15_fu_1392_p2 = (icmp_ln55_31_fu_1368_p2 | icmp_ln55_30_fu_1362_p2);

assign or_ln55_1_fu_412_p2 = (icmp_ln55_3_fu_388_p2 | icmp_ln55_2_fu_382_p2);

assign or_ln55_2_fu_482_p2 = (icmp_ln55_5_fu_458_p2 | icmp_ln55_4_fu_452_p2);

assign or_ln55_3_fu_552_p2 = (icmp_ln55_7_fu_528_p2 | icmp_ln55_6_fu_522_p2);

assign or_ln55_4_fu_622_p2 = (icmp_ln55_9_fu_598_p2 | icmp_ln55_8_fu_592_p2);

assign or_ln55_5_fu_692_p2 = (icmp_ln55_11_fu_668_p2 | icmp_ln55_10_fu_662_p2);

assign or_ln55_6_fu_762_p2 = (icmp_ln55_13_fu_738_p2 | icmp_ln55_12_fu_732_p2);

assign or_ln55_7_fu_832_p2 = (icmp_ln55_15_fu_808_p2 | icmp_ln55_14_fu_802_p2);

assign or_ln55_8_fu_902_p2 = (icmp_ln55_17_fu_878_p2 | icmp_ln55_16_fu_872_p2);

assign or_ln55_9_fu_972_p2 = (icmp_ln55_19_fu_948_p2 | icmp_ln55_18_fu_942_p2);

assign or_ln55_fu_342_p2 = (icmp_ln55_fu_312_p2 | icmp_ln55_1_fu_318_p2);

assign s_10_fu_674_p4 = {{add_ln55_5_fu_636_p2[45:22]}};

assign s_11_fu_698_p3 = ((or_ln55_5_fu_692_p2[0:0] == 1'b1) ? select_ln55_10_fu_684_p3 : s_10_fu_674_p4);

assign s_12_fu_744_p4 = {{add_ln55_6_fu_706_p2[45:22]}};

assign s_13_fu_768_p3 = ((or_ln55_6_fu_762_p2[0:0] == 1'b1) ? select_ln55_12_fu_754_p3 : s_12_fu_744_p4);

assign s_14_fu_814_p4 = {{add_ln55_7_fu_776_p2[45:22]}};

assign s_15_fu_838_p3 = ((or_ln55_7_fu_832_p2[0:0] == 1'b1) ? select_ln55_14_fu_824_p3 : s_14_fu_814_p4);

assign s_16_fu_884_p4 = {{add_ln55_8_fu_846_p2[45:22]}};

assign s_17_fu_908_p3 = ((or_ln55_8_fu_902_p2[0:0] == 1'b1) ? select_ln55_16_fu_894_p3 : s_16_fu_884_p4);

assign s_18_fu_954_p4 = {{add_ln55_9_fu_916_p2[45:22]}};

assign s_19_fu_978_p3 = ((or_ln55_9_fu_972_p2[0:0] == 1'b1) ? select_ln55_18_fu_964_p3 : s_18_fu_954_p4);

assign s_1_fu_348_p3 = ((or_ln55_fu_342_p2[0:0] == 1'b1) ? select_ln55_fu_334_p3 : s_fu_324_p4);

assign s_20_fu_1024_p4 = {{add_ln55_10_fu_986_p2[45:22]}};

assign s_21_fu_1048_p3 = ((or_ln55_10_fu_1042_p2[0:0] == 1'b1) ? select_ln55_20_fu_1034_p3 : s_20_fu_1024_p4);

assign s_22_fu_1094_p4 = {{add_ln55_11_fu_1056_p2[45:22]}};

assign s_23_fu_1118_p3 = ((or_ln55_11_fu_1112_p2[0:0] == 1'b1) ? select_ln55_22_fu_1104_p3 : s_22_fu_1094_p4);

assign s_24_fu_1164_p4 = {{add_ln55_12_fu_1126_p2[45:22]}};

assign s_25_fu_1188_p3 = ((or_ln55_12_fu_1182_p2[0:0] == 1'b1) ? select_ln55_24_fu_1174_p3 : s_24_fu_1164_p4);

assign s_26_fu_1234_p4 = {{add_ln55_13_fu_1196_p2[45:22]}};

assign s_27_fu_1258_p3 = ((or_ln55_13_fu_1252_p2[0:0] == 1'b1) ? select_ln55_26_fu_1244_p3 : s_26_fu_1234_p4);

assign s_28_fu_1304_p4 = {{add_ln55_14_fu_1266_p2[45:22]}};

assign s_29_fu_1328_p3 = ((or_ln55_14_fu_1322_p2[0:0] == 1'b1) ? select_ln55_28_fu_1314_p3 : s_28_fu_1304_p4);

assign s_2_fu_394_p4 = {{add_ln55_1_fu_356_p2[45:22]}};

assign s_30_fu_1374_p4 = {{add_ln55_15_fu_1336_p2[45:22]}};

assign s_31_fu_1398_p3 = ((or_ln55_15_fu_1392_p2[0:0] == 1'b1) ? select_ln55_30_fu_1384_p3 : s_30_fu_1374_p4);

assign s_3_fu_418_p3 = ((or_ln55_1_fu_412_p2[0:0] == 1'b1) ? select_ln55_2_fu_404_p3 : s_2_fu_394_p4);

assign s_4_fu_464_p4 = {{add_ln55_2_fu_426_p2[45:22]}};

assign s_5_fu_488_p3 = ((or_ln55_2_fu_482_p2[0:0] == 1'b1) ? select_ln55_4_fu_474_p3 : s_4_fu_464_p4);

assign s_6_fu_534_p4 = {{add_ln55_3_fu_496_p2[45:22]}};

assign s_7_fu_558_p3 = ((or_ln55_3_fu_552_p2[0:0] == 1'b1) ? select_ln55_6_fu_544_p3 : s_6_fu_534_p4);

assign s_8_fu_604_p4 = {{add_ln55_4_fu_566_p2[45:22]}};

assign s_9_fu_628_p3 = ((or_ln55_4_fu_622_p2[0:0] == 1'b1) ? select_ln55_8_fu_614_p3 : s_8_fu_604_p4);

assign s_fu_324_p4 = {{add_ln55_fu_286_p2[45:22]}};

assign select_ln55_10_fu_684_p3 = ((icmp_ln55_10_fu_662_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_12_fu_754_p3 = ((icmp_ln55_12_fu_732_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_14_fu_824_p3 = ((icmp_ln55_14_fu_802_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_16_fu_894_p3 = ((icmp_ln55_16_fu_872_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_18_fu_964_p3 = ((icmp_ln55_18_fu_942_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_20_fu_1034_p3 = ((icmp_ln55_20_fu_1012_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_22_fu_1104_p3 = ((icmp_ln55_22_fu_1082_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_24_fu_1174_p3 = ((icmp_ln55_24_fu_1152_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_26_fu_1244_p3 = ((icmp_ln55_26_fu_1222_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_28_fu_1314_p3 = ((icmp_ln55_28_fu_1292_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_2_fu_404_p3 = ((icmp_ln55_2_fu_382_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_30_fu_1384_p3 = ((icmp_ln55_30_fu_1362_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_4_fu_474_p3 = ((icmp_ln55_4_fu_452_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_6_fu_544_p3 = ((icmp_ln55_6_fu_522_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_8_fu_614_p3 = ((icmp_ln55_8_fu_592_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign select_ln55_fu_334_p3 = ((icmp_ln55_fu_312_p2[0:0] == 1'b1) ? 24'd8388607 : 24'd8388608);

assign tmp_10_fu_932_p4 = {{add_ln55_9_fu_916_p2[51:45]}};

assign tmp_11_fu_1002_p4 = {{add_ln55_10_fu_986_p2[51:45]}};

assign tmp_12_fu_1072_p4 = {{add_ln55_11_fu_1056_p2[51:45]}};

assign tmp_13_fu_1142_p4 = {{add_ln55_12_fu_1126_p2[51:45]}};

assign tmp_14_fu_1212_p4 = {{add_ln55_13_fu_1196_p2[51:45]}};

assign tmp_15_fu_1282_p4 = {{add_ln55_14_fu_1266_p2[51:45]}};

assign tmp_16_fu_1352_p4 = {{add_ln55_15_fu_1336_p2[51:45]}};

assign tmp_1_fu_302_p4 = {{add_ln55_fu_286_p2[51:45]}};

assign tmp_2_fu_372_p4 = {{add_ln55_1_fu_356_p2[51:45]}};

assign tmp_3_fu_442_p4 = {{add_ln55_2_fu_426_p2[51:45]}};

assign tmp_4_fu_512_p4 = {{add_ln55_3_fu_496_p2[51:45]}};

assign tmp_5_fu_582_p4 = {{add_ln55_4_fu_566_p2[51:45]}};

assign tmp_6_fu_652_p4 = {{add_ln55_5_fu_636_p2[51:45]}};

assign tmp_7_fu_722_p4 = {{add_ln55_6_fu_706_p2[51:45]}};

assign tmp_8_fu_792_p4 = {{add_ln55_7_fu_776_p2[51:45]}};

assign tmp_9_fu_862_p4 = {{add_ln55_8_fu_846_p2[51:45]}};

assign tmp_fu_1411_p18 = {{{{{{{{{{{{{{{{{icmp_ln57_fu_1406_p2}, {s_31_fu_1398_p3}}, {s_29_fu_1328_p3}}, {s_27_fu_1258_p3}}, {s_25_fu_1188_p3}}, {s_23_fu_1118_p3}}, {s_21_fu_1048_p3}}, {s_19_fu_978_p3}}, {s_17_fu_908_p3}}, {s_15_fu_838_p3}}, {s_13_fu_768_p3}}, {s_11_fu_698_p3}}, {s_9_fu_628_p3}}, {s_7_fu_558_p3}}, {s_5_fu_488_p3}}, {s_3_fu_418_p3}}, {s_1_fu_348_p3}};

assign trunc_ln55_10_fu_1062_p4 = {{add_ln55_11_fu_1056_p2[51:22]}};

assign trunc_ln55_11_fu_1132_p4 = {{add_ln55_12_fu_1126_p2[51:22]}};

assign trunc_ln55_12_fu_1202_p4 = {{add_ln55_13_fu_1196_p2[51:22]}};

assign trunc_ln55_13_fu_1272_p4 = {{add_ln55_14_fu_1266_p2[51:22]}};

assign trunc_ln55_14_fu_1342_p4 = {{add_ln55_15_fu_1336_p2[51:22]}};

assign trunc_ln55_1_fu_712_p4 = {{add_ln55_6_fu_706_p2[51:22]}};

assign trunc_ln55_2_fu_362_p4 = {{add_ln55_1_fu_356_p2[51:22]}};

assign trunc_ln55_3_fu_782_p4 = {{add_ln55_7_fu_776_p2[51:22]}};

assign trunc_ln55_4_fu_432_p4 = {{add_ln55_2_fu_426_p2[51:22]}};

assign trunc_ln55_5_fu_852_p4 = {{add_ln55_8_fu_846_p2[51:22]}};

assign trunc_ln55_6_fu_502_p4 = {{add_ln55_3_fu_496_p2[51:22]}};

assign trunc_ln55_7_fu_922_p4 = {{add_ln55_9_fu_916_p2[51:22]}};

assign trunc_ln55_8_fu_572_p4 = {{add_ln55_4_fu_566_p2[51:22]}};

assign trunc_ln55_9_fu_992_p4 = {{add_ln55_10_fu_986_p2[51:22]}};

assign trunc_ln55_s_fu_642_p4 = {{add_ln55_5_fu_636_p2[51:22]}};

assign trunc_ln_fu_292_p4 = {{add_ln55_fu_286_p2[51:22]}};

assign zext_ln37_fu_207_p1 = wr;

endmodule              
