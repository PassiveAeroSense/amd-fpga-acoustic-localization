`timescale 1ns/1ps
                                                                                
                                                                             
module tb_repair_symmetry;
reg clk=0;always #5 clk=~clk;reg rst=0,iv=0,ig=0,invalid=0;
reg [255:0] data=0;wire v1,v2,g1,g2;wire [255:0] x1,x2;wire [31:0] f1,f2;
integer n,outputs=0,gaps=0;
adc_frame_repair #(.WINDOW_FRAMES(100),.MAX_REPAIRS(3)) a1(clk,rst,iv,{1'b0,invalid},ig,data,v1,x1,g1,f1);
adc_frame_repair #(.WINDOW_FRAMES(100),.MAX_REPAIRS(3)) a2(clk,rst,iv,{invalid,1'b0},ig,data,v2,x2,g2,f2);
always @(posedge clk)begin #1;
 if(rst)begin
 if(v1!==v2||g1!==g2||f1!==f2||(v1&&x1!==x2))$fatal(1,"A1/A2 behavior differs");
 if(v1)outputs=outputs+1;if(g1)gaps=gaps+1;
 end
end
task sample(input integer k,input bit rejected);
begin @(negedge clk);iv=1;invalid=rejected;
for(integer j=0;j<16;j=j+1)data[j*16+:16]=rejected?16'h8000:16'(k*60+j*6-1000);
@(negedge clk);iv=0;repeat(7)@(negedge clk);end endtask
initial begin
#20;rst=1;
for(n=0;n<14;n=n+1)sample(n,n==3||n==7||n==8);
if(f1!=3||gaps!=0||outputs!=12)$fatal(1,"symmetric repair short failures");
sample(14,1);sample(15,0);sample(16,0);
if(gaps==0||f1!=3)$fatal(1,"symmetric budget limit bypassed");
@(negedge clk);rst=0;repeat(3)@(negedge clk);rst=1;gaps=0;outputs=0;
for(n=0;n<10;n=n+1)sample(n,n>=3&&n<=5);
if(gaps==0)$fatal(1,"symmetric consecutive-error limit bypassed");
@(negedge clk);ig=1;@(negedge clk);ig=0;repeat(2)@(negedge clk);
$display("REPAIR SYMMETRY PASS: ADC1/ADC2 interchangeable,2-frame limit,budget,hard gaps");$finish;
end
endmodule
