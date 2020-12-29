`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 04:54:30 PM
// Design Name: 
// Module Name: display_signals
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
/*sources
https://projectf.io/posts/fpga-graphics/
https://embeddedthoughts.com/2016/07/29/driving-a-vga-monitor-using-an-fpga/
http://www.righto.com/2018/04/fizzbuzz-hard-way-generating-vga-video.html
https://github.com/shirriff/vga-fpga-fizzbuzz/blob/master/src/vga.v
https://github.com/shirriff/vga-fpga-fizzbuzz/blob/master/src/vga.v
https://ktln2.org/2018/01/23/implementing-vga-in-verilog/

*/

// The code I had for this formerly was adapted from a tutorial, so I could count on it working
// This is a frankenstein of eveything I've read. From what I can tell, it works, but I'm not 100% sure

module display_signals(
input clk,
input reset,
input strobe,
output reg[9:0]xPos=0,
output reg [9:0]yPos=0,
output horizSync,
output vertSync,
output reg valid

    );
    
    reg [9:0]HS;
    reg [9:0]VS;
    
    localparam horizActiveEnd = 639; // end of the active pixels
    localparam horizSyncStart = horizActiveEnd + 16; // active end w/"front porch" taken into account
    localparam horizSyncEnd = horizSyncStart + 96; // end of sync
    localparam horizEnd = 799; // includes blank pixels
    localparam vertActiveEnd = 479; // end of active pixels
    localparam vertSyncStart = vertActiveEnd + 10;
    localparam vertSyncEnd = vertSyncStart + 2;
    localparam vertEnd = 524;
    // if it's in the right window, we can display the image
    always @ (posedge clk) begin
        valid = (xPos < horizActiveEnd) && (yPos < vertActiveEnd);
    end
    // generate syncs
    
        assign horizSync = (xPos > horizSyncStart) && (xPos < horizSyncEnd);
        assign vertSync = (yPos > vertSyncStart) && (yPos < vertSyncEnd);
    
    
    always @ (posedge clk) begin
        if (reset) begin
            xPos = 0;
            yPos = 0;
        end // end reset
        
        if (strobe) begin
            if (xPos == horizEnd) begin
                xPos = 0;
                if (yPos == vertEnd) begin
                    yPos = 0;
                end // end vertEnd
                else begin
                    yPos = yPos + 1;
                end // end else
            end // end horizEnd
            else begin
                xPos = xPos + 1;
            end // end xPos else
        end // end reset else
    end// end always        
  /*         
    always @ (posedge clk) begin
        if (reset) begin
           yPos = 0;
        end // end reset
    end // end always
        
    
    always @(posedge clk) begin
        if(xPos == horizEnd) begin
            xPos = 0;
        end // end horizEnd
        else begin
            xPos = xPos + 1;
        end // end xPos
    end // end always
   
    
   always @ (posedge clk) begin
        
        if(xPos == horizEnd) begin
            if (yPos == vertEnd) begin
                yPos = 0;
            end
            else begin
                yPos = yPos + 1;
            end
        end // end if xPos
    end // end always
    */
    
    
endmodule
