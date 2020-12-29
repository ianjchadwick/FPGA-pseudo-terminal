`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 10:47:18 AM
// Design Name: 
// Module Name: concatenator
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
/* sources:
https://courses.cs.washington.edu/courses/cse467/05wi/pdfs/lectures/07-SequentialVerilog.pdf
*/

module concatenator(
input [7:0]letter,
input CLK100MHZ,
input send,
input reset,
output reg [39:0]string

    );
    reg [39:0]stringInProgress;
    integer counter = 0;
    
    always @ (posedge send) begin
        if (reset == 1) begin
            stringInProgress = 0;
            string <=stringInProgress;
            counter = 0;
        end // end reset
        
        else if (reset == 0) begin
            if (counter < 5) begin
                stringInProgress = {stringInProgress, letter};
                counter = counter + 1;
            end // end letter
            
            if (counter >= 5) begin
                counter = 0;
                string <= stringInProgress;
                stringInProgress = 0;
            end // end counter == 4
        end // end reset == 0
    end
    
    
endmodule
