`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 12:15:00
// Design Name: 
// Module Name: sim_GFmult
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


module sim_GFmult;
    reg[7:0] in1,in2;
    wire[7:0] out;
    
    galois_multiplier G0 (in1,in2,out);
    
    initial begin
    in1 = 8'hd4;
    in2 = 8'h02;
    #10
    in1 = 8'hbf;
    in2 = 8'h03;
    #10
    in1 = 8'h5d;
    in2 = 8'h01;
    #10
    in1 = 8'h30;
    in2 = 8'h01;
    end
endmodule
