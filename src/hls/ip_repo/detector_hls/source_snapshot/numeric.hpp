#pragma once
#include "roms.hpp"
namespace r18 {
static ap_uint<32> isqrt(ap_uint<64> x) {
#pragma HLS INLINE off
    ap_uint<66> rem=0;ap_uint<32> root=0;
    for(int i=31;i>=0;--i) {
#pragma HLS PIPELINE II=1
        rem=(rem<<2)|((x>>(2*i))&3);
        ap_uint<66> trial=(ap_uint<66>(root)<<2)|1;
        root<<=1;if(rem>=trial){rem-=trial;root|=1;}
    }
    return root;
}
static ap_uint<64> udiv(ap_uint<64> n,ap_uint<64> d) {
#pragma HLS INLINE off
    ap_uint<65> rem=0;ap_uint<64> q=0;
    if(!d)return 0;
    for(int i=63;i>=0;--i){
#pragma HLS PIPELINE II=1
        rem=(rem<<1)|n[i];if(rem>=d){rem-=d;q[i]=1;}
    }
    return q;
}
static ap_uint<136> cordic(ap_uint<1> mode,ap_int<40> vx,ap_int<40> vy,ap_int<32> angle) {
#pragma HLS INLINE off
    const ap_int<32> PI=1686629713,HALF_PI=843314857,K=652032874;
    ap_int<44> x,y;ap_int<33> z;
    if(mode){if(vx<0){x=-ap_int<44>(vx);y=-ap_int<44>(vy);z=vy>=0?ap_int<33>(PI):ap_int<33>(-PI);}else{x=vx;y=vy;z=0;}}
    else {y=0;if(angle>HALF_PI){x=-K;z=ap_int<33>(angle)-PI;}else if(angle< -HALF_PI){x=-K;z=ap_int<33>(angle)+PI;}else{x=K;z=angle;}}
    for(int i=0;i<31;++i){
#pragma HLS PIPELINE II=1
        ap_int<44> xx=x,yy=y;
        if(mode){if(y>=0){x=xx+(yy>>i);y=yy-(xx>>i);z+=CORDIC_ATAN[i];}else{x=xx-(yy>>i);y=yy+(xx>>i);z-=CORDIC_ATAN[i];}}
        else {if(z>=0){x=xx-(yy>>i);y=yy+(xx>>i);z-=CORDIC_ATAN[i];}else{x=xx+(yy>>i);y=yy-(xx>>i);z+=CORDIC_ATAN[i];}}
    }
    ap_int<76> product=x*K;ap_uint<136> out=0;
    out.range(31,0)=ap_int<32>(z);out.range(63,32)=ap_int<32>(x);out.range(95,64)=ap_int<32>(y);out.range(135,96)=ap_uint<40>(product>>30);
    return out;
}
static ap_int<32> sat32(ap_int<66> x){return x>2147483647LL?ap_int<32>(2147483647):x< -2147483648LL?ap_int<32>(-2147483648LL):ap_int<32>(x);}
static ap_int<48> power_db(ap_uint<64> value,ap_int<16> exponent) {
#pragma HLS INLINE off
    if(!value)return ap_int<48>(-1288490188800LL);
    int leading=0;for(int j=0;j<64;++j)if(value[j])leading=j;
    ap_uint<33> lx=leading>=31?ap_uint<33>(value>>(leading-31)):ap_uint<33>(value<<(31-leading));
    ap_uint<32> xx=lx<43?ap_uint<32>(43):ap_uint<32>(lx);int lead=0;
    for(int j=0;j<32;++j)if(xx[j])lead=j;
    ap_uint<32> normalized=xx<<(31-lead);unsigned idx=normalized.range(30,19);ap_uint<19> frac=normalized.range(18,0);
    ap_uint<32> l0=LN_LUT[idx],l1=idx==4095?ap_uint<32>(11629080):ap_uint<32>(LN_LUT[idx+1]);
    ap_uint<64> product=ap_uint<32>(l1-l0)*frac;
    ap_uint<32> neglog=(32-lead)*11629080U-l0-(product>>19);
    ap_int<64> ln=(ap_int<64>(exponent)+leading+1)*2977044472LL-(ap_int<64>(neglog)<<8);
    ap_int<96> p=ln*ap_int<96>(4663201492LL);return ap_int<48>(p>>30);
}
}
