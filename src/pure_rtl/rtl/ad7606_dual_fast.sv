`timescale 1ns/1ps
                                                                         
                                                                     
                                                                               
                                                                        
module ad7606_dual_fast #(parameter PERIOD=5000,STARTUP=5000000,RECOVERY_FRAMES=2000,
 CS_SETUP=200,CONV_HIGH=100,RD_LOW=100,RD_HIGH=100,BUSY_TIMEOUT=800,PERIOD_FRAC_NUM=0,PERIOD_FRAC_DEN=1,HOLD_CONV_DURING_READ=0,PRIME_READ=0)(
 input clk,rst_n,input [1:0] adc_busy,firstdata,input [15:0] data1,data2,
 output reg convst,adc_reset,rd_n,output reg [1:0] cs_n,
 output reg frame_valid,output reg [255:0] samples,output reg [1:0] bad,
 output reg [31:0] frame_sequence,output reg gap,
 output reg [31:0] timeout_count,order_error_count,deadline_count,
 output reg [127:0] error_kinds,output reg [64:0] control_trace,output reg [31:0] aligned_frames);
                                                    
                                                                 
                                                                          
reg [7:0] frame_reasons;integer reason_index;
(* ASYNC_REG="TRUE" *)reg [1:0] b0,b1,f0,f1;
always @(posedge clk)begin b0<=adc_busy;b1<=b0;f0<=firstdata;f1<=f0;end

                                                                             
                                                         
reg [1:0] bq,fq;reg [1:0] bc[0:1],fc[0:1];integer qi;
always @(posedge clk)begin
 if(!rst_n)begin bq<=0;fq<=0;for(qi=0;qi<2;qi=qi+1)begin bc[qi]<=0;fc[qi]<=0;end end
 else for(qi=0;qi<2;qi=qi+1)begin
 if(b1[qi]==bq[qi])bc[qi]<=0;
 else if(bc[qi]==2)begin bq[qi]<=b1[qi];bc[qi]<=0;end else bc[qi]<=bc[qi]+1;
 if(f1[qi]==fq[qi])fc[qi]<=0;
 else if(fc[qi]==2)begin fq[qi]<=f1[qi];fc[qi]<=0;end else fc[qi]<=fc[qi]+1;
 end
end
reg [3:0] state;reg [31:0] timer,period,sequence_counter,active_sequence;
reg [31:0] period_limit,period_fraction;
wire period_end=period==period_limit-1;
reg running;reg [1:0] seen,active,work_bad;reg [2:0] channel;
                                                                           
                                                                          
reg [15:0] missing_run[0:1];
wire recover_missing=missing_run[0]>=RECOVERY_FRAMES||missing_run[1]>=RECOVERY_FRAMES;
reg [255:0] work_data;
reg [7:0] first_mask1,first_mask2;
reg [2:0] first_index1,first_index2;integer align_ch;
wire [1:0] alignment_bad={(first_mask2==0)||((first_mask2&(first_mask2-8'd1))!=0),(first_mask1==0)||((first_mask1&(first_mask1-8'd1))!=0)};
localparam [7:0] NOMINAL_FIRST=PRIME_READ?8'h80:8'h01;
wire [1:0] final_bad=work_bad|(alignment_bad&active);
                                                                              
                                                                      
always @(posedge clk)begin
control_trace[0]<=frame_valid&&|bad;
control_trace[32:1]<={data2,data1};control_trace[34:33]<=adc_busy;control_trace[36:35]<=firstdata;
control_trace[38:37]<=b1;control_trace[40:39]<=f1;control_trace[42:41]<=bq;control_trace[44:43]<=fq;
control_trace[45]<=rd_n;control_trace[47:46]<=cs_n;control_trace[48]<=convst;control_trace[49]<=adc_reset;
control_trace[53:50]<=state;control_trace[56:54]<=channel;control_trace[64:57]<=timer[7:0];
end
always @(posedge clk)begin
if(!rst_n)begin state<=0;timer<=0;period<=0;period_limit<=PERIOD;period_fraction<=0;sequence_counter<=0;active_sequence<=0;running<=0;seen<=0;active<=0;work_bad<=3;channel<=0;work_data<=0;
missing_run[0]<=0;missing_run[1]<=0;
first_mask1<=0;first_mask2<=0;first_index1<=0;first_index2<=0;aligned_frames<=0;
convst<=0;adc_reset<=0;rd_n<=1;cs_n<=3;frame_valid<=0;samples<=0;bad<=3;frame_sequence<=0;gap<=0;timeout_count<=0;order_error_count<=0;deadline_count<=0;error_kinds<=0;frame_reasons<=0;end
else begin frame_valid<=0;gap<=0;
                                                                              
                                                                         
if(state==6||state==7||state==8||state==10||state==11||state==12||state==13)begin
 work_bad<=work_bad|(bq&active);
 frame_reasons[1:0]<=frame_reasons[1:0]|(bq&active);
end
if(running)begin
 if(period_end)begin period<=0;sequence_counter<=sequence_counter+1;
 if(period_fraction+PERIOD_FRAC_NUM>=PERIOD_FRAC_DEN)begin
 period_fraction<=period_fraction+PERIOD_FRAC_NUM-PERIOD_FRAC_DEN;period_limit<=PERIOD+1;end
 else begin period_fraction<=period_fraction+PERIOD_FRAC_NUM;period_limit<=PERIOD;end
 if(state!=3)begin deadline_count<=deadline_count+1;gap<=1;end end
 else period<=period+1;
end
case(state)
0:if(timer==STARTUP-1)begin timer<=0;adc_reset<=1;state<=1;end else timer<=timer+1;
1:if(timer==99)begin timer<=0;adc_reset<=0;state<=2;end else timer<=timer+1;
2:if(timer==99)begin timer<=0;period<=PERIOD-1;period_limit<=PERIOD;period_fraction<=0;running<=1;state<=3;end else timer<=timer+1;
3:if(period_end)begin
 if(|bq||recover_missing)begin running<=0;timeout_count<=timeout_count+1;gap<=1;timer<=0;adc_reset<=1;state<=1;
 missing_run[0]<=0;missing_run[1]<=0;convst<=0;rd_n<=1;cs_n<=3;
 for(reason_index=0;reason_index<2;reason_index=reason_index+1)
 if(bq[reason_index]&&error_kinds[(6+reason_index)*16+:16]!=65535)
 error_kinds[(6+reason_index)*16+:16]<=error_kinds[(6+reason_index)*16+:16]+1'b1;
 end
 else begin active_sequence<=sequence_counter;convst<=1;timer<=0;seen<=0;work_bad<=0;frame_reasons<=0;first_mask1<=0;first_mask2<=0;state<=4;end end
4:begin seen<=seen|bq;timer<=timer+1;if(timer==CONV_HIGH-1)begin if(!HOLD_CONV_DURING_READ)convst<=0;state<=5;end end
5:begin seen<=seen|bq;timer<=timer+1;
 if((seen==3&&bq==0&&timer>=499)||timer==BUSY_TIMEOUT-1)begin
 active<=seen&~bq;work_bad<=~(seen&~bq);cs_n<=~(seen&~bq);channel<=0;timer<=0;state<=6;
 frame_reasons[7:6]<=~(seen&~bq);
 if(seen!=3||bq!=0)timeout_count<=timeout_count+1;
 end end
6:if(timer==CS_SETUP-1)begin rd_n<=0;timer<=0;state<=PRIME_READ?12:7;end else timer<=timer+1;
7:begin work_bad<=work_bad|(bq&active);frame_reasons[1:0]<=frame_reasons[1:0]|(bq&active);
 if(timer==RD_LOW-1)begin
 work_data[channel*16+:16]<=data1;work_data[128+channel*16+:16]<=data2;
 work_bad<=work_bad|(bq&active);
 first_mask1[channel]<=fq[0];first_mask2[channel]<=fq[1];
 if(fq[0])first_index1<=channel;if(fq[1])first_index2<=channel;
 if(channel==0)frame_reasons[3:2]<=frame_reasons[3:2]|(~fq&active);
 else frame_reasons[5:4]<=frame_reasons[5:4]|(fq&active);
 rd_n<=1;timer<=0;state<=8;
 end else timer<=timer+1;end
8:if(timer==RD_HIGH-1)begin timer<=0;if(channel==7)begin channel<=0;rd_n<=0;state<=10;end
else begin channel<=channel+1;rd_n<=0;state<=7;end end else timer<=timer+1;
                                                                          
                                                                          
                                                                            
12:if(timer==RD_LOW-1)begin rd_n<=1;timer<=0;state<=13;end else timer<=timer+1;
13:if(timer==RD_HIGH-1)begin rd_n<=0;timer<=0;channel<=0;state<=7;end else timer<=timer+1;
                                                                             
                                                                              
                                                                            
                                                                             
                                                                        
                                                                                   
10:begin work_bad<=work_bad|(bq&active);frame_reasons[1:0]<=frame_reasons[1:0]|(bq&active);
if(timer==RD_LOW-1)begin
work_bad<=work_bad|(bq&active)|({data2!=work_data[128+channel*16+:16]||fq[1]!=first_mask2[channel],data1!=work_data[channel*16+:16]||fq[0]!=first_mask1[channel]}&active);
rd_n<=1;timer<=0;state<=11;end else timer<=timer+1;end
11:if(timer==RD_HIGH-1)begin timer<=0;
if(channel==7)begin cs_n<=3;state<=9;end
else begin channel<=channel+1;rd_n<=0;state<=10;end end else timer<=timer+1;
9:begin
                                                                            
                                                                           
                                                                          
                                                                               
                                                                               
convst<=0;
for(reason_index=0;reason_index<2;reason_index=reason_index+1)
if(active[reason_index])missing_run[reason_index]<=0;
else if(missing_run[reason_index]!=65535)missing_run[reason_index]<=missing_run[reason_index]+1'b1;
for(align_ch=0;align_ch<8;align_ch=align_ch+1)begin
samples[align_ch*16+:16]<=work_data[((first_index1+align_ch)%8)*16+:16];
samples[128+align_ch*16+:16]<=work_data[128+((first_index2+align_ch)%8)*16+:16];end
bad<=final_bad;frame_sequence<=active_sequence;frame_valid<=1;
if((first_mask1!=NOMINAL_FIRST&&!final_bad[0])||(first_mask2!=NOMINAL_FIRST&&!final_bad[1]))aligned_frames<=aligned_frames+1;
for(reason_index=0;reason_index<8;reason_index=reason_index+1)
if(frame_reasons[reason_index]&&error_kinds[reason_index*16+:16]!=65535)
error_kinds[reason_index*16+:16]<=error_kinds[reason_index*16+:16]+1'b1;
if(|(final_bad&active))order_error_count<=order_error_count+1;state<=3;end
default:begin state<=0;running<=0;timer<=0;convst<=0;rd_n<=1;cs_n<=3;gap<=1;end
endcase
end
end

endmodule
