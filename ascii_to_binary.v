`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:11:34 PM
// Design Name: 
// Module Name: ascii_to_binary
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


module ascii_to_binary(
input [7:0]ascii,
output reg[3:0]binary
    );
always@(*)begin
    case(ascii)
     8'h30:binary <=0 ;
     8'h31:binary <=1 ;
     8'h32:binary <=2 ;
     8'h33:binary <=3 ;
     8'h34:binary <=4 ;
     8'h35:binary <=5 ;
     8'h36:binary <=6 ;
     8'h37:binary <=7 ;
     8'h38:binary <=8 ;
     8'h39:binary <=9 ;
    endcase
end    

endmodule
