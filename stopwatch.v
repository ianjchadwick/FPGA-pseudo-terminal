`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 10:09:16 PM
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
input clk,
input reset,
input go,
input [10:0]op_code,//11'b00001000000
output [9:0]minutes,
output [9:0]seconds,
output [9:0]hundreth_sec
    );
reg start_stop=0;

core_time CT(.clk(clk), .reset(reset), .start_stop(start_stop), .minutes(minutes), .seconds(seconds),.hundreth_sec(hundreth_sec));

always@(*)begin

if(go==1 || op_code == 11'b00001000000)
    start_stop=~start_stop;

end
endmodule
