`timescale 1ns/1ps
                                                                           
                                                                          
module tb_aligned_adc;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0,first=0;
reg [15:0] d1=0,d2=0;wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;
wire [255:0] samples;wire [31:0] seq,tc,oc,dc,aligned;wire [127:0] kinds;
integer mode=0,index=0,ch1,ch2,j,count=0;time lastconv=0;
ad7606_dual_fast #(.STARTUP(10)) dut(clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,aligned);
always @(posedge conv)begin
if(lastconv&&$time-lastconv!=50000)$fatal(1,"alignment changed20k cadence");lastconv=$time;
#40;busy=3;#4110;busy=0;end
always @(negedge cs[0])index=0;
always @(negedge rd)begin #150;
ch1=(index+((mode==1||mode==3)?1:mode==7?2:0)+(mode==5&&index>=3?1:0))%8;
ch2=(index+((mode==2||mode==3)?1:0))%8;
d1=100+ch1;d2=200+ch2;first={ch2==0,ch1==0};
if(mode==4&&index==8)d1=d1+1;
if(mode==10&&index==13)d1=d1+1;
if(mode==6)first[0]=0;
if(mode==8&&index==8)first[0]=!first[0];
if(mode==9&&index==3)begin busy[0]=1;#100;busy[0]=0;end
end
always @(posedge rd)if(cs==0)index=index+1;
always @(posedge clk)if(rst&&valid)begin count=count+1;
if(index!=16)$fatal(1,"must consume two whole8-word cycles");
if(mode<=3||mode==7)begin
 if(bad||tc||oc||dc)$fatal(1,"normal/verified rotation rejected mode%0d",mode);
 for(j=0;j<8;j=j+1)if(samples[j*16+:16]!=100+j||samples[128+j*16+:16]!=200+j)$fatal(1,"aligned channel data wrong mode%0d",mode);
end else if(bad!=1||oc==0)$fatal(1,"bad sequence/verification accepted mode%0d bad%0d",mode,bad);
end
initial begin
for(mode=0;mode<11;mode=mode+1)begin
rst=0;busy=0;first=0;lastconv=0;count=0;#100;rst=1;
wait(count==3);@(negedge clk);
if(((mode>=1&&mode<=3)||mode==7)&&aligned<3)$fatal(1,"alignment counter missing");
if(mode==0&&aligned!=0)$fatal(1,"normal frame counted as corrected");
$display("ALIGNMENT mode%0d PASS",mode);rst=0;#1000;
end
$display("ALIGNED ADC PASS normal, each/both rotated, bad repeat, midburst skip, missing/wrong FIRST, BUSY,20k cadence");$finish;
end
initial begin #3000000;$fatal(1,"alignment timeout");end
endmodule
