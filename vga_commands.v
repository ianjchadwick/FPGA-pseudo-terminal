`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 12:13:36 AM
// Design Name: 
// Module Name: vga_commands
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


module vga_commands(
input clk,
input [7:0]a,
input [10:0]op_code,
output reg[2:0]all_of_the_lights
    );

always@(posedge clk)begin
    if(op_code==11'b00010000000)
    case(a)
        8'b000: all_of_the_lights=3'b000;
        8'b001: all_of_the_lights=3'b001;
        8'b010: all_of_the_lights=3'b010;
        8'b011: all_of_the_lights=3'b011;
        8'b100: all_of_the_lights=3'b100;
        8'b101: all_of_the_lights=3'b101;
        8'b110: all_of_the_lights=3'b110;//nothing
        8'b111: all_of_the_lights=3'b111;//nothing
        endcase
end
    
    
endmodule
