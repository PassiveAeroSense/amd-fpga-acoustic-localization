`timescale 1ns/1ps
module tb_adc48;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0,first=0;reg [15:0] d1=0,d2=0;
wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;wire [255:0] samples;wire [31:0] seq,tc,oc,dc;wire [127:0] kinds;
integer index1=0,index2=0,count=0,conversions=0,nowtick=0,previous=0,delta,last1=0,last2=0,checked=0;time convtime;
wire delayed_cs;assign #1400 delayed_cs=cs[1];
ad7606_dual_fast #(.STARTUP(10),.PERIOD(2083),.PERIOD_FRAC_NUM(1),.PERIOD_FRAC_DEN(3),
 .HOLD_CONV_DURING_READ(1),.PRIME_READ(1),.CS_SETUP(200),.RD_LOW(40),.RD_HIGH(35),.BUSY_TIMEOUT(550),.RECOVERY_FRAMES(4800)) dut(
 clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,);
always @(posedge clk)nowtick=nowtick+1;
always @(posedge conv)begin
conversions=conversions+1;convtime=$time;
if(previous)begin delta=nowtick-previous;
if(delta!=2083&&delta!=2084)$fatal(1,"48k period drift %0d",delta);
if(checked>=2&&delta+last1+last2!=6250)$fatal(1,"48k rational rate mismatch");
last2=last1;last1=delta;checked=checked+1;end previous=nowtick;
fork
begin #40;busy[0]=1;#4200;busy[0]=0;end
begin if(conversions!=20)begin #60;busy[1]=1;#4200;busy[1]=0;end end
join
end
always @(negedge cs[0])index1=0;
always @(negedge delayed_cs)index2=0;
always @(negedge rd)begin
if($time-convtime<5000)$fatal(1,"read before conversion guard");
#180;
if(!cs[0])begin d1=100+index1%8;first[0]=index1%8==0;index1=index1+1;end
if(!delayed_cs)begin d2=200+index2%8;first[1]=index2%8==0;index2=index2+1;end
end
always @(posedge clk)if(valid)begin
if(bad[0]||dc||gap)$fatal(1,"A1 fault/deadline at48k");
if(conversions==20)begin if(bad!=2)$fatal(1,"missing A2 not isolated");end
else begin
if(bad)$fatal(1,"healthy48k transfer rejected");
for(integer k=0;k<8;k=k+1)if(samples[k*16+:16]!=100+k||samples[128+k*16+:16]!=200+k)$fatal(1,"channel order");end
count=count+1;if(count==120)begin
if(tc!=1||kinds[127:112]!=1||checked<100)$fatal(1,"diagnostics or cadence lost");
$display("ADC48 PASS exact-average48k,2083/2084 clocks,two-pass16words,1400ns CS skew,180ns data settling,missing A2 preserved");$finish;end
end
initial begin #30;rst=1;#3000000;$fatal(1,"adc48 timeout");end
endmodule
