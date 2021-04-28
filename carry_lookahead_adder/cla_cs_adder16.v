//16 bit carry-skip adder based on blocks of 4bit carry LA adders
`include "la_adder4.v"

module adder16(A,B,Cin,Sum,Cout,Pout);

input [15:0] A;
input [15:0] B;
input Cin;
output [15:0] Sum;
output Cout, Pout;//Pout in case of higher order adders composition (32 bit, 64 bit, etc...)

wire C0,C1,C2,C3;
wire P0,P1,P2,P3;

la_adder4 add0(.A(A[3:0]), .B(B[3:0]), .Cin(Cin),.Sum(Sum[3:0]),.Cout(C0),.Pout(P0));
la_adder4 add1(.A(A[7:4]), .B(B[7:4]), .Cin(C0),.Sum(Sum[7:4]),.Cout(C1),.Pout(P1));
la_adder4 add2(.A(A[11:8]), .B(B[11:8]), .Cin(C1),.Sum(Sum[11:8]),.Cout(C2),.Pout(P2));
la_adder4 add3(.A(A[15:12]), .B(B[15:12]), .Cin(C2),.Sum(Sum[15:12]),.Cout(C3),.Pout(P3));

assign Pout = P0 & P1 & P2 & P3;
assign Cout = C3;
endmodule