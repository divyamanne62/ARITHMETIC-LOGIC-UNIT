`timescale 1ns/1ps

module test_tb;

reg  [3:0] A;
reg  [3:0] B;
reg  [2:0] SEL;

wire [3:0] Y;
wire CARRY;

// Instantiate ALU
alu uut (
    .A(A),
    .B(B),
    .SEL(SEL),
    .Y(Y),
    .CARRY(CARRY)
);

initial begin

    // Create waveform file
    $dumpfile("dump.vcd");
    $dumpvars(0, test_tb);

    // ADDITION
    A = 4'b0101;
    B = 4'b0011;
    SEL = 3'b000;
    #10;

    // SUBTRACTION
    A = 4'b1000;
    B = 4'b0010;
    SEL = 3'b001;
    #10;

    // AND
    A = 4'b1100;
    B = 4'b1010;
    SEL = 3'b010;
    #10;

    // OR
    A = 4'b1100;
    B = 4'b1010;
    SEL = 3'b011;
    #10;

    // NOT
    A = 4'b1010;
    SEL = 3'b100;
    #10;

    $finish;

end

initial begin
    $monitor("TIME=%0t A=%b B=%b SEL=%b Y=%b CARRY=%b",
              $time, A, B, SEL, Y, CARRY);
end

endmodule
