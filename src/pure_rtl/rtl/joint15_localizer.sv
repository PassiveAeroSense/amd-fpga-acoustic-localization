`timescale 1ns/1ps
                                                                                        

`include "r19_config.vh"
module joint15_localizer(input clk,rst_n,audio_valid,gap,input [383:0] audio_samples,
 input recalibrate,output reg background_ready,update,output reg [2:0] direction_ok,
 output reg signed [31:0] jx,jy,a1x,a1y,a2x,a2y,output reg [31:0] evidence,
 output reg [15:0] f0,output reg [31:0] processing_cycles,windows,output [7:0] stage,
 output reg fault,output reg [1:0] coarse_ok,
 output reg candidate_valid,output reg signed [31:0] candidate_x,candidate_y,candidate_z);
wire rn=rst_n&&!gap&&!recalibrate;reg capture_start,search_start;wire [15:0] addr;
wire signed [31:0] cr,ci;wire [5:0] expn;wire [6:0] frames;wire cb,cd,bad;wire [31:0] samples;
joint15_capture capture(clk,rn,audio_valid,gap,audio_samples,capture_start,`R19_FRAMES,addr,cr,ci,expn,frames,cb,cd,bad,samples);
wire [15:0] grid_addr;wire grid_ce;
(* rom_style="block" *)reg [47:0] grid_rom[0:`R19_GRID_POINTS-1];
reg [47:0] grid_q1,grid_q2;
initial $readmemh("r19_grid.mem",grid_rom);
always @(posedge clk)begin if(grid_ce)grid_q1<=grid_rom[grid_addr];grid_q2<=grid_q1;end
wire baseline_two=`R19_BASELINE_TWO,fast_mode=`R19_FAST_MODE;
wire hd,hi,hr,ce;wire [143:0] result;reg [2:0] state;reg [31:0] ticks;
                                                                           
reg [63:0] covariance_q;always @(posedge clk)covariance_q<={ci,cr};
assign stage=state==0?0:state==1?1:state==2?22:state==3?31:58;
r18_ip_joint_search_hls core(.ap_clk(clk),.ap_rst_n(rn),.ap_start(search_start),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),
 .covariance_address0(addr),.covariance_ce0(ce),.covariance_q0(covariance_q),
 .grid_address0(grid_addr),.grid_ce0(grid_ce),.grid_q0(grid_q2),
 .grid_count(`R19_GRID_POINTS),.horizontal_mm(`R19_HORIZONTAL_MM),.vertical_mm(`R19_VERTICAL_MM),
 .baseline_two(baseline_two),.fast_mode(fast_mode),.result(result));
always @(posedge clk)begin
if(!rn)begin background_ready<=1;update<=0;direction_ok<=0;jx<=0;jy<=0;a1x<=0;a1y<=0;a2x<=0;a2y<=0;evidence<=0;f0<=0;processing_cycles<=0;windows<=0;fault<=0;coarse_ok<=0;candidate_valid<=0;candidate_x<=0;candidate_y<=0;candidate_z<=0;state<=0;ticks<=0;capture_start<=0;search_start<=0;end
else begin update<=0;capture_start<=0;if(search_start&&hr)search_start<=0;ticks<=ticks+1;
case(state)
0:begin candidate_valid<=0;capture_start<=1;ticks<=0;state<=1;end
1:if(cd)begin if(bad)begin fault<=1;direction_ok<=0;coarse_ok<=0;update<=1;state<=0;end else begin fault<=0;direction_ok<=0;coarse_ok<=0;state<=2;end end
2:begin search_start<=1;state<=3;end
3:if(hd)begin candidate_x<=result[31:0];candidate_y<=result[63:32];candidate_z<=result[95:64];candidate_valid<=result[96];direction_ok<=result[97]?7:0;coarse_ok<=result[97]?3:0;evidence<={20'd0,result[111:100]};processing_cycles<=ticks;windows<=windows+1;state<=4;end
4:begin update<=1;state<=0;end
default:state<=0;
endcase end end
endmodule
