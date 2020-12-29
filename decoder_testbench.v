`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 02:28:45 PM
// Design Name: 
// Module Name: decoder_testbench
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


module decoder_testbench;
reg clk;
reg [39:0] command;
 wire [7:0]a_in;
 wire [7:0]b_in;
 wire [10:0]op_code;
 wire reset;
 wire go;
 decoder DEC(clk,command,a_in,b_in,op_code,reset,go);
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
initial begin
clk=0;command=0;
#500 command={r,e,s,e,t};
#500 command= {s,m,i,l,e};
#500 command={f,i,g,h,t};
end
always #2 clk=~clk;
endmodule
