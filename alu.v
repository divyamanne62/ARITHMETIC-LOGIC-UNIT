module alu(
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] SEL,
    output reg [3:0] Y,
    output reg CARRY
);

always @(*) begin

    case(SEL)

        // ADDITION
        3'b000:
        begin
            {CARRY, Y} = A + B;
        end

        // SUBTRACTION
        3'b001:
        begin
            {CARRY, Y} = A - B;
        end

        // AND
        3'b010:
        begin
            Y = A & B;
            CARRY = 0;
        end

        // OR
        3'b011:
        begin
            Y = A | B;
            CARRY = 0;
        end

        // NOT
        3'b100:
        begin
            Y = ~A;
            CARRY = 0;
        end

        // DEFAULT
        default:
        begin
            Y = 4'b0000;
            CARRY = 0;
        end

    endcase

end

endmodule
