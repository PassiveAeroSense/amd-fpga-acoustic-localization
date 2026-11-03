
#include "kernels.hpp"
#include <cassert>
#include <cstdio>
#include <cmath>
#include <fstream>
#include <string>
#include <cstdlib>
#undef assert
#define assert(x) do { if(!(x)){fprintf(stderr,"CHECK FAILED %s at line %d\n",#x,__LINE__);std::abort();} } while(0)
static ap_uint<64> cov[36176];static ap_uint<48> grid[65536];
static unsigned load_grid(int h){
 std::ifstream f("grid_"+std::to_string(h)+".mem");assert(f);std::string s;unsigned n=0;
 while(f>>s)grid[n++]=std::stoull(s,nullptr,16);assert(n>9000&&n<65536);return n;
}
static void fixture(double x,double y,double z,bool two,bool zero){
 for(int i=0;i<36176;i++)cov[i]=0;if(zero)return;
 const int xy[16][2]={{-430,-70},{-500,-70},{-570,-70},{-570,0},{-570,70},{-500,70},{-430,70},{-430,0},{570,-70},{500,-70},{430,-70},{430,0},{430,70},{500,70},{570,70},{570,0}};
 double dist[16];for(int i=0;i<16;i++){double dx=x-xy[i][0]-(two?(i<8?-500:500):0),dy=y-xy[i][1];dist[i]=sqrt(dx*dx+dy*dy+z*z);}
 const int bins[12]={10,28,47,66,86,108,132,155,177,199,218,234};
 for(int k=0;k<12;k++){
  int f=bins[k];int power=1000000;double hz=(f+22)*48000.0/4096;
  for(int i=0;i<16;i++)cov[f*136+i]=power;
  int p=0;for(int ia=1;ia<16;ia++)for(int ib=0;ib<ia;ib++){
   double phase=2*3.141592653589793*hz*(dist[ib]-dist[ia])/343000.;
   int re=std::lround(power*cos(phase)),im=std::lround(power*sin(phase));
   ap_uint<64> v;v.range(31,0)=ap_int<32>(re);v.range(63,32)=ap_int<32>(im);cov[f*136+16+p++]=v;
  }
 }
}
static void run_case(int h,bool two,bool fast,int x,int y,int z,bool zero=false){
 unsigned n=load_grid(h);fixture(x,y,z,two,zero);ap_uint<144> out;
 joint_search_hls(cov,grid,n,h,h,two,fast,out);
 int a=ap_int<32>(out.range(31,0)).to_int(),b=ap_int<32>(out.range(63,32)).to_int(),c=ap_int<32>(out.range(95,64)).to_int();
 double error=sqrt(double(a-x)*(a-x)+double(b-y)*(b-y)+double(c-z)*(c-z));
 printf("H%d B%d fast%d target(%d,%d,%d) found(%d,%d,%d) error=%.3fmm valid%d quality%d\n",h,two?2:1,fast,x,y,z,a,b,c,error,int(out[96]),int(out[97]));fflush(stdout);
 if(zero){assert(!out[96]&&!out[97]);return;}
 assert(out[96]&&out[97]);assert(c>=0&&c<=h&&int64_t(a)*a+int64_t(b)*b<=int64_t(h)*h);
 assert(error<=300);                                                                       
}
int main(){
 run_case(20000,false,false,16000,7000,18000);
 run_case(15000,true,false,12000,-5000,13000);
 run_case(10000,false,true,-2000,1000,1000);
 for(int two=0;two<2;two++)for(int h=10000;h<=20000;h+=5000)run_case(h,two,h==10000,0,0,0,true);
 puts("R19 SEARCH RTL CONTRACT PASS: extended cylinder, 2m baseline, fast mode and all six zero-evidence modes");return 0;
}
