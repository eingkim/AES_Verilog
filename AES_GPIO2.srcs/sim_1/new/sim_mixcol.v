`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 11:46:45
// Design Name: 
// Module Name: sim_mixcol
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


module sim_mixcol;

    reg [31:0] in;
    reg clk=0;
    wire [31:0] out;
    MixCol M0 (in,clk,out);
    always #5 begin
    clk=~clk;
    end
    
    initial begin
        in=32'hd4bf5d30;
        #50
        in=32'he0b452ae;
        #50
        in=32'hb84111f1;
        #50
        in=32'h1e2798e5;
        end
endmodule