`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2020 03:00:32 PM
// Design Name: 
// Module Name: clock
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


module clock(
    input wire clk,  // 100MHz
    output clock_divide // 10kHz
);

localparam div_val = 4999; //counts 1000 ms from 0 -> 999
integer counter = 0;
reg hold=0;
assign clock_divide =hold;
always @ (posedge clk)
    begin
        if (counter == div_val) begin
            counter = 0; //resets counter
            hold= !hold;
         end
        else begin
            counter = counter + 1; //iterates clock
        end    
    end     
endmodule
