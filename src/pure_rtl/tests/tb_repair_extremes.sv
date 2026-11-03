`timescale 1ns/1ps
module tb_repair_extremes;
reg clk=0;always #5 clk=~clk;
reg rst=0,iv=0;reg [1:0] bad=0;reg [255:0] data=0;
wire ov,og;wire [255:0] out;wire [31:0] fixes;
integer a[0:15],b[0:15],expected,first,k,j,received=0;
adc_frame_repair dut(clk,rst,iv,bad,1'b0,data,ov,out,og,fixes);
always @(posedge clk)begin #1;
if(rst&&og)$fatal(1,"unexpected gap");
if(ov)begin
for(integer c=0;c<16;c=c+1)begin
first=a[c]+(b[c]-a[c])/3;
case(received)0:expected=a[c];1:expected=first;2:expected=(first+b[c])/2;default:expected=b[c];endcase
if($signed(out[c*16+:16])!=expected)$fatal(1,"endpoint arithmetic case %0d lane %0d output %0d: got %0d expect %0d",k,c,received,$signed(out[c*16+:16]),expected);
end
received=received+1;end end
task send(input integer which);
begin @(negedge clk);iv=1;bad=(which==1||which==2)?2'b10:0;
for(integer c=0;c<16;c=c+1)data[c*16+:16]=which==0?a[c]:(bad?16'hdead:b[c]);
@(negedge clk);iv=0;repeat(10)@(negedge clk);end endtask
initial begin
for(k=0;k<40;k=k+1)begin
@(negedge clk);rst=0;repeat(2)@(negedge clk);received=0;
for(j=0;j<16;j=j+1)begin
if(k==0)begin a[j]=-32768;b[j]=32767;end
else if(k==1)begin a[j]=32767;b[j]=-32768;end
else if(k==2)begin a[j]=-32768;b[j]=-32768;end
else if(k==3)begin a[j]=32767;b[j]=32767;end
else begin a[j]=((k*1733+j*881)%65536)-32768;b[j]=((k*5101+j*1297)%65536)-32768;end
end
rst=1;for(integer n=0;n<6;n=n+1)send(n);
if(received!=4||fixes!=2)$fatal(1,"wrong count");
end
$display("REPAIR EXTREMES: 640 signed endpoint pairs, 16 lanes, 2 bad frames PASS");$finish;
end
endmodule
