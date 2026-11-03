`timescale 1ns/1ps
module tb_light;
reg clk=0;always #5 clk=~clk;reg rst=0;wire bg,update;wire [2:0] ok;
wire signed [31:0] jx,jy,ax,ay,bx,by;wire [31:0] evidence,cycles,windows;wire [15:0] f0;wire [7:0] stage;wire fault;
wire [1:0] coarse_ok;
light_localizer dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,update,ok,jx,jy,ax,ay,bx,by,evidence,f0,cycles,windows,stage,fault,coarse_ok);
reg [63:0] background[0:8511],signal_data[0:8511];reg [63:0] fakeq;reg fake_done=0;
always @(posedge clk)fakeq<=dut.background_pass?background[dut.addr]:signal_data[dut.addr];
integer scene,file_out;
initial begin
$readmemh("light_bg.mem",background);
force dut.cr=fakeq[31:0];force dut.ci=fakeq[63:32];force dut.cd=fake_done;force dut.invalid=0;force dut.expn=0;
file_out=$fopen("light_out.txt","w");
for(scene=0;scene<7;scene=scene+1)begin
case(scene)
0:$readmemh("light_far.mem",signal_data);1:$readmemh("light_near.mem",signal_data);
2:$readmemh("light_zenith.mem",signal_data);3:$readmemh("light_noise.mem",signal_data);
4:$readmemh("light_offband.mem",signal_data);5:$readmemh("light_bad_pairs.mem",signal_data);
6:$readmemh("light_split_conflict.mem",signal_data);endcase
@(negedge clk);rst=0;fake_done=0;repeat(3)@(negedge clk);rst=1;
wait(dut.state==1);repeat(3)@(negedge clk);fake_done=1;@(negedge clk);fake_done=0;
wait(bg);wait(dut.state==1);repeat(3)@(negedge clk);fake_done=1;@(negedge clk);fake_done=0;
wait(update);#1;
if(fault||(^ok===1'bx))$fatal(1,"solver fault scene %0d",scene);
if(scene<3&&coarse_ok!=3)$fatal(1,"valid dual-array observations lost");
if((scene==3||scene==4)&&coarse_ok!=0)$fatal(1,"no phase observations fabricated a candidate");
if(scene==6&&(ok!=0||coarse_ok!=3))$fatal(1,"inconsistent harmonics must retain a labelled estimate without strong-quality flag");
$fwrite(file_out,"%0d %0d %0d %0d %0d %0d %0d\n",scene,ok,ax,ay,bx,by,cycles);
$display("SCENE %0d valid=%d directions=%d,%d,%d,%d cycles=%d",scene,ok,ax,ay,bx,by,cycles);
end
$fclose(file_out);$display("LIGHT SOLVER seven fixtures completed; independent Python oracle required");$finish;end
initial begin #100000000;$fatal(1,"light solver timeout");end
endmodule
