                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="cordic_hls_cordic_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.634781,HLS_SYN_LAT=37,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=464,HLS_SYN_LUT=1352,HLS_VERSION=2024_2}" *)

module cordic_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mode,
        vx,
        vy,
        angle,
        result
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [0:0] mode;
input  [39:0] vx;
input  [39:0] vy;
input  [31:0] angle;
output  [135:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] angle_read_reg_84;
reg   [39:0] vy_read_reg_89;
reg   [39:0] vx_read_reg_94;
reg   [0:0] mode_read_reg_99;
wire    grp_cordic_fu_69_ap_start;
wire    grp_cordic_fu_69_ap_done;
wire    grp_cordic_fu_69_ap_idle;
wire    grp_cordic_fu_69_ap_ready;
wire   [135:0] grp_cordic_fu_69_ap_return;
reg    grp_cordic_fu_69_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 2'd1;
#0 grp_cordic_fu_69_ap_start_reg = 1'b0;
end

cordic_hls_cordic grp_cordic_fu_69(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_cordic_fu_69_ap_start),
    .ap_done(grp_cordic_fu_69_ap_done),
    .ap_idle(grp_cordic_fu_69_ap_idle),
    .ap_ready(grp_cordic_fu_69_ap_ready),
    .mode(mode_read_reg_99),
    .vx(vx_read_reg_94),
    .vy(vy_read_reg_89),
    .angle(angle_read_reg_84),
    .ap_return(grp_cordic_fu_69_ap_return)
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
        grp_cordic_fu_69_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_cordic_fu_69_ap_start_reg <= 1'b1;
        end else if ((grp_cordic_fu_69_ap_ready == 1'b1)) begin
            grp_cordic_fu_69_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        angle_read_reg_84 <= angle;
        mode_read_reg_99 <= mode;
        vx_read_reg_94 <= vx;
        vy_read_reg_89 <= vy;
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
    if ((grp_cordic_fu_69_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_cordic_fu_69_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((grp_cordic_fu_69_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((grp_cordic_fu_69_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_cordic_fu_69_ap_start = grp_cordic_fu_69_ap_start_reg;

assign result = grp_cordic_fu_69_ap_return;

endmodule             
