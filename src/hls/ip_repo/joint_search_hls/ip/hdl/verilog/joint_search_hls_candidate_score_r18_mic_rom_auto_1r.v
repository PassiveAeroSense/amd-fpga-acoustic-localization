                                                                 
                                 
                                                        
                                                                        
                                                                 
`timescale 1 ns / 1 ps
module joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R (
    address0, ce0, q0, 
    reset, clk);

parameter DataWidth = 27;
parameter AddressWidth = 4;
parameter AddressRange = 16;
 
input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;

input reset;
input clk;

 
reg [DataWidth-1:0] rom0[0:AddressRange-1];


initial begin
     
    $readmemh("./joint_search_hls_candidate_score_r18_mic_rom_auto_1r.dat", rom0);
end

  
always @(posedge clk) 
begin 
    if (ce0) 
    begin
        q0 <= rom0[address0];
    end
end


endmodule

