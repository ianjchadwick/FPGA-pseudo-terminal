`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 12:51:54 PM
// Design Name: 
// Module Name: ascii_alu
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

//op_codes
//00000000001=add             7seg
//00000000010=subtract        7seg
//00000000100=mult            7seg
//00000001000=div             7seg
//00000010000=rgb              LED
//00000100000=hi              7seg
//00001000000=stopwatch       7seg
//00010000000=smile            VGA
//00100000000=react game      7Sseg/VGA
//01000000000=vga lightshow    VGA
//10000000000=disco            LED/VGA/7seg

module ascii_alu(
input clk,
input [7:0] a,
input [7:0] b,
input [10:0] op_code,
input reset,
input go,
//output reg [7:0] out,
output reg[39:0] display,
output [2:0]rgb1,
output [2:0]rgb2,
output wire horizSyncOut,
output wire vertSyncOut,
output  [3:0]VGA_R,
output [3:0]VGA_G,
output  [3:0]VGA_B
    );
wire [39:0] display_EBT,display_GRT,display_SWT,display_RGB;
assign display_RGB={5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
assign display_VGA={5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};

eight_bit_top EBT(.a(a), .b(b),.op_code(op_code), .display(display_EBT));
greetings_top GRT(.clk(clk), .a(a), .op_code(op_code), .display(display_GRT));
stopwatch_top SWT(.clk(clk),.reset(reset),.go(go), .op_code(op_code),.display(display_SWT));
RGB_show_top RGBT(.clk(clk),.op_code(op_code),.rgb1(rgb1),.rgb2(rgb2));
vga_show_top VGAT(.clk(clk),.op_code(op_code),.a(a),.reset(reset),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));

always@(posedge clk)begin
case(op_code)
    11'b00000000001: display=display_EBT; 
    11'b00000000010: display=display_EBT;
    11'b00000000100: display=display_EBT; 
    11'b00000001000: display=display_EBT; 
    11'b00000010000: display=display_RGB; 
    11'b00000100000: display=display_GRT;
    11'b00001000000: display=display_SWT;
    11'b00010000000: display=display_VGA;
    default: display={5'b11111,5'b11111,5'b01011,5'b01010,5'b01101,5'b11111,5'b11111,5'b11111};
endcase  
end

endmodule
