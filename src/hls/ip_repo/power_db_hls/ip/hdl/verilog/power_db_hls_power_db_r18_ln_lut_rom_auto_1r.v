                                                                 
                                 
                                                        
                                                                        
                                                                 
`timescale 1 ns / 1 ps
module power_db_hls_power_db_r18_LN_LUT_ROM_AUTO_1R (
    address0, ce0, q0, 
    address1, ce1, q1, 
    reset, clk);

parameter DataWidth = 24;
parameter AddressWidth = 12;
parameter AddressRange = 4096;
 
input[AddressWidth-1:0] address0;
input ce0;
output reg[DataWidth-1:0] q0;
 
input[AddressWidth-1:0] address1;
input ce1;
output reg[DataWidth-1:0] q1;

input reset;
input clk;

 
reg [DataWidth-1:0] rom0[0:AddressRange-1];


initial begin
     
    $readmemh("./power_db_hls_power_db_r18_ln_lut_rom_auto_1r.dat", rom0);
end

  
always @(posedge clk) 
begin 
    if (ce0) 
    begin
        q0 <= rom0[address0];
    end
end
  
always @(posedge clk) 
begin 
    if (ce1) 
    begin
        q1 <= rom0[address1];
    end
end


endmodule

