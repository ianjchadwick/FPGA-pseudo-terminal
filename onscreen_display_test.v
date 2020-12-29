`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 07:15:40 PM
// Design Name: 
// Module Name: onscreen_display_test
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


module onscreen_display_test(

    );
    reg CLK100MHZ;
    reg reset;
    wire horizSyncOut;
    wire vertSyncOut;
    reg [2:0]testInput;
    wire [3:0]VGA_R;
    wire [3:0]VGA_G;
    wire [3:0]VGA_B;
    
    graphics test( .testInput(testInput), .VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .CLK100MHZ(CLK100MHZ), .reset(reset), 
    .horizSyncOut(horizSyncOut), .vertSyncOut(vertSyncOut));
    
    initial begin
        CLK100MHZ = 0;
        reset = 1;
        #20 reset = 0;
        testInput = 0;
    end
    always #5 CLK100MHZ = ~CLK100MHZ;
    always begin
    testInput = testInput + 1;
        #180 $finish;
    end
endmodule
