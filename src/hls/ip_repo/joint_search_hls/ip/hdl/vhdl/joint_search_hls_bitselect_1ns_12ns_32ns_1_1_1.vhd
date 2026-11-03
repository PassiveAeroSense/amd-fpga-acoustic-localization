                                                                 
                                 
                                                        
                                                                        
                                                                 
                                                                   

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1 is
generic (
    ADDRWIDTH : INTEGER := 32;
    DATAWIDTH : INTEGER := 12
);
port (

    sel   : in std_logic_vector (ADDRWIDTH-1 downto 0);
    din   : in std_logic_vector (DATAWIDTH-1 downto 0);
    dout  : out std_logic_vector (0 downto 0)
);
end entity;

architecture behav of joint_search_hls_bitselect_1ns_12ns_32ns_1_1_1 is
    signal dout_tmp : std_logic_vector (0 downto 0);


begin

    process(din,sel) is
    begin
        case sel is
            
            when std_logic_vector(to_unsigned(0,sel'length)) =>
                dout_tmp(0) <= din(0);
            
            when std_logic_vector(to_unsigned(1,sel'length)) =>
                dout_tmp(0) <= din(1);
            
            when std_logic_vector(to_unsigned(2,sel'length)) =>
                dout_tmp(0) <= din(2);
            
            when std_logic_vector(to_unsigned(3,sel'length)) =>
                dout_tmp(0) <= din(3);
            
            when std_logic_vector(to_unsigned(4,sel'length)) =>
                dout_tmp(0) <= din(4);
            
            when std_logic_vector(to_unsigned(5,sel'length)) =>
                dout_tmp(0) <= din(5);
            
            when std_logic_vector(to_unsigned(6,sel'length)) =>
                dout_tmp(0) <= din(6);
            
            when std_logic_vector(to_unsigned(7,sel'length)) =>
                dout_tmp(0) <= din(7);
            
            when std_logic_vector(to_unsigned(8,sel'length)) =>
                dout_tmp(0) <= din(8);
            
            when std_logic_vector(to_unsigned(9,sel'length)) =>
                dout_tmp(0) <= din(9);
            
            when std_logic_vector(to_unsigned(10,sel'length)) =>
                dout_tmp(0) <= din(10);
            
            when std_logic_vector(to_unsigned(11,sel'length)) =>
                dout_tmp(0) <= din(11);
            
            when others => 
                dout_tmp(0) <= 'X';
        end case;
    end process;


    dout <= dout_tmp;




end architecture;
