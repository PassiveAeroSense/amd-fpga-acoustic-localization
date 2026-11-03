`timescale 1ns/1ps
                                                                    
module tb_adc_recovery;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0,first=0;
reg [15:0] d1=0,d2=0;wire conv,reset,rd,valid,gap;wire [1:0] cs,bad;
wire [255:0] samples;wire [31:0] seq,tc,oc,dc;wire [127:0] kinds;
integer index=0,good=0,rejects=0,resets=0;reg stuck=0,injected=0,recovered=0;
ad7606_dual_fast #(.STARTUP(10),.RECOVERY_FRAMES(4)) dut(clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,tc,oc,dc,kinds,,);
always @(posedge reset)begin resets=resets+1;if(injected)begin stuck=0;recovered=1;end end
always @(posedge conv)fork
begin if(!stuck)begin #40;busy[0]=1;#4110;busy[0]=0;end end
begin #40;busy[1]=1;#4110;busy[1]=0;end
join
always @(negedge cs[1])index=0;
always @(negedge rd)begin #50;d1=100+index%8;d2=200+index%8;first={2{index%8==0}};end
always @(posedge rd)if(cs[1]==0)index=index+1;
always @(negedge clk)if(valid)begin
if(bad[0])rejects=rejects+1;
else begin good=good+1;if(samples[15:0]!=100||samples[255:240]!=207)$fatal(1,"recovery channel mapping");end
if(good==3&&!injected)begin injected=1;stuck=1;end
if(recovered&&good==6)begin
if(rejects<4||resets!=2||tc==0||dc!=0)$fatal(1,"watchdog cadence/counters");
$display("ADC RECOVERY PASS: missing BUSY rejected, reset issued, both arrays resumed");$finish;end end
initial begin #30;rst=1;#2000000;$fatal(1,"ADC did not recover");end
endmodule
