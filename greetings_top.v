`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 11:40:56 PM
// Design Name: 
// Module Name: greetings_top
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

//HELLO WORLD
//HOW YOU DOIN
//HEY
//SUP
//pirates
//what is life
//argggg
//I need h20


module greetings_top(
input clk,
input [7:0] a,
input [10:0] op_code,
output reg [39:0] display
//output reg [7:0] out
    );
localparam A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101, G=3'b110, H=3'b111;
wire [7:0] out_hi;
reg [79:0] phrase=0;
wire clock_divide_sec;
greetings GRE(clk,a,op_code,out_hi);
one_sec_clk OSC(.clk(clk),.clock_divide_sec(clock_divide_sec));

//assign display = phrase[79:40]; 

always@(posedge clk)begin
case(out_hi[2:0])
   A:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   B:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   C:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   D:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   E:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   F:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
   G:phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
    default: phrase={5'b11111,5'b01010,5'b10111,5'b10000,5'b10000,5'b10000,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
    endcase    
end
 
always@(posedge clk)begin
case (clock_divide_sec)
    0:display = phrase[79:40];
    1: display =phrase[39:0];
    default: display= {5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111,5'b11111};
endcase
end

endmodule
