`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 05:33:47 PM
// Design Name: 
// Module Name: display_signals_test
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


module display_signals_test(

    );
    
    reg clk;
    reg reset;
    wire [9:0]xPos;
    wire [9:0]yPos;
    wire horizSync;
    wire vertSync;
    wire valid;
    
    display_signals test(.valid(valid), .clk(clk), .reset(reset), .xPos(xPos), .yPos(yPos), 
    .horizSync(horizSync), .vertSync(vertSync));
    
    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
    end
    
    always #5 clk = ~clk;
    
    always begin
    #100000 $finish;
    end
    
endmodule
