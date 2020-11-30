`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 16:28:33
// Design Name: 
// Module Name: sim_mixcol_128
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


module sim_mixcol_128bit;

reg [127:0] in;
    reg clk=0;
    wire [127:0] out;
    MixCol_128bit M2 (in,clk,out);
    always #5 begin
    clk=~clk;
    end
    
    initial begin
        #10
        in=128'hd4e0b81ebfb441275d52119830aef1e5;
        end
endmodule
