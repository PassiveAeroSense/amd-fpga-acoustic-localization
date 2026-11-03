`timescale 1ns/1ps
module tb_power;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg [63:0] value=0;reg signed [15:0] exponent=0;
wire busy,done;wire signed [47:0] db;
power_to_db dut(clk,rst,start,value,exponent,busy,done,db);
integer i,f;
initial begin #30;rst=1;f=$fopen("power_out.txt","w");
for(i=0;i<64;i=i+1)begin @(negedge clk);value=(64'd1<<i)+(i>0?(64'd1<<(i-1)):0);exponent=-90;start=1;
@(negedge clk);start=0;wait(done);#1;$fwrite(f,"%0d %0d\n",value,db);end
@(negedge clk);value=0;start=1;@(negedge clk);start=0;wait(done);#1;if(db!=-48'sd1288490188800)$fatal(1,"zero power floor");
$fclose(f);$display("POWER GENERATED");$finish;end
endmodule
