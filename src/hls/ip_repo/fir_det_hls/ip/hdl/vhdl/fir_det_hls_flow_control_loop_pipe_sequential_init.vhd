                                                                 
                                                                           
                              
                                                        
                                                                        
   
                                                                 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir_det_hls_flow_control_loop_pipe_sequential_init is
port (
    ap_clk             : in  std_logic;
    ap_rst             : in  std_logic;

                                             
    ap_start           : in  std_logic;
    ap_ready           : out std_logic;
    ap_done            : out std_logic;

                                          
    ap_start_int       : out std_logic;
    ap_ready_int       : in  std_logic;
    ap_done_int        : in  std_logic;
    ap_continue_int    : out std_logic;

                            
                                  
    ap_loop_init       : out std_logic := '1';

                                
    ap_loop_exit_ready : in  std_logic;
    ap_loop_exit_done  : in  std_logic
);
end entity fir_det_hls_flow_control_loop_pipe_sequential_init;

architecture behav of fir_det_hls_flow_control_loop_pipe_sequential_init is
    signal ap_done_cache : std_logic := '0';
    signal ap_loop_init_int : std_logic := '1';
begin
    ap_start_int    <= ap_start;   
    ap_continue_int <= '1';
    ap_ready        <= ap_loop_exit_ready;

                                            
                                           
                                              
                                            
    genLoopInit: process(ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
                ap_loop_init_int <= '1';
            elsif (ap_loop_exit_done = '1') then
                ap_loop_init_int <= '1';
            elsif (ap_ready_int = '1') then
                ap_loop_init_int <= '0';
            end if;
        end if;
    end process genLoopInit;

    ap_loop_init <= ap_loop_init_int and ap_start;

                                                                    
                                                                            
                                                                                                 
                                                                                       
                                                 
    genApDoneCache: process(ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
                ap_done_cache <= '0';
            elsif (ap_loop_exit_done = '1') then
                ap_done_cache <= '1';
            elsif (ap_start = '1') then
                ap_done_cache <= '0';
            end if;
        end if;
    end process genApDoneCache;

                                                                                                    
    genApDone: process(ap_loop_exit_done, ap_done_cache, ap_start)
    begin
        if ((ap_loop_exit_done = '1') or ((ap_done_cache = '1') and (ap_start = '0'))) then
            ap_done <= '1';
        else
            ap_done <= '0';
        end if;
    end process genApDone;

end architecture;
        
