`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 02:32:03 PM
// Design Name: 
// Module Name: refresh_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: REFRENCED Simply Embedded youtube channel 7-seg disp video
// 
//////////////////////////////////////////////////////////////////////////////////


module refresh_counter(
    input clock,
    output reg [2:0] counter = 0
);

always @ (posedge clock) counter <= counter +1;

endmodule
