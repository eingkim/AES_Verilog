`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 09:35:35
// Design Name: 
// Module Name: AES
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

module AES(message, key, clk, ciphertext);
    parameter key_size=128;
    parameter round=10;
    
    input [127:0] message;
    input [key_size-1:0] key;
    input clk;
    output [127:0] ciphertext;
    
    event mixcolfinish;
    reg kclk=0;
    reg [3:0] round_count1=0;
    reg [3:0] round_count2=0;
    reg [127:0] rkey[10:0];
    reg [127:0] k1;
    wire [127:0] k2;
    wire [127:0] w1,w2,w3,w4;
    reg [127:0] data1,data2,data3;
    reg [127:0] dataout;
    reg e1,e2 = 0;
    
    
    

/////////////////////////////////keygenarating block/////////////////////////////////
    
    
    KeyGen K (k1,k2,round_count1,clk);
    
    always @(key) begin
        e1 = 1; //Key generation enable
        round_count1=1;
        k1=key;
        rkey[0]=key;
    end
    
    always@(posedge clk) begin
    kclk=~kclk;
    end
    
    always@( posedge kclk) begin
        if(e1) begin
            if(k2 && round_count1<11) begin
            rkey[round_count1] = k2;
            k1=rkey[round_count1];
            round_count1=round_count1+1;
            end
            
            else begin
            // do nothing
            end
        end
    end
  /////////////////////////////////////////////////////////////////////////////////////  
    
    
    
    
/////////////////////////////////AES encryption/////////////////////////////////
    SubBytes S (data1,w1);
    ShiftRow Sft (w1,w2);
    MixCol_128bit M (data2,clk,w3);
    AddroundKey A (data3, rkey[round_count2-1], w4);
    
    assign ciphertext=dataout;
    
    
    always @(message) begin
        e2 = 1; //AES encryption enable
        round_count2=0;
    end
    always@(posedge clk) begin
        if(e2) begin
        case (round_count2)
        0 : begin
            data3=message;
            round_count2=round_count2+1;
            end
        1,2,3,4,5,6,7,8,9 : begin
            data1=w4;
            @(posedge clk) data2 = w2;
            repeat (17) @(posedge clk);
            data3= w3;
            round_count2=round_count2+1;
            end
        10 : begin
            data1=w4;
            repeat(2) @(posedge clk);
            data3 = w2;
            round_count2=round_count2+1;
            @(posedge clk);
            dataout = w4;
         end
        endcase
        end
        else begin
        //
        end
    end
//////////////////////////////////////////////////////////////////////////////

endmodule


