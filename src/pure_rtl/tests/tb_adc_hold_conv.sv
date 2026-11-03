`timescale 1ns/1ps
module tb_adc_hold_conv;
reg clk=0;always #5 clk=~clk;
reg rst=0;reg [1:0] normal_busy=0,injected_busy=0,first=0;
wire [1:0] busy=normal_busy|injected_busy;
reg [15:0] d1=0,d2=0;
wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;
wire [255:0] samples;wire [31:0] seq,tc,oc,dc;wire [127:0] kinds;
integer conversions=0,index1=0,index2=0,outputs=0;
time convtime=0,lowtime=0,prevconv=0;
ad7606_dual_fast #(.STARTUP(10),.PERIOD(2083),.PERIOD_FRAC_NUM(1),.PERIOD_FRAC_DEN(3),
 .HOLD_CONV_DURING_READ(1),.PRIME_READ(1),.CS_SETUP(200),.RD_LOW(40),.RD_HIGH(35),.BUSY_TIMEOUT(550)) dut(
 clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,);
always @(negedge conv)if(rst)begin
 lowtime=$time;
 if(cs!=3||!rd)$fatal(1,"CONVST fell while read bus active");
end
always @(posedge conv)begin
 if(lowtime&&$time-lowtime<500)$fatal(1,"insufficient CONVST low time");
 if(prevconv&&($time-prevconv!=20830)&&($time-prevconv!=20840))$fatal(1,"cadence drift");
 prevconv=$time;convtime=$time;conversions=conversions+1;
 fork
 begin #40;normal_busy[0]=1;#4200;normal_busy[0]=0;index1=0;end
 begin if(conversions!=120)begin #60;normal_busy[1]=1;#4200;normal_busy[1]=0;index2=0;end end
 join
end
                                                                          
                                                                             
initial forever begin
 @(negedge rd);
 if(dut.state==12&&dut.channel==0&&(conversions==20||conversions==40))begin
  #60;injected_busy[conversions==40]=1;
  #3850;injected_busy=0;
  if(conversions==20)index1=0;else index2=0;
 end
end
                                                                           
                                                                           
initial forever begin
 @(negedge cs[0]);
 if(conversions==60||conversions==80)begin
  #400;injected_busy[conversions==80]=1;#100;injected_busy=0;
 end
end
initial forever begin
 @(posedge rd);
 if(dut.state==8&&dut.channel==2&&(conversions==100||conversions==110))begin
  #40;injected_busy[conversions==110]=1;#100;injected_busy=0;
 end
end
always @(negedge rd)begin
 if(!conv||$time-convtime<7000)$fatal(1,"read while CONVST low or too early");
 #180;
 if(!cs[0])begin d1=16'(conversions*17+(index1%8)*31-2000);first[0]=index1%8==0;index1=index1+1;end
 if(!cs[1])begin d2=16'(-conversions*19+(index2%8)*43+1000);first[1]=index2%8==0;index2=index2+1;end
end
always @(posedge clk)if(rst&&cs!=3&&!conv)$fatal(1,"CONVST must stay high while selected");
always @(posedge clk)if(valid)begin
 if(dc||gap)$fatal(1,"unexpected deadline/gap");
 case(conversions)
  20,60,100:if(bad!=1)$fatal(1,"ADC1 unexpected BUSY escaped: %0d bad%0d",conversions,bad);
  40,80,110,120:if(bad!=2)$fatal(1,"ADC2 fault escaped: %0d bad%0d",conversions,bad);
  default:begin
   if(bad)$fatal(1,"healthy dynamic signal rejected at %0d",conversions);
   for(integer k=0;k<8;k=k+1)begin
    if(samples[k*16+:16]!==16'(conversions*17+k*31-2000))$fatal(1,"ADC1 word");
    if(samples[128+k*16+:16]!==16'(-conversions*19+k*43+1000))$fatal(1,"ADC2 word");
   end
  end
 endcase
 outputs=outputs+1;
 if(outputs==140)begin
  if(tc!=1||oc!=6||kinds[15:0]!=3||kinds[31:16]!=3)$fatal(1,"asymmetric counters tc%0d oc%0d kinds%h",tc,oc,kinds);
  $display("ADC_HOLD_CONV PASS:48k cadence,CONVST high through read,>=500ns low,dynamic16ch,observed3.85us rogue BUSY swapped A1/A2,setup/high-gap faults,missing A2");
  $finish;
 end
end
initial begin #30;rst=1;#4000000;$fatal(1,"timeout");end
endmodule
