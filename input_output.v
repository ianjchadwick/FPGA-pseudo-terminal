`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:00:54 PM
// Design Name: 
// Module Name: input_output
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


module input_output(
    input clk,
    input [2:0] a_short,
    input [2:0] b_short,
    input reset,
    input go,
    input [3:0] op_code_abbreviated,
    output [6:0] segments,
    output [7:0] digits,
    output [2:0] rgb1,
    output [2:0] rgb2,
    output wire horizSyncOut,
    output wire vertSyncOut,
    output  [3:0]VGA_R,
    output  [3:0]VGA_G,
    output  [3:0]VGA_B    );
reg [7:0] a,b;
reg [39:0] display=0;
wire [39:0] display_alu;
wire [2:0] rgb1,rgb2;
reg[10:0] op_code;
ascii_alu ASA(.clk(clk), .a(a), .b(b),.go(go),.reset(reset), .op_code(op_code), .display(display_alu),.rgb1(rgb1),.rgb2(rgb2),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
seven_seg_x8 SS8(.clk(clk),.signal_in(display),.segments(segments), .digits(digits));

always@(*)begin
case(a_short)
    0:a= 7'b000;
    1:a= 7'b001;
    2:a= 7'b010;
    3:a= 7'b011;
    4:a= 7'b100;
    5:a= 7'b101;
    6:a= 7'b110;
    7:a= 7'b111;
endcase
case(b_short)     
    0:b= 7'b000;  
    1:b= 7'b001;  
    2:b= 7'b010;  
    3:b= 7'b011;  
    4:b= 7'b100;  
    5:b= 7'b101;  
    6:b= 7'b110;  
    7:b= 7'b111;  
endcase           
end      
always@(*)begin
case(op_code_abbreviated)
    0:begin op_code=11'b00000000001; display=display_alu; end //add
    1:begin op_code=11'b00000000010; display=display_alu ;end //subtract
    2:begin op_code=11'b00000000100; display=display_alu ; end //multiply
    3:begin op_code=11'b00000001000; display=display_alu ; end //divide
    4:begin op_code=11'b00000010000; display=display_alu ; end //RGB
    5:begin op_code=11'b00000100000; display=display_alu ;end //hi
    6:begin op_code=11'b00001000000; display=display_alu ;end //stopwatch
    7:begin op_code=11'b00010000000; display=display_alu ;end //VGA
    8:begin op_code=11'b00100000000; display=display_alu ;end //rxn
   // default: display={5'b01011,5'b01010,5'b01101,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
endcase  
end
endmodule
