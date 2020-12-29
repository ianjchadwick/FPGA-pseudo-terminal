`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 02:02:10 PM
// Design Name: 
// Module Name: output_display
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


module output_display(
    output [6:0] out_seg,
    input [4:0] ln_binary
   // input [7:0] dig_out
);

reg[6:0] digit_code= 7'h00;

always @(*)begin
   case(ln_binary)
        5'b00000 : digit_code <= 7'h7E; //0/O
        5'b00001 : digit_code <= 7'h30; //1
        5'b00010 : digit_code <= 7'h6D; //2/Z
        5'b00011 : digit_code <= 7'h79; //3
        5'b00100 : digit_code <= 7'h33; //4      
        5'b00101 : digit_code <= 7'h5B; //5/S
        5'b00110 : digit_code <= 7'h5F; //6
        5'b00111 : digit_code <= 7'h70; //7
        5'b01000 : digit_code <= 7'h7F; //8
        5'b01001 : digit_code <= 7'h73; //9/q
        5'b01010 : digit_code <= 7'h77; //A
        5'b01011 : digit_code <= 7'h1F; //b
        5'b01100 : digit_code <= 7'h4E; //C
        5'b01101 : digit_code <= 7'h3D; //d
        5'b01110 : digit_code <= 7'h4F; //E
        5'b01111 : digit_code <= 7'h47; //F
        5'b10000 : digit_code <= 7'h7B; //g
        5'b10001 : digit_code <= 7'h37; //H/K/X
        5'b10010 : digit_code <= 7'h10; //i 
        5'b10011 : digit_code <= 7'h3C; //J
        5'b10100 : digit_code <= 7'h0E; //L      
        5'b10101 : digit_code <= 7'h15; //n
        5'b10110 : digit_code <= 7'h67; //P
        5'b10111 : digit_code <= 7'h05; //r
        5'b11000 : digit_code <= 7'h0F; //t
        5'b11001 : digit_code <= 7'h3E; //U/V
        5'b11010 : digit_code <= 7'h1E; //W (first half)
        5'b11011 : digit_code <= 7'h06; //W (second half)
        5'b11100 : digit_code <= 7'h3B; //y
        5'b11101 : digit_code <= 7'h01; //-
        5'b11110 : digit_code <= 7'h09; //=
        5'b11111 : digit_code <= 7'h00; //NULL  
    endcase
end
    
assign out_seg[0] = ~digit_code[0];
assign out_seg[1] = ~digit_code[1];
assign out_seg[2] = ~digit_code[2];
assign out_seg[3] = ~digit_code[3];
assign out_seg[4] = ~digit_code[4];
assign out_seg[5] = ~digit_code[5];
assign out_seg[6] = ~digit_code[6];

endmodule
