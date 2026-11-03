`timescale 1ns/1ps
module tb_v2_localizer;
reg clk=0;always #5 clk=~clk;reg rst=0;wire bg,update;wire [2:0] ok;wire [1:0] coarse;
wire signed [31:0] jx,jy,ax,ay,bx,by;wire [31:0] evidence,cycles,windows;wire [15:0] f0;wire [7:0] stage;wire fault;
srp_localizer dut(clk,rst,1'b0,1'b0,384'd0,1'b0,bg,update,ok,jx,jy,ax,ay,bx,by,evidence,f0,cycles,windows,stage,fault,coarse);
reg [63:0] signal_data[0:19151],fakeq;reg fake_done=0;integer scene,f;
always @(posedge clk)fakeq<=signal_data[dut.addr];
initial begin force dut.cr=fakeq[31:0];force dut.ci=fakeq[63:32];force dut.cd=fake_done;
force dut.bad=0;force dut.expn=0;
f=$fopen("v2_localizer_out.txt","w");
for(scene=0;scene<4;scene=scene+1)begin
case(scene)0:$readmemh("v2_scene0.mem",signal_data);1:$readmemh("v2_scene1.mem",signal_data);2:$readmemh("v2_scene2.mem",signal_data);3:$readmemh("v2_scene3.mem",signal_data);endcase
@(negedge clk);rst=0;fake_done=0;repeat(3)@(negedge clk);rst=1;
wait(dut.state==1);repeat(3)@(negedge clk);fake_done=1;@(negedge clk);fake_done=0;
wait(update);#1;if(fault||(^ok===1'bx))$fatal(1,"fault scene %0d",scene);
$fwrite(f,"%0d %0d %0d %0d %0d %0d %0d\n",scene,ok,ax,ay,bx,by,cycles);
$display("V2 scene %0d ok %0d xy %0d %0d %0d %0d cycles %0d",scene,ok,ax,ay,bx,by,cycles);
end $fclose(f);$finish;end
initial begin repeat(20)#1000000000;$fatal(1,"timeout");end
endmodule
