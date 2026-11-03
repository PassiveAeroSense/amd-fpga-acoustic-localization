`timescale 1ns/1ps
                                                                                                   
module tb_r19_grid_interface;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0,gap=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault,cv;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by,x,y,z;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:36175];integer k,trial;reg two=0;integer dx,dy,dz;
joint15_localizer dut(clk,rst,1'b0,gap,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse,cv,x,y,z);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
task begin_frame;begin @(negedge clk);cd=1;@(negedge clk);cd=0;end endtask
initial begin
$readmemh("r19_grid_cov_b1.mem",covariance);
force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
force dut.core.grid_count=32'd3;force dut.fast_mode=1'b1;force dut.baseline_two=two;
#1;
dut.grid_rom[0]={16'd2500,-16'sd2500,16'd500};
dut.grid_rom[1]={16'd600,16'd400,16'd1500};
dut.grid_rom[2]={-16'sd2500,16'd2500,16'd500};
for(trial=0;trial<2;trial=trial+1)begin
 two=trial;rst=0;repeat(5)@(negedge clk);
 if(trial==1)$readmemh("r19_grid_cov_b2.mem",covariance);
 rst=1;repeat(5)@(negedge clk);begin_frame();wait(up);#1;
 dx=x-600;dy=y-400;dz=z-1500;
 if(!cv||ok!=7||evidence!=360||fault||windows!=1||dx*dx+dy*dy+dz*dz>40000)
   $fatal(1,"grid/baseline contract B%0d xyz %0d %0d %0d evidence%0d",trial+1,x,y,z,evidence);
 $display("R19 GRID B%0d PASS xyz %0d %0d %0d cycles%0d",trial+1,x,y,z,ticks);
end
$display("R19 GRID INTERFACE PASS: two-cycle external grid, covariance adapter, both baselines and positive source");$finish;
end
initial begin #200000000;$fatal(1,"R19 grid interface timeout");end
endmodule
