`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 02:38:11 PM
// Design Name: 
// Module Name: digit_control
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


module digit_control(
    output reg [7:0] digit = 0,
    input [2:0] refresh_counter
);

always@(refresh_counter)
begin
    case(refresh_counter)
    3'b000:
        digit = 8'b11111110; //digit 0 (right-most)
    3'b001:
        digit = 8'b11111101; //digit 1
    3'b010:
        digit = 8'b11111011; //digit 2
    3'b011:
        digit = 8'b11110111; //digit 3 
    3'b100:
        digit = 8'b11101111; //digit 4
    3'b101:
        digit = 8'b11011111; //digit 5
    3'b110:
        digit = 8'b10111111; //digit 6
    3'b111:
        digit = 8'b01111111; //digit 7 
    endcase
 end
        
endmodule
