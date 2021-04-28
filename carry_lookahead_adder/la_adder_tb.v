`timescale 1ps/1ps
`include "la_adder4.v"

module la_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;
reg [5:0] i;
reg [5:0] j;
wire [3:0] S;
wire Cout,Pout;

la_adder4 la_add4(A,B,Cin,S,Cout,Pout);

initial begin
    $dumpfile("la_adder4.vcd");
    $dumpvars(0, la_adder_tb);
    Cin = 0;
    for(i = 0; i<16; i = i+1) begin
        for(j = 0; j<16;j = j+1) begin
            A = i;
            B = j;
            #5;    
        end
            
    end
    #20
    Cin = 1;
    for(i = 0; i<16; i = i+1) begin
        for(j = 0; j<16;j = j+1) begin
            A = i;
            B = j;
            #5;    
        end
            
    end
    
    
end
endmodule