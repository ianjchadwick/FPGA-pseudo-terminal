`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:52:26 PM
// Design Name: 
// Module Name: stopwatch_stop
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


module stopwatch_top(
input clk,
input reset,
input go,
input [10:0]op_code,//11'b00001000000
output reg [39:0] display
    );
wire [9:0] minutes,seconds,hundreth_sec;
stopwatch STW(.clk(clk),.reset(reset),.go(go),.op_code(op_code),.minutes(minutes),.seconds(seconds),.hundreth_sec(hundreth_sec));
always@(posedge clk)begin
if(op_code==11'b00001000000)
display={5'b11111,5'b11111,minutes,seconds,hundreth_sec};
end
endmodule
