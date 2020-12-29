`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 12:33:40 AM
// Design Name: 
// Module Name: rxn_game_testbench
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


module rxn_game_testbench;
reg clk;
reg op_code;
wire [39:0] display;
reg [7:0]a;
reg reset;
wire horizSyncOut2;
wire vertSyncOut2;
wire VGA_R2;
wire VGA_G2;
wire VGA_B2;
rxn_game_top RXN(.clk(clk),.op_code(op_code) ,.display(display_RXN),.a(a),.reset(reset),.horizSyncOut(horizSyncOut2),.vertSyncOut(vertSyncOut2),.VGA_R(VGA_R2),.VGA_G(VGA_G2),.VGA_B(VGA_B2));
initial begin clk=0;op_code=0;a=0;reset=0;
#100 op_code=11'b00100000000;

end
always #2 clk=~clk;
endmodule
