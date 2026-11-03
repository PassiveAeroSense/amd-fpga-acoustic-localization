`timescale 1ns/1ps
module tb_r19_fast_capture;
reg clk=0;always #5 clk=~clk;reg rst=0,start=0;reg [15:0] addr=0;
wire signed [31:0] cr,ci;wire [5:0] exponent;wire [6:0] frames;wire busy,done,invalid;wire [31:0] samples;
reg fv=0,fd=0;reg [8:0] fi=0;reg [3:0] ch=0;reg signed [31:0] re=0,im=0;reg [31:0] peak=2048;
joint15_capture dut(clk,rst,1'b0,1'b0,384'd0,start,7'd6,addr,cr,ci,exponent,frames,busy,done,invalid,samples);
integer frame,f,i,j,k,address;reg signed [63:0] ar,ai,br,bi,er,ei,er1,ei1,er2,ei2;
initial begin
force dut.fv=fv;force dut.fd=fd;force dut.frequency=fi;force dut.channel=ch;
force dut.fr=re;force dut.fiq=im;force dut.peak=peak;force dut.fi=0;
#30;rst=1;@(negedge clk);start=1;@(negedge clk);start=0;
for(frame=0;frame<6;frame=frame+1)begin
peak=frame==0?2048:1048576;
for(f=0;f<266;f=f+1)for(i=0;i<16;i=i+1)begin
@(negedge clk);fv=1;fi=f;ch=i;re=(frame==0?1000:524288)+f+i*3;im=-(i+1)*100+f*2;end
@(negedge clk);fv=0;fd=1;@(negedge clk);fd=0;
if(frame<5)begin wait(frames==frame+1);@(negedge clk);end else wait(done);
end
#1;if(invalid||exponent!=19||frames!=6||samples!=19456)$fatal(1,"capture status/exponent wrong exp%0d",exponent);
                                                                                                  
for(f=0;f<266;f=f+1)for(k=0;k<136;k=k+1)begin
i=dut.pair_i(k);j=dut.pair_j(k);
ar=1000+f+i*3;ai=-(i+1)*100+f*2;br=1000+f+j*3;bi=-(j+1)*100+f*2;
er1=(ar*br+ai*bi)>>>1;ei1=(ai*br-ar*bi)>>>1;
ar=524288+f+i*3;br=524288+f+j*3;
er2=(ar*br+ai*bi)>>>19;ei2=(ai*br-ar*bi)>>>19;
er=(er1>>>18)+5*er2;ei=(ei1>>>18)+5*ei2;
@(negedge clk);addr=f*136+k;repeat(2)@(negedge clk);
if(cr!==er[31:0]||ci!==ei[31:0])$fatal(1,"cov mismatch f%0d k%0d got%0d,%0d expected%0d,%0d",f,k,cr,ci,er,ei);
if(i>15||j>15)$fatal(1,"channel outside physical range");end
$display("R19 FAST SIX-FRAME CAPTURE PASS all36176 complex covariances,120pairs,exponent change,all16 channels");$finish;
end
initial begin #60000000;$fatal(1,"capture test timeout");end
endmodule
