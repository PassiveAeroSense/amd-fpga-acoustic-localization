#include "kernels.hpp"
#include "numeric.hpp"
#include "search_cos.hpp"
#include <cstdint>
using namespace r18;
struct Observation {ap_uint<32> phase,coefficient;ap_uint<8> pair;ap_uint<2> group;ap_uint<4> slot;};
                                                                            
                                                                                
                                                                                 
static void candidate_score(ap_int<32> cx,ap_int<32> cy,ap_int<32> cz,const Observation obs[1440],int count,bool baseline_two,ap_int<64> group_score[3]) {
#pragma HLS INLINE off
    uint32_t distance[16];
#pragma HLS ARRAY_PARTITION variable=distance complete
    for(int i=0;i<16;i++){
        int32_t mx=ap_int<16>(MIC[i].range(31,16)).to_int(),my=ap_int<16>(MIC[i].range(15,0)).to_int();
        int64_t dx=int64_t(cx.to_int())-mx-(baseline_two?(i<8?-500:500):0),dy=int64_t(cy.to_int())-my,z=cz.to_int();
        distance[i]=isqrt(ap_uint<64>((uint64_t(dx*dx+dy*dy+z*z))<<32)).to_uint();
    }
    int64_t sum0=0,sum1=0,real[12],imag[12];
#pragma HLS ARRAY_PARTITION variable=real complete
#pragma HLS ARRAY_PARTITION variable=imag complete
    for(int i=0;i<12;i++){
#pragma HLS UNROLL
        real[i]=0;imag[i]=0;
    }
    for(int i=0;i<count;i++){
#pragma HLS LOOP_TRIPCOUNT min=24 max=1440 avg=1200
#pragma HLS PIPELINE II=1
        Observation o=obs[i];unsigned p=PAIRS[o.pair].to_uint();
        int32_t delta=int32_t(int64_t(distance[p&15])-int64_t(distance[p>>4]));
        int64_t predicted=int64_t(delta)*o.coefficient.to_uint();
        uint32_t phase=o.phase.to_uint()-uint32_t(predicted>>16);
        unsigned a=phase>>20,si=(a+3072)&4095,fraction=phase&1048575;
        int64_t angle=(int64_t(fraction)*1647099)>>20,angle2=(angle*angle)>>30;
        int32_t co=SEARCH_COS[a].to_int(),sn=SEARCH_COS[si].to_int();
        int32_t re=int32_t(int64_t(co)-((int64_t(sn)*angle)>>30)-((int64_t(co)*angle2)>>31));
        int32_t im=int32_t(int64_t(sn)+((int64_t(co)*angle)>>30)-((int64_t(sn)*angle2)>>31));
        unsigned group=o.group.to_uint(),slot=o.slot.to_uint();
        if(group==0)sum0+=re;else if(group==1)sum1+=re;else{real[slot]+=re;imag[slot]+=im;}
    }
    uint64_t cross=0;
    for(int i=0;i<12;i++){int64_t r=real[i]>>6,v=imag[i]>>6;cross+=isqrt(ap_uint<64>(uint64_t(r*r+v*v))).to_uint64()<<6;}
    group_score[0]=sum0;group_score[1]=sum1;group_score[2]=cross;
}

static bool in_domain(ap_int<32> x,ap_int<32> y,ap_int<32> z,unsigned h,unsigned v){
#pragma HLS INLINE
 ap_int<64> xx=x*x,yy=y*y;ap_uint<64> hh=ap_uint<64>(h)*h;
 return z>=0&&z<=ap_int<33>(v)&&xx+yy<=hh&&(x!=0||y!=0||z!=0);
}
static ap_int<32> evaluate(ap_int<32> x,ap_int<32> y,ap_int<32> z,const Observation obs[1440],int count,bool baseline_two,const ap_uint<32> reciprocal[3],ap_int<64> sg[3]){
#pragma HLS INLINE off
 candidate_score(x,y,z,obs,count,baseline_two,sg);
 ap_int<64> v0=sg[0]*ap_int<33>(reciprocal[0]),v1=sg[1]*ap_int<33>(reciprocal[1]),v2=sg[2]*ap_int<33>(reciprocal[2]);
 ap_int<64> m=v0<v1?(v0<v2?v0:v2):(v1<v2?v1:v2);return m>>20;
}
struct Seed {ap_int<32> x,y,z,score;};
void joint_search_hls(const ap_uint<64> covariance[36176],const ap_uint<48> grid[65536],unsigned grid_count,unsigned horizontal_mm,unsigned vertical_mm,bool baseline_two,bool fast_mode,ap_uint<144>& result){
#pragma HLS INTERFACE ap_memory port=covariance storage_type=rom_1p latency=2
#pragma HLS INTERFACE ap_memory port=grid storage_type=rom_1p latency=2
#pragma HLS INTERFACE ap_none port=grid_count
#pragma HLS INTERFACE ap_none port=horizontal_mm
#pragma HLS INTERFACE ap_none port=vertical_mm
#pragma HLS INTERFACE ap_none port=baseline_two
#pragma HLS INTERFACE ap_none port=fast_mode
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
                                                                              
                                                                                 
    Seed seeds[3];
#pragma HLS ARRAY_PARTITION variable=seeds complete
    for(int k=0;k<3;k++){seeds[k].x=0;seeds[k].y=0;seeds[k].z=1000;seeds[k].score=-2147483647;}
    for(unsigned n=0;n<grid_count&&n<65536;n++){
#pragma HLS LOOP_TRIPCOUNT min=9878 max=25002 avg=19096
        ap_uint<48> g=grid[n];ap_int<32> cx=ap_int<16>(g.range(47,32)),cy=ap_int<16>(g.range(31,16)),cz=ap_int<16>(g.range(15,0));
        if(!in_domain(cx,cy,cz,horizontal_mm,vertical_mm))continue;
        ap_int<64> sg[3];ap_int<32> score=evaluate(cx,cy,cz,obs,count,baseline_two,reciprocal,sg);
        int near=-1,worst=0;
        for(int k=0;k<3;k++){
            ap_int<32> dx=cx-seeds[k].x,dy=cy-seeds[k].y,dz=cz-seeds[k].z;
            ap_int<64> dd=ap_int<64>(dx)*dx+ap_int<64>(dy)*dy+ap_int<64>(dz)*dz;
            if(seeds[k].score!=-2147483647&&dd<250000)near=k;
            if(seeds[k].score<seeds[worst].score)worst=k;
        }
        int k=near>=0?near:worst;
        if(score>seeds[k].score){seeds[k].x=cx;seeds[k].y=cy;seeds[k].z=cz;seeds[k].score=score;}
    }
    ap_int<32> bx=0,by=0,bz=1000,best=-2147483647;ap_int<64> best_raw=0,bg[3]={0,0,0};bool found=false;
    for(int k=0;k<3;k++){
        if(seeds[k].score==-2147483647)continue;
        ap_int<32> lx=seeds[k].x,ly=seeds[k].y,lz=seeds[k].z,local_best=seeds[k].score;
        ap_int<64> sg[3];evaluate(lx,ly,lz,obs,count,baseline_two,reciprocal,sg);
        if(local_best>best){best=local_best;bx=lx;by=ly;bz=lz;best_raw=sg[0]+sg[1]+sg[2];for(int t=0;t<3;t++)bg[t]=sg[t];found=true;}
        int levels=fast_mode?6:7;
        for(int level=0;level<levels;level++){
            int j=level+(fast_mode?1:0);
            int step=j==0?2000:j==1?1000:j==2?500:j==3?200:j==4?100:j==5?25:10;
            ap_int<32> center_x=lx,center_y=ly,center_z=lz;
            int total=fast_mode?125:343;
            for(int n=0;n<total;n++){
#pragma HLS LOOP_TRIPCOUNT min=125 max=343 avg=234
                int ix,iy,iz;
                if(fast_mode){ix=n/25-2;iy=(n/5)%5-2;iz=n%5-2;}
                else{ix=n/49-3;iy=(n/7)%7-3;iz=n%7-3;}
                ap_int<32> cx=center_x+ix*step,cy=center_y+iy*step,cz=center_z+iz*step;
                if(!in_domain(cx,cy,cz,horizontal_mm,vertical_mm))continue;
                ap_int<32> score=evaluate(cx,cy,cz,obs,count,baseline_two,reciprocal,sg);
                if(score>local_best){local_best=score;lx=cx;ly=cy;lz=cz;}
                if(score>best){found=true;best=score;best_raw=sg[0]+sg[1]+sg[2];bx=cx;by=cy;bz=cz;for(int t=0;t<3;t++)bg[t]=sg[t];}
            }
        }
                                                                              
                                                                                
        for(int level=0;level<3;level++){
            int step=level==0?100:level==1?10:1;
            int32_t cx0=lx.to_int(),cy0=ly.to_int(),cz0=lz.to_int();
            for(int n=-20;n<=20;n++){
                int scale=10000+n*step;
                ap_int<32> cx=(int64_t(cx0)*scale+(cx0>=0?5000:-5000))/10000;
                ap_int<32> cy=(int64_t(cy0)*scale+(cy0>=0?5000:-5000))/10000;
                ap_int<32> cz=(int64_t(cz0)*scale+5000)/10000;
                if(!in_domain(cx,cy,cz,horizontal_mm,vertical_mm))continue;
                ap_int<32> score=evaluate(cx,cy,cz,obs,count,baseline_two,reciprocal,sg);
                if(score>local_best){local_best=score;lx=cx;ly=cy;lz=cz;}
                if(score>best){found=true;best=score;best_raw=sg[0]+sg[1]+sg[2];bx=cx;by=cy;bz=cz;for(int t=0;t<3;t++)bg[t]=sg[t];}
            }
        }
    }
    bool quality=count>=48&&frequencies>=3&&groups[0]>=8&&groups[1]>=8&&groups[2]>=8&&best>10650*65536&&best_raw>ap_int<64>(count)*12288*65536&&bg[0]>ap_int<64>(groups[0])*10650*65536&&bg[1]>ap_int<64>(groups[1])*10650*65536&&bg[2]>ap_int<64>(groups[2])*10650*65536;
    result.range(31,0)=bx;result.range(63,32)=by;result.range(95,64)=bz;result[96]=found;result[97]=quality;result.range(143,112)=best;
}
