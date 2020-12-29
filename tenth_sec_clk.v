`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 06:32:16 AM
// Design Name: 
// Module Name: tenth_sec_clk
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


module tenth_sec_clk(
    input wire clk,  // 100MHz
    output  clock_divide_tenth_sec// 101Hz
);

localparam div_val = 9999999; 
integer counter = 0;
reg hold=0;
assign clock_divide_tenth_sec =hold;
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
