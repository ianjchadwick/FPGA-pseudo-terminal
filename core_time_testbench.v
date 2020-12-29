`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 04:13:45 PM
// Design Name: 
// Module Name: core_time_testbench
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


module core_time_testbench;
reg clk;
reg reset;
reg go;
reg [7:0] a,b;
reg [10:0]op_code;
wire [39:0] display;

ascii_alu UUT(    .clk(clk),
                  .a(a),
                  .b(b),  
                  .reset(reset),
                  .go(go),
                  .op_code(op_code),
                  .display(display));
initial begin  clk=0;
reset=0;
go=0;
op_code=11'b00001000000;
a=0;b=0;
# 100 go=1;
#10 go=0;
end
always #2 clk=~clk;
endmodule
