module reg8bits (
    input logic EN,           // Sinal de habilitação para escrever os dados
    input logic [7:0] D,      // Dados de entrada a serem escritos no registrador
    input logic rst, clk,    // Sinal de reset e sinal de clock
    output logic [7:0] DataOut  // Dados de saída
);

// array de registradores de 8 bits
logic [7:0] register [0:7];

always @(posedge clk or negedge rst) begin
	if (rst == 0) begin
		DataOut <= 0;
	end
	else if (EN) begin
		DataOut <= D;
	end
end

endmodule
