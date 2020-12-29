`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Jack Locke and Jon Ngo
// 
// Create Date: 09/27/2020 12:32:31 PM
// Design Name: ALU
// Module Name: full_adder
// Project Name: 3-bit ALU
// Target Devices: NEXUS A7
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


module full_adder(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );
    
    wire w1, w2, w3;
    
    half_adder half_adder_1(w1, w2, a, b);
    half_adder half_adder_2(sum, w3, c_in, w1);
    
    or or_1(c_out,w3,w2);

endmodule

