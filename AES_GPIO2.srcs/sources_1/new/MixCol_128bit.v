`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 15:29:10
// Design Name: 
// Module Name: MixCol_128bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//need 4 * 4 = 16 clock cycle
module MixCol_128bit(in,clk,out);
    input [127:0] in;
    input clk;
    output [127:0]out;
    
    event set;
    reg [3:0] clk_count=0;
    reg [31:0] in1;
    wire [31:0] out1;
    reg [127:0] in2,out2;
    reg e=0;
    reg [3:0] count=4;
    
    always@(in) begin
    e=1;
    in2=in;
    count=4;
    clk_count=0;
    in1 = {in2[127:120], in2[95:88], in2[63:56], in2[31:24]};
    end
    
    always @(posedge clk) begin
        if(e==1) begin
        if(clk_count==3) begin
        -> set;
        clk_count=0;
        end
        else begin
        clk_count=clk_count+1;
        end
        end
    end
    
    always@(set) begin
        if(count) begin
        if(e==1) begin
            in2=in2<<8;
            in1 = {in2[127:120], in2[95:88], in2[63:56], in2[31:24]};
            {out2[103:96], out2[71:64], out2[39:32], out2[7:0]} = out1;
            end
            if (count>1) begin
            out2=out2<<8;
            end
            else begin
            {out2[103:96], out2[71:64], out2[39:32], out2[7:0]} = out1;
            end
            count=count-1;
            end
         end
    
    MixCol M1 (in1, clk, out1);
    
    assign out=out2;
endmodule
