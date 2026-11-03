`timescale 1ns/1ps
                                                                            
                                                                                  
module tb_dual_repair_integration;
reg clk=0;always #10 clk=~clk;reg rst=0;
reg iv=0,ig=0;reg [1:0] bad=0;reg [255:0] data=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
integer n,c,outputs=0,gaps=0;reg check_values=1;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
always @(posedge dut.ac)begin #1;
 if(dut.ar[2]&&dut.repaired_gap)gaps=gaps+1;
 if(dut.ar[2]&&dut.repaired_valid)begin
  if(check_values)for(c=0;c<16;c=c+1)
   if($signed(dut.repaired_samples[c*16+:16])!==16'(outputs*60+c*6-300))
    $fatal(1,"top repair lost alignment/poison leaked lane%0d sample%0d",c,outputs);
  outputs=outputs+1;
 end
end
task sample(input integer k,input [1:0] rejected);
begin @(negedge dut.ac);iv=1;bad=rejected;
for(integer j=0;j<16;j=j+1)data[j*16+:16]=rejected[j/8]?16'h7fff:16'(k*60+j*6-300);
@(negedge dut.ac);iv=0;repeat(4999)@(negedge dut.ac);
end endtask
initial begin
force dut.av=iv;force dut.ag=ig;force dut.bad=bad;force dut.adc_samples=data;
force dut.timeouts=0;force dut.order_errors=0;force dut.deadlines=0;force dut.aligned_frames=0;
#100;rst=1;wait(dut.ar[2]);repeat(5)@(negedge dut.ac);
                                                                           
for(n=0;n<18;n=n+1)sample(n,n==3?1:(n==7||n==8)?2:n==12?3:0);
if(dut.repaired_total!=4||gaps!=0||outputs!=16)$fatal(1,"top symmetric repair counts");
if(dut.secondary_fault_epoch!=3)$fatal(1,"raw ADC2 diagnostics hidden");
if(dut.epoch!=0)$fatal(1,"repaired ADC2 frame reset shared timeline");
check_values=0;
                                                                                
for(n=18;n<25;n=n+1)sample(n,n>=19&&n<=21?2:0);
if(gaps==0||dut.epoch==0)$fatal(1,"unrecoverable A2 outage hidden");
ig=1;repeat(2)@(negedge dut.ac);ig=0;repeat(10)@(negedge dut.ac);
if(gaps<2)$fatal(1,"hard reader gap ignored");
$display("DUAL REPAIR TOP PASS: A1/A2/simultaneous repairs,16ch alignment,raw counter retained,A2 outage/hard gap rejected");$finish;
end
initial begin #2500000;$fatal(1,"dual repair top timeout");end
endmodule
