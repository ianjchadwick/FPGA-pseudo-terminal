`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 03:06:01 PM
// Design Name: 
// Module Name: vga_show_top
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


module vga_show_top(
input clk,
input reset,
input [7:0] a,
input [10:0] op_code,
output wire horizSyncOut,
output wire vertSyncOut,
output  [3:0]VGA_R,
output  [3:0]VGA_G,
output  [3:0]VGA_B
    );
wire [2:0] testInput;
 vga_commands VGAC(
              .clk(clk),
              .a(a),
              .op_code(op_code),
              .all_of_the_lights(testInput)
               );
               
graphics GRA(  .testInput(testInput),
               .CLK100MHZ(clk), 
               .reset(reset),
               .horizSyncOut(horizSyncOut),
               .vertSyncOut(vertSyncOut),
               .VGA_R(VGA_R),
               .VGA_G(VGA_G),
               .VGA_B(VGA_B)
               );
endmodule
