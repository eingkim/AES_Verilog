`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 14:53:11
// Design Name: 
// Module Name: RotWord
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


module RotWord(w_in,w_out);
    input [31:0] w_in;
    output [31:0] w_out;
    assign w_out[31:0] = {w_in[23:16],w_in[15:8],w_in[7:0],w_in[31:24]};
endmodule
