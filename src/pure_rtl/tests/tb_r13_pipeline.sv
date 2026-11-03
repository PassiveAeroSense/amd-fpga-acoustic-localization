`timescale 1ns/1ps
                                                                               
module tb_r13_pipeline;
reg clk=0;always #10 clk=~clk;reg rst=0,iv=0,ig=0;reg [1:0] bad=0;reg [255:0] data=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
integer n,j,span,loc_count=0,det_count=0,hard_gaps=0;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
always @(posedge dut.pc)if(dut.pr[2])begin
if(dut.audio_valid)loc_count=loc_count+1;
if(dut.detector_sample_valid)begin det_count=det_count+1;
if(dut.detection.audio_samples[383:192]!==192'd0)$fatal(1,"ADC2 leaked into detector");
if(dut.detection.audio_samples[191:0]!==dut.detector_packet[191:0])$fatal(1,"detector used48k packet");end
end
always @(posedge dut.ac)if(dut.ar[2]&&dut.repaired_gap)hard_gaps=hard_gaps+1;
initial begin
force dut.av=iv;force dut.ag=ig;force dut.bad=bad;force dut.adc_samples=data;
force dut.timeouts=0;force dut.order_errors=0;force dut.deadlines=0;force dut.aligned_frames=0;
#100;rst=1;wait(dut.ar[2]);repeat(5)@(negedge dut.ac);
for(n=0;n<4800;n=n+1)begin
@(negedge dut.ac);iv=1;bad=n==500?1:(n==800||n==801)?2:n==1200?3:0;
for(j=0;j<16;j=j+1)data[j*16+:16]=bad[j/8]?16'h7fff:16'(((n%200)-100)*(j+1));
span=n%3==2?2084:2083;
@(negedge dut.ac);iv=0;repeat(span-2)@(negedge dut.ac);
end
repeat(4000)@(negedge dut.ac);
if(hard_gaps||dut.repaired_total!=4||dut.secondary_fault_epoch!=3||dut.epoch!=0)$fatal(1,"repair policy changed at48k");
if(loc_count!=4416||det_count!=1372)$fatal(1,"48k/15k output cadence %0d %0d",loc_count,det_count);
if(dut.rate_fault||dut.loc_fault||dut.audio_overrun||dut.detector_mailbox_overrun)$fatal(1,"filter or CDC overrun");
if(dut.innovation.capture.invalid&&dut.innovation.capture.busy)$fatal(1,"capture rejected valid48k stream");
$display("R13 PIPELINE PASS ADC1/ADC2 repairs,4416 localization48k samples,1372 detector15k samples,A1-only features,no filter/CDC overrun");$finish;
end
initial begin #120000000;$fatal(1,"pipeline timeout");end
endmodule
