`timescale 1ns/1ps
                                                                                  
module r18_ip_fft4096_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,output [11:0] data_address0,output  data_ce0,output  data_we0,output [63:0] data_d0,input [63:0] data_q0,output [11:0] data_address1,output  data_ce1,output  data_we1,output [63:0] data_d1,input [63:0] data_q1,output [0:0] overflow);
fft4096_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.data_address0(data_address0),.data_ce0(data_ce0),.data_we0(data_we0),.data_d0(data_d0),.data_q0(data_q0),.data_address1(data_address1),.data_ce1(data_ce1),.data_we1(data_we1),.data_d1(data_d1),.data_q1(data_q1),.overflow(overflow));
endmodule
module r18_ip_fir_loc_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [383:0] samples,output [384:0] result);
fir_loc_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.samples(samples),.result(result));
endmodule
module r18_ip_fir_det_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [383:0] samples,output [384:0] result);
fir_det_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.samples(samples),.result(result));
endmodule
module r18_ip_sqrt_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [63:0] value_r,output [95:0] result);
sqrt_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.value_r(value_r),.result(result));
endmodule
module r18_ip_divide_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [63:0] num,input [63:0] den,output [128:0] result);
divide_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.num(num),.den(den),.result(result));
endmodule
module r18_ip_cordic_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [0:0] mode,input [39:0] vx,input [39:0] vy,input [31:0] angle,output [135:0] result);
cordic_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.mode(mode),.vx(vx),.vy(vy),.angle(angle),.result(result));
endmodule
module r18_ip_power_db_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [63:0] value_r,input [15:0] exponent,output [47:0] result);
power_db_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.value_r(value_r),.exponent(exponent),.result(result));
endmodule
module r18_ip_covariance_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,input [31:0] ar,input [31:0] ai,input [31:0] br,input [31:0] bi,input [31:0] oldr,input [31:0] oldi,input [5:0] shift_old,input [5:0] next_exp,output [64:0] result);
covariance_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.ar(ar),.ai(ai),.br(br),.bi(bi),.oldr(oldr),.oldi(oldi),.shift_old(shift_old),.next_exp(next_exp),.result(result));
endmodule
module r18_ip_detector_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,output [6:0] bands_address0,output  bands_ce0,input [47:0] bands_q0,input [0:0] valid,input [0:0] new_sequence,input [0:0] array_id,output [103:0] result);
detector_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.bands_address0(bands_address0),.bands_ce0(bands_ce0),.bands_q0(bands_q0),.valid(valid),.new_sequence(new_sequence),.array_id(array_id),.result(result));
endmodule
module r18_ip_joint_search_hls(input  ap_clk,input  ap_rst_n,input  ap_start,output  ap_done,output  ap_idle,output  ap_ready,output [15:0] covariance_address0,output  covariance_ce0,input [63:0] covariance_q0,output [15:0] grid_address0,output  grid_ce0,input [47:0] grid_q0,input [31:0] grid_count,input [31:0] horizontal_mm,input [31:0] vertical_mm,input [0:0] baseline_two,input [0:0] fast_mode,output [143:0] result);
joint_search_hls impl(.ap_clk(ap_clk),.ap_rst_n(ap_rst_n),.ap_start(ap_start),.ap_done(ap_done),.ap_idle(ap_idle),.ap_ready(ap_ready),.covariance_address0(covariance_address0),.covariance_ce0(covariance_ce0),.covariance_q0(covariance_q0),.grid_address0(grid_address0),.grid_ce0(grid_ce0),.grid_q0(grid_q0),.grid_count(grid_count),.horizontal_mm(horizontal_mm),.vertical_mm(vertical_mm),.baseline_two(baseline_two),.fast_mode(fast_mode),.result(result));
endmodule
