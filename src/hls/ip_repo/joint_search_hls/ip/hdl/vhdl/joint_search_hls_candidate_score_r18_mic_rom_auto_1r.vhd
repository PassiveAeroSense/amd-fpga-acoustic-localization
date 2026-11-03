                                                                 
                                 
                                                        
                                                                        
                                                                 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 27; 
             AddressWidth     : integer := 4; 
             AddressRange    : integer := 16
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of joint_search_hls_candidate_score_r18_MIC_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "110010100101111111110111010", 1 => "110000011001111111110111010", 2 => "101110001101111111110111010", 3 => "101110001100000000000000000", 
    4 => "101110001100000000001000110", 5 => "110000011000000000001000110", 6 => "110010100100000000001000110", 7 => "110010100100000000000000000", 
    8 => "010001110101111111110111010", 9 => "001111101001111111110111010", 10 => "001101011101111111110111010", 11 => "001101011100000000000000000", 
    12 => "001101011100000000001000110", 13 => "001111101000000000001000110", 14 => "010001110100000000001000110", 15 => "010001110100000000000000000");



begin 

 
memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
                         
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
                        
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
 
        if (ce0 = '1') then  
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;

end if;
end process;

end rtl;

