`timescale 1ns / 1ps

module nw_kb(
input clk,
input ps2c,
input ps2d,
output reg [7:0] key,
output reg done);

localparam
        BREAK = 8'hF0,
        L_SHIFT = 8'h12,
        R_SHIFT = 8'h59;

//counts the bits for ps2 signals
reg [3:0] count;

reg letter_case, flag;

reg [7:0] current_code, last_code;

wire [7:0]  ascii;

scan_to_ascii convert (.scan_code(last_code), 
                       .letter_case(letter_case), 
                       .ascii_code(ascii));
                       

always @(negedge ps2c)
begin
    case(count)
    0:; //start bit
    1: current_code[0] = ps2d;
    2: current_code[1] = ps2d;
    3: current_code[2] = ps2d;
    4: current_code[3] = ps2d;
    5: current_code[4] = ps2d;
    6: current_code[5] = ps2d;
    7: current_code[6] = ps2d;
    8: current_code[7] = ps2d;
    9: flag = 1'b1;
    10: flag = 1'b0;
    endcase
    
    if (count <= 9)
        count = count +1;
    else if (count >= 10)
        count = 1'b0; 
 end

always @(posedge flag)
begin
    if (current_code == BREAK)
    begin
        key <= ascii;
        done <= 1;
    end
    else
     begin
        last_code <= current_code;
        letter_case = 1'b0;
        done = 0;
     end


//    else if (current_code == L_SHIFT || current_code == R_SHIFT)
//    begin
//        key <= asc
//    end    
    



end









endmodule
