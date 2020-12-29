`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 11:42:19 PM
// Design Name: 
// Module Name: decimal_converter
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


module decimal_converter_testbench;

wire [9:0] pbcd;
reg [7:0] num;

decimal_converter UUT(pbcd, num);

initial begin
num=0;

end
always
#2 num=num +1;

endmodule