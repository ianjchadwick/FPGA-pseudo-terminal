`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 01:42:14 PM
// Design Name: 
// Module Name: word_bank
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
//gmorning
//what is life
//argggg
//I need h20

module word_bank(
input [2:0]r,
input [2:0]in_num,
output reg [2:0]out_num
    );
reg [20:0]bank;
localparam A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101, G=3'b110, H=3'b111;
always @(*)begin
case (in_num)
    A: bank= {B,C,D,E,F,G,H};
    B: bank= {A,C,D,E,F,G,H};
    C: bank= {A,B,D,E,F,G,H};
    D: bank= {A,B,C,E,F,G,H};
    E: bank= {A,B,C,D,F,G,H};
    F: bank= {A,B,C,D,E,G,H};
    G: bank= {A,B,C,D,E,F,H};
    H: bank= {A,B,C,D,E,F,G};
endcase
case (r)
    0: out_num <= bank[2:0];
    1: out_num <= bank[5:3];
    2: out_num <= bank[8:6];
    3: out_num <= bank[11:9];
    4: out_num <= bank[14:12];
    5: out_num <= bank[17:15];
    6: out_num <= bank[20:18];
endcase    
end
endmodule
