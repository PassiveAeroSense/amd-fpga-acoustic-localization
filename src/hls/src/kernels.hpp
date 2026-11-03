#pragma once
#include <ap_int.h>
void fft4096_hls(ap_uint<64> data[4096], ap_uint<1>& overflow);
void fir_loc_hls(ap_uint<384> samples, ap_uint<385>& result);
void fir_det_hls(ap_uint<384> samples, ap_uint<385>& result);
void sqrt_hls(ap_uint<64> value,ap_uint<96>& result);
void divide_hls(ap_uint<64> num,ap_uint<64> den,ap_uint<129>& result);
void cordic_hls(ap_uint<1> mode,ap_int<40> vx,ap_int<40> vy,ap_int<32> angle,ap_uint<136>& result);
void power_db_hls(ap_uint<64> value,ap_int<16> exponent,ap_int<48>& result);
void detector_hls(const ap_int<48> bands[97],ap_uint<1> valid,ap_uint<1> new_sequence,ap_uint<1> array_id,ap_uint<104>& result);
void joint_search_hls(const ap_uint<64> covariance[36176],const ap_uint<48> grid[65536],unsigned grid_count,unsigned horizontal_mm,unsigned vertical_mm,bool baseline_two,bool fast_mode,ap_uint<144>& result);
void covariance_hls(ap_int<32> ar,ap_int<32> ai,ap_int<32> br,ap_int<32> bi,ap_int<32> oldr,ap_int<32> oldi,ap_uint<6> shift_old,ap_uint<6> next_exp,ap_uint<65>& result);
