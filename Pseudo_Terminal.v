`timescale 1ns / 1ps


module Pseudo_Terminal(
    input clk,
    input ps2_clk,
    input ps2_data,
    input reset, 
    input clear,
    output [7:0] kb_out,
    output signal_out,
    output [6:0] segments,
    output [7:0] digits,
    output [2:0]rgb1,
    output [2:0]rgb2,
    output horizSyncOut,
    output vertSyncOut,
    output[3:0]VGA_R,
    output[3:0]VGA_G,
    output[3:0]VGA_B
    );
    
wire send_out;
wire [7:0] cur_ascii;
wire [39:0] command;

text_IO TIO(.clk(clk),
            .ps2_clk(ps2_clk),
            .ps2_data(ps2_data),
            .reset(reset),
            .kb_out(cur_ascii),
            .signal_out(signal_out),
            .send_out(send_out)
            );
    
concatenator CCT(.letter(kb_out),
                 .CLK100MHZ(clk),
                 .send(send_out),
                 .reset(clear),
                 .string(command)
                 );

logic LOG(.clk(clk),
          .command(command),
          .segments(segments),
          .digits(digits),
          .rgb1(rgb1),
          .rgb2(rgb2),
          .horizSyncOut(horizSyncOut),
          .vertSyncOut(vertSyncOut),
          .VGA_R(VGA_R),
          .VGA_G(VGA_G),
          .VGA_B(VGA_B)
           );

assign kb_out = cur_ascii;

endmodule
