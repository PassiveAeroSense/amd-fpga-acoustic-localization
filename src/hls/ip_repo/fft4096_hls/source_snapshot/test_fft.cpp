#include "kernels.hpp"
#include <cmath>
#include <cstdio>
#include <cstdint>
#include <cassert>
static ap_uint<64> data[4096];static int32_t x[4096],y[4096];
static unsigned rev(unsigned x){unsigned r=0;for(int k=0;k<12;k++){r=(r<<1)|(x&1);x>>=1;}return r;}
int main(){
 for(int scene=0;scene<4;scene++){
  for(int n=0;n<4096;n++){
   double phase=6.283185307179586*n/4096;
   x[n]=scene==0?0:scene==1?(n==0?1000000:0):scene==2?int32_t(1000000*cos(57*phase)+230000*sin(135*phase)):int32_t(((n*7919U+37)%2000000)-1000000);
   y[n]=scene==3?int32_t(300000*sin(53*phase)):0;
   ap_uint<64> v;v.range(31,0)=ap_int<32>(x[n]);v.range(63,32)=ap_int<32>(y[n]);data[rev(n)]=v;
  }
  ap_uint<1> overflow;fft4096_hls(data,overflow);assert(!overflow);
  for(int k=0;k<4096;k+=17){
   double rr=0,ii=0;for(int n=0;n<4096;n++){double a=6.283185307179586*k*n/4096;rr+=x[n]*cos(a)+y[n]*sin(a);ii+=y[n]*cos(a)-x[n]*sin(a);}
   int32_t r=ap_int<32>(data[k].range(31,0)).to_int(),i=ap_int<32>(data[k].range(63,32)).to_int();
   if(fabs(r-rr/4096)>16||fabs(i-ii/4096)>16){printf("FAIL scene%d bin%d got%d,%d reference%f,%f\n",scene,k,r,i,rr/4096,ii/4096);return 1;}
  }
 }
 puts("FFT4096 HLS PASS: zero, impulse, tones, complex broadband vs independent double DFT");return 0;
}
