`timescale 1ns/1ps
module tb_r27_key;
reg clk=0;always #5 clk=~clk;reg rst=0,key=1,frame=0;wire [15:0] pixel;wire page,press;
integer pulses=0;
r27_page_mux #(.DEBOUNCE_CYCLES(8)) dut(clk,rst,key,frame,16'h1234,16'habcd,pixel,page,press);
always @(posedge clk)begin #1;if(rst&&press)pulses=pulses+1;end
task ticks(input integer n);begin repeat(n)@(negedge clk);#1;end endtask
task boundary;begin frame=1;ticks(1);frame=0;ticks(1);end endtask
initial begin
 ticks(3);rst=1;ticks(15);boundary();if(page||pixel!=16'h1234)$fatal(1,"default page");
 repeat(5)begin key=0;ticks(2);key=1;ticks(2);end
 ticks(12);boundary();if(page||pulses)$fatal(1,"bounce toggled page");
 key=0;ticks(15);if(page||pulses!=1)$fatal(1,"page changed mid-frame or missing event");
 boundary();if(!page||pixel!=16'habcd)$fatal(1,"first press");
 ticks(80);repeat(3)boundary();if(!page||pulses!=1)$fatal(1,"long hold repeated");
 key=1;ticks(15);boundary();if(!page)$fatal(1,"release toggled");
 key=0;ticks(15);boundary();if(page||pulses!=2)$fatal(1,"return press");
 rst=0;key=0;ticks(3);rst=1;ticks(20);boundary();if(page||pulses!=2)$fatal(1,"held key at boot toggled");
 key=1;ticks(15);key=0;ticks(15);boundary();if(!page||pulses!=3)$fatal(1,"boot recovery press");
 $display("R27_KEY_PASS debounce, one event per hold, boot-held immunity, frame-boundary toggle, return page");$finish;
end
initial begin #20000;$fatal(1,"key timeout");end
endmodule
