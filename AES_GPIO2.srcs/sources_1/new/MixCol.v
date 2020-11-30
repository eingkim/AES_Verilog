`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: hanyang Univ.
// Engineer: Taeyeon Kim,Jaewon Kim

// Create Date: 2020/10/22 15:09:48 
// Module Name: MixColumn

//////////////////////////////////////////////////////////////////////////////////


module MixCol(in,clk,out);  //need 4 clock cycle
    parameter Matrix = 128'h02030101010203010101020303010102;
    input [31:0] in;
    input clk;
    output [31:0] out;
    reg [31:0] outputreg;
    reg [127:0] m = Matrix;
    wire [7:0] w [3:0];
    reg[3:0] count=4;
    always@(in) begin
    m=Matrix;
    outputreg=0;
    count = 0;
    end
    always@(posedge clk) begin
    if(count<3) begin
    outputreg[7:0]=w[0]^w[1]^w[2]^w[3];
    m=m<<32;
    outputreg=outputreg<<8;
    count = count+1;
    end
    else if (count==3) begin
    outputreg[7:0]=w[0]^w[1]^w[2]^w[3];
    m=m<<32;
    count = count+1;
    end
    else begin
    end
    end
    
    galois_multiplier g0 (in[31:24] ,m[127:120], w[3]);
    galois_multiplier g1 (in[23:16] ,m[119:112], w[2]);
    galois_multiplier g2 (in[15:8], m[111:104], w[1]);
    galois_multiplier g3 (in[7:0], m[103:96], w[0]);
    assign out = outputreg;
    
endmodule