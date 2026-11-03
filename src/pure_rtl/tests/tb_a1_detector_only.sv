`timescale 1ns/1ps
                                                                                   
                                                                             
module tb_a1_detector_only;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;
wire [11:0] addr,ga;wire [3:0] ch,gch;reg signed [23:0] sample=0,gs=0;
reg [7:0] pa=0;wire [63:0] pv,gpv;wire busy,done,invalid,gb,gd,gi;
wire [31:0] cycles,gcycles;reg [15:0] visited=0;integer k;
detector_stft_frame dut(clk,rst,start,addr,ch,sample,pa,pv,busy,done,invalid,cycles);
detector_stft_frame_r8 golden(clk,rst,start,ga,gch,gs,pa,gpv,gb,gd,gi,gcycles);
function signed [23:0] stimulus(input [11:0] n,input [3:0] c);
begin stimulus=c<8?($signed({1'b0,n[7:0]})-128)*(c+1)*256:24'sd7654321;end endfunction
always @(posedge clk)begin sample<=stimulus(addr,ch);gs<=stimulus(ga,gch);
if(busy)visited[ch]<=1;end
initial begin
#30;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;
wait(done);#1;if(invalid||visited!=16'h00ff)$fatal(1,"A1 detector requested wrong channels");
wait(gd);#1;if(gi)$fatal(1,"golden overflow");
for(k=0;k<97;k=k+1)begin @(negedge clk);pa=k;repeat(2)@(negedge clk);
if(pv!==gpv)$fatal(1,"R8 A1 power changed band%0d actual%0d expected%0d",k,pv,gpv);end
$display("A1 DETECTOR PASS: eight channels, bit-exact R8 A1 powers with unrelated A2 input, cycles%0d vs%0d",cycles,gcycles);$finish;
end
initial begin #50000000;$fatal(1,"detector frame timeout");end
endmodule
