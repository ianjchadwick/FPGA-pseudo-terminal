`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 08:39:21 PM
// Design Name: 
// Module Name: ten_sec_clk
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


module ten_sec_clk(
    input wire clk,  // 100MHz
    output clock_divide_ten_sec // 1Hz
);

localparam div_val = 499999999; 
integer counter = 0;
reg hold=0;
assign clock_divide_ten_sec =hold;
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