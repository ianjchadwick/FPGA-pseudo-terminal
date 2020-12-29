`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 10:33:46 PM
// Design Name: 
// Module Name: clock_testbenches
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


module clock_testbenches;
reg clk;
wire clock_divide_hund_sec;
wire clock_divide_sec;
wire clock_divide;

hundreth_seconds_cll UUT1(clk,clock_divide_hund_sec);
one_sec_clk UUT2(clk,clock_divide_sec);
clock UUT3(clk,clock_divide);

initial begin
clk=0;
end
always 
#1 clk=~clk;

endmodule
