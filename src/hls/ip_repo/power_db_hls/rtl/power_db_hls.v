                                                                 
                                 
                                                        
                                                                        
                                                                 

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="power_db_hls_power_db_hls,hls_ip_2024_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a200t-fbg484-2,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=12.992833,HLS_SYN_LAT=55,HLS_SYN_TPT=none,HLS_SYN_MEM=6,HLS_SYN_DSP=0,HLS_SYN_FF=510,HLS_SYN_LUT=1944,HLS_VERSION=2024_2}" *)

module power_db_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        value_r,
        exponent,
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
input  [63:0] value_r;
input  [15:0] exponent;
output  [47:0] result;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] exponent_read_reg_62;
reg   [63:0] value_r_read_reg_67;
wire    grp_power_db_fu_51_ap_start;
wire    grp_power_db_fu_51_ap_done;
wire    grp_power_db_fu_51_ap_idle;
wire    grp_power_db_fu_51_ap_ready;
wire   [47:0] grp_power_db_fu_51_ap_return;
reg    grp_power_db_fu_51_ap_start_reg;
wire    ap_CS_fsm_state2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

                          
initial begin
#0 ap_CS_fsm = 2'd1;
#0 grp_power_db_fu_51_ap_start_reg = 1'b0;
end

power_db_hls_power_db grp_power_db_fu_51(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_power_db_fu_51_ap_start),
    .ap_done(grp_power_db_fu_51_ap_done),
    .ap_idle(grp_power_db_fu_51_ap_idle),
    .ap_ready(grp_power_db_fu_51_ap_ready),
    .value_r(value_r_read_reg_67),
    .exponent(exponent_read_reg_62),
    .ap_return(grp_power_db_fu_51_ap_return)
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
        grp_power_db_fu_51_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_power_db_fu_51_ap_start_reg <= 1'b1;
        end else if ((grp_power_db_fu_51_ap_ready == 1'b1)) begin
            grp_power_db_fu_51_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        exponent_read_reg_62 <= exponent;
        value_r_read_reg_67 <= value_r;
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
    if ((grp_power_db_fu_51_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if (((grp_power_db_fu_51_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((grp_power_db_fu_51_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((grp_power_db_fu_51_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign grp_power_db_fu_51_ap_start = grp_power_db_fu_51_ap_start_reg;

assign result = grp_power_db_fu_51_ap_return;

endmodule               
