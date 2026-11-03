                                                                 
                                 
                                                        
                                                                        
                                                                 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 29; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 31
    ); 
    port (
 
          address0        : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0             : in std_logic; 
          q0              : out std_logic_vector(DataWidth-1 downto 0);

          reset               : in std_logic;
          clk                 : in std_logic
    ); 
end entity; 


architecture rtl of joint_search_hls_cordic_Pipeline_VITIS_LOOP_31_1_r18_CORDIC_ATAN_ROM_AUTO_1R is 
 
signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 

type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 

signal mem0 : mem_array := (
    0 => "11001001000011111101101010100", 1 => "01110110101100011001110000011", 2 => "00111110101101101110101111110", 3 => "00011111110101011011101010011", 
    4 => "00001111111110101010110111011", 5 => "00000111111111110101010101110", 6 => "00000011111111111110101010101", 7 => "00000001111111111111110101011", 
    8 => "00000000111111111111111110101", 9 => "00000000011111111111111111111", 10 => "00000000010000000000000000000", 11 => "00000000001000000000000000000", 
    12 => "00000000000100000000000000000", 13 => "00000000000010000000000000000", 14 => "00000000000001000000000000000", 15 => "00000000000000100000000000000", 
    16 => "00000000000000010000000000000", 17 => "00000000000000001000000000000", 18 => "00000000000000000100000000000", 19 => "00000000000000000010000000000", 
    20 => "00000000000000000001000000000", 21 => "00000000000000000000100000000", 22 => "00000000000000000000010000000", 23 => "00000000000000000000001000000", 
    24 => "00000000000000000000000100000", 25 => "00000000000000000000000010000", 26 => "00000000000000000000000001000", 27 => "00000000000000000000000000100", 
    28 => "00000000000000000000000000010", 29 => "00000000000000000000000000001", 30 => "00000000000000000000000000000");



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

