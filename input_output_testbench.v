`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:24:31 PM
// Design Name: 
// Module Name: input_output_testbench
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


module input_output_testbench;
reg clk;
reg [2:0]a;
reg [2:0] b;
reg [3:0]op_code_abbreviated;
reg reset;
reg go;
wire[6:0] segments;
wire [7:0]digits;
wire [2:0]rgb1;
wire [2:0] rgb2;
 wire horizSyncOut;
wire vertSyncOut;
wire[3:0]VGA_R;
wire[3:0]VGA_G;
wire [3:0]VGA_B;
input_output UUT(clk,a,b,reset,go,op_code_abbreviated,segments,digits,rgb1,rgb2, horizSyncOut,vertSyncOut,VGA_R,VGA_G,VGA_B);
initial begin
clk=0;a=0;b=0;op_code_abbreviated=0;go=0;reset=0;

//#10 reset=1;
//#10 reset=0;

#100 op_code_abbreviated=5;a=5;


end

always
#2 clk=~clk;

endmodule
