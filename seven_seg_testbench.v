`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 02:18:49 PM
// Design Name: 
// Module Name: seven_seg_testbench
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


module seven_seg_testbench;
wire [6:0] segments;
wire [7:0] digits;
reg [39:0] signal_in;
reg clk;
seven_seg_x8 SS8(.clk(clk),.signal_in(signal_in),.segments(segments), .digits(digits));
initial begin
signal_in=0;
clk=0;
#1000 signal_in={5'b11111,5'b10001,5'b01110,5'b10100,5'b10100,5'b00000,5'b11111,5'b11111};
//5'b11111,5'b11010,5'b11011, 5'b00000, 5'b10111, 5'b10100, 5'b01101,5'b11111};

end
always
#2 clk=~clk;
endmodule
