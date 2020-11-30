`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: hanyang Univ.
// Engineer: Taeyeon Kim,Jaewon Kim
// 
// Create Date: 2020/10/21 17:27


//ShiftRows
//( 1 2 3 4 )      not changed
//( 2 3 4 1 )      Circular <<1
//( 3 4 1 2 )      Circular <<2
//( 4 1 2 3 )      Circular <<3
//////////////////////////////////////////////////////////////////////////////////


module ShiftRow(in,out);
    input [127:0] in;
    output [127:0] out;
    reg [127:0] out;
    integer i;
    always@(in) begin
//  store start from LSB to MSB

/*
    out[31:0]=in[31:0];
    out[63:32]={in[39:32],in[63:56],in[55:48],in[47:40]};
    out[95:64]={in[79:72],in[71:64],in[95:88],in[87:80]};
    out[127:96]={in[119:112],in[111:104],in[103:96],in[127:120]};
    */
    
// store start from MSB to LSB
    out[127:96]=in[127:96];
    out[95:64]={in[87:80],in[79:72],in[71:64],in[95:88]};
    out[63:32]={in[47:40],in[39:32],in[63:56],in[55:48]};
    out[31:0]={in[7:0],in[31:24],in[23:16],in[15:8]};
    
    end
endmodule
