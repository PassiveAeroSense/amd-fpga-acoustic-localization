`timescale 1ns/1ps
module tb_fft;
reg clk=0;always #5 clk=~clk;reg rst=0,load=0,start=0;
reg [10:0] la=0,ra=0;reg signed [31:0] lr=0,li=0;wire signed [31:0] rr,ri;wire busy,done,ov;
reg [31:0] re[0:2047],im[0:2047];integer i,k,f;string name;
fft2048 dut(clk,rst,load,la,lr,li,start,ra,rr,ri,busy,done,ov);
initial begin
 #30;rst=1;
 for(k=0;k<3;k=k+1)begin
 name=$sformatf("fft%0d_re.mem",k);$readmemh(name,re);name=$sformatf("fft%0d_im.mem",k);$readmemh(name,im);
 for(i=0;i<2048;i=i+1)begin @(negedge clk);load=1;la=i;lr=re[i];li=im[i];end
 @(negedge clk);load=0;start=1;@(negedge clk);start=0;wait(done);#1;if(ov)$fatal(1,"FFT overflow");
 name=$sformatf("fft%0d_out.txt",k);f=$fopen(name,"w");
 for(i=0;i<2048;i=i+1)begin @(negedge clk);ra=i;@(posedge clk);#1;$fwrite(f,"%0d %0d\n",rr,ri);end
 $fclose(f);$display("FFT case %0d generated",k);
 end
 $finish;
end
initial begin #5000000;$fatal(1,"FFT timeout");end
endmodule
