`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: hanyang Univ.
// Engineer: Taeyeon Kim,Jaewon Kim
// 
// Create Date: 2020/10/26 13:15:02
 
// Module Name: AddRoundKey

//////////////////////////////////////////////////////////////////////////////////


module AddroundKey(state,key,out);
    parameter key_size = 128;
    parameter round = 10;
    input [127:0] state,key;
    output [127:0] out;
    
    assign out=state^key;
endmodule
