`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2020 06:28:26 AM
// Design Name: 
// Module Name: RGB_show
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


module RGB_show(
    input clk,
    input siren,
    output reg [2:0] rgb1 = 0, 
    output reg [2:0] rgb2 = 0
    );

parameter  red=8'b00000001, orange=8'b00000010, green =8'b00000100, teal=8'b00001000, blue=8'b00010000,violet=8'b00100000, white=8'b01000000, lightoff=8'b10000000;
reg [7:0] current_state = 0; 
reg [7:0] next_state = 0;
wire clk_div;

tenth_sec_clk TSC(.clk(clk), .clock_divide_tenth_sec(clk_div));

always @(posedge clk_div)begin//mode_select
  if(siren == 1)begin 
    case(current_state)
        red: begin 
             next_state = orange; 
             rgb1 <= 3'b100;
             rgb2 <= 3'b011; end
        orange: begin 
             next_state = green; 
             rgb1 <= 3'b110;
             rgb2 <= 3'b001; end
        green: begin 
             next_state = teal; 
             rgb1 <= 3'b010;
             rgb2 <= 3'b101; end
        teal: begin 
             next_state = blue; 
             rgb1 <= 3'b011;
             rgb2 <= 3'b100; end
        blue: begin 
             next_state = violet; 
             rgb1 <= 3'b001;
             rgb2 <= 3'b110; end
        violet: begin 
             next_state = white; 
             rgb1 <= 3'b101;
             rgb2 <= 3'b010; end
        white: begin 
             next_state = lightoff; 
             rgb1 <= 3'b111;
             rgb2 <= 3'b000; end
        lightoff: begin 
             next_state = red; 
             rgb1 <= 3'b000;
             rgb2 <= 3'b111; end
        default: begin 
             next_state = red;
             rgb1 <= 3'b100;
             rgb2 <= 3'b011; end            
        endcase
    end
    else begin
        rgb1 <= 3'b000;
        rgb2 <= 3'b000;
        end
end     
always @ (posedge clk) current_state <= next_state;

endmodule
