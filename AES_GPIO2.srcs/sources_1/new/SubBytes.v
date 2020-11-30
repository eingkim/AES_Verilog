`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: hanyang Univ.
// Engineer: Taeyeon Kim,Jaewon Kim
// 
// Create Date: 2020/10/08 15:12:33


//SubBytes
//Using S-box
//////////////////////////////////////////////////////////////////////////////////


module SubBytes(in,out);
    input [127:0] in;
    output [127:0] out;
    
    genvar i;
    generate
    for(i=0;i<128;i=i+8) begin
    SubBytes_8bit S (in[i+7:i],out[i+7:i]);
    end
    endgenerate
    
endmodule



/*

shiftregister(in,clk,out);
    input[127:0] in;
    input clk;
    output [127:0] out;
    
    always begin
    #10 clk=~clk;
    end
    
    always@(in, posedge clk) begin
    out=in<<8;
    end


*/