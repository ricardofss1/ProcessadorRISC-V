module ULA(
input logic [7:0] SrcA, SrcB,
input logic [2:0] ULAControl,
output logic [7:0] ULAResult,
output logic FlagZ
);

always_comb begin
	case(ULAControl)
        3'b000 : ULAResult = SrcA + SrcB;        // ADD
        3'b001 : ULAResult = SrcA - SrcB;        // SUB
        3'b010 : ULAResult = SrcA & SrcB;        // AND
        3'b011 : ULAResult = SrcA | SrcB;        // OR
        3'b100 : ULAResult = SrcA * SrcB;        // MUL (Multiplicação)
        3'b101 : ULAResult = (SrcA < SrcB) ? 1 : 0; // SLT (Set on Less Than)
        3'b110 : ULAResult = SrcA / SrcB;        // DIV (Divisão)
        3'b111 : ULAResult = SrcA ^ SrcB;        // XOR (Bitwise Exclusive OR)
        default: ULAResult = 0;
    endcase
	FlagZ = (ULAResult == 0) ? 1 : 0; 
end

endmodule
