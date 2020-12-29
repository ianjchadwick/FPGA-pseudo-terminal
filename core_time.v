`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 08:02:30 AM
// Design Name: 
// Module Name: core_time
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


module core_time(
    input clk,
    input reset,
    input start_stop,
    output [9:0] minutes,
    output [9:0] seconds,
    output [9:0] hundreth_sec
    //output reg [16:0] clock_out
    );
    
//localparam day_count = 86399; // number of seconds in 24 hours
localparam hour_count =359999;  //number of hundreths og seconds in 1 hour
reg [16:0] hundreth_seconds_local = 0;
//reg [16:0] clock_out_local;
wire clk_div;

hundreth_seconds_cll HSC(.clk(clk), .clock_divide_hund_sec(clk_div));
core_time_decoder CTD(.clk(clk), .binary_time(hundreth_seconds_local), .hundreth_sec(hundreth_sec), .minutes(minutes), .seconds(seconds));

always@(posedge clk_div)
    begin
        if(reset == 1 )//|| start_stop==0)
           hundreth_seconds_local <= 0;
        else if(hundreth_seconds_local == hour_count)
           hundreth_seconds_local = 0;
        else if(start_stop==0)
           hundreth_seconds_local = hundreth_seconds_local;
        else
           hundreth_seconds_local = hundreth_seconds_local + 1;
      //  clock_out_local = hundreth_seconds_local;
    end
    
//always@(posedge clk)
//    clock_out = clock_out_local;
    
endmodule
