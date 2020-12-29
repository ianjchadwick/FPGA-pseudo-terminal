`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 08:17:56 PM
// Design Name: 
// Module Name: eight_bit_alu
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


module eight_bit_alu(
input [7:0] a,
input [7:0] b,
input [10:0] op_code,
output reg [7:0] out,//should we save result for cumulative operations?
output reg [2:0] rem
    );
//reg [2:0] remainder=0;
wire [7:0] out_add, out_sub, out_mult,  out_div;
//wire add_c_out;
//eight_bit_adder EBA(.a(a), .b(b), .c_in(0), .out(out_add), .c_out(add_c_out));
assign out_add = a+b;
assign out_sub = a-b;
assign out_mult = a*b;
assign out_div = a/b;//just display "a / b" on 7 seg if fraction exist
//or display remainder "q  r8"
always@(*)begin
    case(op_code)
        11'b00000000001:begin out <=out_add; rem=0; end
        11'b00000000010:begin 
        out <=out_sub; rem<=0;
        if(b>a) out<=b-a;
         end
        11'b00000000100:begin out <=out_mult; rem=0; end
        11'b00000001000:begin 
        out <=out_div; 
        rem<=a%b;
        if(b==0) begin 
        out<=0; rem<=0;end
         end
    endcase
end


//arithmetic


endmodule
