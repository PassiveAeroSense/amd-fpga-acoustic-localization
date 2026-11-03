`timescale 1ns/1ps
module tb_xyz_estimate_tracker;
reg clk=0;always #5 clk=~clk;reg rst=0,up=0,cv=0,strong_match=0,gap=0;
reg signed [31:0] ix=0,iy=0,iz=0;wire valid,av;wire [1:0] mode;wire [15:0] age;
wire signed [31:0] x,y,z,ux,uy;wire [11:0] az;wire [9:0] el;
xyz_estimate_tracker #(.TENTH_CYCLES(100)) dut(clk,rst,up,cv,strong_match,16'd1,ix,iy,iz,gap,valid,mode,age,x,y,z,ux,uy,az,el,av);
task send(input bit v,c,input integer a,b,d);begin
@(negedge clk);cv=v;strong_match=c;ix=a;iy=b;iz=d;up=1;@(negedge clk);up=0;repeat(400)@(negedge clk);end endtask
initial begin
#30;rst=1;repeat(500)@(negedge clk);if(valid)$fatal(1,"startup invented XYZ");
send(1,0,100,200,1000);if(!valid||mode!=0||x!=100||y!=200||z!=1000)$fatal(1,"first weak estimate hidden");
send(0,0,0,0,0);if(!valid||mode!=2||z!=1000)$fatal(1,"loss erased position");
repeat(13000)@(negedge clk);if(!valid||mode!=3||x!=100||z!=1000)$fatal(1,"old XYZ not retained");
send(1,1,120,220,980);if(mode!=1||x!=110||y!=210||z!=990)$fatal(1,"strong_match nearby update smoothing");
send(1,1,-2000,0,2000);if(x!=110)$fatal(1,"single jump accepted");
send(1,1,-2010,10,2010);if(x!=110)$fatal(1,"two-point jump accepted");
send(1,1,-2020,0,2000);if(x!=-2020||mode!=1)$fatal(1,"confirmed relocation not accepted");
send(1,0,0,0,0);if(z!=2000)$fatal(1,"invalid origin accepted");
gap=1;repeat(5)@(negedge clk);if(!valid||mode!=2)$fatal(1,"gap hid history");
$display("XYZ TRACKER PASS first estimate,quality labels,smoothing,confirmed jump,indefinite old XYZ,no fabricated startup");$finish;
end
initial begin #1000000;$fatal(1,"tracker timeout");end
endmodule
