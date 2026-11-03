                                                                 
                                                                           
                              
                                                        
                                                                        
   
                                                                 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fft4096_hls_flow_control_loop_delay_pipe is
port (
    ap_clk             : in  std_logic;
    ap_rst             : in  std_logic;

                                             
    ap_start           : in  std_logic;
    ap_ready           : out std_logic;
    ap_done            : out std_logic;
    ap_continue        : in  std_logic;

                                          
    ap_start_int       : out std_logic;
    ap_ready_int       : in  std_logic;
    ap_done_int        : in  std_logic;
    ap_continue_int    : out std_logic;

                            
                                  
    ap_loop_init       : out std_logic := '1';

                                
    ap_loop_exit_ready : in  std_logic;
    ap_loop_exit_ready_delayed : in std_logic;
    ap_loop_exit_done  : in  std_logic
);
end entity fft4096_hls_flow_control_loop_delay_pipe;

architecture behav of fft4096_hls_flow_control_loop_delay_pipe is
                                                 
                                      
    signal rewind_ap_ready_reg : std_logic := '0';
begin   
    ap_continue_int <= ap_continue;
    ap_done         <= ap_loop_exit_done;
    ap_ready        <= ap_loop_exit_ready_delayed;

                                            
                                           
                                              
                                            
    genLoopInit: process(ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
                ap_loop_init <= '1';
            elsif (ap_loop_exit_ready = '1') then
                ap_loop_init <= '1';
            elsif (ap_ready_int = '1') then
                ap_loop_init <= '0';
            end if;
        end if;
    end process genLoopInit;

    genRewindAPReadyReg: process(ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
                rewind_ap_ready_reg <= '0';
            elsif ((ap_loop_exit_ready_delayed = '0') and (ap_start = '1') and (ap_loop_exit_ready = '1')) then
                rewind_ap_ready_reg <= '1';
            elsif ((ap_loop_exit_ready_delayed = '1') and (ap_start = '1')) then
                rewind_ap_ready_reg <= '0';
            end if;
        end if;
    end process genRewindAPReadyReg;

    genAPStartInt: process(rewind_ap_ready_reg, ap_start)
    begin
        if ((rewind_ap_ready_reg = '0') and (ap_start = '1')) then
            ap_start_int <= '1';
        else
            ap_start_int <= '0';
        end if;
    end process genAPStartInt;
end architecture;
        
