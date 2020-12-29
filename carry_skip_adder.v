`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2020 11:53:44 AM
// Design Name: 
// Module Name: carry_skip_adder
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


module carry_skip_adder(
    output reg[3:0] out,
    output reg c_out,
    input [3:0] a,
    input [3:0] b,
    input c_in
    );
    wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
    wire temp0,temp1;//temp placement for the first two digits of addition

full_adder full_add0(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(temp0), .c_out(w0));
full_adder full_add1(.a(a[1]), .b(b[1]), .c_in(w0), .sum(temp1), .c_out(w1));// w1 is the carry out from adder 2

//assuming w1 was a 0
full_adder full_add2(a[2],b[2],0,w2,w3);
full_adder full_add3(a[3],b[3],w3,w4,w5);//w5 is c_out if selected by mux

//assuming w1 was a 1
full_adder full_add4(a[2],b[2],1,w6,w7);
full_adder full_add5(a[3],b[3],w7,w8,w9);//w9 is c_out if selected by mux
always@(*)begin
if(w1==0)begin
c_out=w5;
out[2]=w2;
out[3]=w4;
 out[0]=temp0;
 out[1]=temp1;
end
else begin
c_out=w9;
out[2]=w6;
out[3]=w8;
 out[0]=temp0;
 out[1]=temp1;
end
end



endmodule
