`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 09:54:33 PM
// Design Name: 
// Module Name: seven_seg_x8
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


module seven_seg_x8(
    output reg [6:0] segments,
    output [7:0] digits,
    input [39:0] signal_in,
    input wire clk
);

wire clock_refresh;
wire [2:0] control;
wire [4:0] digit_0 = signal_in[4:0];
wire [4:0] digit_1 = signal_in[9:5];
wire [4:0] digit_2 = signal_in[14:10];
wire [4:0] digit_3 = signal_in[19:15];
wire [4:0] digit_4 = signal_in[24:20];
wire [4:0] digit_5 = signal_in[29:25];
wire [4:0] digit_6 = signal_in[34:30];
wire [4:0] digit_7 = signal_in[39:35];
wire [7:0] dig_out;
wire [6:0] segtemp; 

always@(*) begin
    segments = segtemp;
end

clock clockdivider(.clk(clk), .clock_divide(clock_refresh));

refresh_counter refresh(.clock(clock_refresh), .counter(control));

digt_value_control outval(.out_digit(dig_out), .refresh_counter(control), .digit_0(digit_0), .digit_1(digit_1), .digit_2(digit_2), .digit_3(digit_3), .digit_4(digit_4), .digit_5(digit_5), .digit_6(digit_6), .digit_7(digit_7));

digit_control outdigit(.digit(digits), .refresh_counter(control));

output_display outdisp(.out_seg(segtemp), .ln_binary(dig_out));

endmodule
