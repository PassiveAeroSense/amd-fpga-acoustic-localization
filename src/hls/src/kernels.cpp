#include "kernels.hpp"
#include "numeric.hpp"
using namespace r18;

void fft4096_hls(ap_uint<64> data[4096],ap_uint<1>& overflow) {
#pragma HLS INTERFACE ap_memory port=data storage_type=ram_t2p latency=1
#pragma HLS INTERFACE ap_none port=overflow
    bool ov=false;
    for(int stage=0;stage<12;++stage){
        int half=1<<stage;
        for(int k=0;k<2048;++k){
#pragma HLS PIPELINE II=2
#pragma HLS DEPENDENCE variable=data inter false
            int j=k&(half-1),a=((k>>stage)<<(stage+1))+j,b=a+half,t=j<<(11-stage);
            ap_uint<64> aa=data[a],bb=data[b];
            ap_int<32> ar=aa.range(31,0),ai=aa.range(63,32),br=bb.range(31,0),bi=bb.range(63,32),wr=TW_R[t],wi=TW_I[t];
            ap_int<64> p0=br*wr,p1=bi*wi,p2=br*wi,p3=bi*wr;
            ap_int<65> tr=ap_int<65>(p0)-p1,ti=ap_int<65>(p2)+p3;
            ap_int<66> r0=(ap_int<66>(ar)+(tr>>30))>>1,i0=(ap_int<66>(ai)+(ti>>30))>>1;
            ap_int<66> r1=(ap_int<66>(ar)-(tr>>30))>>1,i1=(ap_int<66>(ai)-(ti>>30))>>1;
            ov|=r0>2147483647LL||r0< -2147483648LL||i0>2147483647LL||i0< -2147483648LL||r1>2147483647LL||r1< -2147483648LL||i1>2147483647LL||i1< -2147483648LL;
            ap_uint<64> u,v;u.range(31,0)=sat32(r0);u.range(63,32)=sat32(i0);v.range(31,0)=sat32(r1);v.range(63,32)=sat32(i1);data[a]=u;data[b]=v;
        }
    }
    overflow=ov;
}

template<int L,int M,int TAPS,int LANES> static void fir(ap_uint<384> samples,ap_uint<385>& result,const ap_int<24> coeff[TAPS]) {
#pragma HLS INLINE
    static ap_uint<384> history[512];
#pragma HLS BIND_STORAGE variable=history type=ram_s2p impl=bram
    static ap_uint<9> wr=0;static ap_uint<32> count=0,next=0;static ap_uint<16> phase=0;
#pragma HLS RESET variable=wr
#pragma HLS RESET variable=count
#pragma HLS RESET variable=next
#pragma HLS RESET variable=phase
    history[wr]=samples;result=0;
    if(count==next){
        ap_int<56> acc[LANES];
#pragma HLS ARRAY_PARTITION variable=acc complete
        for(int c=0;c<LANES;++c){
#pragma HLS UNROLL
            acc[c]=0;
        }
        for(int tap=0;tap<(TAPS+L-1)/L;++tap){
#pragma HLS PIPELINE II=1
            ap_uint<9> at=wr-tap;ap_uint<384> word=history[at];int ci=phase+tap*L;ap_int<24> co=ci<TAPS?coeff[ci]:ap_int<24>(0);
            for(int c=0;c<LANES;++c){
#pragma HLS UNROLL
                ap_int<24> sample=word.range(c*24+23,c*24);ap_int<48> prod=sample*co;acc[c]+=prod;
            }
        }
        for(int c=0;c<LANES;++c){
#pragma HLS UNROLL
            ap_int<56> v=(acc[c]+2097152)>>22;ap_int<24> s=v>8388607?ap_int<24>(8388607):v< -8388608?ap_int<24>(-8388608):ap_int<24>(v);result.range(c*24+23,c*24)=s;
        }
        result[384]=count>=((TAPS+L-1)/L-1);
        next+=(phase+M)/L;phase=(phase+M)%L;
    }
    ++wr;++count;
}
void fir_loc_hls(ap_uint<384> samples,ap_uint<385>& result){
#pragma HLS INTERFACE ap_none port=samples
#pragma HLS INTERFACE ap_none port=result
    fir<1,1,383,16>(samples,result,LOC_FIR);
}
void fir_det_hls(ap_uint<384> samples,ap_uint<385>& result){
#pragma HLS INTERFACE ap_none port=samples
#pragma HLS INTERFACE ap_none port=result
    fir<5,16,2047,8>(samples,result,DET_FIR);
}
void sqrt_hls(ap_uint<64> value,ap_uint<96>& result){
#pragma HLS INTERFACE ap_none port=value
#pragma HLS INTERFACE ap_none port=result
    ap_uint<32> r=isqrt(value);result.range(31,0)=r;result.range(95,32)=value-ap_uint<64>(r)*r;
}
void divide_hls(ap_uint<64> num,ap_uint<64> den,ap_uint<129>& result){
#pragma HLS INTERFACE ap_none port=num
#pragma HLS INTERFACE ap_none port=den
#pragma HLS INTERFACE ap_none port=result
    ap_uint<64> q=den?udiv(num,den):ap_uint<64>(-1);result.range(63,0)=q;result.range(127,64)=num-q*den;result[128]=!den;
}
void cordic_hls(ap_uint<1> mode,ap_int<40> vx,ap_int<40> vy,ap_int<32> angle,ap_uint<136>& result){
#pragma HLS INTERFACE ap_none port=mode
#pragma HLS INTERFACE ap_none port=vx
#pragma HLS INTERFACE ap_none port=vy
#pragma HLS INTERFACE ap_none port=angle
#pragma HLS INTERFACE ap_none port=result
    result=cordic(mode,vx,vy,angle);
}
void power_db_hls(ap_uint<64> value,ap_int<16> exponent,ap_int<48>& result){
#pragma HLS INTERFACE ap_none port=value
#pragma HLS INTERFACE ap_none port=exponent
#pragma HLS INTERFACE ap_none port=result
    result=power_db(value,exponent);
}
void covariance_hls(ap_int<32> ar,ap_int<32> ai,ap_int<32> br,ap_int<32> bi,ap_int<32> oldr,ap_int<32> oldi,ap_uint<6> shift_old,ap_uint<6> next_exp,ap_uint<65>& result){
#pragma HLS INTERFACE ap_none port=ar
#pragma HLS INTERFACE ap_none port=ai
#pragma HLS INTERFACE ap_none port=br
#pragma HLS INTERFACE ap_none port=bi
#pragma HLS INTERFACE ap_none port=oldr
#pragma HLS INTERFACE ap_none port=oldi
#pragma HLS INTERFACE ap_none port=shift_old
#pragma HLS INTERFACE ap_none port=next_exp
#pragma HLS INTERFACE ap_none port=result
    ap_int<64> p0=ar*br,p1=ai*bi,p2=ai*br,p3=ar*bi;
    ap_int<65> rr=ap_int<65>(p0)+p1,ri=ap_int<65>(p2)-p3;
    ap_int<65> nr=ap_int<65>(oldr>>shift_old)+(rr>>next_exp),ni=ap_int<65>(oldi>>shift_old)+(ri>>next_exp);
    result.range(31,0)=sat32(nr);result.range(63,32)=sat32(ni);result[64]=nr>2147483647LL||nr< -2147483648LL||ni>2147483647LL||ni< -2147483648LL;
}
