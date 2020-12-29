`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 01:16:58 PM
// Design Name: 
// Module Name: greetings
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

//this module takes in the input "greeting" 
//and outputs a random one from word bank. output cannot
//be the same as the input
module greetings(
input clk,
input [7:0] a,
input [10:0] op_code,
output reg [7:0] out =0
    );
reg [2:0] hold_r=0;
wire [2:0] r;
wire [2:0] out_num;
//reg in_num=0;
word_bank WBR(hold_r,a,out_num);// r currently can have 7 values
randomizer R(clk, r);
always@(a)
    hold_r=r;
always@(posedge clk)begin
if(op_code==11'b00000100000)
    out[2:0]=out_num;
end
endmodule
