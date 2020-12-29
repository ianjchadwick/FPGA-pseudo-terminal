`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 02:41:02 PM
// Design Name: 
// Module Name: logic_testbench
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


module logic_testbench; 

reg clk;
reg [39:0]command;
wire[6:0] segments;
wire [7:0]digits;
wire [2:0]rgb1;
wire [2:0] rgb2;
 wire horizSyncOut;
wire vertSyncOut;
wire[3:0]VGA_R;
wire[3:0]VGA_G;
wire [3:0]VGA_B;

logic UUT(.clk(clk),.command(command),.segments(segments), .digits(digits),.rgb1(rgb1),.rgb2(rgb2),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
initial begin
clk=0;command=0;
//#2000 command={8'h30,8'h33,add,8'h30,8'h35};
///#2000 command={l,a,z,e,r};
#100 command={r,e,s,e,t};
#2000 command ={s,m,i,l,e};
end
always
#2 clk=~clk;

parameter a  = 8'h61;  
parameter b  = 8'h62;  
parameter c  = 8'h63;  
parameter d  = 8'h64;  
parameter e  = 8'h65;  
parameter f  = 8'h66;  
parameter g  = 8'h67;  
parameter h  = 8'h68;  
parameter i  = 8'h69;  
parameter j  = 8'h6A;  
parameter k  = 8'h6B;  
parameter l  = 8'h6C;  
parameter m  = 8'h6D;  
parameter n  = 8'h6E;  
parameter o  = 8'h6F;  
parameter p  = 8'h70;  
parameter q  = 8'h71;  
parameter r  = 8'h72;  
parameter s  = 8'h73;  
parameter t  = 8'h74;  
parameter u  = 8'h75;  
parameter v  = 8'h76;  
parameter w  = 8'h77;  
parameter x  = 8'h78;  
parameter y  = 8'h79;  
parameter z  = 8'h7A;  
parameter add  = 8'h2B;
parameter sub  = 8'h2D;
parameter mult = 8'h2A;
parameter div = 8'h2F; 
parameter space=8'h20; 
endmodule
