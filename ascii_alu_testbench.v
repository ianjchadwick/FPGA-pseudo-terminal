`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 12:11:28 AM
// Design Name: 
// Module Name: ascii_alu_testbench
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


module ascii_alu_testbench;
reg clk;
reg [7:0] a;
reg [7:0] b;
reg [10:0] op_code;
reg reset;
reg go;
//output reg [7:0] out,
 wire[39:0] display_alu;
 wire[2:0]rgb1;
wire [2:0]rgb2;
 wire horizSyncOut;
 wire vertSyncOut;
 wire[3:0]VGA_R;
 wire[3:0]VGA_G;
 wire[3:0]VGA_B;
ascii_alu ASA(.clk(clk), .a(a), .b(b),.go(go),.reset(reset), .op_code(op_code), .display(display_alu),.rgb1(rgb1),.rgb2(rgb2),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
initial begin
a=0;b=0; op_code= 0;clk=0;
#10 reset=1;
#10 reset=0;
#300 op_code= 11'b00010000000;
#400 a=2;
end
always #2 clk=~clk;








endmodule
