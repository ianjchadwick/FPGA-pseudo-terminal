`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 02:46:24 PM
// Design Name: 
// Module Name: digt_value_control
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


module digt_value_control(
    output reg [4:0] out_digit = 0,
    input [2:0] refresh_counter,
    input [4:0] digit_0,
    input [4:0] digit_1,
    input [4:0] digit_2,
    input [4:0] digit_3,
    input [4:0] digit_4,
    input [4:0] digit_5,
    input [4:0] digit_6,
    input [4:0] digit_7
);


always@(refresh_counter)
begin
    case(refresh_counter)
    3'd0:
        out_digit = digit_0; //digit 0 value (right-most)
    3'd1:
        out_digit = digit_1; //digit 1 value
    3'd2:
        out_digit = digit_2; //digit 2 value
    3'd3:
        out_digit = digit_3; //digit 3 value
    3'd4:
        out_digit = digit_4; //digit 4 value 
    3'd5:
        out_digit = digit_5; //digit 5 value
    3'd6:
        out_digit = digit_6; //digit 6 value
    3'd7:
        out_digit = digit_7; //digit 7 value
    endcase
 end
    
    
    
endmodule
