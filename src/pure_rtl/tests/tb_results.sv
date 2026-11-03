`timescale 1ns/1ps
                                                                       
module tb_results;
reg clk=0;always #5 clk=~clk;reg rst=0,update=0;reg [2:0] ok=7;
wire valid,dv,pv,av;wire [11:0] az;wire [9:0] el;
wire signed [31:0] ux,uy,x,y,z;wire [31:0] gap;
localization_results dut(clk,rst,update,1'b1,ok,
32'sd520841289,-32'sd520841289,32'sd611821186,-32'sd489456949,
32'sd412435659,-32'sd549914212,32'd16777216,16'd300,
valid,dv,pv,av,az,el,ux,uy,x,y,z,gap);
integer n;
task submit;
begin @(negedge clk);update=1;@(negedge clk);update=0;wait(valid);#1;end
endtask
initial begin
#30;rst=1;
for(n=0;n<8;n=n+1)begin
submit;
if(az!=3150||el<466||el>468||!av)$fatal(1,"angle formatting %0d %0d",az,el);
if(x<1995||x>2005||y< -2005||y> -1995||z<2995||z>3005||gap>5)$fatal(1,"geometry tuple %0d %0d %0d gap%0d",x,y,z,gap);
if(n<7&&(dv||pv))$fatal(1,"persistence bypass at window%0d",n);
if(n==7&&(!dv||!pv))$fatal(1,"valid tuple rejected");
end
ok=3;submit;if(dv||pv)$fatal(1,"bad second array must reject a dual-array direction");
ok=6;submit;if(dv||pv)$fatal(1,"bad joint direction leaked valid display");
@(negedge clk);rst=0;@(posedge clk);#1;if(dv||pv)$fatal(1,"reset retained validity");
$display("RESULTS angle quantization, XYZ tuple,8-window gate and invalid-mode propagation PASS");$finish;
end
initial begin #1000000;$fatal(1,"results timeout");end
endmodule
