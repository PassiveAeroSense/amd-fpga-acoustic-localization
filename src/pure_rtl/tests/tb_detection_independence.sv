`timescale 1ns/1ps
module tb_detection_independence;
reg clk=0;always #10 clk=~clk;reg rst=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
integer sends=0;
acoustic_top dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,
cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
always @(posedge dut.pc)if(dut.send_ui)sends=sends+1;
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
force dut.gap=0;force dut.dover=0;force dut.dv=0;force dut.link_good=1;
force dut.detected=1;force dut.history=19;
force dut.bg=0;force dut.mfault=1;force dut.direction_ok=0;
force dut.rdv=0;force dut.rpv=0;force dut.have_position=0;
#1;if(dut.status!=3||dut.display_direction||dut.display_position)
 $fatal(1,"positive detection must survive all localization failures");
                                                                             
force dut.ru=0;force dut.ui_ready=1;
@(negedge dut.pc);dut.ui_refresh_counter=90;sends=0;
repeat(25)@(negedge dut.pc);
if(sends!=1)$fatal(1,"no localization result prevented UI refresh");
                                                                           
force dut.ru=1;
@(negedge dut.pc);dut.ui_refresh_counter=90;sends=0;
repeat(25)@(negedge dut.pc);
if(sends!=1)$fatal(1,"localization result restarted UI refresh timer");
force dut.detected=0;force dut.rdv=1;force dut.rpv=1;
force dut.bg=1;force dut.mfault=0;force dut.have_position=1;force dut.age=0;
#1;if(dut.status!=5||dut.display_direction||dut.display_position)
 $fatal(1,"location result falsely implied drone detection");
force dut.detected=2;
#1;if(dut.status!=3||!dut.display_position)$fatal(1,"second array detection not displayed");
force dut.link_good=0;force dut.ever_audio=1;
#1;if(dut.status==3)$fatal(1,"lost acquisition kept current-positive claim");
$display("DETECTION INDEPENDENCE: positive without location, locator fault, refresh isolation, negative with location PASS");$finish;
end
initial begin #1000000;$fatal(1,"timeout");end
endmodule
