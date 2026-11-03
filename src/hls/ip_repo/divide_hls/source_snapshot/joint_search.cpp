#include "kernels.hpp"
#include "numeric.hpp"
using namespace r18;
struct Observation {ap_uint<32> phase,coefficient;ap_uint<8> pair;ap_uint<2> group;ap_uint<4> slot;};
static void candidate_score(ap_int<32> cx,ap_int<32> cy,ap_int<32> cz,const Observation obs[1440],int count,ap_int<32> group_score[3]) {
#pragma HLS INLINE off
    ap_uint<32> distance[16];
#pragma HLS ARRAY_PARTITION variable=distance complete
    for(int i=0;i<16;i++){
        ap_int<16> mx=MIC[i].range(31,16),my=MIC[i].range(15,0);
        ap_int<32> dx=cx-mx,dy=cy-my;
        ap_int<64> sx=dx*dx,sy=dy*dy,sz=cz*cz;distance[i]=isqrt(ap_uint<64>(sx+sy+sz));
    }
    ap_int<32> sum0=0,sum1=0,real[12],imag[12];
#pragma HLS ARRAY_PARTITION variable=real complete
#pragma HLS ARRAY_PARTITION variable=imag complete
    for(int i=0;i<12;i++){
#pragma HLS UNROLL
        real[i]=0;imag[i]=0;
    }
    for(int i=0;i<count;i++){
#pragma HLS LOOP_TRIPCOUNT min=24 max=1440 avg=1200
#pragma HLS PIPELINE II=1
        Observation o=obs[i];unsigned p=PAIRS[o.pair];
        ap_int<32> delta=ap_int<32>(distance[p&15])-ap_int<32>(distance[p>>4]);
        ap_int<64> predicted=delta*ap_int<33>(o.coefficient);ap_uint<32> phase=o.phase-ap_uint<32>(predicted);
        ap_uint<12> a=phase.range(31,20),s=a-1024;ap_int<16> re=COS_LUT[a],im=COS_LUT[s];
        if(o.group==0)sum0+=re;else if(o.group==1)sum1+=re;else{real[o.slot]+=re;imag[o.slot]+=im;}
    }
    ap_uint<32> cross=0;
    for(int i=0;i<12;i++){ap_int<64> r=real[i]*real[i],v=imag[i]*imag[i];cross+=isqrt(ap_uint<64>(r+v));}
    group_score[0]=sum0;group_score[1]=sum1;group_score[2]=cross;
}
void joint_search_hls(const ap_uint<64> covariance[36176],ap_uint<144>& result){
#pragma HLS INTERFACE ap_memory port=covariance storage_type=rom_1p latency=2
#pragma HLS INTERFACE ap_none port=result
    ap_uint<40> trace[266];ap_uint<32> weights[266];bool blocked[266];ap_uint<9> chosen[12];
    Observation obs[1440];
#pragma HLS AGGREGATE variable=obs compact=bit
#pragma HLS BIND_STORAGE variable=obs type=ram_1p impl=bram
    int count=0,groups[3]={0,0,0};ap_uint<12> mask=0;result=0;
    for(int f=0;f<266;f++){
        ap_uint<40> sum=0;for(int c=0;c<16;c++){
#pragma HLS PIPELINE II=1
            ap_int<32> v=covariance[f*136+c].range(31,0);if(v>0)sum+=ap_uint<32>(v);
        }
        trace[f]=sum;blocked[f]=false;
    }
    for(int f=0;f<266;f++){
        ap_uint<64> n=ap_uint<64>(trace[f])<<16,d=ap_uint<64>(trace[f<6?0:f-6])+trace[f>259?265:f+6]+1;
        ap_uint<64> q=udiv(n,d);weights[f]=f>=8&&f<=234&&q>40960?ap_uint<32>(q>1048575?ap_uint<64>(1048575):q):ap_uint<32>(0);
    }
    for(int s=0;s<12;s++){
        ap_uint<32> best=0;int bf=0;for(int f=0;f<266;f++){
#pragma HLS PIPELINE II=1
            if(!blocked[f]&&weights[f]>best){best=weights[f];bf=f;}
        }
        chosen[s]=bf;blocked[bf]=true;if(bf>0)blocked[bf-1]=true;if(bf<265)blocked[bf+1]=true;
    }
    for(int s=0;s<12;s++){
        int f=chosen[s];
        for(int p=0;p<120;p++){
            unsigned pair=PAIRS[p],ia=pair>>4,ib=pair&15;
            ap_uint<64> cov=covariance[f*136+16+p];ap_int<32> re=cov.range(31,0),im=cov.range(63,32);
            ap_int<32> aa=covariance[f*136+ia].range(31,0),bb=covariance[f*136+ib].range(31,0);
            ap_uint<32> pa=aa>0?ap_uint<32>(aa):ap_uint<32>(0),pb=bb>0?ap_uint<32>(bb):ap_uint<32>(0);
            ap_uint<64> pp=pa*pb;ap_int<64> r2=re*re,i2=im*im;
            if(weights[f]&&pa&&pb&&(ap_uint<65>(r2)+ap_uint<65>(i2))>=(ap_uint<65>(pp)>>1)){
                ap_uint<136> c=cordic(1,re,im,0);ap_int<32> angle=c.range(31,0);ap_int<64> phase=angle*ap_int<64>(1367130551);
                Observation o;o.phase=ap_uint<32>(phase>>30);o.coefficient=PHASE_MM[f];o.pair=p;o.slot=s;o.group=ia<8?0:ib>=8?1:2;
                obs[count++]=o;groups[o.group]++;mask[s]=1;
            }
        }
    }
    int frequencies=0;for(int i=0;i<12;i++)frequencies+=mask[i];
    result.range(111,100)=count;
    if(count<24||frequencies<2||groups[0]<4||groups[1]<4||groups[2]<4)return;
    ap_uint<32> reciprocal[3];for(int g=0;g<3;g++)reciprocal[g]=udiv(1048576,groups[g]);
    ap_int<32> bx=0,by=0,bz=1000,best=-2147483647,best_raw=0,bg[3]={0,0,0};bool found=false;
    ap_int<32> center_x=0,center_y=0,center_z=1000;
                                                                        
    for(int level=0;level<6;level++){
        int total=level==0?11025:343;int step=level==1?500:level==2?200:level==3?100:level==4?25:10;
        if(level){center_x=bx;center_y=by;center_z=bz;}
        for(int n=0;n<total;n++){
#pragma HLS LOOP_TRIPCOUNT min=343 max=11025 avg=2123
            ap_int<32> cx,cy,cz;
            if(!level){ap_uint<48> g=GRID[n];cx=ap_int<16>(g.range(47,32));cy=ap_int<16>(g.range(31,16));cz=ap_int<16>(g.range(15,0));}
            else {cx=center_x+(n/49-3)*step;cy=center_y+((n/7)%7-3)*step;cz=center_z+(n%7-3)*step;}
            ap_int<64> xx=cx*cx,yy=cy*cy,zz=cz*cz;
            if(cz<100||xx+yy+zz>100000000)continue;
            ap_int<32> sg[3];candidate_score(cx,cy,cz,obs,count,sg);
            ap_int<64> v0=sg[0]*ap_int<33>(reciprocal[0]),v1=sg[1]*ap_int<33>(reciprocal[1]),v2=sg[2]*ap_int<33>(reciprocal[2]);
            ap_int<64> minimum=v0<v1?(v0<v2?v0:v2):(v1<v2?v1:v2);ap_int<32> score=minimum>>20;
            if(score>best){found=true;best=score;best_raw=sg[0]+sg[1]+sg[2];bx=cx;by=cy;bz=cz;for(int g=0;g<3;g++)bg[g]=sg[g];}
        }
    }
    bool quality=count>=48&&frequencies>=3&&groups[0]>=8&&groups[1]>=8&&groups[2]>=8&&best>10650&&best_raw>count*12288&&bg[0]>groups[0]*10650&&bg[1]>groups[1]*10650&&bg[2]>groups[2]*10650;
    result.range(31,0)=bx;result.range(63,32)=by;result.range(95,64)=bz;result[96]=found;result[97]=quality;result.range(143,112)=best;
}
