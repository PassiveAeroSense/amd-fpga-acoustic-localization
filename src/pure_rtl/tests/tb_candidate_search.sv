`timescale 1ns/1ps
module tb_candidate_search;
reg clk=0;always #5 clk=~clk;reg rst=0,cd=0;reg signed [31:0] cr=0,ci=0;
wire bg,up,fault,cv;wire [2:0] ok;wire [1:0] coarse;wire signed [31:0] jx,jy,ax,ay,bx,by,cx,cy,cz;
wire [31:0] evidence,ticks,windows;wire [15:0] f0;wire [7:0] stage;
reg [63:0] covariance[0:36175];integer scene,k;
joint15_localizer dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,up,ok,jx,jy,ax,ay,bx,by,evidence,f0,ticks,windows,stage,fault,coarse,cv,cx,cy,cz);
always @(posedge clk)begin cr<=covariance[dut.addr][31:0];ci<=covariance[dut.addr][63:32];end
initial begin force dut.cd=cd;force dut.cr=cr;force dut.ci=ci;force dut.bad=0;
for(scene=0;scene<3;scene=scene+1)begin
rst=0;cd=0;repeat(5)@(negedge clk);
if(scene==0)$readmemh("joint15_fixture_cov.mem",covariance);
else if(scene==1)$readmemh("weak_candidate_cov.mem",covariance);
else for(k=0;k<36176;k=k+1)covariance[k]=0;
rst=1;repeat(5)@(negedge clk);cd=1;@(negedge clk);cd=0;wait(up);#1;
if(scene<2)begin
if(!cv||fault||evidence!=1440||cz<100||cx*64'sd1*cx+cy*64'sd1*cy+cz*64'sd1*cz>100000000)$fatal(1,"computed candidate lost/invalid");
if(scene==0&&(ok!=7||cx< -540||cx> -460||cy<460||cy>540||cz<960||cz>1040))$fatal(1,"strong reference changed");
if(scene==1&&ok!=0)$fatal(1,"inconsistent phase reported high confidence");
if(^({cx,cy,cz})===1'bx)$fatal(1,"unknown XYZ");
$display("CANDIDATE scene%0d valid%0d quality%0d xyz(%0d,%0d,%0d) score%0d",scene,cv,ok,cx,cy,cz,dut.best_score);
end else if(cv||ok!=0||evidence!=0)$fatal(1,"no-data startup fabricated candidate");
end
$display("CANDIDATE SEARCH PASS: direct strong XYZ,weak fit visible as estimate,no-data rejection");$finish;
end
initial begin #1600000000;$fatal(1,"candidate checks timeout");end
endmodule
