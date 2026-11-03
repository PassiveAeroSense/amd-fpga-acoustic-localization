#include "kernels.hpp"
#include <cassert>
#include <cstdlib>
#include <cstdio>
#undef assert
#define assert(x) do { if(!(x)){fprintf(stderr,"CHECK FAILED %s at line %d\n",#x,__LINE__);std::abort();} } while(0)
#include <cmath>
#include <cstdio>
#include <cstdint>
int main(){
 uint64_t v=0xabcdef0123456789ULL;
 for(int i=0;i<80;i++){
  v=v*6364136223846793005ULL+1;ap_uint<96> s;sqrt_hls(v,s);uint64_t r=ap_uint<32>(s.range(31,0)).to_uint64();
  assert(r*r<=v);assert(r==0xffffffffULL||(r+1)*(r+1)>v);assert(ap_uint<64>(s.range(95,32))==v-r*r);
  uint64_t d=(v>>3)+1;ap_uint<129> q;divide_hls(v,d,q);assert(ap_uint<64>(q.range(63,0))==v/d);assert(ap_uint<64>(q.range(127,64))==v%d);assert(!q[128]);
 }
 ap_uint<129> q;divide_hls(123,0,q);assert(q[128]);
 for(int degrees=-180;degrees<=180;degrees+=9){
  double angle=degrees*3.141592653589793/180;ap_uint<136> c;cordic_hls(0,0,0,int64_t(angle*536870912.0),c);
  double co=ap_int<32>(c.range(63,32)).to_double()/1073741824.,si=ap_int<32>(c.range(95,64)).to_double()/1073741824.;
  assert(fabs(co-cos(angle))<2e-7&&fabs(si-sin(angle))<2e-7);
  int x=int(1000000*cos(angle)),y=int(1000000*sin(angle));cordic_hls(1,x,y,0,c);
  double a=ap_int<32>(c.range(31,0)).to_double()/536870912.,err=atan2(sin(a-atan2(y,x)),cos(a-atan2(y,x)));assert(fabs(err)<1e-4);
 }
 for(int b=0;b<63;b+=3){ap_int<48> r;uint64_t x=(1ULL<<b)+19;power_db_hls(x,-50,r);assert(fabs(r.to_double()/4294967296.-10*log10(ldexp(double(x),-50)))<0.001);}
 ap_int<48> r;power_db_hls(0,-50,r);assert(r==ap_int<48>(-1288490188800LL));
 ap_uint<65> c;covariance_hls(3,4,5,-6,0,0,0,0,c);assert(ap_int<32>(c.range(31,0))==-9);assert(ap_int<32>(c.range(63,32))==38);assert(!c[64]);
 puts("NUMERIC HLS PASS: integer bounds/remainders, divide-zero, CORDIC vs trig, calibrated dB vs log10, complex covariance sign");return 0;
}
