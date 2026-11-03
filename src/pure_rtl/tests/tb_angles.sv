`timescale 1ns/1ps
module tb_angles;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg signed [31:0] ux=0,uy=0;
wire busy,done,invalid,av;wire [11:0] az;wire [9:0] el;wire signed [31:0] uz;
direction_angles dut(clk,rst,start,ux,uy,busy,done,invalid,av,az,el,uz);
reg [31:0] x[0:79],y[0:79];integer i,f;
initial begin $readmemh("score_ux.mem",x);$readmemh("score_uy.mem",y);#30;rst=1;f=$fopen("angles_out.txt","w");
for(i=0;i<80;i=i+1)begin @(negedge clk);ux=x[i];uy=y[i];start=1;@(negedge clk);start=0;wait(done);#1;
if(invalid||!av)$fatal(1,"angles invalid");$fwrite(f,"%0d %0d %0d\n",az,el,uz);end
@(negedge clk);ux=0;uy=0;start=1;@(negedge clk);start=0;wait(done);#1;if(invalid||av||el!=900)$fatal(1,"zenith angle invalid");
@(negedge clk);ux=1073741824;uy=1073741824;start=1;@(negedge clk);start=0;wait(done);#1;if(!invalid)$fatal(1,"outside disk accepted");
$fclose(f);$display("ANGLES PASS zenith/invalid; random directions generated");$finish;end
endmodule
