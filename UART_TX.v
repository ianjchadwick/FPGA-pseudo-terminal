`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 06:49:48 AM
// Design Name: 
// Module Name: UART_TX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: adapted from Electronics with prof. Mughal on YouTube (link below)
// https://www.youtube.com/watch?v=Fms2Qwkbu1g&t=1689s
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_TX(
    input clk,
    input [7:0] signal_in,
    input send,
    input reset,
    output reg signal_out
    );
    
parameter baud_max = 10416; // (clockspeed / baudrate) - 1  (100MHz/9600) - 1 in this case
    
reg [3:0] bit_counter; // counts number of bits sent - 1 to start - 8 bits (1 byte) of data - 1 to stop
reg [13:0] baudrate_counter; //10,415 counters for 9600 baud
reg [9:0] shiftright; //10-bits serially transmitted to 
reg cur_state, next_state; // state machine to switch idle and transmit mode.
reg shift; // shift dignal to start sending bits to the UART
reg load; //  signal to load data into the register and add headder and footer bits
reg clear; // resets bit counter;

//UART transmission 
always @(posedge clk) begin
    if (reset) begin
        cur_state <= 0; // idle state
        bit_counter <= 0; // preped for next transmission
        baudrate_counter <= 0; // preped for next transmission
    end
    else begin
        baudrate_counter <= baudrate_counter + 1;
        if (baudrate_counter == baud_max) begin
            cur_state <= next_state; // switched from idle to transmit
            baudrate_counter <= 0;
            if(load)
                shiftright <= {1'b1, signal_in , 1'b0}; // data loaded and prefix and suffix appended         
            if(clear) 
                bit_counter <= 0;
            if(shift) begin
                shiftright <= shiftright >> 1; // transmits data one bit at a time
                bit_counter <= bit_counter + 1;
                end
        end
    end
end 
           
//State Machine
always @(posedge clk) begin
    load <= 0;
    shift <= 0;
    clear <= 0;
    signal_out <= 1;

    case(cur_state)
        0: begin
            if(send) begin
                next_state <=1;
                load <= 1; //start loading bits
                shift <= 0;
                clear <= 0; // avoid accidental clearing
            end
            else begin
                next_state <= 0; //stay in idle mode
                signal_out <= 1;
            end
        end
        1: begin
            if(bit_counter == 10) begin
                next_state <= 0; //bit sent, switch from transmit to idle
                clear <= 1; // clear counters;
            end 
            else begin
               next_state <= 1; //stay in transmit 
               signal_out <= shiftright[0];
               shift <= 1; //keep shifting
            end
         end
         default: next_state <= 0;
     endcase
 end          
           
endmodule
