`timescale 1ns / 1ps


module decoder(
input clk,
input [39:0] command,
output reg [7:0]a_in,
output reg [7:0]b_in,
output reg [10:0]op_code,
output reg reset,
output reg go
    );
wire [7:0] c1,c2,c3,c4,c5;
reg [1:0]reset_count=0;
assign c1= command[39:32];
assign c2= command[31:24];
assign c3= command[23:16];
assign c4= command[15:8];
assign c5= command[7:0];

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
wire[7:0] bcd2,bcd1;
wire[7:0] bin2,bin1;

 ascii_to_binary ATB1(.ascii(c1),.binary(bcd1[7:4]));
 ascii_to_binary ATB2(.ascii(c2),.binary(bcd1[3:0]));
 ascii_to_binary ATB3(.ascii(c4),.binary(bcd2[7:4]));
 ascii_to_binary ATB4(.ascii(c5),.binary(bcd2[3:0]));
 
 binary_converter BC1(.bcd(bcd1),.bin(bin1));
 binary_converter BC2(.bcd(bcd2),.bin(bin2));
 
always@(posedge clk)begin
if((c1>= 8'h30 && c1 <=8'h39&&c2>= 8'h30 && c2 <=8'h39&&c1>= 8'h30 && c1 <=8'h39&&c2>= 8'h30 && c2 <=8'h39)&&(c3==add ||c3==sub||c3==mult||c3==x || c3 == div))begin
case(c3)
    add:begin
        a_in= bin1;   
        b_in= bin2;  
        op_code=11'b00000000001; 
        reset=0;
        go=   0;
        end
    sub:begin
        a_in = bin1;  
        b_in = bin2;  
        op_code=11'b00000000010; 
        reset=  0;
        go=     0;
        end
    mult:begin
        a_in = bin1;  
        b_in = bin2;  
        op_code=11'b00000000100;  
        reset=  0;
        go=     0;
        end  
    x:begin                               
        a_in = bin1;                         
        b_in = bin2;                         
        op_code=11'b00000000100;  
        reset= 0;
        go=    0;       
        end                                   
    div:begin
        a_in  = bin1; 
        b_in  = bin2; 
        op_code=11'b00000001000;  
        reset= 0;
        go=    0;
        end
endcase
end  
else begin
case(command)
    {h,e,l,l,o}:begin
        a_in=  0;  
        b_in=  0; 
        op_code=11'b00000100000;
        reset=0;
        go=   0;
        end
    {h,o,w,space,space}:begin
        a_in=     1;
        b_in=     0;
        op_code=11'b00000100000;
        reset=    0;
        go=       0;
        end       
    {h,e,y,space,space}:begin
        a_in=     2;
        b_in=     0;
        op_code=11'b00000100000;
        reset=    0;
        go=       0;
        end
    {s,u,p,space,space}:begin
        a_in=     3;
        b_in=     0;
        op_code=11'b00000100000;
        reset=     0;
        go=        0;
        end
    {p,i,r,a,t}:begin
        a_in=     4;
        b_in=     0;
        op_code=11'b00000100000;
        reset=     0;
        go=        0;
        end
    {w,h,a,t,space}:begin
        a_in=     5;
        b_in=     0;
        op_code=11'b00000100000;
        reset=     0;
        go=        0;
        end
    {a,r,g,g,g}:begin
        a_in=     6;
        b_in=     0;
        op_code=11'b00000100000; 
        reset=     0;
        go=        0;
        end
    {i,space,n,e,e}:begin
        a_in=     7;
        b_in=     0;
        op_code=11'b00000100000;
        reset=    0;
        go=       0;
        end
    {l,a,z,e,r}:begin
        a_in=     0;
        b_in=     0;
        op_code=11'b00000010000;
        reset=    0;
        go=       0;
        end
    {s,t,a,r,t}:begin
        a_in=     0;
        b_in=     0;
        op_code=11'b00001000000; 
        reset=     0;
        go=        1;
        end
    {s,t,o,p,space}:begin
        a_in=     1;
        b_in=     0;
        op_code=op_code;
        reset=    0;
        go=       1;
        end
    {r,e,s,e,t}:begin
        a_in=     0;
        b_in=     0;
        op_code=11'b00100000000;
     //   op_code=op_code;
        reset=   1'b1;
        go=      0;
        if(reset_count==2'b11)begin
        reset=1'b0;
        reset_count=2'b0;
        end
        else begin
        reset_count=reset_count+1;
        end
        end
        
    {s,m,i,l,e}:begin
        a_in=     3'b010;//change
        b_in=     0;
        op_code=11'b00010000000; 
        reset=  0;
        go=     0;
        end
    {r,a,v,e,s}:begin
        a_in=     0;
        b_in=     0;
        op_code=11'b00010000000;
        reset= 0;
        go=    0;
        end
    {f,i,g,h,t}:begin
        a_in=     0;
        b_in=     0;
        op_code=11'b00100000000;
        reset= 0;
        go=    0;
        end
    {d,i,s,c,o}:begin
        a_in=     0;
        b_in=     0;
        op_code=0;
        reset=0;
        go=   0;
        end
    endcase
end  

end

endmodule
