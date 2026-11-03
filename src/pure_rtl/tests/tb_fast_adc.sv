`timescale 1ns/1ps
module tb_fast_adc;
reg clk=0;always #5 clk=~clk;reg rst=0;reg [1:0] busy=0;reg [1:0] first=0;
reg [15:0] d1=0,d2=0;wire conv,reset,rd;wire [1:0] cs;wire valid,gap;wire [255:0] samples;wire [1:0] bad;
wire [31:0] seq,timeout,order,deadline;integer index=0,frame=0,count=0,j;time last=0;
reg inject_order=0,missing=0;
wire [127:0] kinds;
ad7606_dual_fast #(.STARTUP(10)) dut(clk,rst,busy,first,d1,d2,conv,reset,rd,cs,valid,samples,bad,seq,gap,timeout,order,deadline,kinds,,);
always @(posedge conv)begin
if(last!=0&&$time-last!=50000)$fatal(1,"ADC period not20kSPS");last=$time;frame=frame+1;
if(!missing)begin #40;busy=3;#4110;busy=0;end
end
always @(negedge cs[0])index=0;
                                                                          
                                                
always @(negedge rd)begin #150;d1=frame*100+(index%8);d2=frame*100+(index%8)+20000;first={2{index%8==0}}^{2{inject_order}};end
always @(posedge rd)if(cs==0)index=index+1;
always @(posedge clk)if(valid)begin
count=count+1;
if(!inject_order&&!missing)begin
 if(bad!=0)$fatal(1,"ADC valid transfer rejected");
 for(j=0;j<8;j=j+1)if(samples[j*16+:16]!==frame*100+j||samples[128+j*16+:16]!==frame*100+j+20000)$fatal(1,"ADC data order mismatch");
end
end
initial begin #30;rst=1;wait(count==100);if(deadline||timeout||order)$fatal(1,"20kSPS timing errors");
@(negedge clk);inject_order=1;wait(count==103);if(order==0)$fatal(1,"FIRSTDATA fault undetected");
@(negedge clk);inject_order=0;missing=1;wait(timeout>0);$display("ADC PASS 20kSPS16ch, delayed150ns data/FIRSTDATA, ordering and missingBUSY faults");$finish;end
initial begin #10000000;$fatal(1,"ADC test timeout");end
endmodule
