`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 20:57:07
// Design Name: 
// Module Name: sim_keygen
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


module sim_keygen;

    reg [127:0] key;
    wire [127:0] rkey;
    reg clk=0;
    reg [3:0] round;
    always #5 begin
    clk=~clk;
    end
    KeyGen  K (key, rkey, round, clk);
    
    initial begin
    round=1;
    key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
    #50
    key=0;
    end
endmodule
