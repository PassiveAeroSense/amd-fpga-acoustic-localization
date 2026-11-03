`timescale 1ns/1ps
module tb_adc_priming;
reg clk=0;always #5 clk=~clk;reg rst=0;
reg [1:0] busy=0,first=0;reg [15:0] d1=0,d2=0;
wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;wire [255:0] samples;
wire [31:0] seq,tc,oc,dc,aligned;wire [127:0] kinds;
integer n=0,index1=0,index2=0,reads=0,frames=0,expected_align=0;
integer mode1,mode2;time previous=0;
ad7606_dual_fast #(.STARTUP(10),.PERIOD(2083),.PERIOD_FRAC_NUM(1),.PERIOD_FRAC_DEN(3),
 .HOLD_CONV_DURING_READ(1),.PRIME_READ(1),.CS_SETUP(200),.RD_LOW(40),.RD_HIGH(35),.BUSY_TIMEOUT(550)) dut(
 clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,aligned);
always @(posedge conv)begin
 if(previous&&$time-previous!=20830&&$time-previous!=20840)$fatal(1,"48k cadence");
 previous=$time;n=n+1;mode1=n%3;mode2=(n+1)%3;
 #40;busy=3;#4200;busy=0;index1=0;index2=0;
end
always @(negedge cs[0])reads=0;
always @(negedge rd)begin
 reads=reads+1;#180;
 if(!cs[0])begin
  if(reads==1&&mode1==1)begin d1=0;first[0]=0;end
  else if(reads==1&&mode1==2)begin d1=16'ha55a;first[0]=0;index1=index1+1;end
  else begin d1=16'(n*719+(index1%8)*211-30000);first[0]=index1%8==0;index1=index1+1;end
                                                                            
  if(n==30&&reads==2)d1=d1^16'h0001;
 end
 if(!cs[1])begin
  if(reads==1&&mode2==1)begin d2=0;first[1]=0;end
  else if(reads==1&&mode2==2)begin d2=16'h5aa5;first[1]=0;index2=index2+1;end
  else begin d2=16'(30000-n*631-(index2%8)*307);first[1]=index2%8==0;index2=index2+1;end
  if(n==50&&reads==2)d2=d2^16'h0002;
 end
end
always @(posedge clk)if(valid)begin
 if(reads!=17||gap||dc||tc)$fatal(1,"17read frame timing failure");
 if(n==30)begin if(bad!=1)$fatal(1,"formal ADC1 mismatch accepted");end
 else if(n==50)begin if(bad!=2)$fatal(1,"formal ADC2 mismatch accepted");end
 else if(bad)$fatal(1,"priming instability rejected complete verified frame: %0d %0d",n,bad);
 for(integer k=0;k<8;k=k+1)begin
  if(!bad[0]&&samples[k*16+:16]!==16'(n*719+k*211-30000))$fatal(1,"ADC1 mapping/data");
  if(!bad[1]&&samples[128+k*16+:16]!==16'(30000-n*631-k*307))$fatal(1,"ADC2 mapping/data");
 end
 if((mode1==1&&!bad[0])||(mode2==1&&!bad[1]))expected_align=expected_align+1;
 if(aligned!=expected_align)$fatal(1,"intentional priming rotation counted as error %0d %0d",aligned,expected_align);
 frames=frames+1;
 if(frames==80)begin
  if(oc!=2)$fatal(1,"formal mismatches must remain visible");
  $display("ADC_PRIMING PASS:17strobes,48k,zero/stale/healthy initial bus swapped ADCs,all16 signed values/channel mapping,formal first-word mismatch still rejected,budget/deadline,nominal rotation excluded from FIX");
  $finish;
 end
end
initial begin #30;rst=1;#2500000;$fatal(1,"timeout");end
endmodule
