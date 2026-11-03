`timescale 1ns/1ps
module tb_r20_radar;
reg clk=0;always #5 clk=~clk;
reg rst=0,tick=0,valid=1,fresh=1;
reg signed [31:0] px=2000,py=0,pz=1000;
wire [31:0] horizontal[0:5],range_mm[0:5];wire [2:0] ri[0:5];
wire signed [10:0] dx[0:5],dy[0:5],bx[0:5],by[0:5];
wire [7:0] baseline[0:5];wire [5:0] overhead,ready;
genvar g;generate for(g=0;g<6;g=g+1)begin:versions
 radar_view_transform #(.HORIZONTAL_MM(g%3==0?20000:g%3==1?15000:10000),.BASELINE_MM(g<3?1000:2000)) dut(
 .clk(clk),.rst_n(rst),.frame_tick(tick),.valid(valid),.fresh(fresh),.px_mm(px),.py_mm(py),.pz_mm(pz),
 .horizontal(horizontal[g]),.range_mm(range_mm[g]),.range_index(ri[g]),.dx(dx[g]),.dy(dy[g]),.bx(bx[g]),.by(by[g]),.baseline_px(baseline[g]),.overhead(overhead[g]),.ready(ready[g]));
end endgenerate
integer i,j,cycles;
task frame;begin
 @(negedge clk);tick=1;@(negedge clk);tick=0;cycles=0;
 while(ready!=6'b111111 && cycles<10000)begin @(negedge clk);cycles=cycles+1;end
 if(cycles>=10000)$fatal(1,"transform did not complete before display region");
 if(cycles>2000)$fatal(1,"transform exceeds raster timing budget");
 @(negedge clk);
end endtask
task all_range(input integer r);begin for(i=0;i<6;i=i+1)if(range_mm[i]!=r)$fatal(1,"range v%0d got %0d expected %0d",i,range_mm[i],r);end endtask
initial begin
 repeat(4)@(negedge clk);rst=1;frame;all_range(5000);
 for(i=0;i<6;i=i+1)begin
  if(dx[i]!=52||dy[i]!=0||bx[i]!=134||by[i]!=0||overhead[i])$fatal(1,"2 m near-field mapping");
  if(baseline[i]!=(i<3?13:26))$fatal(1,"baseline not scaled");
 end
                                                                          
 px=0;py=2000;frame;for(i=0;i<6;i=i+1)if(dx[i]!=0||dy[i]!=52||bx[i]!=0||by[i]!=134)$fatal(1,"+Y");
 px=-2000;py=0;frame;for(i=0;i<6;i=i+1)if(dx[i]!=-52||bx[i]!=-134)$fatal(1,"-X");
 px=0;py=-2000;frame;for(i=0;i<6;i=i+1)if(dy[i]!=-52||by[i]!=-134)$fatal(1,"-Y");
 px=2000;py=2000;frame;for(i=0;i<6;i=i+1)if(bx[i]!=94||by[i]!=94||dx[i]!=52||dy[i]!=52)$fatal(1,"diagonal");
 px=4200;py=0;frame;all_range(5000);
 px=4300;frame;all_range(10000);
 px=3000;
 for(j=0;j<171;j=j+1)begin frame;all_range(10000);end
 frame;all_range(5000);
 px=1250;
                                                         
 fresh=0;for(j=0;j<180;j=j+1)frame;all_range(5000);
 fresh=1;valid=0;for(j=0;j<180;j=j+1)frame;all_range(5000);
 valid=1;for(j=0;j<171;j=j+1)begin frame;all_range(5000);end
 frame;all_range(2000);
 for(i=0;i<6;i=i+1)if(dx[i]!=81||baseline[i]!=(i<3?32:65))$fatal(1,"2m scale baseline");
                                                                      
 px=2000;frame;all_range(5000);px=1250;repeat(100)frame;px=1400;frame;px=1250;repeat(100)frame;all_range(5000);
 px=9000;frame;
 for(i=0;i<6;i=i+1)if(range_mm[i]!=(i%3==2?10000:15000))$fatal(1,"15m cap");
 px=14000;frame;
 for(i=0;i<6;i=i+1)if(range_mm[i]!=(i%3==0?20000:i%3==1?15000:10000))$fatal(1,"max scale");
 px=0;py=0;pz=1000;frame;
 if(overhead!=6'b111111)$fatal(1,"overhead missing");
 for(i=0;i<6;i=i+1)if(dx[i]||dy[i]||bx[i]||by[i])$fatal(1,"origin/divide by zero");
 px=100;py=100;frame;if(overhead!=0)$fatal(1,"overhead threshold");
 $display("R20_RADAR_PASS: six variants, 2/5/10/15/20m, 172-frame hysteresis, invalid/history, all quadrants, vertical, baseline and bounded latency");$finish;
end
initial begin #100000000;$fatal(1,"timeout");end
endmodule
