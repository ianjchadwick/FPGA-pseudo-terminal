`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 11:17:21 PM
// Design Name: 
// Module Name: eight_bit_top
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


module eight_bit_top(
input [7:0] a,
input [7:0] b,
input [10:0] op_code,
output reg [39:0] display
    );
wire [7:0] out_math;
wire [9:0] pbcd1,pbcd2;
wire [2:0] rem;
parameter blank=5'b11111;//good for 1 digits
eight_bit_alu EBA(a,b,op_code,out_math,rem);
decimal_converter DC1(.pbcd(pbcd1),.acc_in(out_math));//2 digits on 7seg. 
decimal_converter DC2(.pbcd(pbcd2),.acc_in({4'b0000,rem}));
always@(*)begin
case(op_code)
    11'b00000000001:begin display={blank,blank,pbcd1,blank,blank,blank,blank}; end
    11'b00000000010:begin
     display={blank,blank,pbcd1,blank,blank,blank,blank};
     if(b>a)
      display={blank,5'b11101,pbcd1,blank,blank,blank,blank};  
      end
    11'b00000000100:begin display={blank,blank,pbcd1,blank,blank,blank,blank}; end
    11'b00000001000:begin display= {blank,blank,pbcd1,blank,blank,5'b10111,pbcd2[4:0]};
     if(b==0) begin display={5'b11111,5'b11111,5'b01011,5'b01010,5'b01101,5'b11111,5'b11111,5'b11111};;end
     end
    endcase
end

endmodule
