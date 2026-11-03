                                                                 
                                 
                                                        
                                                                        
                                                                 
                                                                   

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_bitset_12ns_12ns_32ns_1s_12_1_1 is
generic (
    ADDRWIDTH : INTEGER := 32;
    DATAWIDTH : INTEGER := 12
);
port (

    sel   : in std_logic_vector (ADDRWIDTH-1 downto 0);
    din   : in std_logic_vector (DATAWIDTH-1 downto 0);
    value : in std_logic_vector (0 downto 0);
    dout  : out std_logic_vector (DATAWIDTH-1 downto 0)
);
end entity;

architecture behav of joint_search_hls_bitset_12ns_12ns_32ns_1s_12_1_1 is
    signal dout_tmp : std_logic_vector (DATAWIDTH-1 downto 0);



begin

    process(din,sel,value) is
    begin
        dout_tmp <= din;
        if to_integer(unsigned(sel)) >= din'low and to_integer(unsigned(sel)) <= din'high then
            dout_tmp(to_integer(unsigned(sel))) <= value(0);
        end if;
    end process;


    dout <= dout_tmp;






end architecture;
