#include "kernels.hpp"
#include "roms.hpp"
#include <cassert>
#include <cstdio>
#include <cstdint>
static int32_t history[600][16];
static int32_t expected(int n,int ch,int phase,bool det){
 int64_t sum=0;int taps=det?410:383;
 for(int k=0;k<taps;k++){int at=n-k,ci=det?phase+k*5:k;int co=det?(ci<2047?r18::DET_FIR[ci].to_int():0):r18::LOC_FIR[ci].to_int();if(at>=0)sum+=int64_t(history[at][ch])*co;}
 int64_t x=(sum+2097152)>>22;return x>8388607?8388607:x< -8388608?-8388608:int32_t(x);
}
int main(){int phase=0,next=0,loc_count=0,det_count=0;
 for(int n=0;n<550;n++){
  ap_uint<384> x=0;for(int c=0;c<16;c++){int32_t v=int32_t((n*7919U+c*13001U)%8000000U)-4000000;history[n][c]=v;x.range(c*24+23,c*24)=ap_int<24>(v);}
  ap_uint<385> loc,det;fir_loc_hls(x,loc);fir_det_hls(x,det);
  assert(bool(loc[384])==(n>=382));if(loc[384]){loc_count++;for(int c=0;c<16;c++)assert(ap_int<24>(loc.range(c*24+23,c*24))==expected(n,c,0,false));}
  bool active=n==next;assert(bool(det[384])==(active&&n>=409));if(active){if(det[384]){det_count++;for(int c=0;c<8;c++)assert(ap_int<24>(det.range(c*24+23,c*24))==expected(n,c,phase,true));for(int c=8;c<16;c++)assert(det.range(c*24+23,c*24)==0);}next+=(phase+16)/5;phase=(phase+16)%5;}
 }
 printf("FIR HLS PASS: independent scalar convolution, all16loc/A1onlydet, rational5/16 phases, warmup/saturation; valid counts%d,%d\n",loc_count,det_count);return 0;
}
