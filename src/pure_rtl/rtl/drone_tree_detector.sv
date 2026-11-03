`timescale 1ns/1ps
`include "detector_config.vh"
                                                                              
                                                                
                                                                                    
                                                                               
module drone_tree_detector(input clk,rst_n,load,input [7:0] feature_addr,
 input signed [47:0] feature_value,input start,input_valid,new_sequence,
 output reg busy,done,invalid,detected,output reg signed [31:0] raw_score,
 output reg signed [63:0] causal_sum,output reg [4:0] history_count);
(* ram_style="block" *) reg [159:0] nodes[0:`DETECTOR_NODES-1];
reg [10:0] roots[0:`DETECTOR_TREES-1];reg signed [47:0] features[0:217];
initial begin $readmemh("detector_nodes.mem",nodes);$readmemh("detector_roots.mem",roots);end
reg signed [31:0] history[0:2];reg [4:0] pointer;reg [10:0] node;
reg [6:0] tree;reg [3:0] state;reg [159:0] word;reg signed [47:0] feature;
reg signed [63:0] score,new_sum;reg [4:0] new_count;
wire signed [63:0] threshold_product=$signed(`DETECTOR_THRESHOLD)*$signed({1'b0,new_count});
always @(posedge clk)begin
if(load&&!busy&&feature_addr<218)features[feature_addr]<=feature_value;
if(!rst_n)begin busy<=0;done<=0;invalid<=0;detected<=0;raw_score<=0;causal_sum<=0;history_count<=0;
pointer<=0;node<=0;tree<=0;state<=0;word<=0;feature<=0;score<=0;new_sum<=0;new_count<=0;end
else begin done<=0;
if(start&&!busy)begin
 invalid<=!input_valid;detected<=0;
 if(new_sequence||!input_valid)begin history_count<=0;causal_sum<=0;pointer<=0;end
 if(!input_valid)begin done<=1;raw_score<=0;end
 else begin busy<=1;score<=`DETECTOR_BASELINE;tree<=0;state<=0;end
end else if(busy)case(state)
0:begin node<=roots[tree];state<=1;end
1:begin word<=nodes[node];state<=2;end
2:begin
 if(word[159])begin score<=score+$signed(word[79:48]);
 if(tree==`DETECTOR_TREES-1)state<=5;else begin tree<=tree+1;state<=0;end end
 else if(word[157:150]>=218||word[149:139]>=`DETECTOR_NODES||word[138:128]>=`DETECTOR_NODES)begin
 invalid<=1;busy<=0;done<=1;detected<=0;history_count<=0;causal_sum<=0;pointer<=0;end
 else begin feature<=features[word[157:150]];state<=3;end
end
3:begin node<=feature<=$signed(word[127:80])?word[149:139]:word[138:128];state<=1;end
5:begin
 if(score>2147483647||score< -64'sd2147483648)begin invalid<=1;busy<=0;done<=1;history_count<=0;causal_sum<=0;pointer<=0;end
 else begin raw_score<=score[31:0];new_count<=history_count<3?history_count+1:3;
 new_sum<=causal_sum+score-(history_count==3?$signed(history[pointer]):64'sd0);
 history[pointer]<=score[31:0];state<=6;end
end
6:begin causal_sum<=new_sum;history_count<=new_count;pointer<=pointer==2?0:pointer+1;
detected<=new_sum>threshold_product;busy<=0;done<=1;end
endcase
end
end
endmodule
