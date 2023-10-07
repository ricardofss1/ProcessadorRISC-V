module ULA(
    input logic [7:0] SrcA, SrcB,  // Entradas de dados
    input logic [2:0] ULAControl,  // Sinal de controle da ULA
    output logic [7:0] ULAResult,  // Resultado da ULA
    output logic ZeroFlag         // Sinal de flag
);

always_comb begin
	case(ULAControl)
		3'b000 : ULAResult = SrcA + SrcB;				// Adição
		3'b001 : ULAResult = SrcA + ~SrcB + 1;			// Subtração
		3'b010 : ULAResult = SrcA & SrcB;				// AND
		3'b011 : ULAResult = SrcA | SrcB;				// OR
		3'b101 : ULAResult = (SrcA < SrcB) ? 1 : 0;		// Menor que
		default: ULAResult = 0;
	endcase
	FlagZ = (ULAResult == 0) ? 1 : 0; 	// Definir o sinal ZeroFlag com base no resultado
end

endmodule
