`timescale 1ns/1ps
                                                                                 
module tb_health;
reg clk=0;always #10 clk=~clk;reg rst=0;
wire cv,reset,rd,cs1,cs2,hs,vs,pclk,de,bl;wire [15:0] rgb;
acoustic_top #(.UI_FAULT_CYCLES(20)) dut(clk,rst,16'd0,16'd0,1'b0,1'b0,1'b0,1'b0,
cv,reset,rd,cs1,cs2,rgb,hs,vs,pclk,de,bl,1'b1);
initial begin
#100;rst=1;wait(dut.pr[2]);repeat(5)@(negedge dut.pc);
dut.detected=1;dut.history=19;dut.link_good=1;
force dut.dover=1;
#1;if(!dut.gap)$fatal(1,"processing overrun not propagated");
@(posedge dut.pc);#1;
if(dut.detected!=0||dut.history!=0||dut.link_good!=0)$fatal(1,"old detection held after overrun");
release dut.dover;
@(negedge dut.pc);
force dut.rdv=1;force dut.detected=1;force dut.link_good=1;force dut.have_position=1;force dut.age=10;
force dut.mfault=0;#1;if(!dut.display_direction)$fatal(1,"good held direction unexpectedly hidden");
force dut.mfault=1;#1;if(dut.display_direction)$fatal(1,"faulted localizer still displayed");
force dut.detected=0;force dut.bg=1;force dut.history=19;
#1;if(dut.status!=5||dut.display_direction||dut.display_position)$fatal(1,"environment must show not detected with no stale coordinates");
force dut.bg=0;force dut.history=0;#1;if(dut.status!=2)$fatal(1,"warmup must select not detected plus secondary hint");
force dut.bg=1;force dut.history=19;force dut.detected=1;#1;if(dut.status!=3)$fatal(1,"positive detector must select drone banner");
force dut.mfault=0;force dut.rpv=1;force dut.age=60;
#1;if(!dut.display_position||dut.estimate_mode!=3)$fatal(1,"old estimate must remain explicitly labelled last position");
force dut.age=20;#1;if(dut.estimate_mode!=2)$fatal(1,"short hold not labelled");
force dut.detected=0;#1;if(dut.display_position)$fatal(1,"background leaked held drone marker");
force dut.detected=1;
                                                                   
repeat(2)@(negedge dut.pc);
force dut.link_good=0;force dut.ever_audio=1;
repeat(10)@(negedge dut.pc);
#1;if(dut.status!=6||dut.display_direction)$fatal(1,"short outage must recover without red fault or stale coordinates");
force dut.link_good=1;repeat(2)@(negedge dut.pc);
if(dut.ui_outage_cycles!=0||dut.status!=3)$fatal(1,"healthy link must clear UI outage immediately");
force dut.link_good=0;repeat(22)@(negedge dut.pc);
#1;if(dut.status!=4||dut.display_direction)$fatal(1,"persistent outage must show fault and hide stale coordinates");
$display("BOARD HEALTH negative audio, initialization, positive, link fault and stale-result suppression PASS");$finish;
end
initial begin #1000000;$fatal(1,"board clock/reset timeout");end
endmodule
