`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:45:28 AM
// Design Name: 
// Module Name: greetings_top_testbench
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


module greetings_top_testbench;
reg clk;
reg [7:0]a;
reg [10:0]op_code;
wire [39:0] display;
greetings_top UUT(clk, a,op_code,display);
initial begin
clk=0; a=0;op_code=11'b00000100000;

end
always 
#70 a=0;
always
#10 a=a+1;
always
#1 clk=~clk;
endmodule


