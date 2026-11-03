                                                                 
                                 
                                                        
                                                                        
                                                                 
`timescale 1 ns / 1 ps
module detector_hls_detector_hls_Pipeline_VITIS_LOOP_42_7_r18_NODE_LEFT_ROM_AUTO_1R (
    address0, ce0, q0, 
    reset, clk);

parameter DataWidth = 11;
parameter AddressWidth = 11;
parameter AddressRange = 1560;
 
input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;

input reset;
input clk;

 
reg [DataWidth-1:0] rom0[0:AddressRange-1];


initial begin
     
    $readmemh("./detector_hls_detector_hls_pipeline_vitis_loop_42_7_r18_node_left_rom_auto_1r.dat", rom0);
end

  
always @(posedge clk) 
begin 
    if (ce0) 
    begin
        q0 <= rom0[address0];
    end
end


endmodule

