`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 07:49:52 PM
// Design Name: 
// Module Name: RGB_show_top
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


module RGB_show_top(   
    input clk,
    input [10:0] op_code,
    output  [2:0] rgb1 , 
    output  [2:0] rgb2 
    );
reg siren=0;
//wire ten_sec;
//ten_sec_clk TENSC1(clk,ten_sec);
RGB_show RGB(
            .clk(clk),
            .siren(siren),
            .rgb1(rgb1),
            .rgb2(rgb2)
            );
always@(posedge clk)begin
if(op_code==11'b00000010000 )
    siren=1;
else
    siren=0;
end
endmodule
