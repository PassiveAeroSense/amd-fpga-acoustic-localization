`timescale 1ns/1ps
                                                                                
module r27_scope_frontend(input adc_clk,adc_rst_n,lcd_clk,lcd_rst_n,
 input sample_valid,gap,input [1:0] bad,input [255:0] samples,
 input [31:0] errors,fixes,input frame_start,input [7:0] read_column,
 output [527:0] waveform,output [255:0] dc_values,output [63:0] scales,
 output [1:0] displayed_good,output display_valid,stream_alive,
 output [31:0] display_errors,display_fixes,completed_frames);
reg gap_pending;
always @(posedge adc_clk)if(!adc_rst_n)gap_pending<=0;
else if(gap)gap_pending<=1;else if(sample_valid)gap_pending<=0;
wire [1:0] effective_bad=bad|{2{gap_pending}};
wire scope_ready,scope_overrun,scope_valid;wire [321:0] scope_packet;
cdc_mailbox #(.WIDTH(322)) scope_cross(adc_clk,adc_rst_n,sample_valid,
 {fixes,errors,effective_bad,samples},scope_ready,scope_overrun,
 lcd_clk,lcd_rst_n,scope_valid,scope_packet);
reg [22:0] since_scope;
always @(posedge lcd_clk)if(!lcd_rst_n)since_scope<=3333333;
else if(scope_valid)since_scope<=0;else if(since_scope<3333333)since_scope<=since_scope+1;
assign stream_alive=since_scope<3333333;
assign display_errors=scope_packet[289:258];assign display_fixes=scope_packet[321:290];
wire [255:0] pp_values;wire [159:0] clipping;wire frame_ready;
scope_capture capture(lcd_clk,lcd_rst_n,scope_valid,scope_packet[255:0],scope_packet[257:256],
 frame_start,read_column,waveform,dc_values,pp_values,scales,clipping,
 displayed_good,display_valid,frame_ready,completed_frames);
endmodule
