`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 09:21:30 PM
// Design Name: 
// Module Name: text_IO
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


module text_IO(
    input clk,
    input ps2_clk,
    input ps2_data,
    input reset,
    //input send,
    output [7:0] kb_out,
    output signal_out,
    output send_out
    //output [7:0] count_out,
    //output scan_code_ready
    );

parameter threshold = 49999;

//wire scan_code_ready, letter_case_out, transmit_out;    
wire [7:0] scan_code, ascii_code;
reg [12:0] counter;   
//reg [7:0] scan_reg;
wire send;
    
//keyboard KEY(.clk(clk), 
//             .ps2_clk(ps2_clk), 
//             .ps2_data(ps2_data), 
//             .reset(reset),
//             .scan_code(scan_code), 
//             .scan_code_ready(scan_code_ready), 
//             .letter_case_out(letter_case_out)); 

//scan_to_ascii S2A(.scan_code(scan_code), 
//                  .letter_case(letter_case_out), 
//                  .ascii_code(ascii_code));

nw_kb keys (.clk(clk), .ps2c(ps2_clk), .ps2d(ps2_data), .key(ascii_code), .done(send));


UART_TX UTX(.clk(clk), 
            .signal_in(ascii_code), 
            .send(send), .reset(reset), 
            .signal_out(signal_out));

//button_send BTX(.clk(clk), .btn(scan_code_ready), .transmit(transmit_out));

assign kb_out = ascii_code;
assign send_out = send;

//always@(posedge scan_code_ready)
//    begin
//        scan_reg = scan_reg +1;
//    //if(counter == threshold)begin
//      //  counter = 0;
//        //end 
//    end
 
// always@(posedge scan_reg)
//    begin
//    send = 1'b1;
//    end

    
//always @(posedge clk)
//begin
//    if (scan_reg == 1)
//        send <= 1'b1;
//    else if (scan_reg == 0 && counter < threshold)
//        begin
//        send <= 1'b1;
//        counter <= counter +1;
//        end
//   else
//    begin
//    counter <= 0;
//    send <= 0;
//    end
//end
   
 
// assign count_out = counter;
    
endmodule
