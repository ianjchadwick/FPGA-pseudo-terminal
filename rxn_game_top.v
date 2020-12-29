`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 09:59:10 AM
// Design Name: 
// Module Name: rxn_game_top
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


module rxn_game_top(
input clk,
input [7:0] a,
//input [7:0] b,
input [10:0] op_code,
input reset,
input go,
output reg [39:0] display,

output  horizSyncOut,
output  vertSyncOut,
output  [3:0]VGA_R,
output  [3:0]VGA_G,
output  [3:0]VGA_B
    );
    parameter smile=3'b011; 
    parameter pirate=3'b100;
    parameter disco =3'b101;
  //  wire [3:0]VGA_R, VGA_B,VGA_G;
    wire danger;//,horizSyncOut,vertSyncOut;
reg resetter=0;
reg go_buffer=0;
reg [3:0]thing=0;
reg [10:0]op_sw=0;
reg [10:0]op_vga=0;
wire [39:0] display_sw;
reg [39:0] display_hold;
danger_random DR(clk,reset,op_code,danger);
always@(op_code)begin
    if(op_code!=11'b00100000000)begin
    op_sw=0;op_vga=0;end
    else begin
    op_sw=11'b00001000000; op_vga=11'b00010000000;
    go_buffer=1;
    end 
end
always@(posedge clk)begin
if(!danger)begin//peace
thing=smile;
resetter=1;
end
else if(danger && !a )begin//danger present
thing=pirate;resetter=0;display=display_sw;
end
else if(danger && a)begin//danger fixed
thing=disco;display=display;
end
end


stopwatch_top RXN_SWT(.clk(clk),.reset(resetter),.go(go_buffer), .op_code(op_sw),.display(display_sw));
vga_show_top RXN_VGAT(.clk(clk),.op_code(op_vga),.a({5'b0,thing}),.reset(0),.horizSyncOut(horizSyncOut),.vertSyncOut(vertSyncOut),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));


endmodule
