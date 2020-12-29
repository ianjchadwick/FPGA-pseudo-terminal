`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Jack Locke and Jon Ngo
// 
// Create Date: 09/27/2020 12:32:31 PM
// Design Name: ALU
// Module Name: half_adder
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


module half_adder(
    output SUM,
    output C_OUT,
    input A,
    input B
    );
    
    xor XOR1(SUM, A, B);
    and AND1(C_OUT, A, B);

endmodule
