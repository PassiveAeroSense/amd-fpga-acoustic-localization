`timescale 1ns/1ps
                                                                           
module acoustic_clocks(input sys_clk,reset,output adc_clk,algorithm_clk,lcd_clk,locked);
wire input_clock,feedback,feedback_buffer,c0,c1,c2;
IBUF ib(.I(sys_clk),.O(input_clock));
MMCME2_BASE #(.CLKIN1_PERIOD(20.0),.CLKFBOUT_MULT_F(20.0),.DIVCLK_DIVIDE(1),
.CLKOUT0_DIVIDE_F(10.0),.CLKOUT1_DIVIDE(20),.CLKOUT2_DIVIDE(30)) mm(
.CLKIN1(input_clock),.CLKFBIN(feedback_buffer),.RST(reset),.PWRDWN(1'b0),
.CLKFBOUT(feedback),.CLKOUT0(c0),.CLKOUT1(c1),.CLKOUT2(c2),.LOCKED(locked));
BUFG fb(.I(feedback),.O(feedback_buffer));BUFG ba(.I(c0),.O(adc_clk));
BUFG bp(.I(c1),.O(algorithm_clk));BUFG bl(.I(c2),.O(lcd_clk));
endmodule
