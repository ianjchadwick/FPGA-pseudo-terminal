`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 02:19:31 PM
// Design Name: 
// Module Name: logic
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


module logic(
input clk,           
input [39:0] command,
output [6:0] segments,
output [7:0] digits,
output [2:0]rgb1,
output [2:0]rgb2,
output horizSyncOut,
output vertSyncOut,
output[3:0]VGA_R,
output[3:0]VGA_G,
output[3:0]VGA_B
    );
wire [7:0] a,b;
wire go,reset;
wire [39:0] display_alu;
wire[10:0] op_code;

decoder DEC(.clk(clk),.command(command),.a_in(a),.b_in(b),.op_code(op_code),.reset(reset),.go(go));

ascii_alu ASA(.clk(clk), .a(a), .b(b),.go(go),.reset(reset), .op_code(op_code), .display(display_alu),.rgb1(rgb1),.rgb2(rgb2),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));

seven_seg_x8 SS8(.clk(clk),.signal_in(display_alu),.segments(segments), .digits(digits));

endmodule
