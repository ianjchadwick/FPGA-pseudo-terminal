`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 10:04:25 AM
// Design Name: 
// Module Name: danger_random
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


module danger_random(
input clk,
input reset,
input[10:0] op_code,
output reg danger_out=0
    );
wire clock_divide_sec,clock_divide_tenth;
reg [2:0] count1,count2=1;
reg [2:0] rand;
wire [2:0]r;
one_sec_clk RXN_OSC(clk,clock_divide_sec);
tenth_sec_clk RXN_TSC(clk,clock_divide_tenth);
randomizer RXN_R(clk,r);

always@(op_code,reset)begin
if(op_code==11'b00100000000)
  //  rand=r+1;
    rand=r+1'b01;
end

always@(posedge clock_divide_sec,posedge reset)begin
if(danger_out==0 &&reset==0)
    count1=count1+1;
//else if(danger_out ==1 &&reset==0)
//    count1=count1;
else if(reset==1)
    count1=0;
end
always@(posedge clock_divide_tenth,posedge reset)begin
if(danger_out==0 &&reset==0)
    count2=count2+1;
//else if(danger_out ==1 &&reset==0)
//    count2=count2;
else if(reset ==1)
    count2=0;
end

always@(posedge clk)begin
    if(count1>=rand &&count2>=rand)
        danger_out=1;
    else
        danger_out=0;   
end

endmodule
