`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 15:15:14
// Design Name: 
// Module Name: RCons
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


module RCons(word,RCons,result);
    input [31:0] word, RCons;
    output [31:0] result;
/*    reg [31:0] out;
     parameter RCons0 = 32'h0;
    parameter RCons1 = 32'h01000000;
    parameter RCons2 = 32'h02000000;
    parameter RCons3 = 32'h04000000;
    parameter RCons4 = 32'h08000000;
    parameter RCons5 = 32'h10000000;
    parameter RCons6 = 32'h20000000;
    parameter RCons7 = 32'h40000000;
    parameter RCons8 = 32'h80000000;
    parameter RCons9 = 32'h1b000000;
    parameter RCons10= 32'h36000000;
    always@* begin
    case (round)
        0: out=word^RCons0;
        1:out=word^RCons1;
        2:out=word^RCons2;
        3:out=word^RCons3;
        4:out=word^RCons4;
        5:out=word^RCons5;
        6:out=word^RCons6;
        7:out=word^RCons7;
        8:out=word^RCons8;
        9:out=word^RCons9;
        10:out=word^RCons10;
    endcase
   end 
   */
   assign result = word^RCons;
endmodule
