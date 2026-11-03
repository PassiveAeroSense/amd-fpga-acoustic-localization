`timescale 1ns/1ps
                                                                                
                                                                                  
module banked_sdp_ram #(parameter WIDTH=64,DEPTH=36176,AW=($clog2(DEPTH)<10?10:$clog2(DEPTH)),BANKS=(DEPTH+511)/512)(
input clk,we,input [AW-1:0] write_addr,read_addr,input [WIDTH-1:0] data,
output [WIDTH-1:0] q);
wire [WIDTH-1:0] read_bank[0:BANKS-1];reg [AW-10:0] bank;
always @(posedge clk)bank<=read_addr[AW-1:9];
genvar b;generate for(b=0;b<BANKS;b=b+1)begin:storage
(* ram_style="block" *)reg [WIDTH-1:0] memory[0:511];reg [WIDTH-1:0] qr;
always @(posedge clk)begin
if(we&&write_addr[AW-1:9]==b)memory[write_addr[8:0]]<=data;
                                                                               
if(read_addr[AW-1:9]==b)qr<=memory[read_addr[8:0]];
end
assign read_bank[b]=qr;
end endgenerate
assign q=bank<BANKS?read_bank[bank]:{WIDTH{1'b0}};
endmodule
