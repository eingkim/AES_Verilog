`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 10:36:53
// Design Name: 
// Module Name: AES_sim
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


module AES_sim;

    reg [127:0] message,key;
    reg clk=0;
    wire [127:0] cipher;
    
    AES A0 (message, key, clk, cipher);
    always begin
    #1 clk=~clk;
    end
    initial begin
    message = 128'h328831e0435a3137f6309807a88da234;
    key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
    end
endmodule
