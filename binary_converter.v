`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 01:29:58 PM
// Design Name: 
// Module Name: binary_converter
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

//convert 2 digits of bcd to its binary value
module binary_converter(
input [7:0] bcd,
output reg [7:0]bin);
integer k,i;
reg [15:0] temp;


always@(*)begin
temp[15:8]=bcd;
temp[7:0]=0;

for(k=0;k<8;k=k+1)begin
temp = temp>>1;//shift 1 

if(temp[11:8]>=8)
    temp[11:8]=temp[11:8]-3;

if(temp[15:12]>=8)
    temp[15:12]=temp[15:12]-3; 



end
bin=temp[7:0];
end
endmodule
