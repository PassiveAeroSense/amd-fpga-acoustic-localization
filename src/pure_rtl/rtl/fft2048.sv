`timescale 1ns/1ps
                                                                                        

module fft2048 #(parameter LOG_N=11,TW_RE_FILE="fft_tw_re.mem",TW_IM_FILE="fft_tw_im.mem")(
 input clk,rst_n,load,input [LOG_N-1:0] load_addr,input signed [31:0] load_re,load_im,input start,
 input [LOG_N-1:0] read_addr,output signed [31:0] read_re,read_im,output reg busy,done,overflow);
initial if(LOG_N!=12)$error("R18 active FFT IP is4096point only");
(* ram_style="block" *)reg [63:0] memory[0:4095];reg [63:0] q0,q1;
wire [11:0] a0,a1;wire ce0,ce1,we0,we1,hd,hi,hr,ho;wire [63:0] d0,d1;reg launch;
function [11:0] reverse(input [11:0] x);integer i;begin for(i=0;i<12;i=i+1)reverse[i]=x[11-i];end endfunction
wire [11:0] port0=busy?a0:reverse(load_addr),port1=busy?a1:read_addr;
always @(posedge clk)begin
 if(busy?(ce0&&we0):load)memory[port0]<=busy?d0:{load_im,load_re};
 q0<=memory[port0];end
always @(posedge clk)begin
 if(busy&&ce1&&we1)memory[port1]<=d1;
 q1<=memory[port1];end
assign read_re=q1[31:0];assign read_im=q1[63:32];
r18_ip_fft4096_hls core(.ap_clk(clk),.ap_rst_n(rst_n),.ap_start(launch),.ap_done(hd),.ap_idle(hi),.ap_ready(hr),
 .data_address0(a0),.data_ce0(ce0),.data_we0(we0),.data_d0(d0),.data_q0(q0),
 .data_address1(a1),.data_ce1(ce1),.data_we1(we1),.data_d1(d1),.data_q1(q1),.overflow(ho));
always @(posedge clk)begin if(!rst_n)begin busy<=0;done<=0;overflow<=0;launch<=0;end else begin
done<=0;if(launch&&hr)launch<=0;
if(start&&!busy)begin busy<=1;overflow<=0;launch<=1;end
if(hd&&busy)begin busy<=0;done<=1;overflow<=ho;end end end
endmodule
