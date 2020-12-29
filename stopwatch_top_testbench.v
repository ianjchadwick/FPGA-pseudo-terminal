`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 12:11:39 AM
// Design Name: 
// Module Name: stopwatch_top_testbench
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


module stopwatch_top_testbench;
reg clk;
reg reset;//button
reg go;//button
reg [10:0]op_code;
wire [39:0] display;
stopwatch_top UUT(clk,reset,go,op_code,display);

initial begin
clk=0;reset=0;go=0;op_code=0;
#1500 op_code=11'b00001000000;
//#600 reset=1;
//#10 reset=0;
#500 go=1;
#10 go=0;
end

always
#2 clk=~clk;
endmodule

