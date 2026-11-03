#include "kernels.hpp"
#include "detector_fixture.hpp"
#include <cassert>
#include <cstdio>
int main(){ap_int<48> bands[97];ap_uint<104> out;long long sum=0;
for(int k=0;k<6;k++){
 for(int i=0;i<97;i++)bands[i]=BANDS[k][i];detector_hls(bands,1,k==0,0,out);
 assert(ap_int<32>(out.range(31,0))==SCORES[k]);sum+=SCORES[k];if(k>=3)sum-=SCORES[k-3];
 assert(ap_int<64>(out.range(95,32))==sum);assert(out.range(100,96)==(k<3?k+1:3));assert(!out[102]);
 assert(bool(out[101])==(sum>50331648LL*(k<3?k+1:3)));
}
detector_hls(bands,0,0,0,out);assert(out[102]);
detector_hls(bands,1,0,0,out);assert(out.range(100,96)==1);assert(ap_int<64>(out.range(95,32))==SCORES[5]);
detector_hls(bands,1,1,1,out);assert(out[103]&&out.range(100,96)==1);
puts("DETECTOR HLS PASS:97bands/218features/120trees match independent Python integer oracle; rolling history,gap reset,array separation");return 0;
}
