`timescale 1ps/1ps
`include "cla_cs_adder16.v"

module adder16_tb ();

reg [15:0] A;
reg [15:0] B;

reg Cin = 0;

wire [15:0] S;
wire Cout;
wire P;

//Loop variables
reg [16:0] i;
reg [16:0] j;

adder16 adder(A,B,Cin,S,Cout,P);

initial begin
    $dumpfile("adder16.vcd");
    $dumpvars(0, adder16_tb);
    //This takes forever to run...
    //It is faster to split it in blocks that can be run in parallel since icarus verilog vvp runs single thread.
    //I am pretty sure that high level tools (Synopsys maybe?) can do it much faster.
    
    Cin = 0;
    for(i = 0; i<65535; i = i+1) begin
        for(j = 0; j<65535;j = j+1) begin
            A = i;
            B = j;
            #5;    
        end
            
    end
    #20
    Cin = 1;
    for(i = 0; i<65535; i = i+1) begin
        for(j = 0; j<65535;j = j+1) begin
            A = i;
            B = j;
            #5;    
        end
            
    end
        
end

endmodule