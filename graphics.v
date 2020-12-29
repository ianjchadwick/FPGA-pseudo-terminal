`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 11:50:06 AM
// Design Name: 
// Module Name: onscreen_display
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
/*
sources:
http://users.wpi.edu/~rjduck/Counter%20Tutorial%20Verilog.pdf
https://timetoexplore.net/blog/arty-fpga-vga-verilog-01
https://github.com/WillGreen/timetoexplore
https://learn.digilentinc.com/Documents/269
https://electronics.stackexchange.com/questions/209462/fpga-vga-driver-not-working
*/

module graphics(

    input [2:0]testInput, // input depends on implementation
    input wire CLK100MHZ,
    input reset,
    output wire horizSyncOut,
    output wire vertSyncOut,
    output reg [3:0]VGA_R,
    output reg [3:0]VGA_G,
    output reg [3:0]VGA_B
    );
   
    // generate 25 MHz clock
    /*
    wire slowClk;
    twentyFiveMHzClock clock(.twentyFiveMHzClk(slowClk), .CLK100MHZ(CLK100MHZ));
    */
    // Alt strobe generator
    
    reg[15:0] cnt=0;
    reg strobe=1'b0;
    always @(posedge CLK100MHZ)begin
        {strobe,cnt} <=cnt+16'h4000;
    end
    
    wire [9:0]xPos; // current x position
    wire [9:0]yPos; // current y position
    wire valid;
    display_signals signals(
    .clk(CLK100MHZ),
    .reset(reset),
    .strobe(strobe),
    .xPos(xPos),
    .yPos(yPos),
    .horizSync(horizSyncOut),
    .vertSync(vertSyncOut),
    .valid(valid)
    );
    
   always @(posedge CLK100MHZ)begin
       if (valid) begin
       case (testInput)
           3'b000 : begin // blue
                VGA_B <=4'b1000;
                VGA_R <= 4'b0000;
                VGA_G <= 4'b0000;
           end // end 000
           3'b001 : begin // red
                VGA_B <=4'b0000;
                VGA_R <= 4'b1000;
                VGA_G <= 4'b0000;
           end // end red
           3'b010 : begin // green
                VGA_B <=4'b0000;
                VGA_R <= 4'b0000;
                VGA_G <= 4'b1000;
           end // end green
           3'b011 : begin // smile
           VGA_G <=
           (xPos > 80 && xPos < 200) && (yPos > 60 && yPos < 120) // left top eye
           || (xPos > 400 && xPos < 520) && (yPos > 60 && yPos < 120) // right top eye
           || (xPos > 80 && xPos < 260) && (yPos > 120 && yPos < 180) // left bottom eye
           || (xPos > 400 && xPos < 580) && (yPos > 120 && yPos < 180) // right bottom eye
           || (xPos > 100 && xPos < 200) && (yPos > 300 && yPos < 340) // top left smile
           || (xPos > 420 && xPos < 520) && (yPos > 300 && yPos < 340) // top right smile
           || (xPos > 140 && xPos < 480) && (yPos > 340 && yPos < 380) // bottom smile
           ? 4'b1000 : 0; 
           VGA_B <= 4'b0000;
           VGA_R <=4'b0000;
           end // end smile
           3'b100 : begin // pirate
                VGA_R <= 
                (xPos > 400 && xPos < 520) && (yPos > 80 && yPos < 140) // right top eye
                || (xPos > 400 && xPos < 580) && (yPos > 140 && yPos < 200) // right bottom eye
                || (xPos > 0 && xPos < 640) && (yPos > 20 && yPos < 60) // eyepatch strap
                || ( xPos > 80 && xPos < 260) &&  (yPos > 60 && yPos < 180)// eye patch
                || (xPos > 140 && xPos < 480) && (yPos > 340 && yPos < 380) // bottom smile
                || (xPos > 100 && xPos < 200) && (yPos > 380 && yPos < 420)// bottom left smile
                || (xPos > 420 && xPos < 520) && (yPos > 380 && yPos < 420)// bottom right smile
                ? 4'b1000 : 0;
                VGA_B <=4'b0000;
                VGA_G <=4'b0000;
           end // end pirate
           3'b101 : begin // start disco
                VGA_R <= 
                (xPos > 0 && xPos < 213) && (yPos > 0 && yPos < 160) // top left 
                || (xPos > 213 && xPos < 416) && (yPos > 160 && yPos < 320) // middle middle
                || (xPos > 416 && xPos < 629) && (yPos > 320 && yPos < 480) // bottom right
                ? 4'b1000 : 0;
                VGA_G <= 
                (xPos > 213 && xPos < 416) && (yPos > 0 && yPos < 160) // top middle
                || (xPos > 416 && xPos < 629) && (yPos > 160 && yPos < 320) // middle right
                || (xPos > 0 && xPos < 213) && (yPos > 320 && yPos < 480) // bottom left
                ? 4'b1000 : 0;
                VGA_B <=
                (xPos > 416 && xPos < 629) && (yPos > 0 && yPos < 160) // top right
                || (xPos > 0 && xPos < 213) && (yPos > 160 && yPos < 320)// middle left
                ||(xPos > 213 && xPos < 416) && (yPos > 320 && yPos < 480)// bottom middle
                ? 4'b1000 : 0;
           end // end disco
           3'b110 : begin end
           3'b111 : begin end
           default : begin
                VGA_R <=4'b0000;
                VGA_G <=4'b0000;
                VGA_B <= 4'b0000;
           end // end default
       endcase // end testInput
       end // end valid
       else begin
        VGA_R <=4'b0000;
        VGA_G <=4'b0000;
        VGA_B <=4'b0000;
       end
   end // end always
   
endmodule