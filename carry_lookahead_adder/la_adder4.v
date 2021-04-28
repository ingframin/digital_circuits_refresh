module la_adder4(A,B,Cin,Sum,Cout,Pout);

input [3:0] A,B;
input Cin;
output [3:0] Sum;
output Cout, Pout;

wire P0,P1,P2,P3;
wire G0,G1,G2,G3;
wire C0,C1,C2;

assign P0 = A[0] ^ B[0];
assign P1 = A[1] ^ B[1];
assign P2 = A[2] ^ B[2];
assign P3 = A[3] ^ B[3];

assign G0 = A[0] & B[0];
assign G1 = A[1] & B[1];
assign G2 = A[2] & B[2];
assign G3 = A[3] & B[3];

assign C0 = G0 | P0&Cin;
assign C1 = G1 | P1&C0;
assign C2 = G2 | P2&C1;
assign Cout = G3 | P3&C2;

assign Sum[0] = P0 ^ Cin;
assign Sum[1] = P1 ^ C0;
assign Sum[2] = P2 ^ C1;
assign Sum[3] = P3 ^ C2;

assign Pout = P0&P1&P2&P3;

endmodule