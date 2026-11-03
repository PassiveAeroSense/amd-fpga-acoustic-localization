                                                                 
                                                                           
                              
                                                        
                                                                        
   
                                                                 

`timescale 1 ns / 1 ps

module power_db_hls_flow_control_loop_pipe_sequential_init(
        ap_clk,
        ap_rst,
        ap_start,
        ap_ready,
        ap_done,
        ap_start_int,
        ap_ready_int,
        ap_done_int,
        ap_continue_int,
        ap_loop_init,
        ap_loop_exit_ready,
        ap_loop_exit_done
);

input   ap_clk;
input   ap_rst;

                                         
input   ap_start;
output  ap_ready;
output  ap_done;

                                      
output  ap_start_int;
input   ap_ready_int;
input   ap_done_int;
output  ap_continue_int;

                        
output   ap_loop_init;
wire     ap_loop_init;
reg ap_loop_init_int;
reg ap_done;
reg ap_done_cache;

                            
input   ap_loop_exit_ready;
input   ap_loop_exit_done;

                          
initial begin
#0 ap_loop_init_int = 1'b1;
#0 ap_done_cache = 1'b0;
end

assign ap_start_int = ap_start;

assign ap_continue_int = 1'b1;

assign ap_ready = ap_loop_exit_ready;

                                        
                                       
                                          
                                        
always @ (posedge ap_clk)
begin
    if (ap_rst == 1'b1) begin
        ap_loop_init_int <= 1'b1;
    end else if(ap_loop_exit_done == 1'b1) begin
        ap_loop_init_int <= 1'b1;
    end else if(ap_ready_int == 1'b1) begin
        ap_loop_init_int <= 1'b0;
    end
end

assign ap_loop_init = ap_loop_init_int & ap_start;

                                                                
                                                                        
                                                                                
                                                                             
                                             
always @(posedge ap_clk)
begin
    if (ap_rst == 1'b1) begin
        ap_done_cache <= 1'b0;
    end else if (ap_done_int == 1'b1) begin
        ap_done_cache <= 1'b1;
    end else if (ap_start_int == 1'b1) begin
        ap_done_cache <= 1'b0;
    end
end

                                                                                                
always @(*)
begin
    if ((ap_done_int == 1'b1) || ((ap_done_cache == 1'b1) && (ap_start_int == 1'b0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

endmodule
        
