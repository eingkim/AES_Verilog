`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: hanyang Univ.
// Engineer: Taeyeon Kim,Jaewon Kim
// 
// Create Date: 2020/10/08 15:12:33


//KeyScheduler
//
//////////////////////////////////////////////////////////////////////////////////


module KeyGen(key,rkey,round,clk);
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
    input [127:0] key;
    input clk;
    input [3:0] round;
    output [127:0] rkey;
    reg [31:0] win;
    wire [31:0] wrot;
    wire [31:0] wsub;
    wire [31:0] wout;
    reg [127:0] word;
    reg [31:0] RConst;
    
    always@(posedge clk) begin
    case (round)
        1 : RConst=RCons1;
        2 : RConst=RCons2;
        3 : RConst=RCons3;
        4 : RConst=RCons4;
        5 : RConst=RCons5;
        6 : RConst=RCons6;
        7 : RConst=RCons7;
        8 : RConst=RCons8;
        9 : RConst=RCons9;
        10 : RConst=RCons10;
    endcase
    
    win[31:24]=key[103:96];
    win[23:16]=key[71:64];
    win[15:8]=key[39:32];
    win[7:0]=key[7:0];
    
    {word[127:120],word[95:88],word[63:56],word[31:24]} = wout^{key[127:120],key[95:88],key[63:56],key[31:24]};
    {word[119:112],word[87:80],word[55:48],word[23:16]} = {word[127:120],word[95:88],word[63:56],word[31:24]}^{key[119:112],key[87:80],key[55:48],key[23:16]};
    {word[111:104],word[79:72],word[47:40],word[15:8]} = {word[119:112],word[87:80],word[55:48],word[23:16]}^{key[111:104],key[79:72],key[47:40],key[15:8]};
    {word[103:96],word[71:64],word[39:32],word[7:0]} = {word[111:104],word[79:72],word[47:40],word[15:8]}^{key[103:96],key[71:64],key[39:32],key[7:0]};
    end
    
    RotWord  key_rot0 (win,wrot);
    SubBytes_8bit  key_sub0 (wrot[31:24], wsub[31:24]);
    SubBytes_8bit  key_sub1 (wrot[23:16], wsub[23:16]);
    SubBytes_8bit  key_sub2 (wrot[15:8], wsub[15:8]);
    SubBytes_8bit  key_sub3 (wrot[7:0], wsub[7:0]);
    RCons   key_Rcons (wsub,RConst,wout);
    
    
    assign rkey = word;

endmodule
