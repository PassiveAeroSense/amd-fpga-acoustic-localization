#include "kernels.hpp"
#include "numeric.hpp"
using namespace r18;
void detector_hls(const ap_int<48> bands[97],ap_uint<1> valid,ap_uint<1> new_sequence,ap_uint<1> array_id,ap_uint<104>& result){
#pragma HLS INTERFACE ap_memory port=bands storage_type=rom_1p latency=1
#pragma HLS INTERFACE ap_none port=valid
#pragma HLS INTERFACE ap_none port=new_sequence
#pragma HLS INTERFACE ap_none port=array_id
#pragma HLS INTERFACE ap_none port=result
    static ap_int<32> history[2][3];static ap_int<64> sums[2]={0,0};static ap_uint<2> counts[2]={0,0},ptr[2]={0,0};
#pragma HLS ARRAY_PARTITION variable=history complete
#pragma HLS ARRAY_PARTITION variable=sums complete
#pragma HLS ARRAY_PARTITION variable=counts complete
#pragma HLS ARRAY_PARTITION variable=ptr complete
#pragma HLS RESET variable=counts
#pragma HLS RESET variable=sums
#pragma HLS RESET variable=ptr
    unsigned a=array_id;result=0;
    if(new_sequence||!valid){counts[a]=0;sums[a]=0;ptr[a]=0;}
    if(!valid){result[102]=1;return;}
    ap_int<48> raw[97],features[218];ap_int<64> sum=0;
    for(int i=0;i<97;i++){
#pragma HLS PIPELINE II=1
        raw[i]=bands[i];features[i]=raw[i];sum+=raw[i];
    }
    ap_int<64> mean=sum<0?ap_int<64>(-ap_int<64>(udiv(ap_uint<64>(-sum),97))):ap_int<64>(udiv(ap_uint<64>(sum),97));
    for(int i=0;i<97;i++){
        ap_int<64> s=0;for(int j=-4;j<=4;j++){int at=i+j;if(at<0)at=0;if(at>96)at=96;s+=raw[at];}
        ap_int<64> m=s<0?ap_int<64>(-ap_int<64>(udiv(ap_uint<64>(-s),9))):ap_int<64>(udiv(ap_uint<64>(s),9));features[97+i]=ap_int<48>(raw[i]-m);
    }
    bool invalid=false;
    for(int k=0;k<24;k++){
        ap_int<88> acc=0;for(int i=0;i<97;i++){
#pragma HLS PIPELINE II=1
            ap_int<48> x=raw[i]-mean;ap_int<80> prod=x*DCT[k*97+i];acc+=prod;
        }
        ap_int<88> v=acc>>30;invalid|=v>140737488355327LL||v< -140737488355328LL;features[194+k]=ap_int<48>(v);
    }
    ap_int<64> score=0;
    for(int tree=0;tree<120;tree++){
        unsigned node=ROOTS[tree];bool leaf=false;
        for(int depth=0;depth<32;depth++){
            if(NODE_LEAF[node]){score+=NODE_VALUE[node];leaf=true;break;}
            unsigned f=NODE_FEAT[node],left=NODE_LEFT[node],right=NODE_RIGHT[node];
            if(f>=218||left>=1560||right>=1560){invalid=true;break;}
            node=features[f]<=NODE_THR[node]?left:right;
        }
        if(!leaf)invalid=true;
    }
    if(invalid||score>2147483647LL||score< -2147483648LL){counts[a]=0;sums[a]=0;ptr[a]=0;result[102]=1;return;}
    ap_int<64> next=sums[a]+score-(counts[a]==3?ap_int<64>(history[a][ptr[a]]):ap_int<64>(0));
    history[a][ptr[a]]=score;ptr[a]=ptr[a]==2?ap_uint<2>(0):ap_uint<2>(ptr[a]+1);if(counts[a]<3)counts[a]++;sums[a]=next;
    result.range(31,0)=ap_int<32>(score);result.range(95,32)=next;result.range(100,96)=counts[a];result[101]=next>ap_int<64>(50331648)*counts[a];result[102]=0;result[103]=array_id;
}
