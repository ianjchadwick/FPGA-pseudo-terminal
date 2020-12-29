//this module takes in a 17 bit binary number that hold the core time and converts it to a modified pseudo code thats readable by the new 7(8?) seg display
module core_time_decoder(
input clk,
input [16:0] binary_time,
output [9:0]hundreth_sec,
output [9:0]minutes,
output [9:0]seconds
);
//doing it behaviorally for now, work later to convert to strictly using alu/structurally
//wire [19:0]decimal_time=0;
//reg [5:0] num_hour=0;
//reg [5:0] sixty_hour=0;
reg [5:0] num_min=0;
reg [5:0] num_sec=0;//remainders
reg [6:0] num_hundreth_sec=0;
//seventeen_bit_decimal_converter dc(binary_time, decimal_time);
decimal_converter conv1(hundreth_sec, {1'b0,num_hundreth_sec});
decimal_converter conv2(minutes, {2'b00,num_min});
decimal_converter conv3(seconds, {2'b00,num_sec});

always@(posedge clk)begin
//sixty_hour= (binary_time/3600 - (binary_time%3600)/3600);
//num_hour= sixty_hour%24;
num_min= (binary_time/6000 -(binary_time%6000)/6000);
num_sec= (binary_time/100 - (binary_time%100)/100);
num_hundreth_sec = binary_time%100;

end
endmodule