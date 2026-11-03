`timescale 1ns/1ps
module tb_guarded_adc;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0,first=0;
wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;reg [15:0] d1=0,d2=0;
wire [255:0] samples;wire [31:0] seq,tc,oc,dc;
wire [127:0] kinds;
integer mode=0,index=0,j,g1=0,g2=0,b2=0;time conv_time;
ad7606_dual_fast #(.STARTUP(10)) dut(clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,);
always @(posedge conv)conv_time=$time;
always @(negedge rd)if($time-conv_time<5000)$fatal(1,"read before5us");
always @(posedge conv)fork
begin #40;busy[0]=1;#4110;busy[0]=0;end
begin if(mode!=1)begin #40;busy[1]=1;
if(mode==2)#12000;
else if(mode==9)begin #1500;busy[1]=0;#200;busy[1]=1;#2410;end
else #4110;busy[1]=0;end end
join
always @(negedge cs[0])index=0;
always @(negedge rd)begin #50;d1=100+(index%8);d2=200+(index%8);
first[0]=index%8==0;first[1]=mode==3?0:mode==4?1:index%8==0;
if(mode==5&&index==3)begin busy[1]=1;#200;busy[1]=0;end
if(mode==7&&index==3)begin busy[1]=1;#10;busy[1]=0;end
if(mode==8&&index==3)begin busy[1]=1;#20;busy[1]=0;end
if(mode==10&&index==3)begin busy[1]=1;#100;busy[1]=0;end
end
always @(posedge rd)if(cs[0]==0)index=index+1;
always @(posedge clk)if(rst&&valid)begin
if(!bad[0])begin g1=g1+1;for(j=0;j<8;j=j+1)if(samples[j*16+:16]!==16'(100+j))$fatal(1,"ADC1 data order");end
else $fatal(1,"ADC2 fault corrupted ADC1");
if(!bad[1])begin g2=g2+1;for(j=0;j<8;j=j+1)if(samples[128+j*16+:16]!==16'(200+j))$fatal(1,"ADC2 data order");end
else b2=b2+1;
end
initial begin
for(mode=0;mode<11;mode=mode+1)begin
rst=0;busy=0;first=0;g1=0;g2=0;b2=0;#100;rst=1;if(mode==6)busy[1]=1;
#99000;
if((mode==0||(mode>=7&&mode<=9))&&(g1==0||g2==0||b2!=0||tc||oc||dc))$fatal(1,"guard acceptance/cadence failed mode%0d",mode);
if((mode>=1&&mode<=5||mode==10)&&(b2==0||g2!=0))$fatal(1,"sustained ADC2 fault hidden mode%0d",mode);
if(mode==6&&tc==0)$fatal(1,"prestart busy not detected");
if(mode==0&&kinds!=0)$fatal(1,"normal transfer produced diagnostic errors");
if(mode==1&&kinds[127:112]==0)$fatal(1,"ADC2 missing BUSY diagnostic absent");
if(mode==3&&kinds[63:48]==0)$fatal(1,"ADC2 missing FIRST diagnostic absent");
if(mode==4&&kinds[95:80]==0)$fatal(1,"ADC2 late FIRST diagnostic absent");
if(mode==5&&kinds[31:16]==0)$fatal(1,"ADC2 read BUSY diagnostic absent");
$display("PRODUCTION GUARD mode%0d good1=%0d good2=%0d bad2=%0d PASS",mode,g1,g2,b2);
rst=0;#20000;
end
$display("PRODUCTION GUARDED READER 11 CASES PASS");$finish;end
initial begin #2000000;$fatal(1,"timeout");end
endmodule
