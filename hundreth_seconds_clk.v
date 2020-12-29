`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 10:52:05 PM
// Design Name: 
// Module Name: hundreth_seconds_clk
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


module hundreth_seconds_cll(
    input wire clk,  // 100MHz
    output  clock_divide_hund_sec // .01Hz
);
//49999999; is 1 second
//499999; is a hundreth second
localparam div_val = 499999; 
integer counter = 0;
reg hold=0;
assign clock_divide_hund_sec =hold;
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

